class HijriDate {
  final int day;
  final int month; // 1-12
  final int year;

  const HijriDate(this.day, this.month, this.year);

  /// Hijri month name has no single "canonical" spelling once the app
  /// supports multiple languages — each locale gets its own transliteration.
  /// Ramadan is always month 9; prefer checking `month == 9` over comparing
  /// name strings, which only worked because everything used to be Arabic.
  static const Map<String, List<String>> _monthNamesByLocale = {
    'ar': [
      'محرم', 'صفر', 'ربيع الأول', 'ربيع الآخر', 'جمادى الأولى', 'جمادى الآخرة',
      'رجب', 'شعبان', 'رمضان', 'شوال', 'ذو القعدة', 'ذو الحجة',
    ],
    'en': [
      'Muharram', 'Safar', 'Rabi al-Awwal', 'Rabi al-Thani', 'Jumada al-Awwal', 'Jumada al-Thani',
      'Rajab', 'Shaban', 'Ramadan', 'Shawwal', 'Dhu al-Qadah', 'Dhu al-Hijjah',
    ],
    'de': [
      'Muharram', 'Safar', 'Rabi al-Awwal', 'Rabi al-Thani', 'Jumada al-Awwal', 'Jumada al-Thani',
      'Radschab', 'Schaban', 'Ramadan', 'Schawwal', 'Dhu al-Qada', 'Dhu al-Hiddscha',
    ],
    'tr': [
      'Muharrem', 'Safer', 'Rebiülevvel', 'Rebiülahir', 'Cemaziyelevvel', 'Cemaziyelahir',
      'Recep', 'Şaban', 'Ramazan', 'Şevval', 'Zilkade', 'Zilhicce',
    ],
  };

  static List<String> monthNamesFor(String languageCode) =>
      _monthNamesByLocale[languageCode] ?? _monthNamesByLocale['en']!;

  /// Convenience for call sites that haven't been updated to pass a
  /// locale yet. Prefer [monthNameFor] in new/localized code.
  static const List<String> monthNames = <String>[];

  String monthNameFor(String languageCode) => monthNamesFor(languageCode)[month - 1];

  /// Whether this Hijri date falls in Ramadan (month 9) — locale-independent,
  /// unlike comparing monthName against an Arabic string.
  bool get isRamadan => month == 9;

  String toStringLocalized(String languageCode) => '$day ${monthNameFor(languageCode)} $year';

  @override
  String toString() => '$day ${monthNameFor('en')} $year AH';

  /// Standard tabular/civil Hijri conversion (widely used arithmetic
  /// approximation, epoch-aligned to the Kuwaiti algorithm). This is an
  /// approximation of the *civil* calendar, not a moon-sighting-based
  /// one — real observed Hijri dates can differ by a day depending on
  /// region and lunar sighting, same caveat that applies to any
  /// arithmetic Hijri calculation without an official lookup table.
  factory HijriDate.fromGregorian(DateTime date) {
    final jd = _gregorianToJulianDay(date.year, date.month, date.day);

    var l = jd - 1948440 + 10632;
    final n = (l - 1) ~/ 10631;
    l = l - 10631 * n + 354;
    final j = ((10985 - l) ~/ 5316) * ((50 * l) ~/ 17719) + (l ~/ 5670) * ((43 * l) ~/ 15238);
    l = l - ((30 - j) ~/ 15) * ((17719 * j) ~/ 50) - (j ~/ 16) * ((15238 * j) ~/ 43) + 29;
    final month = (24 * l) ~/ 709;
    final day = l - (709 * month) ~/ 24;
    final year = 30 * n + j - 30;

    return HijriDate(day, month, year);
  }

  static int _gregorianToJulianDay(int year, int month, int day) {
    final a = (14 - month) ~/ 12;
    final y = year + 4800 - a;
    final m = month + 12 * a - 3;
    return day +
        (153 * m + 2) ~/ 5 +
        365 * y +
        y ~/ 4 -
        y ~/ 100 +
        y ~/ 400 -
        32045;
  }
}
