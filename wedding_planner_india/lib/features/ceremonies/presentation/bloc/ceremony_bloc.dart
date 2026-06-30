import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:wedding_planner_india/core/constants/app_constants.dart';
import 'package:wedding_planner_india/domain/entities/ceremony_entity.dart';
import 'package:wedding_planner_india/domain/repositories/wedding_repository.dart';

part 'ceremony_event.dart';
part 'ceremony_state.dart';

const _uuid = Uuid();

class CeremonyBloc extends Bloc<CeremonyEvent, CeremonyState> {
  CeremonyBloc({required CeremonyRepository ceremonyRepository})
      : _ceremonyRepository = ceremonyRepository,
        super(const CeremonyState()) {
    on<CeremonyLoadRequested>(_onLoad);
    on<CeremonyUpdated>(_onUpdated);
    on<CeremonyAdded>(_onAdded);
    on<CeremonyDeleted>(_onDeleted);
    on<CeremonyReordered>(_onReordered);
    on<ChecklistItemToggled>(_onChecklistToggled);
  }

  final CeremonyRepository _ceremonyRepository;

  Future<void> _onLoad(
    CeremonyLoadRequested event,
    Emitter<CeremonyState> emit,
  ) async {
    emit(state.copyWith(status: CeremonyStatus.loading));
    try {
      final ceremonies =
          await _ceremonyRepository.getCeremonies(event.weddingId);
      emit(state.copyWith(status: CeremonyStatus.loaded, ceremonies: ceremonies));
    } catch (e) {
      emit(state.copyWith(status: CeremonyStatus.error));
    }
  }

  Future<void> _onUpdated(
    CeremonyUpdated event,
    Emitter<CeremonyState> emit,
  ) async {
    await _ceremonyRepository.saveCeremony(event.ceremony);
    final updated = state.ceremonies
        .map((c) => c.id == event.ceremony.id ? event.ceremony : c)
        .toList();
    emit(state.copyWith(ceremonies: updated, selectedCeremony: event.ceremony));
  }

  Future<void> _onAdded(CeremonyAdded event, Emitter<CeremonyState> emit) async {
    final ceremony = CeremonyEntity(
      id: _uuid.v4(),
      weddingId: event.weddingId,
      name: event.name,
      side: event.side,
      sortOrder: state.ceremonies.length,
      isCustom: true,
    );
    await _ceremonyRepository.saveCeremony(ceremony);
    emit(state.copyWith(ceremonies: [...state.ceremonies, ceremony]));
  }

  Future<void> _onDeleted(
    CeremonyDeleted event,
    Emitter<CeremonyState> emit,
  ) async {
    await _ceremonyRepository.deleteCeremony(event.ceremonyId);
    emit(state.copyWith(
      ceremonies:
          state.ceremonies.where((c) => c.id != event.ceremonyId).toList(),
    ));
  }

  Future<void> _onReordered(
    CeremonyReordered event,
    Emitter<CeremonyState> emit,
  ) async {
    await _ceremonyRepository.reorderCeremonies(event.ceremonies);
    emit(state.copyWith(ceremonies: event.ceremonies));
  }

  Future<void> _onChecklistToggled(
    ChecklistItemToggled event,
    Emitter<CeremonyState> emit,
  ) async {
    final ceremony = state.ceremonies.firstWhere((c) => c.id == event.ceremonyId);
    final checklist = ceremony.checklist.map((item) {
      if (item.id == event.itemId) {
        return item.copyWith(isCompleted: event.completed);
      }
      return item;
    }).toList();
    final updated = ceremony.copyWith(checklist: checklist);
    await _ceremonyRepository.saveCeremony(updated);
    final ceremonies = state.ceremonies
        .map((c) => c.id == updated.id ? updated : c)
        .toList();
    emit(state.copyWith(ceremonies: ceremonies, selectedCeremony: updated));
  }
}
