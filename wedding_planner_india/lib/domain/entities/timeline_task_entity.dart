import 'package:equatable/equatable.dart';
import 'package:wedding_planner_india/core/constants/app_constants.dart';

class TimelineTaskEntity extends Equatable {
  const TimelineTaskEntity({
    required this.id,
    required this.weddingId,
    required this.stage,
    required this.title,
    this.isCompleted = false,
    this.dueDate,
  });

  final String id;
  final String weddingId;
  final TimelineStage stage;
  final String title;
  final bool isCompleted;
  final DateTime? dueDate;

  TimelineTaskEntity copyWith({
    String? id,
    String? weddingId,
    TimelineStage? stage,
    String? title,
    bool? isCompleted,
    DateTime? dueDate,
  }) {
    return TimelineTaskEntity(
      id: id ?? this.id,
      weddingId: weddingId ?? this.weddingId,
      stage: stage ?? this.stage,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      dueDate: dueDate ?? this.dueDate,
    );
  }

  @override
  List<Object?> get props => [id, weddingId, stage, title, isCompleted, dueDate];
}
