class SurahModel {
  final int number;
  final String name;
  final String englishName;
  final List<AyahModel> ayahs;

  const SurahModel({
    required this.number,
    required this.name,
    required this.englishName,
    required this.ayahs,
  });
}

class AyahModel {
  final int number;
  final String text;

  const AyahModel({
    required this.number,
    required this.text,
  });
}
