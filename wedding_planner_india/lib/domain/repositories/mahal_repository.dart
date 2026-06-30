import 'package:wedding_planner_india/core/utils/geo_utils.dart';
import 'package:wedding_planner_india/data/datasources/local/mahal_sample_data.dart';
import 'package:wedding_planner_india/domain/entities/mahal_entity.dart';

class MahalRepository {
  List<MahalEntity> getAllMahals() => MahalSampleData.all;

  MahalEntity? getMahalById(String id) => MahalSampleData.byId(id);

  List<MahalWithDistance> getMahalsInRange({
    required double userLat,
    required double userLng,
    required double rangeKm,
  }) {
    final results = <MahalWithDistance>[];

    for (final mahal in getAllMahals()) {
      final distance = GeoUtils.distanceKm(
        userLat,
        userLng,
        mahal.latitude,
        mahal.longitude,
      );
      if (distance <= rangeKm) {
        results.add(MahalWithDistance(mahal: mahal, distanceKm: distance));
      }
    }

    results.sort((a, b) {
      final reviewCompare =
          b.mahal.reviewCount.compareTo(a.mahal.reviewCount);
      if (reviewCompare != 0) return reviewCompare;
      return a.distanceKm.compareTo(b.distanceKm);
    });

    return results;
  }
}
