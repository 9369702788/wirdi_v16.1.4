import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/models/prayer_models.dart';
import '../../core/services/hijri_date.dart';
import '../../core/services/prayer_service.dart';
import '../../core/services/user_progress_service.dart';
import '../../core/theme/app_theme.dart';
import '../../l10n/generated/app_localizations.dart';

enum _CountdownTarget { suhoor, iftar, suhoorTomorrow }

class RamadanCompanionScreen extends StatefulWidget {
  const RamadanCompanionScreen({super.key});

  @override
  State<RamadanCompanionScreen> createState() => _RamadanCompanionScreenState();
}

class _RamadanCompanionScreenState extends State<RamadanCompanionScreen> {
  PrayerTimesResult? _prayer;
  bool _loading = true;
  bool _error = false;
  Timer? _timer;
  _CountdownTarget? _countdownTarget;
  String _countdown = '--:--:--';
  bool _fastingToday = false;
  int _ramadanDaysLogged = 0;

  @override
  void initState() {
    super.initState();
    _load();
    _loadFastingState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = false;
    });
    try {
      final result = await PrayerService.fetchUsingSavedPreference();
      setState(() {
        _prayer = result;
        _loading = false;
      });
      _startCountdown();
    } catch (_) {
      setState(() {
        _error = true;
        _loading = false;
      });
    }
  }

  Future<void> _loadFastingState() async {
    final fasted = await UserProgressService.isFastingToday();
    final now = DateTime.now();
    final hijri = HijriDate.fromGregorian(now);
    int loggedCount = 0;
    if (hijri.isRamadan) {
      var cursor = now;
      var daysBack = 0;
      while (daysBack < 30) {
        final h = HijriDate.fromGregorian(cursor);
        if (!h.isRamadan) break;
        cursor = cursor.subtract(const Duration(days: 1));
        daysBack++;
      }
      final startOfMonth = now.subtract(Duration(days: daysBack - 1));
      loggedCount = await UserProgressService.fastingDaysInRange(startOfMonth, now);
    }
    if (mounted) {
      setState(() {
        _fastingToday = fasted;
        _ramadanDaysLogged = loggedCount;
      });
    }
  }

  void _startCountdown() {
    _timer?.cancel();
    _updateCountdown();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _updateCountdown());
  }

  void _updateCountdown() {
    final result = _prayer;
    if (result == null) return;

    final now = DateTime.now();
    final fajr = result.prayers.firstWhere((p) => p.name == 'Fajr');
    final maghrib = result.prayers.firstWhere((p) => p.name == 'Maghrib');

    DateTime target;
    _CountdownTarget targetType;

    if (now.isBefore(fajr.dateTime)) {
      target = fajr.dateTime;
      targetType = _CountdownTarget.suhoor;
    } else if (now.isBefore(maghrib.dateTime)) {
      target = maghrib.dateTime;
      targetType = _CountdownTarget.iftar;
    } else {
      target = fajr.dateTime.add(const Duration(days: 1));
      targetType = _CountdownTarget.suhoorTomorrow;
    }

    final diff = target.difference(now);
    final h = diff.inHours.toString().padLeft(2, '0');
    final m = (diff.inMinutes % 60).toString().padLeft(2, '0');
    final s = (diff.inSeconds % 60).toString().padLeft(2, '0');

    if (mounted) {
      setState(() {
        _countdown = '$h:$m:$s';
        _countdownTarget = targetType;
      });
    }
  }

  Future<void> _toggleFasting() async {
    final next = !_fastingToday;
    setState(() => _fastingToday = next);
    await UserProgressService.setFastingToday(next);
    _loadFastingState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final hijri = HijriDate.fromGregorian(DateTime.now());
    final isRamadan = hijri.isRamadan;

    final countdownLabel = switch (_countdownTarget) {
      _CountdownTarget.suhoor => l10n.ramadanCountdownToSuhoor,
      _CountdownTarget.iftar => l10n.ramadanCountdownToIftar,
      _CountdownTarget.suhoorTomorrow => l10n.ramadanCountdownToSuhoorTomorrow,
      null => '',
    };

    return Scaffold(
      appBar: AppBar(title: Text(l10n.toolRamadanTitle), centerTitle: true),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(l10n.ramadanLoadError, textAlign: TextAlign.center),
                        const SizedBox(height: 16),
                        ElevatedButton(onPressed: _load, child: Text(l10n.commonRetry)),
                      ],
                    ),
                  ),
                )
              : ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    Text(
                      isRamadan ? l10n.ramadanDayOfRamadan(hijri.day) : hijri.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [AppColors.primaryEmerald, Color(0xFF115E56)]),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        children: [
                          Text(countdownLabel, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white70)),
                          const SizedBox(height: 10),
                          Text(_countdown, style: const TextStyle(color: AppColors.goldAccent, fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Card(
                      child: SwitchListTile(
                        title: Text(l10n.ramadanFastingToday),
                        subtitle: Text(l10n.ramadanFastingSubtitle),
                        value: _fastingToday,
                        activeTrackColor: AppColors.primaryEmerald,
                        onChanged: (_) => _toggleFasting(),
                      ),
                    ),
                    if (isRamadan) ...[
                      const SizedBox(height: 12),
                      Card(
                        child: ListTile(
                          leading: const Icon(Icons.calendar_month, color: AppColors.primaryEmerald),
                          title: Text(l10n.ramadanDaysLoggedTitle),
                          trailing: Text('$_ramadanDaysLogged', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        ),
                      ),
                    ],
                    if (isRamadan && hijri.day >= 21) ...[
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.goldAccent.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.goldAccent.withValues(alpha: 0.4)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.star, color: AppColors.goldAccent),
                                const SizedBox(width: 8),
                                Expanded(child: Text(l10n.ramadanLast10NightsTitle, style: const TextStyle(fontWeight: FontWeight.w700))),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(l10n.ramadanLast10NightsBody, style: const TextStyle(fontSize: 13, color: AppColors.mutedText)),
                            if (hijri.day.isOdd) ...[
                              const SizedBox(height: 8),
                              Text(l10n.ramadanPossibleLaylatAlQadr, style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.goldAccent)),
                            ],
                          ],
                        ),
                      ),
                    ],
                    const SizedBox(height: 16),
                    Text(
                      l10n.ramadanHijriFootnote,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12, color: AppColors.mutedText),
                    ),
                  ],
                ),
    );
  }
}
