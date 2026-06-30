import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_planner_india/core/constants/app_constants.dart';
import 'package:wedding_planner_india/core/di/injection.dart';
import 'package:wedding_planner_india/core/theme/app_colors.dart';
import 'package:wedding_planner_india/core/utils/formatters.dart';
import 'package:wedding_planner_india/features/budget/presentation/bloc/budget_bloc.dart';
import 'package:wedding_planner_india/l10n/app_localizations.dart';

class BudgetPage extends StatelessWidget {
  const BudgetPage({super.key, required this.weddingId});

  final String weddingId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<BudgetBloc>()..add(BudgetLoadRequested(weddingId)),
      child: _BudgetView(weddingId: weddingId),
    );
  }
}

class _BudgetView extends StatelessWidget {
  const _BudgetView({required this.weddingId});

  final String weddingId;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.budget)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddExpenseDialog(context),
        icon: const Icon(Icons.add),
        label: Text(l10n.addExpense),
      ),
      body: BlocBuilder<BudgetBloc, BudgetState>(
        builder: (context, state) {
          if (state.status == BudgetStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          final chartData = state.items
              .where((i) => i.actual > 0)
              .toList();

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      _BudgetSummaryTile(
                        label: l10n.estimated,
                        value: CurrencyFormatter.format(state.totalEstimated),
                      ),
                      _BudgetSummaryTile(
                        label: l10n.actual,
                        value: CurrencyFormatter.format(state.totalActual),
                      ),
                      _BudgetSummaryTile(
                        label: l10n.remaining,
                        value:
                            CurrencyFormatter.format(state.totalRemaining),
                      ),
                    ],
                  ),
                ),
              ),
              if (chartData.isNotEmpty)
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 200,
                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 2,
                        centerSpaceRadius: 40,
                        sections: chartData.asMap().entries.map((entry) {
                          final colors = [
                            AppColors.primary,
                            AppColors.accent,
                            AppColors.secondary,
                            AppColors.success,
                            AppColors.warning,
                          ];
                          return PieChartSectionData(
                            value: entry.value.actual,
                            title: entry.value.category.label.split(' ').first,
                            color: colors[entry.key % colors.length],
                            radius: 50,
                            titleStyle: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final item = state.items[index];
                      if (item.estimated == 0 && item.actual == 0) {
                        return const SizedBox.shrink();
                      }
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          title: Text(item.category.label),
                          subtitle: Text(
                            '${l10n.estimated}: ${CurrencyFormatter.format(item.estimated)} • ${l10n.paid}: ${CurrencyFormatter.format(item.paid)}',
                          ),
                          trailing: Text(
                            CurrencyFormatter.format(item.actual),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
                    childCount: state.items.length,
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 80)),
            ],
          );
        },
      ),
    );
  }

  void _showAddExpenseDialog(BuildContext context) {
    final titleController = TextEditingController();
    final amountController = TextEditingController();
    var category = BudgetCategory.miscellaneous;

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 24,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocalizations.of(context)!.addExpense,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: amountController,
                decoration: const InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<BudgetCategory>(
                value: category,
                decoration: const InputDecoration(labelText: 'Category'),
                items: BudgetCategory.values
                    .map(
                      (c) => DropdownMenuItem(
                        value: c,
                        child: Text(c.label),
                      ),
                    )
                    .toList(),
                onChanged: (v) => category = v ?? category,
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () {
                  final amount =
                      double.tryParse(amountController.text) ?? 0;
                  if (titleController.text.isNotEmpty && amount > 0) {
                    context.read<BudgetBloc>().add(
                          ExpenseAdded(
                            weddingId: weddingId,
                            title: titleController.text,
                            amount: amount,
                            category: category,
                          ),
                        );
                    Navigator.pop(ctx);
                  }
                },
                child: Text(AppLocalizations.of(context)!.save),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _BudgetSummaryTile extends StatelessWidget {
  const _BudgetSummaryTile({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
