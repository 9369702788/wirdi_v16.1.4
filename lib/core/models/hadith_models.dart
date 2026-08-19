/// A single hadith, merged from the Arabic source edition and the
/// translation edition matching the app's active language (see
/// [AppSources.hadithTranslationEditionFor]). The translated text
/// already includes its own source attribution inline (e.g. "[Bukhari
/// & Muslim]"), as published in the underlying dataset — not stripped
/// out, since it's part of the reference.
class HadithModel {
  final int number;
  final String arabicText;
  final String translatedText;

  const HadithModel({
    required this.number,
    required this.arabicText,
    required this.translatedText,
  });

  String get uid => 'nawawi_$number';
}
