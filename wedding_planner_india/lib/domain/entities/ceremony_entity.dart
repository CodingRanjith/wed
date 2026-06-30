import 'package:equatable/equatable.dart';
import 'package:wedding_planner_india/core/constants/app_constants.dart';

class CeremonyEntity extends Equatable {
  const CeremonyEntity({
    required this.id,
    required this.weddingId,
    required this.name,
    required this.side,
    required this.sortOrder,
    this.date,
    this.time,
    this.venue = '',
    this.dress = '',
    this.jewelry = '',
    this.budget = 0,
    this.notes = '',
    this.isSkipped = false,
    this.isCustom = false,
    this.checklist = const [],
  });

  final String id;
  final String weddingId;
  final String name;
  final CeremonySide side;
  final int sortOrder;
  final DateTime? date;
  final String? time;
  final String venue;
  final String dress;
  final String jewelry;
  final double budget;
  final String notes;
  final bool isSkipped;
  final bool isCustom;
  final List<ChecklistItemEntity> checklist;

  int get completedChecklistCount =>
      checklist.where((item) => item.isCompleted).length;

  @override
  List<Object?> get props => [
        id,
        weddingId,
        name,
        side,
        sortOrder,
        date,
        time,
        venue,
        dress,
        jewelry,
        budget,
        notes,
        isSkipped,
        isCustom,
        checklist,
      ];

  CeremonyEntity copyWith({
    String? id,
    String? weddingId,
    String? name,
    CeremonySide? side,
    int? sortOrder,
    DateTime? date,
    String? time,
    String? venue,
    String? dress,
    String? jewelry,
    double? budget,
    String? notes,
    bool? isSkipped,
    bool? isCustom,
    List<ChecklistItemEntity>? checklist,
  }) {
    return CeremonyEntity(
      id: id ?? this.id,
      weddingId: weddingId ?? this.weddingId,
      name: name ?? this.name,
      side: side ?? this.side,
      sortOrder: sortOrder ?? this.sortOrder,
      date: date ?? this.date,
      time: time ?? this.time,
      venue: venue ?? this.venue,
      dress: dress ?? this.dress,
      jewelry: jewelry ?? this.jewelry,
      budget: budget ?? this.budget,
      notes: notes ?? this.notes,
      isSkipped: isSkipped ?? this.isSkipped,
      isCustom: isCustom ?? this.isCustom,
      checklist: checklist ?? this.checklist,
    );
  }
}

class ChecklistItemEntity extends Equatable {
  const ChecklistItemEntity({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });

  final String id;
  final String title;
  final bool isCompleted;

  ChecklistItemEntity copyWith({
    String? id,
    String? title,
    bool? isCompleted,
  }) {
    return ChecklistItemEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [id, title, isCompleted];
}
