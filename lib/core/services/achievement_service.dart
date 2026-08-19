import 'user_progress_service.dart';

class AchievementStats {
  final int longestStreak;
  final double quranRatio;
  final int khatmasCompleted;
  final int lifetimePages;
  final int lifetimeAzkar;
  final int lifetimeTasbeeh;
  final int lifetimePrayers;
  final int favoritesCount;

  const AchievementStats({
    required this.longestStreak,
    required this.quranRatio,
    required this.khatmasCompleted,
    required this.lifetimePages,
    required this.lifetimeAzkar,
    required this.lifetimeTasbeeh,
    required this.lifetimePrayers,
    required this.favoritesCount,
  });

  static Future<AchievementStats> load() async {
    final longest = await UserProgressService.longestStreak();
    final ratio = await UserProgressService.quranCompletionRatio();
    final khatmas = await UserProgressService.khatmasCompletedCount();
    final pages = await UserProgressService.lifetimePagesTotal();
    final azkar = await UserProgressService.lifetimeAzkarTotal();
    final tasbeeh = await UserProgressService.lifetimeTasbeehTotal();
    final prayers = await UserProgressService.lifetimePrayersTotal();
    final favorites = await UserProgressService.totalFavoritesCount();
    return AchievementStats(
      longestStreak: longest,
      quranRatio: ratio,
      khatmasCompleted: khatmas,
      lifetimePages: pages,
      lifetimeAzkar: azkar,
      lifetimeTasbeeh: tasbeeh,
      lifetimePrayers: prayers,
      favoritesCount: favorites,
    );
  }
}
