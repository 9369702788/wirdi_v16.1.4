class AzkarItemModel {
  final String uid; // stable id: "<categoryId>_<itemId>", used for favorites/counters
  final int id;
  final String text;
  final int targetCount;

  const AzkarItemModel({
    required this.uid,
    required this.id,
    required this.text,
    required this.targetCount,
  });
}

class AzkarCategoryModel {
  final int id;
  final String category;
  final List<AzkarItemModel> items;

  const AzkarCategoryModel({
    required this.id,
    required this.category,
    required this.items,
  });
}
