import 'dart:convert';
import 'dart:math' as math;

import 'package:http/http.dart' as http;

import '../models/nearby_place.dart';
import 'app_logger.dart';

/// Finds nearby mosques (and, best-effort, halal restaurants) using the
/// free, public Overpass API over OpenStreetMap data — no paid API key
/// or billing account required, unlike Google Places. Real, documented
/// tagging scheme: amenity=place_of_worship + religion=muslim for
/// mosques (confirmed against OpenStreetMap's own wiki before use).
///
/// Coverage caveat that's real and worth stating plainly: OpenStreetMap
/// is community-mapped, so results are only as complete as what's been
/// mapped in a given area — dense in some cities, sparse in others.
/// Halal-restaurant tagging in particular (diet:halal=yes) is far less
/// consistently applied than mosque tagging, so that search will find
/// fewer real matches than actually exist nearby.
class NearbyPlacesService {
  NearbyPlacesService._();

  static const String _endpoint = 'https://overpass-api.de/api/interpreter';

  static Future<List<NearbyPlace>> findMosques({
    required double latitude,
    required double longitude,
    int radiusMeters = 5000,
  }) async {
    final query = '[out:json][timeout:20];'
        'node["amenity"="place_of_worship"]["religion"="muslim"]'
        '(around:$radiusMeters,$latitude,$longitude);'
        'out body 40;';
    return _query(query, latitude, longitude);
  }

  static Future<List<NearbyPlace>> findHalalRestaurants({
    required double latitude,
    required double longitude,
    int radiusMeters = 5000,
  }) async {
    final query = '[out:json][timeout:20];'
        'node["amenity"="restaurant"]["diet:halal"~"yes|only"]'
        '(around:$radiusMeters,$latitude,$longitude);'
        'out body 40;';
    return _query(query, latitude, longitude);
  }

  static Future<List<NearbyPlace>> _query(String overpassQuery, double lat, double lon) async {
    try {
      final response = await http
          .post(Uri.parse(_endpoint), body: {'data': overpassQuery})
          .timeout(const Duration(seconds: 25));

      if (response.statusCode != 200) {
        throw Exception('Overpass HTTP ${response.statusCode}');
      }

      final decoded = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      final elements = decoded['elements'] as List<dynamic>? ?? [];

      final places = <NearbyPlace>[];
      for (final el in elements) {
        final map = el as Map<String, dynamic>;
        final placeLat = (map['lat'] as num?)?.toDouble();
        final placeLon = (map['lon'] as num?)?.toDouble();
        if (placeLat == null || placeLon == null) continue;

        final tags = map['tags'] as Map<String, dynamic>? ?? {};
        final name = tags['name']?.toString() ?? tags['name:ar']?.toString();
        if (name == null || name.trim().isEmpty) continue; // skip unnamed entries

        final addressParts = [
          tags['addr:street']?.toString(),
          tags['addr:city']?.toString(),
        ].where((p) => p != null && p.isNotEmpty).join('، ');

        places.add(NearbyPlace(
          name: name,
          latitude: placeLat,
          longitude: placeLon,
          distanceMeters: _distanceMeters(lat, lon, placeLat, placeLon),
          address: addressParts.isEmpty ? null : addressParts,
        ));
      }

      places.sort((a, b) => a.distanceMeters.compareTo(b.distanceMeters));
      return places;
    } catch (e, st) {
      AppLogger.error('Nearby places query failed', error: e, stackTrace: st);
      rethrow;
    }
  }

  /// Haversine formula — real great-circle distance, not a flat
  /// approximation (which would be noticeably wrong at these scales).
  static double _distanceMeters(double lat1, double lon1, double lat2, double lon2) {
    const earthRadius = 6371000.0;
    final dLat = _toRad(lat2 - lat1);
    final dLon = _toRad(lon2 - lon1);
    final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_toRad(lat1)) * math.cos(_toRad(lat2)) * math.sin(dLon / 2) * math.sin(dLon / 2);
    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    return earthRadius * c;
  }

  static double _toRad(double deg) => deg * (math.pi / 180);
}
