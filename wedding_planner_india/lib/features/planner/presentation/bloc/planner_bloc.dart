import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_planner_india/core/constants/app_constants.dart';
import 'package:wedding_planner_india/domain/entities/timeline_task_entity.dart';
import 'package:wedding_planner_india/domain/repositories/wedding_repository.dart';

part 'planner_event.dart';
part 'planner_state.dart';

class PlannerBloc extends Bloc<PlannerEvent, PlannerState> {
  PlannerBloc({required TimelineRepository timelineRepository})
      : _timelineRepository = timelineRepository,
        super(const PlannerState()) {
    on<PlannerLoadRequested>(_onLoad);
    on<PlannerTaskToggled>(_onTaskToggled);
  }

  final TimelineRepository _timelineRepository;

  Future<void> _onLoad(
    PlannerLoadRequested event,
    Emitter<PlannerState> emit,
  ) async {
    emit(state.copyWith(status: PlannerStatus.loading));
    try {
      final tasks = await _timelineRepository.getTasks(event.weddingId);
      emit(state.copyWith(status: PlannerStatus.loaded, tasks: tasks));
    } catch (e) {
      emit(state.copyWith(status: PlannerStatus.error));
    }
  }

  Future<void> _onTaskToggled(
    PlannerTaskToggled event,
    Emitter<PlannerState> emit,
  ) async {
    await _timelineRepository.toggleTask(event.taskId, event.completed);
    final updated = state.tasks.map((task) {
      if (task.id == event.taskId) {
        return task.copyWith(isCompleted: event.completed);
      }
      return task;
    }).toList();
    emit(state.copyWith(tasks: updated));
  }
}
