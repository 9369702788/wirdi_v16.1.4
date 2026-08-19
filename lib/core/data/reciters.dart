class ReciterOption {
  final String id; // islamic.network / AlQuran.Cloud edition identifier
  final String displayName; // Arabic script, shown for the 'ar' locale
  final String latinDisplayName; // Transliterated, shown for other locales
  const ReciterOption(this.id, this.displayName, this.latinDisplayName);

  String displayNameFor(String languageCode) =>
      languageCode == 'ar' ? displayName : latinDisplayName;
}

/// Verified real reciter edition identifiers from the AlQuran.Cloud /
/// islamic.network CDN (https://api.alquran.cloud/v1/edition?format=audio).
class Reciters {
  Reciters._();

  static const List<ReciterOption> all = [
    ReciterOption('ar.alafasy', 'مشاري راشد العفاسي', 'Mishari Rashid Alafasy'),
    ReciterOption('ar.husary', 'محمود خليل الحصري', 'Mahmoud Khalil Al-Husary'),
    ReciterOption('ar.minshawi', 'محمد صديق المنشاوي', 'Mohamed Siddiq Al-Minshawi'),
    ReciterOption('ar.abdulbasitmurattal', 'عبد الباسط عبد الصمد', 'Abdul Basit Abdul Samad'),
    ReciterOption('ar.abdurrahmaansudais', 'عبد الرحمن السديس', 'Abdul Rahman Al-Sudais'),
    ReciterOption('ar.mahermuaiqly', 'ماهر المعيقلي', 'Maher Al-Muaiqly'),
  ];

  static ReciterOption byId(String id) =>
      all.firstWhere((r) => r.id == id, orElse: () => all.first);
}
