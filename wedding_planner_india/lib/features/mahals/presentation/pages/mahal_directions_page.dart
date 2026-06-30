import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:wedding_planner_india/core/di/injection.dart';
import 'package:wedding_planner_india/core/models/geo_point.dart';
import 'package:wedding_planner_india/core/services/live_location_service.dart';
import 'package:wedding_planner_india/core/services/route_service.dart';
import 'package:wedding_planner_india/core/theme/app_colors.dart';
import 'package:wedding_planner_india/core/utils/geo_utils.dart';
import 'package:wedding_planner_india/core/utils/mahal_launcher.dart';
import 'package:wedding_planner_india/data/datasources/local/mahal_sample_data.dart';
import 'package:wedding_planner_india/domain/repositories/mahal_repository.dart';

class MahalDirectionsPage extends StatefulWidget {
  const MahalDirectionsPage({super.key, required this.mahalId});

  final String mahalId;

  @override
  State<MahalDirectionsPage> createState() => _MahalDirectionsPageState();
}

class _MahalDirectionsPageState extends State<MahalDirectionsPage> {
  final MapController _mapController = MapController();
  List<GeoPoint> _route = [];
  double _userLat = MahalSampleData.defaultLat;
  double _userLng = MahalSampleData.defaultLng;
  bool _loading = true;
  String? _distanceText;
  bool _liveTracking = false;

  @override
  void initState() {
    super.initState();
    _loadRoute();
    _startLiveTracking();
  }

  Future<void> _startLiveTracking() async {
    final service = getIt<LiveLocationService>();
    final started = await service.startTracking();
    if (!started || !mounted) return;

    setState(() => _liveTracking = true);
    service.positionStream.listen((position) async {
      if (!mounted) return;
      final mahal = getIt<MahalRepository>().getMahalById(widget.mahalId);
      if (mahal == null) return;

      final route = await getIt<RouteService>().fetchRoute(
        fromLat: position.latitude,
        fromLng: position.longitude,
        toLat: mahal.latitude,
        toLng: mahal.longitude,
      );

      setState(() {
        _userLat = position.latitude;
        _userLng = position.longitude;
        _route = route;
        _distanceText =
            '${GeoUtils.distanceKm(_userLat, _userLng, mahal.latitude, mahal.longitude).toStringAsFixed(1)} km';
      });
    });
  }

  Future<void> _loadRoute() async {
    final mahal = getIt<MahalRepository>().getMahalById(widget.mahalId);
    if (mahal == null) {
      setState(() => _loading = false);
      return;
    }

    final position = await getIt<LiveLocationService>().getCurrentPosition();
    if (position != null) {
      _userLat = position.latitude;
      _userLng = position.longitude;
    }

    final route = await getIt<RouteService>().fetchRoute(
      fromLat: _userLat,
      fromLng: _userLng,
      toLat: mahal.latitude,
      toLng: mahal.longitude,
    );

    final distance = GeoUtils.distanceKm(
      _userLat,
      _userLng,
      mahal.latitude,
      mahal.longitude,
    );

    if (mounted) {
      setState(() {
        _route = route;
        _distanceText = '${distance.toStringAsFixed(1)} km';
        _loading = false;
      });
      _fitBounds(mahal.latitude, mahal.longitude);
    }
  }

  void _fitBounds(double destLat, double destLng) {
    _mapController.fitCamera(
      CameraFit.coordinates(
        coordinates: [
          LatLng(_userLat, _userLng),
          LatLng(destLat, destLng),
        ],
        padding: const EdgeInsets.all(48),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mahal = getIt<MahalRepository>().getMahalById(widget.mahalId);
    if (mahal == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('Mahal not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Directions to ${mahal.name}'),
        actions: [
          if (_liveTracking)
            const Padding(
              padding: EdgeInsets.only(right: 12),
              child: Center(
                child: Text(
                  '● LIVE',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: FlutterMap(
                    mapController: _mapController,
                    options: MapOptions(
                      initialCenter: LatLng(
                        (mahal.latitude + _userLat) / 2,
                        (mahal.longitude + _userLng) / 2,
                      ),
                      initialZoom: 13,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.weddingplanner.india',
                      ),
                      if (_route.length >= 2)
                        PolylineLayer(
                          polylines: [
                            Polyline(
                              points: _route
                                  .map(
                                    (p) => LatLng(p.latitude, p.longitude),
                                  )
                                  .toList(),
                              color: AppColors.primary,
                              strokeWidth: 5,
                            ),
                          ],
                        ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: LatLng(_userLat, _userLng),
                            width: 40,
                            height: 40,
                            child: const Icon(
                              Icons.my_location,
                              color: Colors.blue,
                              size: 36,
                            ),
                          ),
                          Marker(
                            point: LatLng(mahal.latitude, mahal.longitude),
                            width: 40,
                            height: 40,
                            child: const Icon(
                              Icons.location_on,
                              color: AppColors.primary,
                              size: 36,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          mahal.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(mahal.address),
                        const SizedBox(height: 4),
                        Text('Distance: $_distanceText'),
                        const SizedBox(height: 4),
                        Text('Phone: ${mahal.phone}'),
                        const SizedBox(height: 8),
                        Text(
                          'Free route via OpenStreetMap. Tap below for turn-by-turn in Google Maps app.',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 12),
                        FilledButton.icon(
                          onPressed: () => MahalLauncher.openDirections(
                            destLat: mahal.latitude,
                            destLng: mahal.longitude,
                            originLat: _userLat,
                            originLng: _userLng,
                          ),
                          icon: const Icon(Icons.navigation),
                          label: const Text('Open in Google Maps App'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
