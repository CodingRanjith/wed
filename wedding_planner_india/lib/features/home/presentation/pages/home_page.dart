import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:wedding_planner_india/core/di/injection.dart';
import 'package:wedding_planner_india/core/router/route_paths.dart';
import 'package:wedding_planner_india/core/theme/app_colors.dart';
import 'package:wedding_planner_india/core/utils/formatters.dart';
import 'package:wedding_planner_india/core/widgets/stat_card.dart';
import 'package:wedding_planner_india/features/home/presentation/bloc/home_bloc.dart';
import 'package:wedding_planner_india/l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.weddingId});

  final String weddingId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeBloc>()..add(const HomeLoadRequested()),
      child: _HomeView(weddingId: weddingId),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({required this.weddingId});

  final String weddingId;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.status == HomeStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        final wedding = state.wedding;
        if (wedding == null) {
          return const Center(child: Text('No wedding found'));
        }

        final budgetUsed = wedding.budget > 0
            ? (state.totalSpent / wedding.budget).clamp(0.0, 1.0)
            : 0.0;
        final remaining = wedding.budget - state.totalPaid;

        return RefreshIndicator(
          onRefresh: () async {
            context.read<HomeBloc>().add(const HomeLoadRequested());
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 180,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('${wedding.brideName} & ${wedding.groomName}'),
                  background: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          theme.colorScheme.primary,
                          theme.colorScheme.primary.withValues(alpha: 0.6),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 40),
                          Text(
                            l10n.daysLeft(wedding.daysUntilWedding),
                            style: theme.textTheme.headlineSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            AppDateUtils.formatDate(wedding.weddingDate),
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: Colors.white.withValues(alpha: 0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: [
                            CircularPercentIndicator(
                              radius: 50,
                              lineWidth: 8,
                              percent: budgetUsed,
                              center: Text(
                                '${(budgetUsed * 100).toInt()}%',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              progressColor: AppColors.primary,
                              backgroundColor:
                                  AppColors.primary.withValues(alpha: 0.15),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    l10n.budget,
                                    style: theme.textTheme.titleSmall,
                                  ),
                                  Text(
                                    '${CurrencyFormatter.format(state.totalSpent, currency: wedding.currency)} / ${CurrencyFormatter.format(wedding.budget, currency: wedding.currency)}',
                                    style:
                                        theme.textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${l10n.remaining}: ${CurrencyFormatter.format(remaining, currency: wedding.currency)}',
                                    style: theme.textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              AppColors.primary.withValues(alpha: 0.15),
                          child: const Icon(Icons.map, color: AppColors.primary),
                        ),
                        title: const Text('Nearby Marriage Mahals'),
                        subtitle: const Text(
                          'Find reception halls by distance, reviews & directions',
                        ),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () => context.push(RoutePaths.mahals),
                      ),
                    ),
                    const SizedBox(height: 16),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1.4,
                      children: [
                        StatCard(
                          title: l10n.guests,
                          value: '${state.guestCount}',
                          icon: Icons.people,
                          color: AppColors.accent,
                        ),
                        StatCard(
                          title: 'Tasks',
                          value: l10n.pendingTasks(state.pendingTasks),
                          icon: Icons.task_alt,
                          color: AppColors.success,
                        ),
                        StatCard(
                          title: l10n.payments,
                          value: CurrencyFormatter.format(
                            wedding.budget - state.totalPaid,
                            currency: wedding.currency,
                          ),
                          icon: Icons.payment,
                          color: AppColors.warning,
                        ),
                        StatCard(
                          title: l10n.ceremonies,
                          value: wedding.weddingType.label.split(' ').first,
                          icon: Icons.temple_hindu,
                          onTap: () => context.push(RoutePaths.ceremonies),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    _SectionHeader(title: l10n.todaysTasks),
                    const SizedBox(height: 8),
                    if (state.todaysTasks.isEmpty)
                      const Card(
                        child: ListTile(
                          leading: Icon(Icons.check_circle_outline),
                          title: Text('All caught up!'),
                          subtitle: Text('No pending tasks'),
                        ),
                      )
                    else
                      ...state.todaysTasks.map(
                        (task) => Card(
                          child: ListTile(
                            leading: const Icon(Icons.radio_button_unchecked),
                            title: Text(task.title),
                            dense: true,
                          ),
                        ),
                      ),
                    const SizedBox(height: 24),
                    _SectionHeader(title: l10n.upcomingCeremony),
                    const SizedBox(height: 8),
                    if (state.upcomingCeremony != null)
                      Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor:
                                AppColors.primary.withValues(alpha: 0.15),
                            child: const Icon(Icons.celebration,
                                color: AppColors.primary),
                          ),
                          title: Text(state.upcomingCeremony!.name),
                          subtitle: Text(
                            state.upcomingCeremony!.date != null
                                ? AppDateUtils.formatDate(
                                    state.upcomingCeremony!.date!)
                                : 'Date not set',
                          ),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () => context.push(
                            '/ceremonies/${state.upcomingCeremony!.id}',
                          ),
                        ),
                      ),
                    const SizedBox(height: 24),
                    _SectionHeader(title: l10n.latestExpense),
                    const SizedBox(height: 8),
                    Card(
                      child: ListTile(
                        leading: const Icon(Icons.receipt_long),
                        title: Text(
                          state.latestExpense?.title ?? 'No expenses yet',
                        ),
                        subtitle: state.latestExpense != null
                            ? Text(
                                CurrencyFormatter.format(
                                  state.latestExpense!.amount,
                                  currency: wedding.currency,
                                ),
                              )
                            : const Text('Add your first expense'),
                      ),
                    ),
                    const SizedBox(height: 80),
                  ]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
