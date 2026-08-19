class Bismillah {
  Bismillah._();

  static const String text = 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ';

  /// Surah 1 (Al-Fatihah) already has the Bismillah as its own first
  /// ayah in the underlying text — showing it again separately would
  /// duplicate it. Surah 9 (At-Tawbah) traditionally omits the
  /// Bismillah entirely. Every other surah should show it.
  static bool shouldShowFor(int surahNumber) => surahNumber != 1 && surahNumber != 9;
}
