import 'package:url_launcher/url_launcher.dart';

class MahalLauncher {
  MahalLauncher._();

  static Future<void> callPhone(String phone) async {
    final uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  static Future<void> openDirections({
    required double destLat,
    required double destLng,
    double? originLat,
    double? originLng,
  }) async {
    final origin = originLat != null && originLng != null
        ? '&origin=$originLat,$originLng'
        : '';
    final uri = Uri.parse(
      'https://www.google.com/maps/dir/?api=1'
      '$origin'
      '&destination=$destLat,$destLng'
      '&travelmode=driving',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
