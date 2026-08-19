import 'package:flutter/material.dart';

import '../../core/services/achievement_service.dart';
import '../../core/theme/app_theme.dart';
import '../../l10n/generated/app_localizations.dart';

class _AchievementDef {
  final IconData icon;
  final String Function(AppLocalizations) titleFor;
  final String Function(AppLocalizations) descriptionFor;
  final bool Function(AchievementStats) isUnlocked;
  const _AchievementDef({
    required this.icon,
    required this.titleFor,
    required this.descriptionFor,
    required this.isUnlocked,
  });
}

class AchievementsScreen extends StatefulWidget {
  const AchievementsScreen({super.key});

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen> {
  static final List<_AchievementDef> _achievements = [
    _AchievementDef(
      icon: Icons.local_fire_department,
      titleFor: (l10n) => l10n.achievementStreak3Title,
      descriptionFor: (l10n) => l10n.achievementStreak3Desc,
      isUnlocked: (s) => s.longestStreak >= 3,
    ),
    _AchievementDef(
      icon: Icons.local_fire_department,
      titleFor: (l10n) => l10n.achievementStreak7Title,
      descriptionFor: (l10n) => l10n.achievementStreak7Desc,
      isUnlocked: (s) => s.longestStreak >= 7,
    ),
    _AchievementDef(
      icon: Icons.local_fire_department,
      titleFor: (l10n) => l10n.achievementStreak30Title,
      descriptionFor: (l10n) => l10n.achievementStreak30Desc,
      isUnlocked: (s) => s.longestStreak >= 30,
    ),
    _AchievementDef(
      icon: Icons.local_fire_department,
      titleFor: (l10n) => l10n.achievementStreak100Title,
      descriptionFor: (l10n) => l10n.achievementStreak100Desc,
      isUnlocked: (s) => s.longestStreak >= 100,
    ),
    _AchievementDef(
      icon: Icons.menu_book,
      titleFor: (l10n) => l10n.achievementQuran10Title,
      descriptionFor: (l10n) => l10n.achievementQuran10Desc,
      isUnlocked: (s) => s.quranRatio >= 0.10,
    ),
    _AchievementDef(
      icon: Icons.menu_book,
      titleFor: (l10n) => l10n.achievementQuran25Title,
      descriptionFor: (l10n) => l10n.achievementQuran25Desc,
      isUnlocked: (s) => s.quranRatio >= 0.25,
    ),
    _AchievementDef(
      icon: Icons.menu_book,
      titleFor: (l10n) => l10n.achievementQuran50Title,
      descriptionFor: (l10n) => l10n.achievementQuran50Desc,
      isUnlocked: (s) => s.quranRatio >= 0.50,
    ),
    _AchievementDef(
      icon: Icons.menu_book,
      titleFor: (l10n) => l10n.achievementQuran100Title,
      descriptionFor: (l10n) => l10n.achievementQuran100Desc,
      isUnlocked: (s) => s.quranRatio >= 1.0,
    ),
    _AchievementDef(
      icon: Icons.emoji_events,
      titleFor: (l10n) => l10n.achievementKhatma1Title,
      descriptionFor: (l10n) => l10n.achievementKhatma1Desc,
      isUnlocked: (s) => s.khatmasCompleted >= 1,
    ),
    _AchievementDef(
      icon: Icons.emoji_events,
      titleFor: (l10n) => l10n.achievementKhatma3Title,
      descriptionFor: (l10n) => l10n.achievementKhatma3Desc,
      isUnlocked: (s) => s.khatmasCompleted >= 3,
    ),
    _AchievementDef(
      icon: Icons.auto_stories,
      titleFor: (l10n) => l10n.achievementPages50Title,
      descriptionFor: (l10n) => l10n.achievementPages50Desc,
      isUnlocked: (s) => s.lifetimePages >= 50,
    ),
    _AchievementDef(
      icon: Icons.auto_stories,
      titleFor: (l10n) => l10n.achievementPages200Title,
      descriptionFor: (l10n) => l10n.achievementPages200Desc,
      isUnlocked: (s) => s.lifetimePages >= 200,
    ),
    _AchievementDef(
      icon: Icons.auto_stories,
      titleFor: (l10n) => l10n.achievementPages604Title,
      descriptionFor: (l10n) => l10n.achievementPages604Desc,
      isUnlocked: (s) => s.lifetimePages >= 604,
    ),
    _AchievementDef(
      icon: Icons.favorite,
      titleFor: (l10n) => l10n.achievementAzkar50Title,
      descriptionFor: (l10n) => l10n.achievementAzkar50Desc,
      isUnlocked: (s) => s.lifetimeAzkar >= 50,
    ),
    _AchievementDef(
      icon: Icons.favorite,
      titleFor: (l10n) => l10n.achievementAzkar500Title,
      descriptionFor: (l10n) => l10n.achievementAzkar500Desc,
      isUnlocked: (s) => s.lifetimeAzkar >= 500,
    ),
    _AchievementDef(
      icon: Icons.fingerprint,
      titleFor: (l10n) => l10n.achievementTasbeeh100Title,
      descriptionFor: (l10n) => l10n.achievementTasbeeh100Desc,
      isUnlocked: (s) => s.lifetimeTasbeeh >= 100,
    ),
    _AchievementDef(
      icon: Icons.fingerprint,
      titleFor: (l10n) => l10n.achievementTasbeeh1000Title,
      descriptionFor: (l10n) => l10n.achievementTasbeeh1000Desc,
      isUnlocked: (s) => s.lifetimeTasbeeh >= 1000,
    ),
    _AchievementDef(
      icon: Icons.access_time,
      titleFor: (l10n) => l10n.achievementPrayers50Title,
      descriptionFor: (l10n) => l10n.achievementPrayers50Desc,
      isUnlocked: (s) => s.lifetimePrayers >= 50,
    ),
    _AchievementDef(
      icon: Icons.access_time,
      titleFor: (l10n) => l10n.achievementPrayers350Title,
      descriptionFor: (l10n) => l10n.achievementPrayers350Desc,
      isUnlocked: (s) => s.lifetimePrayers >= 350,
    ),
    _AchievementDef(
      icon: Icons.star,
      titleFor: (l10n) => l10n.achievementFavorites10Title,
      descriptionFor: (l10n) => l10n.achievementFavorites10Desc,
      isUnlocked: (s) => s.favoritesCount >= 10,
    ),
  ];

  AchievementStats? _stats;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final stats = await AchievementStats.load();
    if (!mounted) return;
    setState(() {
      _stats = stats;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final stats = _stats;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.achievementsTitle), centerTitle: true),
      body: (_loading || stats == null)
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _load,
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  Builder(builder: (context) {
                    final unlockedCount = _achievements.where((a) => a.isUnlocked(stats)).length;
                    return Center(
                      child: Text(
                        l10n.achievementsUnlockedCount(unlockedCount, _achievements.length),
                        style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                    );
                  }),
                  const SizedBox(height: 20),
                  ..._achievements.map((achievement) {
                    final unlocked = achievement.isUnlocked(stats);
                    return Card(
                      color: unlocked ? null : AppColors.mutedText.withValues(alpha: 0.04),
                      child: ListTile(
                        leading: Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            color: (unlocked ? AppColors.goldAccent : AppColors.mutedText).withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(
                            unlocked ? achievement.icon : Icons.lock_outline,
                            color: unlocked ? AppColors.goldAccent : AppColors.mutedText,
                          ),
                        ),
                        title: Text(
                          achievement.titleFor(l10n),
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: unlocked ? null : AppColors.mutedText,
                          ),
                        ),
                        subtitle: Text(
                          achievement.descriptionFor(l10n),
                          style: TextStyle(
                            fontSize: 12,
                            color: unlocked ? AppColors.mutedText : AppColors.mutedText.withValues(alpha: 0.6),
                          ),
                        ),
                        trailing: unlocked ? const Icon(Icons.check_circle, color: AppColors.primaryEmerald) : null,
                      ),
                    );
                  }),
                ],
              ),
            ),
    );
  }
}
