part of 'planner_bloc.dart';

enum PlannerStatus { initial, loading, loaded, error }

class PlannerState extends Equatable {
  const PlannerState({
    this.status = PlannerStatus.initial,
    this.tasks = const [],
  });

  final PlannerStatus status;
  final List<TimelineTaskEntity> tasks;

  Map<TimelineStage, List<TimelineTaskEntity>> get groupedTasks {
    final map = <TimelineStage, List<TimelineTaskEntity>>{};
    for (final stage in TimelineStage.values) {
      map[stage] = tasks.where((t) => t.stage == stage).toList();
    }
    return map;
  }

  PlannerState copyWith({
    PlannerStatus? status,
    List<TimelineTaskEntity>? tasks,
  }) {
    return PlannerState(
      status: status ?? this.status,
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  List<Object?> get props => [status, tasks];
}
