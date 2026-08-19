class BookmarkEntry {
  final String id;
  final int surahNumber;
  final String surahName;
  final int ayahNumber;
  final String ayahText;
  final String note;
  final String category;
  final int createdAtMillis;

  const BookmarkEntry({
    required this.id,
    required this.surahNumber,
    required this.surahName,
    required this.ayahNumber,
    required this.ayahText,
    required this.note,
    required this.category,
    required this.createdAtMillis,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'surahNumber': surahNumber,
        'surahName': surahName,
        'ayahNumber': ayahNumber,
        'ayahText': ayahText,
        'note': note,
        'category': category,
        'createdAtMillis': createdAtMillis,
      };

  factory BookmarkEntry.fromJson(Map<String, dynamic> json) => BookmarkEntry(
        id: json['id'] as String,
        surahNumber: json['surahNumber'] as int,
        surahName: json['surahName'] as String? ?? '',
        ayahNumber: json['ayahNumber'] as int,
        ayahText: json['ayahText'] as String? ?? '',
        note: json['note'] as String? ?? '',
        category: json['category'] as String? ?? 'personal',
        createdAtMillis: json['createdAtMillis'] as int? ?? 0,
      );
}
