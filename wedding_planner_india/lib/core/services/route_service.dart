import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wedding_planner_india/core/models/geo_point.dart';

class RouteService {
  Future<List<GeoPoint>> fetchRoute({
    required double fromLat,
    required double fromLng,
    required double toLat,
    required double toLng,
  }) async {
    try {
      final url =
          'https://router.project-osrm.org/route/v1/driving/$fromLng,$fromLat;$toLng,$toLat'
          '?overview=full&geometries=geojson';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode != 200) {
        return _straightLine(fromLat, fromLng, toLat, toLng);
      }

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final routes = data['routes'] as List<dynamic>?;
      if (routes == null || routes.isEmpty) {
        return _straightLine(fromLat, fromLng, toLat, toLng);
      }

      final geometry = routes.first['geometry'] as Map<String, dynamic>;
      final coords = geometry['coordinates'] as List<dynamic>;
      return coords
          .map(
            (c) => GeoPoint(
              (c[1] as num).toDouble(),
              (c[0] as num).toDouble(),
            ),
          )
          .toList();
    } catch (_) {
      return _straightLine(fromLat, fromLng, toLat, toLng);
    }
  }

  List<GeoPoint> _straightLine(
    double fromLat,
    double fromLng,
    double toLat,
    double toLng,
  ) {
    return [
      GeoPoint(fromLat, fromLng),
      GeoPoint(toLat, toLng),
    ];
  }
}
