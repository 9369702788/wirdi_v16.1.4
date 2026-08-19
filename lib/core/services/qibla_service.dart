import 'dart:math' as math;

/// Computes the compass bearing to the Kaaba from any point on Earth,
/// using the standard great-circle initial-bearing formula (the same
/// approach used by aviation/navigation and every other Qibla-finder
/// app — there's no ambiguity here, unlike prayer-time calculation
/// methods, which do vary).
class QiblaService {
  QiblaService._();

  /// Kaaba coordinates (Masjid al-Haram, Mecca), widely published and
  /// precise to well under a degree of bearing error anywhere on Earth.
  static const double kaabaLatitude = 21.4225;
  static const double kaabaLongitude = 39.8262;

  /// Returns the initial bearing (0-360°, measured clockwise from true
  /// north) from [latitude]/[longitude] to the Kaaba.
  static double bearingTo({required double latitude, required double longitude}) {
    final lat1 = _toRadians(latitude);
    final lat2 = _toRadians(kaabaLatitude);
    final deltaLon = _toRadians(kaabaLongitude - longitude);

    final y = math.sin(deltaLon) * math.cos(lat2);
    final x = math.cos(lat1) * math.sin(lat2) - math.sin(lat1) * math.cos(lat2) * math.cos(deltaLon);

    final bearingRad = math.atan2(y, x);
    final bearingDeg = _toDegrees(bearingRad);
    return (bearingDeg + 360) % 360;
  }

  static double distanceKmTo({required double latitude, required double longitude}) {
    const earthRadiusKm = 6371.0;
    final lat1 = _toRadians(latitude);
    final lat2 = _toRadians(kaabaLatitude);
    final deltaLat = _toRadians(kaabaLatitude - latitude);
    final deltaLon = _toRadians(kaabaLongitude - longitude);

    final a = math.sin(deltaLat / 2) * math.sin(deltaLat / 2) +
        math.cos(lat1) * math.cos(lat2) * math.sin(deltaLon / 2) * math.sin(deltaLon / 2);
    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    return earthRadiusKm * c;
  }

  static double _toRadians(double degrees) => degrees * math.pi / 180;
  static double _toDegrees(double radians) => radians * 180 / math.pi;
}
