import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_planner_india/core/constants/app_constants.dart';
import 'package:wedding_planner_india/core/di/injection.dart';
import 'package:wedding_planner_india/core/router/route_paths.dart';
import 'package:wedding_planner_india/core/theme/app_colors.dart';
import 'package:wedding_planner_india/domain/entities/timeline_task_entity.dart';
import 'package:wedding_planner_india/features/planner/presentation/bloc/planner_bloc.dart';
import 'package:wedding_planner_india/l10n/app_localizations.dart';

class PlannerPage extends StatelessWidget {
  const PlannerPage({super.key, required this.weddingId});

  final String weddingId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<PlannerBloc>()..add(PlannerLoadRequested(weddingId)),
      child: const _PlannerView(),
    );
  }
}

class _PlannerView extends StatelessWidget {
  const _PlannerView();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.planner),
          bottom: TabBar(
            tabs: [
              Tab(text: l10n.timeline),
              Tab(text: l10n.ceremonies),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const _TimelineTab(),
            _CeremoniesTab(
              onOpenCeremonies: () => context.push(RoutePaths.ceremonies),
            ),
          ],
        ),
      ),
    );
  }
}

class _TimelineTab extends StatelessWidget {
  const _TimelineTab();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlannerBloc, PlannerState>(
      builder: (context, state) {
        if (state.status == PlannerStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        final grouped = state.groupedTasks;

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: TimelineStage.values.length,
          itemBuilder: (context, index) {
            final stage = TimelineStage.values[index];
            final tasks = grouped[stage] ?? [];
            if (tasks.isEmpty) return const SizedBox.shrink();

            final completed =
                tasks.where((t) => t.isCompleted).length;
            final progress = tasks.isEmpty ? 0.0 : completed / tasks.length;

            return _TimelineStageCard(
              stage: stage,
              tasks: tasks,
              progress: progress,
              onToggle: (taskId, completed) {
                context.read<PlannerBloc>().add(
                      PlannerTaskToggled(
                        taskId: taskId,
                        completed: completed,
                      ),
                    );
              },
            );
          },
        );
      },
    );
  }
}

class _TimelineStageCard extends StatefulWidget {
  const _TimelineStageCard({
    required this.stage,
    required this.tasks,
    required this.progress,
    required this.onToggle,
  });

  final TimelineStage stage;
  final List<TimelineTaskEntity> tasks;
  final double progress;
  final void Function(String taskId, bool completed) onToggle;

  @override
  State<_TimelineStageCard> createState() => _TimelineStageCardState();
}

class _TimelineStageCardState extends State<_TimelineStageCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: AppColors.primary.withValues(alpha: 0.15),
                child: Text(
                  '${(widget.progress * 100).toInt()}%',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ),
              title: Text(
                widget.stage.label,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text('${widget.tasks.length} tasks'),
              trailing: Icon(
                _expanded ? Icons.expand_less : Icons.expand_more,
              ),
              onTap: () => setState(() => _expanded = !_expanded),
            ),
            if (_expanded)
              ...widget.tasks.map<Widget>((task) {
                return CheckboxListTile(
                  value: task.isCompleted,
                  title: Text(
                    task.title,
                    style: task.isCompleted
                        ? theme.textTheme.bodyMedium?.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: theme.colorScheme.onSurface
                                .withValues(alpha: 0.5),
                          )
                        : null,
                  ),
                  onChanged: (v) => widget.onToggle(task.id, v ?? false),
                  controlAffinity: ListTileControlAffinity.leading,
                  dense: true,
                );
              }),
          ],
        ),
      ),
    );
  }
}

class _CeremoniesTab extends StatelessWidget {
  const _CeremoniesTab({required this.onOpenCeremonies});

  final VoidCallback onOpenCeremonies;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.temple_hindu,
              size: 64,
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'Ceremony Planner',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Manage Ponnu Paarkum, Muhurtham, Reception & all ceremonies',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.6),
                  ),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: onOpenCeremonies,
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Open Ceremony Planner'),
            ),
          ],
        ),
      ),
    );
  }
}
