import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_planner_india/domain/entities/budget_entity.dart';
import 'package:wedding_planner_india/domain/entities/ceremony_entity.dart';
import 'package:wedding_planner_india/domain/entities/timeline_task_entity.dart';
import 'package:wedding_planner_india/domain/entities/wedding_entity.dart';
import 'package:wedding_planner_india/domain/repositories/wedding_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required WeddingRepository weddingRepository,
    required BudgetRepository budgetRepository,
    required GuestRepository guestRepository,
    required TimelineRepository timelineRepository,
    required CeremonyRepository ceremonyRepository,
  })  : _weddingRepository = weddingRepository,
        _budgetRepository = budgetRepository,
        _guestRepository = guestRepository,
        _timelineRepository = timelineRepository,
        _ceremonyRepository = ceremonyRepository,
        super(const HomeState()) {
    on<HomeLoadRequested>(_onLoad);
  }

  final WeddingRepository _weddingRepository;
  final BudgetRepository _budgetRepository;
  final GuestRepository _guestRepository;
  final TimelineRepository _timelineRepository;
  final CeremonyRepository _ceremonyRepository;

  Future<void> _onLoad(
    HomeLoadRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      final wedding = await _weddingRepository.getActiveWedding();
      if (wedding == null) {
        emit(state.copyWith(status: HomeStatus.noWedding));
        return;
      }

      final budgetItems = await _budgetRepository.getBudgetItems(wedding.id);
      final expenses = await _budgetRepository.getExpenses(wedding.id);
      final guests = await _guestRepository.getGuests(wedding.id);
      final tasks = await _timelineRepository.getTasks(wedding.id);
      final ceremonies = await _ceremonyRepository.getCeremonies(wedding.id);

      final totalSpent = budgetItems.fold<double>(0, (sum, i) => sum + i.actual);
      final totalPaid = budgetItems.fold<double>(0, (sum, i) => sum + i.paid);
      final pendingTasks =
          tasks.where((t) => !t.isCompleted).length;

      final upcomingCeremony = ceremonies
          .where((c) => !c.isSkipped && c.date != null)
          .toList()
        ..sort((a, b) => a.date!.compareTo(b.date!));

      emit(state.copyWith(
        status: HomeStatus.loaded,
        wedding: wedding,
        totalSpent: totalSpent,
        totalPaid: totalPaid,
        guestCount: guests.length,
        pendingTasks: pendingTasks,
        upcomingCeremony: upcomingCeremony.isNotEmpty
            ? upcomingCeremony.first
            : ceremonies.isNotEmpty
                ? ceremonies.first
                : null,
        latestExpense: expenses.isNotEmpty ? expenses.first : null,
        todaysTasks: tasks
            .where((t) => !t.isCompleted)
            .take(5)
            .toList(),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HomeStatus.error,
        errorMessage: 'Failed to load dashboard',
      ));
    }
  }
}
