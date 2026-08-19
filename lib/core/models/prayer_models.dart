class PrayerItem {
  final String name;
  final String timeText;
  final DateTime dateTime;

  const PrayerItem({
    required this.name,
    required this.timeText,
    required this.dateTime,
  });
}

class PrayerTimesResult {
  final List<PrayerItem> prayers;
  final PrayerItem next;
  final bool isFromCache;
  final DateTime? cachedAt;
  final String? locationLabel;

  const PrayerTimesResult({
    required this.prayers,
    required this.next,
    required this.isFromCache,
    this.cachedAt,
    this.locationLabel,
  });
}

/// Location permission / service outcome, kept as a real enum so the UI
/// can show the exact reason prayer times aren't available instead of a
/// generic error string.
enum PrayerAvailability {
  ok,
  locationServiceDisabled,
  permissionDenied,
  permissionDeniedForever,
  networkErrorNoCache,
}
