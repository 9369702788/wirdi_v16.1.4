class KhatmaPlan {
  final String id;
  final String label;
  final DateTime startDate;
  final DateTime targetDate;
  final Set<int> startingCompletedSurahs;

  const KhatmaPlan({
    required this.id,
    required this.label,
    required this.startDate,
    required this.targetDate,
    required this.startingCompletedSurahs,
  });

  int get totalDays {
    final days = targetDate.difference(startDate).inDays;
    return days < 1 ? 1 : days;
  }

  int get daysElapsed {
    final elapsed = DateTime.now().difference(startDate).inDays;
    if (elapsed < 0) return 0;
    if (elapsed > totalDays) return totalDays;
    return elapsed;
  }

  int get daysRemaining {
    final remaining = targetDate.difference(DateTime.now()).inDays;
    return remaining < 0 ? 0 : remaining;
  }

  bool get isOverdue => DateTime.now().isAfter(targetDate);

  int newlyCompletedCount(Set<int> currentGlobalCompleted) {
    return currentGlobalCompleted.difference(startingCompletedSurahs).length;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'label': label,
        'startDate': startDate.millisecondsSinceEpoch,
        'targetDate': targetDate.millisecondsSinceEpoch,
        'startingCompletedSurahs': startingCompletedSurahs.toList(),
      };

  factory KhatmaPlan.fromJson(Map<String, dynamic> json) => KhatmaPlan(
        id: json['id'] as String,
        label: json['label'] as String? ?? '',
        startDate: DateTime.fromMillisecondsSinceEpoch(json['startDate'] as int),
        targetDate: DateTime.fromMillisecondsSinceEpoch(json['targetDate'] as int),
        startingCompletedSurahs: ((json['startingCompletedSurahs'] as List?) ?? const [])
            .map((e) => e as int)
            .toSet(),
      );
}
