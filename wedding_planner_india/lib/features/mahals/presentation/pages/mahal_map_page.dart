import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_planner_india/core/di/injection.dart';
import 'package:wedding_planner_india/core/utils/mahal_launcher.dart';
import 'package:wedding_planner_india/features/mahals/presentation/bloc/mahal_map_bloc.dart';
import 'package:wedding_planner_india/features/mahals/presentation/widgets/live_mahal_map.dart';
import 'package:wedding_planner_india/features/mahals/presentation/widgets/mahal_list_tile.dart';
import 'package:wedding_planner_india/features/mahals/presentation/widgets/range_filter_chips.dart';

class MahalMapPage extends StatelessWidget {
  const MahalMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<MahalMapBloc>()..add(const MahalMapLoadRequested()),
      child: const _MahalMapView(),
    );
  }
}

class _MahalMapView extends StatelessWidget {
  const _MahalMapView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Marriage Mahals'),
        actions: [
          BlocBuilder<MahalMapBloc, MahalMapState>(
            buildWhen: (p, c) => p.followUser != c.followUser,
            builder: (context, state) {
              return IconButton(
                icon: Icon(
                  state.followUser
                      ? Icons.gps_fixed
                      : Icons.gps_not_fixed,
                ),
                tooltip: state.followUser
                    ? 'Following your location'
                    : 'Stop following location',
                onPressed: () {
                  context.read<MahalMapBloc>().add(
                        MahalMapFollowUserToggled(!state.followUser),
                      );
                },
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh location',
            onPressed: () {
              context.read<MahalMapBloc>().add(const MahalMapLoadRequested());
            },
          ),
        ],
      ),
      body: BlocBuilder<MahalMapBloc, MahalMapState>(
        builder: (context, state) {
          if (state.status == MahalMapStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: RangeFilterChips(
                  selectedKm: state.rangeKm,
                  onChanged: (km) {
                    context
                        .read<MahalMapBloc>()
                        .add(MahalMapRangeChanged(km));
                  },
                ),
              ),
              if (state.locationDenied)
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Location off — showing mahals near Chennai. Enable GPS for live tracking.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.orange.shade800,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: LiveMahalMap(
                    userLat: state.userLat,
                    userLng: state.userLng,
                    rangeKm: state.rangeKm,
                    mahals: state.mahals,
                    selectedMahalId: state.selectedMahalId,
                    followUser: state.followUser,
                    isLiveTracking: state.isLiveTracking,
                    onMahalTap: (id) {
                      context.read<MahalMapBloc>().add(
                            MahalMapMahalSelected(id),
                          );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text(
                      '${state.mahals.length} mahals • sorted by reviews',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    if (state.isLiveTracking) ...[
                      const SizedBox(width: 8),
                      Icon(Icons.circle, size: 8, color: Colors.red.shade600),
                      Text(
                        ' Live',
                        style: TextStyle(
                          color: Colors.red.shade600,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: state.mahals.isEmpty
                    ? const Center(
                        child: Text('No mahals found in this range'),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(12),
                        itemCount: state.mahals.length,
                        itemBuilder: (context, index) {
                          final item = state.mahals[index];
                          return MahalListTile(
                            item: item,
                            isSelected:
                                state.selectedMahalId == item.mahal.id,
                            onTap: () => context.push(
                              '/mahals/${item.mahal.id}',
                            ),
                            onCall: () => MahalLauncher.callPhone(
                              item.mahal.phone,
                            ),
                            onDirections: () => context.push(
                              '/mahals/${item.mahal.id}/directions',
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
}
