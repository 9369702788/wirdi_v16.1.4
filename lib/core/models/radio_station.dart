
class RadioStation {
  final String id;
  final String nameAr;
  final String nameEn;
  final String streamUrl;
  final String country;
  final String countryCode;
  final String category;
  final bool isOfficial;
  final String? stationUuid; // radio-browser.info UUID for click tracking

  const RadioStation({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.streamUrl,
    required this.country,
    required this.countryCode,
    required this.category,
    this.isOfficial = false,
    this.stationUuid,
  });

  /// Build a RadioStation from a radio-browser.info JSON response object.
  factory RadioStation.fromRadioBrowser(Map<String, dynamic> j) => RadioStation(
    id: j['stationuuid'] ?? j['name'] ?? '',
    nameAr: j['name'] ?? '',
    nameEn: j['name'] ?? '',
    streamUrl: j['url_resolved'] ?? j['url'] ?? '',
    country: j['country'] ?? '',
    countryCode: (j['countrycode'] ?? 'INT').toUpperCase(),
    category: _inferCategory(j['tags'] ?? ''),
    isOfficial: false,
    stationUuid: j['stationuuid'],
  );

  static String _inferCategory(String tags) {
    final t = tags.toLowerCase();
    if (t.contains('quran') || t.contains('قرآن')) return 'quran';
    if (t.contains('lecture') || t.contains('talk') || t.contains('islamic talk')) return 'lectures';
    if (t.contains('nasheed') || t.contains('anasheed')) return 'nasheed';
    return 'quran';
  }
}
