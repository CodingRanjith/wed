import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_planner_india/core/constants/app_constants.dart';
import 'package:wedding_planner_india/core/di/injection.dart';
import 'package:wedding_planner_india/domain/entities/ceremony_entity.dart';
import 'package:wedding_planner_india/domain/repositories/wedding_repository.dart';
import 'package:wedding_planner_india/features/ceremonies/presentation/bloc/ceremony_bloc.dart';
import 'package:wedding_planner_india/l10n/app_localizations.dart';

class CeremoniesPage extends StatefulWidget {
  const CeremoniesPage({super.key});

  @override
  State<CeremoniesPage> createState() => _CeremoniesPageState();
}

class _CeremoniesPageState extends State<CeremoniesPage> {
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
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.ceremonies)),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _showAddCeremonyDialog(context, _weddingId!),
          icon: const Icon(Icons.add),
          label: Text(l10n.addCeremony),
        ),
        body: BlocBuilder<CeremonyBloc, CeremonyState>(
          builder: (context, state) {
            if (state.status == CeremonyStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            return DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(text: l10n.brideSide),
                      Tab(text: l10n.groomSide),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        _CeremonyList(
                          ceremonies: state.brideCeremonies,
                          onTap: (id) => context.push('/ceremonies/$id'),
                          onReorder: (list) => context
                              .read<CeremonyBloc>()
                              .add(CeremonyReordered(list)),
                        ),
                        _CeremonyList(
                          ceremonies: state.groomCeremonies,
                          onTap: (id) => context.push('/ceremonies/$id'),
                          onReorder: (list) => context
                              .read<CeremonyBloc>()
                              .add(CeremonyReordered(list)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _showAddCeremonyDialog(BuildContext context, String weddingId) {
    final nameController = TextEditingController();
    var side = CeremonySide.bride;

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setState) {
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
                    AppLocalizations.of(context)!.customCeremony,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: nameController,
                    decoration:
                        const InputDecoration(labelText: 'Ceremony Name'),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<CeremonySide>(
                    value: side,
                    decoration: const InputDecoration(labelText: 'Side'),
                    items: CeremonySide.values
                        .map(
                          (s) => DropdownMenuItem(
                            value: s,
                            child: Text(s.name),
                          ),
                        )
                        .toList(),
                    onChanged: (v) => setState(() => side = v ?? side),
                  ),
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: () {
                      if (nameController.text.isNotEmpty) {
                        context.read<CeremonyBloc>().add(
                              CeremonyAdded(
                                weddingId: weddingId,
                                name: nameController.text,
                                side: side,
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
      },
    );
  }
}

class _CeremonyList extends StatelessWidget {
  const _CeremonyList({
    required this.ceremonies,
    required this.onTap,
    required this.onReorder,
  });

  final List<CeremonyEntity> ceremonies;
  final ValueChanged<String> onTap;
  final ValueChanged<List<CeremonyEntity>> onReorder;

  @override
  Widget build(BuildContext context) {
    if (ceremonies.isEmpty) {
      return const Center(child: Text('No ceremonies'));
    }

    return ReorderableListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: ceremonies.length,
      onReorder: (oldIndex, newIndex) {
        if (newIndex > oldIndex) newIndex--;
        final list = List.of(ceremonies);
        final item = list.removeAt(oldIndex);
        list.insert(newIndex, item);
        onReorder(list);
      },
      itemBuilder: (context, index) {
        final ceremony = ceremonies[index];
        final progress = ceremony.checklist.isEmpty
            ? 0.0
            : ceremony.completedChecklistCount / ceremony.checklist.length;

        return Card(
          key: ValueKey(ceremony.id),
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: CircleAvatar(
              child: Text('${(progress * 100).toInt()}%'),
            ),
            title: Text(
              ceremony.name,
              style: ceremony.isSkipped
                  ? const TextStyle(decoration: TextDecoration.lineThrough)
                  : null,
            ),
            subtitle: Text(
              '${ceremony.completedChecklistCount}/${ceremony.checklist.length} checklist items',
            ),
            trailing: const Icon(Icons.drag_handle),
            onTap: () => onTap(ceremony.id),
          ),
        );
      },
    );
  }
}
