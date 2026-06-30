import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wedding_planner_india/core/constants/app_constants.dart';
import 'package:wedding_planner_india/core/di/injection.dart';
import 'package:wedding_planner_india/core/utils/guest_side_utils.dart';
import 'package:wedding_planner_india/core/widgets/empty_state.dart';
import 'package:wedding_planner_india/domain/entities/guest_entity.dart';
import 'package:wedding_planner_india/features/guests/presentation/bloc/guest_bloc.dart';
import 'package:wedding_planner_india/l10n/app_localizations.dart';

class GuestsPage extends StatelessWidget {
  const GuestsPage({super.key, required this.weddingId});

  final String weddingId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<GuestBloc>()..add(GuestLoadRequested(weddingId)),
      child: _GuestsView(weddingId: weddingId),
    );
  }
}

class _GuestsView extends StatefulWidget {
  const _GuestsView({required this.weddingId});

  final String weddingId;

  @override
  State<_GuestsView> createState() => _GuestsViewState();
}

class _GuestsViewState extends State<_GuestsView> {
  GuestSide? _filterSide;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.guests),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () => _showAddGuestDialog(context),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddGuestDialog(context),
        icon: const Icon(Icons.person_add),
        label: Text(l10n.addGuest),
      ),
      body: BlocBuilder<GuestBloc, GuestState>(
        builder: (context, state) {
          if (state.status == GuestStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          final guests = _filterSide == null
              ? state.guests
              : state.guests.where((g) => g.side == _filterSide).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  children: [
                    _GuestStatChip(
                      label: 'Total',
                      count: state.guests.length,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 8),
                    _GuestStatChip(
                      label: l10n.coming,
                      count: state.comingCount,
                      color: Colors.green,
                    ),
                    const SizedBox(width: 8),
                    _GuestStatChip(
                      label: l10n.notComing,
                      count: state.notComingCount,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
              _SideSummaryGrid(guests: state.guests),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    FilterChip(
                      label: Text(l10n.allGuests),
                      selected: _filterSide == null,
                      onSelected: (_) => setState(() => _filterSide = null),
                    ),
                    const SizedBox(width: 8),
                    ...GuestSideX.mainSides.map(
                      (side) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: FilterChip(
                          avatar: Icon(side.icon, size: 18),
                          label: Text(side.label(l10n)),
                          selected: _filterSide == side,
                          onSelected: (_) =>
                              setState(() => _filterSide = side),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: guests.isEmpty
                    ? EmptyStateWidget(
                        title: 'No guests yet',
                        message: _filterSide == null
                            ? 'Add your first guest to start tracking RSVPs'
                            : 'No guests in ${ _filterSide!.label(l10n)}',
                        icon: Icons.people_outline,
                        actionLabel: l10n.addGuest,
                        onAction: () => _showAddGuestDialog(context),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: guests.length,
                        itemBuilder: (context, index) {
                          final guest = guests[index];
                          return Card(
                            margin: const EdgeInsets.only(bottom: 8),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: guest.side
                                    .sideColor(context)
                                    .withValues(alpha: 0.15),
                                child: Icon(
                                  guest.side.icon,
                                  color: guest.side.sideColor(context),
                                ),
                              ),
                              title: Text(guest.name),
                              subtitle: Text(
                                '${guest.side.label(l10n)} • ${guest.foodPreference.label(l10n)}',
                              ),
                              trailing: _RsvpChip(status: guest.rsvpStatus),
                              onTap: () => _showGuestOptions(context, guest),
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _showAddGuestDialog(BuildContext context, {GuestEntity? existing}) {
    final nameController = TextEditingController(text: existing?.name ?? '');
    var side = existing?.side ?? GuestSide.brideWomen;
    var food = existing?.foodPreference ?? FoodPreference.veg;
    final l10n = AppLocalizations.of(context)!;

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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      existing == null ? l10n.addGuest : l10n.edit,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                      textCapitalization: TextCapitalization.words,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.guestSide,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: GuestSide.values.map((s) {
                        final selected = side == s;
                        return ChoiceChip(
                          avatar: Icon(s.icon, size: 18),
                          label: Text(s.label(l10n)),
                          selected: selected,
                          onSelected: (_) => setState(() => side = s),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.foodPreference,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: FoodPreference.values.map((f) {
                        return ChoiceChip(
                          label: Text(f.label(l10n)),
                          selected: food == f,
                          onSelected: (_) => setState(() => food = f),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 24),
                    FilledButton(
                      onPressed: () {
                        if (nameController.text.isNotEmpty) {
                          if (existing == null) {
                            context.read<GuestBloc>().add(
                                  GuestAdded(
                                    weddingId: widget.weddingId,
                                    name: nameController.text,
                                    side: side,
                                    foodPreference: food,
                                  ),
                                );
                          } else {
                            context.read<GuestBloc>().add(
                                  GuestUpdated(
                                    existing.copyWith(
                                      name: nameController.text,
                                      side: side,
                                      foodPreference: food,
                                    ),
                                  ),
                                );
                          }
                          Navigator.pop(ctx);
                        }
                      },
                      child: Text(l10n.save),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showGuestOptions(BuildContext context, GuestEntity guest) {
    final l10n = AppLocalizations.of(context)!;

    showModalBottomSheet<void>(
      context: context,
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.edit),
                title: Text(l10n.edit),
                onTap: () {
                  Navigator.pop(ctx);
                  _showAddGuestDialog(context, existing: guest);
                },
              ),
              ListTile(
                leading: const Icon(Icons.check_circle, color: Colors.green),
                title: Text(l10n.coming),
                onTap: () {
                  context.read<GuestBloc>().add(
                        GuestUpdated(
                          guest.copyWith(rsvpStatus: RsvpStatus.coming),
                        ),
                      );
                  Navigator.pop(ctx);
                },
              ),
              ListTile(
                leading: const Icon(Icons.cancel, color: Colors.red),
                title: Text(l10n.notComing),
                onTap: () {
                  context.read<GuestBloc>().add(
                        GuestUpdated(
                          guest.copyWith(rsvpStatus: RsvpStatus.notComing),
                        ),
                      );
                  Navigator.pop(ctx);
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: Text(l10n.delete),
                onTap: () {
                  context.read<GuestBloc>().add(GuestDeleted(guest.id));
                  Navigator.pop(ctx);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SideSummaryGrid extends StatelessWidget {
  const _SideSummaryGrid({required this.guests});

  final List<GuestEntity> guests;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 1.6,
        children: GuestSideX.mainSides.map((side) {
          final total = guests.countForSide(side);
          final coming = guests.comingCountForSide(side);
          final veg = guests.foodCountForSide(side, FoodPreference.veg);
          final nonVeg = guests.foodCountForSide(side, FoodPreference.nonVeg);
          final jain = guests.foodCountForSide(side, FoodPreference.jain);

          return Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        side.icon,
                        size: 18,
                        color: side.sideColor(context),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          side.label(l10n),
                          style: Theme.of(context).textTheme.labelMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    '$total total • $coming ${l10n.coming.toLowerCase()}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    '${l10n.veg}: $veg • ${l10n.nonVeg}: $nonVeg • ${l10n.jainFood}: $jain',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _GuestStatChip extends StatelessWidget {
  const _GuestStatChip({
    required this.label,
    required this.count,
    required this.color,
  });

  final String label;
  final int count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            children: [
              Text(
                '$count',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              Text(label, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}

class _RsvpChip extends StatelessWidget {
  const _RsvpChip({required this.status});

  final RsvpStatus status;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final (color, label) = switch (status) {
      RsvpStatus.coming => (Colors.green, l10n.coming),
      RsvpStatus.notComing => (Colors.red, l10n.notComing),
      RsvpStatus.pending => (Colors.orange, 'Pending'),
    };

    return Chip(
      label: Text(label, style: const TextStyle(fontSize: 11)),
      backgroundColor: color.withValues(alpha: 0.15),
      side: BorderSide.none,
      padding: EdgeInsets.zero,
      visualDensity: VisualDensity.compact,
    );
  }
}
