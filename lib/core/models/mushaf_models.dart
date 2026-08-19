class MushafAyahRef {
  final int surahNumber;
  final int ayahNumber;
  final String text;
  const MushafAyahRef({required this.surahNumber, required this.ayahNumber, required this.text});
}

class MushafPage {
  final int pageNumber;
  final int juzNumber;
  final List<MushafAyahRef> ayahs;
  const MushafPage({required this.pageNumber, required this.juzNumber, required this.ayahs});
}
