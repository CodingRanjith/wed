import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:wedding_planner_india/core/constants/app_constants.dart';
import 'package:wedding_planner_india/domain/entities/budget_entity.dart';
import 'package:wedding_planner_india/domain/repositories/wedding_repository.dart';

part 'budget_event.dart';
part 'budget_state.dart';

const _uuid = Uuid();

class BudgetBloc extends Bloc<BudgetEvent, BudgetState> {
  BudgetBloc({required BudgetRepository budgetRepository})
      : _budgetRepository = budgetRepository,
        super(const BudgetState()) {
    on<BudgetLoadRequested>(_onLoad);
    on<BudgetItemUpdated>(_onItemUpdated);
    on<ExpenseAdded>(_onExpenseAdded);
  }

  final BudgetRepository _budgetRepository;

  Future<void> _onLoad(
    BudgetLoadRequested event,
    Emitter<BudgetState> emit,
  ) async {
    emit(state.copyWith(status: BudgetStatus.loading));
    try {
      final items = await _budgetRepository.getBudgetItems(event.weddingId);
      final expenses = await _budgetRepository.getExpenses(event.weddingId);
      emit(state.copyWith(
        status: BudgetStatus.loaded,
        items: items,
        expenses: expenses,
      ));
    } catch (e) {
      emit(state.copyWith(status: BudgetStatus.error));
    }
  }

  Future<void> _onItemUpdated(
    BudgetItemUpdated event,
    Emitter<BudgetState> emit,
  ) async {
    await _budgetRepository.saveBudgetItem(event.item);
    final updated = state.items.map((item) {
      return item.id == event.item.id ? event.item : item;
    }).toList();
    emit(state.copyWith(items: updated));
  }

  Future<void> _onExpenseAdded(
    ExpenseAdded event,
    Emitter<BudgetState> emit,
  ) async {
    final expense = ExpenseEntity(
      id: _uuid.v4(),
      weddingId: event.weddingId,
      title: event.title,
      amount: event.amount,
      category: event.category,
      date: DateTime.now(),
      vendor: event.vendor,
      paymentMethod: event.paymentMethod,
    );
    await _budgetRepository.saveExpense(expense);

    final item = state.items.firstWhere(
      (i) => i.category == event.category,
      orElse: () => BudgetItemEntity(
        id: _uuid.v4(),
        weddingId: event.weddingId,
        category: event.category,
        estimated: 0,
      ),
    );
    final updatedItem = item.copyWith(
      actual: item.actual + event.amount,
      paid: item.paid + event.amount,
    );
    await _budgetRepository.saveBudgetItem(updatedItem);

    emit(state.copyWith(
      expenses: [expense, ...state.expenses],
      items: state.items
          .map((i) => i.id == updatedItem.id ? updatedItem : i)
          .toList(),
    ));
  }
}
