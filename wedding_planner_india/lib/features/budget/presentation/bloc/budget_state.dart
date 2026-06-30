part of 'budget_bloc.dart';

enum BudgetStatus { initial, loading, loaded, error }

class BudgetState extends Equatable {
  const BudgetState({
    this.status = BudgetStatus.initial,
    this.items = const [],
    this.expenses = const [],
  });

  final BudgetStatus status;
  final List<BudgetItemEntity> items;
  final List<ExpenseEntity> expenses;

  double get totalEstimated =>
      items.fold(0.0, (sum, item) => sum + item.estimated);

  double get totalActual => items.fold(0.0, (sum, item) => sum + item.actual);

  double get totalPaid => items.fold(0.0, (sum, item) => sum + item.paid);

  double get totalRemaining => totalActual - totalPaid;

  BudgetState copyWith({
    BudgetStatus? status,
    List<BudgetItemEntity>? items,
    List<ExpenseEntity>? expenses,
  }) {
    return BudgetState(
      status: status ?? this.status,
      items: items ?? this.items,
      expenses: expenses ?? this.expenses,
    );
  }

  @override
  List<Object?> get props => [status, items, expenses];
}
