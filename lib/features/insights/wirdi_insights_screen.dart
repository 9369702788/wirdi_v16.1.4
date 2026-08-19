import 'package:flutter/material.dart';

import '../../core/models/progress_models.dart';
import '../../core/services/user_progress_service.dart';
import '../../core/theme/app_theme.dart';
import '../../l10n/generated/app_localizations.dart';

class WirdiInsightsScreen extends StatefulWidget {
  const WirdiInsightsScreen({super.key});

  @override
  State<WirdiInsightsScreen> createState() => _WirdiInsightsScreenState();
}

class _WirdiInsightsScreenState extends State<WirdiInsightsScreen> {
  bool _loading = true;
  List<DailyActivitySummary> _thisWeek = [];
  List<DailyActivitySummary> _lastWeek = [];
  int _streak = 0;
  int _wirdTarget = 5;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final thisWeek = await UserProgressService.weekSummary(weeksAgo: 0);
    final lastWeek = await UserProgressService.weekSummary(weeksAgo: 1);
    final streak = await UserProgressService.wirdStreak();
    final target = await UserProgressService.dailyWirdTarget();
    if (!mounted) return;
    setState(() {
      _thisWeek = thisWeek;
      _lastWeek = lastWeek;
      _streak = streak;
      _wirdTarget = target;
      _loading = false;
    });
  }

  List<DailyActivitySummary> _pastOrToday(List<DailyActivitySummary> week) {
    final today = DateTime.now();
    final todayOnly = DateTime(today.year, today.month, today.day);
    return week.where((d) => !d.date.isAfter(todayOnly)).toList();
  }

  double _dayScore(DailyActivitySummary d) {
    final quran = _wirdTarget == 0 ? 0.0 : (d.wirdPages / _wirdTarget).clamp(0.0, 1.0);
    final azkar = (d.azkarCompleted / 20).clamp(0.0, 1.0);
    final tasbeeh = (d.tasbeehTotal / 100).clamp(0.0, 1.0);
    final prayer = (d.prayersDone / 5).clamp(0.0, 1.0);
    return (quran + azkar + tasbeeh + prayer) / 4;
  }

  double _weekIndex(List<DailyActivitySummary> week) {
    final valid = _pastOrToday(week);
    if (valid.isEmpty) return 0.0;
    var total = 0.0;
    for (final d in valid) {
      total += _dayScore(d);
    }
    return total / valid.length;
  }

  int _sumPages(List<DailyActivitySummary> week) {
    var total = 0;
    for (final d in week) {
      total += d.wirdPages;
    }
    return total;
  }

  int _sumAzkar(List<DailyActivitySummary> week) {
    var total = 0;
    for (final d in week) {
      total += d.azkarCompleted;
    }
    return total;
  }

  int _sumTasbeeh(List<DailyActivitySummary> week) {
    var total = 0;
    for (final d in week) {
      total += d.tasbeehTotal;
    }
    return total;
  }

  int _sumPrayers(List<DailyActivitySummary> week) {
    var total = 0;
    for (final d in week) {
      total += d.prayersDone;
    }
    return total;
  }

  static String _dayName(AppLocalizations l10n, int weekday) {
    switch (weekday) {
      case DateTime.saturday:
        return l10n.dayNameSat;
      case DateTime.sunday:
        return l10n.dayNameSun;
      case DateTime.monday:
        return l10n.dayNameMon;
      case DateTime.tuesday:
        return l10n.dayNameTue;
      case DateTime.wednesday:
        return l10n.dayNameWed;
      case DateTime.thursday:
        return l10n.dayNameThu;
      case DateTime.friday:
      default:
        return l10n.dayNameFri;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.insightsTitle), centerTitle: true),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _load,
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  Text(l10n.insightsThisWeek, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 12),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.5,
                    children: [
                      _StatCard(
                        icon: Icons.menu_book,
                        color: AppColors.primaryEmerald,
                        label: l10n.insightsQuranPages,
                        value: '${_sumPages(_thisWeek)}',
                      ),
                      _StatCard(
                        icon: Icons.favorite,
                        color: Colors.pinkAccent,
                        label: l10n.insightsAzkarCompleted,
                        value: '${_sumAzkar(_thisWeek)}',
                      ),
                      _StatCard(
                        icon: Icons.access_time,
                        color: Colors.blueAccent,
                        label: l10n.insightsPrayers,
                        value: '${_sumPrayers(_thisWeek)}/35',
                      ),
                      _StatCard(
                        icon: Icons.fingerprint,
                        color: AppColors.goldAccent,
                        label: l10n.insightsTasbeeh,
                        value: '${_sumTasbeeh(_thisWeek)}',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          const Icon(Icons.local_fire_department, color: Colors.deepOrange),
                          const SizedBox(width: 12),
                          Text(l10n.insightsCurrentStreak, style: const TextStyle(fontWeight: FontWeight.w600)),
                          const Spacer(),
                          Text(l10n.insightsDaysCount(_streak), style: const TextStyle(fontWeight: FontWeight.w800)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(l10n.insightsWeeklyActivity, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 12),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          _ActivityBarRow(
                            label: l10n.navQuran,
                            color: AppColors.primaryEmerald,
                            week: _thisWeek,
                            valueFor: (d) => d.wirdPages.toDouble(),
                          ),
                          const SizedBox(height: 14),
                          _ActivityBarRow(
                            label: l10n.navAzkar,
                            color: Colors.pinkAccent,
                            week: _thisWeek,
                            valueFor: (d) => d.azkarCompleted.toDouble(),
                          ),
                          const SizedBox(height: 14),
                          _ActivityBarRow(
                            label: l10n.navPrayer,
                            color: Colors.blueAccent,
                            week: _thisWeek,
                            valueFor: (d) => d.prayersDone.toDouble(),
                          ),
                          const SizedBox(height: 14),
                          _ActivityBarRow(
                            label: l10n.navTasbeeh,
                            color: AppColors.goldAccent,
                            week: _thisWeek,
                            valueFor: (d) => d.tasbeehTotal.toDouble(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildBestDayAndConsistency(l10n),
                  const SizedBox(height: 20),
                  _buildWeekComparison(l10n),
                ],
              ),
            ),
    );
  }

  Widget _buildBestDayAndConsistency(AppLocalizations l10n) {
    final valid = _pastOrToday(_thisWeek);
    DailyActivitySummary? best;
    var bestScore = 0.0;
    for (final d in valid) {
      final score = _dayScore(d);
      if (score > bestScore) {
        bestScore = score;
        best = d;
      }
    }

    final quranActiveDays = valid.where((d) => d.wirdPages > 0).length;
    final azkarActiveDays = valid.where((d) => d.azkarCompleted > 0).length;
    final prayerActiveDays = valid.where((d) => d.prayersDone > 0).length;
    final tasbeehActiveDays = valid.where((d) => d.tasbeehTotal > 0).length;

    final counts = <String, int>{
      l10n.navQuran: quranActiveDays,
      l10n.navAzkar: azkarActiveDays,
      l10n.navPrayer: prayerActiveDays,
      l10n.navTasbeeh: tasbeehActiveDays,
    };
    String? mostConsistentLabel;
    var mostConsistentCount = 0;
    counts.forEach((label, count) {
      if (count > mostConsistentCount) {
        mostConsistentCount = count;
        mostConsistentLabel = label;
      }
    });

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.emoji_events_outlined, color: AppColors.goldAccent),
                const SizedBox(width: 10),
                Text(l10n.insightsBestDay, style: const TextStyle(fontWeight: FontWeight.w700)),
                const Spacer(),
                Text(
                  best != null ? _dayName(l10n, best.date.weekday) : l10n.insightsNoBestDayYet,
                  style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.primaryEmerald),
                ),
              ],
            ),
            const Divider(height: 24),
            Row(
              children: [
                const Icon(Icons.trending_up, color: AppColors.primaryEmerald),
                const SizedBox(width: 10),
                Text(l10n.insightsMostConsistent, style: const TextStyle(fontWeight: FontWeight.w700)),
                const Spacer(),
                Text(
                  mostConsistentLabel ?? l10n.insightsNoBestDayYet,
                  style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.primaryEmerald),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeekComparison(AppLocalizations l10n) {
    final thisIndex = _weekIndex(_thisWeek);
    final lastIndex = _weekIndex(_lastWeek);

    String message;
    IconData icon;
    Color color;

    if (thisIndex <= 0 && lastIndex <= 0) {
      message = l10n.insightsNoActivityYet;
      icon = Icons.info_outline;
      color = AppColors.mutedText;
    } else if (lastIndex <= 0) {
      message = l10n.insightsFirstActiveWeek;
      icon = Icons.celebration_outlined;
      color = AppColors.primaryEmerald;
    } else {
      final percent = (((thisIndex - lastIndex) / lastIndex) * 100).round();
      if (percent > 0) {
        message = l10n.insightsImproved(percent);
        icon = Icons.trending_up;
        color = AppColors.primaryEmerald;
      } else if (percent < 0) {
        message = l10n.insightsDeclined(percent.abs());
        icon = Icons.trending_down;
        color = Colors.orange;
      } else {
        message = l10n.insightsSameAsLastWeek;
        icon = Icons.trending_flat;
        color = AppColors.mutedText;
      }
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.insightsWeekComparisonTitle, style: const TextStyle(fontWeight: FontWeight.w700)),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(icon, color: color),
                const SizedBox(width: 10),
                Expanded(child: Text(message, style: TextStyle(color: color, fontWeight: FontWeight.w600))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final String value;
  const _StatCard({required this.icon, required this.color, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color),
            const Spacer(),
            Text(value, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
            Text(label, style: const TextStyle(fontSize: 12, color: AppColors.mutedText)),
          ],
        ),
      ),
    );
  }
}

class _ActivityBarRow extends StatelessWidget {
  final String label;
  final Color color;
  final List<DailyActivitySummary> week;
  final double Function(DailyActivitySummary) valueFor;

  const _ActivityBarRow({
    required this.label,
    required this.color,
    required this.week,
    required this.valueFor,
  });

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year && date.month == now.month && date.day == now.day;
  }

  @override
  Widget build(BuildContext context) {
    final values = week.map(valueFor).toList();
    var maxValue = 0.0;
    for (final v in values) {
      if (v > maxValue) maxValue = v;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        SizedBox(
          height: 34,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: List.generate(week.length, (i) {
              final value = values[i];
              final ratio = maxValue == 0 ? 0.0 : (value / maxValue).clamp(0.0, 1.0);
              final isToday = _isToday(week[i].date);
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 30 * (ratio == 0 ? 0.05 : ratio),
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: isToday ? 1.0 : 0.55),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
