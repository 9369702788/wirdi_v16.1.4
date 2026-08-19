import 'package:flutter/material.dart';

import '../../core/services/user_progress_service.dart';
import '../../core/theme/app_theme.dart';
import '../../l10n/generated/app_localizations.dart';
import '../azkar/azkar_screen.dart';
import '../duas/my_duas_screen.dart';
import '../prayer/prayer_times_screen.dart';
import '../quran/quran_screen.dart';
import '../tasbeeh/tasbeeh_screen.dart';

class MyWirdiStats {
  final int prayersDone;
  final int pagesRead;
  final int wirdTarget;
  final int azkarCompleted;
  final int tasbeehTotal;
  final bool duaRead;

  const MyWirdiStats({
    required this.prayersDone,
    required this.pagesRead,
    required this.wirdTarget,
    required this.azkarCompleted,
    required this.tasbeehTotal,
    required this.duaRead,
  });

  static const int totalPrayers = 5;
  static const int azkarSoftTarget = 20;
  static const int tasbeehSoftTarget = 100;

  double get prayerScore => (prayersDone / totalPrayers).clamp(0.0, 1.0);
  double get quranScore => wirdTarget == 0 ? 0.0 : (pagesRead / wirdTarget).clamp(0.0, 1.0);
  double get azkarScore => (azkarCompleted / azkarSoftTarget).clamp(0.0, 1.0);
  double get tasbeehScore => (tasbeehTotal / tasbeehSoftTarget).clamp(0.0, 1.0);
  double get duaScore => duaRead ? 1.0 : 0.0;

  double get overallPercent => (prayerScore + quranScore + azkarScore + tasbeehScore + duaScore) / 5;

  static Future<MyWirdiStats> load() async {
    final prayed = await UserProgressService.prayedToday();
    final pages = await UserProgressService.pagesReadToday();
    final target = await UserProgressService.dailyWirdTarget();
    final azkar = await UserProgressService.completedAzkarToday();
    final tasbeeh = await UserProgressService.tasbeehTotalToday();
    final dua = await UserProgressService.duaReadToday();
    return MyWirdiStats(
      prayersDone: prayed.length,
      pagesRead: pages,
      wirdTarget: target,
      azkarCompleted: azkar.length,
      tasbeehTotal: tasbeeh,
      duaRead: dua,
    );
  }
}

class MyWirdiScreen extends StatefulWidget {
  const MyWirdiScreen({super.key});

  @override
  State<MyWirdiScreen> createState() => _MyWirdiScreenState();
}

class _MyWirdiScreenState extends State<MyWirdiScreen> {
  MyWirdiStats? _stats;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final stats = await MyWirdiStats.load();
    if (!mounted) return;
    setState(() {
      _stats = stats;
      _loading = false;
    });
  }

  Future<void> _toggleDua() async {
    final current = _stats;
    if (current == null) return;
    await UserProgressService.setDuaReadToday(!current.duaRead);
    await _load();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final stats = _stats;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.myWirdiTitle), centerTitle: true),
      body: (_loading || stats == null)
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _load,
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  Center(
                    child: SizedBox(
                      width: 180,
                      height: 180,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 180,
                            height: 180,
                            child: CircularProgressIndicator(
                              value: stats.overallPercent,
                              strokeWidth: 12,
                              backgroundColor: AppColors.primaryEmerald.withValues(alpha: 0.1),
                              valueColor: AlwaysStoppedAnimation(
                                stats.overallPercent >= 1.0 ? AppColors.goldAccent : AppColors.primaryEmerald,
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${(stats.overallPercent * 100).round()}%',
                                style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w800),
                              ),
                              Text(l10n.myWirdiToday, style: const TextStyle(color: AppColors.mutedText)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      stats.overallPercent >= 1.0
                          ? l10n.myWirdiCompleted
                          : l10n.myWirdiRemaining((100 - (stats.overallPercent * 100).round()).clamp(0, 100)),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: stats.overallPercent >= 1.0 ? AppColors.primaryEmerald : AppColors.mutedText,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Card(
                    child: Column(
                      children: [
                        ListTile(
                          leading: const Icon(Icons.access_time, color: Colors.blueAccent),
                          title: Text(l10n.navPrayer),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: LinearProgressIndicator(
                                value: stats.prayerScore,
                                color: Colors.blueAccent,
                                backgroundColor: Colors.blueAccent.withValues(alpha: 0.1),
                              ),
                            ),
                          ),
                          trailing: Text('${stats.prayersDone}/${MyWirdiStats.totalPrayers}', style: const TextStyle(fontWeight: FontWeight.w700)),
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PrayerTimesScreen())),
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: const Icon(Icons.menu_book, color: AppColors.primaryEmerald),
                          title: Text(l10n.navQuran),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: LinearProgressIndicator(
                                value: stats.quranScore,
                                color: AppColors.primaryEmerald,
                                backgroundColor: AppColors.primaryEmerald.withValues(alpha: 0.1),
                              ),
                            ),
                          ),
                          trailing: Text('${stats.pagesRead}/${stats.wirdTarget}', style: const TextStyle(fontWeight: FontWeight.w700)),
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const QuranScreen())),
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: const Icon(Icons.favorite, color: Colors.pinkAccent),
                          title: Text(l10n.navAzkar),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: LinearProgressIndicator(
                                value: stats.azkarScore,
                                color: Colors.pinkAccent,
                                backgroundColor: Colors.pinkAccent.withValues(alpha: 0.1),
                              ),
                            ),
                          ),
                          trailing: Text('${stats.azkarCompleted}', style: const TextStyle(fontWeight: FontWeight.w700)),
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AzkarScreen())),
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: const Icon(Icons.fingerprint, color: AppColors.goldAccent),
                          title: Text(l10n.navTasbeeh),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: LinearProgressIndicator(
                                value: stats.tasbeehScore,
                                color: AppColors.goldAccent,
                                backgroundColor: AppColors.goldAccent.withValues(alpha: 0.1),
                              ),
                            ),
                          ),
                          trailing: Text('${stats.tasbeehTotal}', style: const TextStyle(fontWeight: FontWeight.w700)),
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TasbeehScreen())),
                        ),
                        const Divider(height: 1),
                        ListTile(
                          leading: const Icon(Icons.auto_stories_outlined, color: Colors.deepPurpleAccent),
                          title: Text(l10n.myWirdiPersonalDua),
                          subtitle: Text(stats.duaRead ? l10n.myWirdiDuaDone : l10n.myWirdiDuaNotYet),
                          trailing: Checkbox(
                            value: stats.duaRead,
                            activeColor: AppColors.primaryEmerald,
                            onChanged: (_) => _toggleDua(),
                          ),
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MyDuasScreen())),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
