part of 'budget_bloc.dart';

sealed class BudgetEvent extends Equatable {
  const BudgetEvent();

  @override
  List<Object?> get props => [];
}

class BudgetLoadRequested extends BudgetEvent {
  const BudgetLoadRequested(this.weddingId);

  final String weddingId;

  @override
  List<Object?> get props => [weddingId];
}

class BudgetItemUpdated extends BudgetEvent {
  const BudgetItemUpdated(this.item);

  final BudgetItemEntity item;

  @override
  List<Object?> get props => [item];
}

class ExpenseAdded extends BudgetEvent {
  const ExpenseAdded({
    required this.weddingId,
    required this.title,
    required this.amount,
    required this.category,
    this.vendor = '',
    this.paymentMethod = 'Cash',
  });

  final String weddingId;
  final String title;
  final double amount;
  final BudgetCategory category;
  final String vendor;
  final String paymentMethod;

  @override
  List<Object?> get props => [
        weddingId,
        title,
        amount,
        category,
        vendor,
        paymentMethod,
      ];
}
