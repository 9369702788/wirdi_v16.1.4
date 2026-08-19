class AdhanOption {
  final String id;
  final String displayName; // Arabic script, shown for the 'ar' locale
  final String latinDisplayName; // Transliterated, shown for other locales
  final String url;
  const AdhanOption(this.id, this.displayName, this.latinDisplayName, this.url);

  String displayNameFor(String languageCode) =>
      languageCode == 'ar' ? displayName : latinDisplayName;
}
