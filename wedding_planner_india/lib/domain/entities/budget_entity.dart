import 'package:equatable/equatable.dart';
import 'package:wedding_planner_india/core/constants/app_constants.dart';

class BudgetItemEntity extends Equatable {
  const BudgetItemEntity({
    required this.id,
    required this.weddingId,
    required this.category,
    required this.estimated,
    this.actual = 0,
    this.paid = 0,
    this.vendor = '',
    this.notes = '',
  });

  final String id;
  final String weddingId;
  final BudgetCategory category;
  final double estimated;
  final double actual;
  final double paid;
  final String vendor;
  final String notes;

  double get remaining => actual - paid;

  @override
  List<Object?> get props => [
        id,
        weddingId,
        category,
        estimated,
        actual,
        paid,
        vendor,
        notes,
      ];

  BudgetItemEntity copyWith({
    String? id,
    String? weddingId,
    BudgetCategory? category,
    double? estimated,
    double? actual,
    double? paid,
    String? vendor,
    String? notes,
  }) {
    return BudgetItemEntity(
      id: id ?? this.id,
      weddingId: weddingId ?? this.weddingId,
      category: category ?? this.category,
      estimated: estimated ?? this.estimated,
      actual: actual ?? this.actual,
      paid: paid ?? this.paid,
      vendor: vendor ?? this.vendor,
      notes: notes ?? this.notes,
    );
  }
}

class ExpenseEntity extends Equatable {
  const ExpenseEntity({
    required this.id,
    required this.weddingId,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    this.vendor = '',
    this.gst = 0,
    this.paymentMethod = 'Cash',
    this.dueDate,
    this.notes = '',
  });

  final String id;
  final String weddingId;
  final String title;
  final double amount;
  final BudgetCategory category;
  final DateTime date;
  final String vendor;
  final double gst;
  final String paymentMethod;
  final DateTime? dueDate;
  final String notes;

  @override
  List<Object?> get props => [
        id,
        weddingId,
        title,
        amount,
        category,
        date,
        vendor,
        gst,
        paymentMethod,
        dueDate,
        notes,
      ];
}
