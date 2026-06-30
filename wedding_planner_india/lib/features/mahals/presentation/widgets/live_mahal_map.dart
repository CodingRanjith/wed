import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:wedding_planner_india/core/theme/app_colors.dart';
import 'package:wedding_planner_india/domain/entities/mahal_entity.dart';

/// Free live map using OpenStreetMap — no API key or billing required.
class LiveMahalMap extends StatefulWidget {
  const LiveMahalMap({
    super.key,
    required this.userLat,
    required this.userLng,
    required this.rangeKm,
    required this.mahals,
    required this.selectedMahalId,
    required this.followUser,
    required this.isLiveTracking,
    required this.onMahalTap,
  });

  final double userLat;
  final double userLng;
  final double rangeKm;
  final List<MahalWithDistance> mahals;
  final String? selectedMahalId;
  final bool followUser;
  final bool isLiveTracking;
  final ValueChanged<String> onMahalTap;

  @override
  State<LiveMahalMap> createState() => _LiveMahalMapState();
}

class _LiveMahalMapState extends State<LiveMahalMap> {
  final MapController _mapController = MapController();

  @override
  void didUpdateWidget(covariant LiveMahalMap oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.followUser &&
        (oldWidget.userLat != widget.userLat ||
            oldWidget.userLng != widget.userLng ||
            oldWidget.rangeKm != widget.rangeKm)) {
      _mapController.move(
        LatLng(widget.userLat, widget.userLng),
        _zoomForRange(widget.rangeKm),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: LatLng(widget.userLat, widget.userLng),
              initialZoom: _zoomForRange(widget.rangeKm),
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.weddingplanner.india',
              ),
              CircleLayer(
                circles: [
                  CircleMarker(
                    point: LatLng(widget.userLat, widget.userLng),
                    radius: widget.rangeKm * 1000,
                    useRadiusInMeter: true,
                    color: AppColors.primary.withValues(alpha: 0.12),
                    borderColor: AppColors.primary.withValues(alpha: 0.5),
                    borderStrokeWidth: 2,
                  ),
                ],
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(widget.userLat, widget.userLng),
                    width: 48,
                    height: 48,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.my_location,
                        color: Colors.blue,
                        size: 32,
                      ),
                    ),
                  ),
                  ...widget.mahals.map((item) {
                    final selected =
                        widget.selectedMahalId == item.mahal.id;
                    return Marker(
                      point: LatLng(
                        item.mahal.latitude,
                        item.mahal.longitude,
                      ),
                      width: 52,
                      height: 52,
                      child: GestureDetector(
                        onTap: () => widget.onMahalTap(item.mahal.id),
                        child: Column(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: selected
                                  ? AppColors.error
                                  : AppColors.primary,
                              size: selected ? 40 : 34,
                            ),
                            if (selected)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  item.mahal.name.split(' ').first,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
        if (widget.isLiveTracking)
          const Positioned(top: 12, left: 12, child: _LiveBadge()),
        Positioned(
          bottom: 4,
          right: 4,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            color: Colors.white.withValues(alpha: 0.85),
            child: const Text(
              '© OpenStreetMap — Free',
              style: TextStyle(fontSize: 9, color: Colors.black54),
            ),
          ),
        ),
      ],
    );
  }

  double _zoomForRange(double km) {
    if (km <= 1) return 15;
    if (km <= 5) return 13;
    return 12;
  }
}

class _LiveBadge extends StatelessWidget {
  const _LiveBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4)],
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.gps_fixed, color: Colors.white, size: 14),
          SizedBox(width: 4),
          Text(
            'LIVE',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
