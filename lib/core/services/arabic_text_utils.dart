/// Utilities for forgiving Arabic text search: the Quran text is fully
/// vocalized (tashkeel/diacritics) and uses Uthmani-specific marks, but
/// users type plain, undiacritized Arabic when searching. Without
/// normalization, a search for "الرحمن" would never match "الرَّحْمَٰنِ"
/// in the underlying text.
class ArabicTextUtils {
  ArabicTextUtils._();

  // Arabic diacritics/tashkeel + Quranic annotation marks (fatha, damma,
  // kasra, shadda, sukun, tanween, superscript alef, small high marks
  // used in the Uthmani mushaf script, etc.)
  static final RegExp _diacritics = RegExp(
    r'[\u0610-\u061A\u064B-\u065F\u0670\u06D6-\u06ED\u08D4-\u08FF]',
  );

  static final RegExp _tatweel = RegExp(r'\u0640'); // ـ elongation mark

  /// Normalizes Arabic text for matching: strips diacritics/tatweel and
  /// folds common letter-shape variants (alef forms, ya/alef-maksura,
  /// ta-marbuta/ha) so a plain-typed query matches vocalized Quran text.
  static String normalize(String input) {
    var result = input;
    result = result.replaceAll(_diacritics, '');
    result = result.replaceAll(_tatweel, '');

    result = result.replaceAll(RegExp(r'[أإآٱ]'), 'ا');
    result = result.replaceAll('ى', 'ي');
    result = result.replaceAll('ة', 'ه');
    result = result.replaceAll('ؤ', 'و');
    result = result.replaceAll('ئ', 'ي');

    return result.trim();
  }

  static bool contains(String haystack, String needle) {
    if (needle.isEmpty) return true;
    return normalize(haystack).contains(normalize(needle));
  }
}
