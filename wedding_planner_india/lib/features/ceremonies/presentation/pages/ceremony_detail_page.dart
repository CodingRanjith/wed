import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_planner_india/core/di/injection.dart';
import 'package:wedding_planner_india/core/utils/formatters.dart';
import 'package:wedding_planner_india/domain/repositories/wedding_repository.dart';
import 'package:wedding_planner_india/features/ceremonies/presentation/bloc/ceremony_bloc.dart';
import 'package:wedding_planner_india/l10n/app_localizations.dart';

class CeremonyDetailPage extends StatefulWidget {
  const CeremonyDetailPage({super.key, required this.ceremonyId});

  final String ceremonyId;

  @override
  State<CeremonyDetailPage> createState() => _CeremonyDetailPageState();
}

class _CeremonyDetailPageState extends State<CeremonyDetailPage> {
  String? _weddingId;

  @override
  void initState() {
    super.initState();
    _loadWedding();
  }

  Future<void> _loadWedding() async {
    final wedding = await getIt<WeddingRepository>().getActiveWedding();
    if (mounted) setState(() => _weddingId = wedding?.id);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (_weddingId == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return BlocProvider(
      create: (_) => getIt<CeremonyBloc>()
        ..add(CeremonyLoadRequested(_weddingId!)),
      child: BlocBuilder<CeremonyBloc, CeremonyState>(
        builder: (context, state) {
          final matches =
              state.ceremonies.where((c) => c.id == widget.ceremonyId);
          final ceremony = matches.isEmpty ? null : matches.first;

          if (ceremony == null) {
            return Scaffold(
              appBar: AppBar(),
              body: const Center(child: Text('Ceremony not found')),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: Text(ceremony.name),
              actions: [
                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'skip') {
                      context.read<CeremonyBloc>().add(
                            CeremonyUpdated(
                              ceremony.copyWith(isSkipped: !ceremony.isSkipped),
                            ),
                          );
                    } else if (value == 'delete') {
                      context.read<CeremonyBloc>().add(
                            CeremonyDeleted(ceremony.id),
                          );
                      Navigator.pop(context);
                    }
                  },
                  itemBuilder: (_) => [
                    PopupMenuItem(
                      value: 'skip',
                      child: Text(ceremony.isSkipped ? 'Unskip' : 'Skip'),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Text(l10n.delete),
                    ),
                  ],
                ),
              ],
            ),
            body: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: const Text('Date & Time'),
                    subtitle: Text(
                      ceremony.date != null
                          ? AppDateUtils.formatDate(ceremony.date!)
                          : 'Not set',
                    ),
                    trailing: const Icon(Icons.edit),
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate:
                            ceremony.date ?? DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate:
                            DateTime.now().add(const Duration(days: 730)),
                      );
                      if (date != null && context.mounted) {
                        context.read<CeremonyBloc>().add(
                              CeremonyUpdated(ceremony.copyWith(date: date)),
                            );
                      }
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.location_on),
                    title: Text(l10n.venue),
                    subtitle: Text(
                      ceremony.venue.isEmpty ? 'Not set' : ceremony.venue,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.checklist,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                ...ceremony.checklist.map(
                  (item) => Card(
                    margin: const EdgeInsets.only(bottom: 4),
                    child: CheckboxListTile(
                      value: item.isCompleted,
                      title: Text(item.title),
                      onChanged: (v) {
                        context.read<CeremonyBloc>().add(
                              ChecklistItemToggled(
                                ceremonyId: ceremony.id,
                                itemId: item.id,
                                completed: v ?? false,
                              ),
                            );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.notes,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      ceremony.notes.isEmpty
                          ? 'No notes added'
                          : ceremony.notes,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
