part of 'planner_bloc.dart';

sealed class PlannerEvent extends Equatable {
  const PlannerEvent();

  @override
  List<Object?> get props => [];
}

class PlannerLoadRequested extends PlannerEvent {
  const PlannerLoadRequested(this.weddingId);

  final String weddingId;

  @override
  List<Object?> get props => [weddingId];
}

class PlannerTaskToggled extends PlannerEvent {
  const PlannerTaskToggled({
    required this.taskId,
    required this.completed,
  });

  final String taskId;
  final bool completed;

  @override
  List<Object?> get props => [taskId, completed];
}
