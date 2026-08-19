class DailyActivitySummary {
  final DateTime date;
  final int wirdPages;
  final bool wirdTargetMet;
  final int azkarCompleted;
  final int tasbeehTotal;
  final int prayersDone;

  const DailyActivitySummary({
    required this.date,
    required this.wirdPages,
    required this.wirdTargetMet,
    required this.azkarCompleted,
    required this.tasbeehTotal,
    required this.prayersDone,
  });

  /// True if the user engaged with the app at all that day, across any
  /// tracked activity — used for a simple "active day" indicator.
  bool get hasAnyActivity =>
      wirdPages > 0 || azkarCompleted > 0 || tasbeehTotal > 0 || prayersDone > 0;
}
