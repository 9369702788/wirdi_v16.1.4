class NearbyPlace {
  final String name;
  final double latitude;
  final double longitude;
  final double distanceMeters;
  final String? address;

  const NearbyPlace({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.distanceMeters,
    this.address,
  });

  String get distanceLabel {
    if (distanceMeters < 1000) return '${distanceMeters.round()} م';
    return '${(distanceMeters / 1000).toStringAsFixed(1)} كم';
  }

  String get mapsUrl => 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
}
