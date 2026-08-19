import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/data/app_sources.dart';
import '../../core/models/prayer_models.dart';
import '../../core/services/app_logger.dart';
import '../../core/services/prayer_display.dart';
import '../../core/services/prayer_notification_scheduler.dart';
import '../../core/services/prayer_service.dart';
import '../../core/services/settings_service.dart';
import '../../core/services/user_progress_service.dart';
import '../../core/theme/app_theme.dart';
import '../../l10n/generated/app_localizations.dart';

class PrayerTimesScreen extends StatefulWidget {
  const PrayerTimesScreen({super.key});

  @override
  State<PrayerTimesScreen> createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends State<PrayerTimesScreen> {
  bool _loading = true;
  PrayerAvailability? _availabilityError;
  PrayerTimesResult? _result;
  String _countdown = '--:--:--';
  Timer? _timer;
  Set<String> _prayedToday = {};
  String? _remindedForPrayer; // avoids re-firing the reminder every second
  final AudioPlayer _adhanPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _load();
    _loadPrayedToday();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _adhanPlayer.dispose();
    super.dispose();
  }

  Future<void> _loadPrayedToday() async {
    final prayed = await UserProgressService.prayedToday();
    if (mounted) setState(() => _prayedToday = prayed);
  }

  Future<void> _togglePrayed(String prayerId) async {
    final isPrayed = _prayedToday.contains(prayerId);
    await UserProgressService.setPrayed(prayerId, !isPrayed);
    await _loadPrayedToday();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _availabilityError = null;
    });

    try {
      final result = await PrayerService.fetchUsingSavedPreference();
      setState(() {
        _result = result;
        _loading = false;
      });
      _startCountdown();
      if (mounted) {
        unawaited(PrayerNotificationScheduler.rescheduleFromResult(context, result));
      }
    } on PrayerAvailability catch (e) {
      setState(() {
        _availabilityError = e;
        _loading = false;
      });
    } catch (_) {
      setState(() {
        _availabilityError = PrayerAvailability.networkErrorNoCache;
        _loading = false;
      });
    }
  }

  Future<void> _useGpsLocation() async {
    setState(() => _loading = true);
    try {
      final result = await PrayerService.fetchPrayerTimes();
      setState(() {
        _result = result;
        _availabilityError = null;
        _loading = false;
      });
      _startCountdown();
      if (mounted) {
        unawaited(PrayerNotificationScheduler.rescheduleFromResult(context, result));
      }
    } on PrayerAvailability catch (e) {
      setState(() {
        _availabilityError = e;
        _loading = false;
      });
    } catch (_) {
      setState(() {
        _availabilityError = PrayerAvailability.networkErrorNoCache;
        _loading = false;
      });
    }
  }

  Future<void> _pickCityManually() async {
    final l10n = AppLocalizations.of(context);
    final controller = TextEditingController(text: _result?.locationLabel ?? '');

    final city = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.prayerSetCityManually),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: l10n.prayerCityHint),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(l10n.commonCancel)),
          TextButton(onPressed: () => Navigator.pop(context, controller.text.trim()), child: Text(l10n.prayerSearch)),
        ],
      ),
    );

    if (city == null || city.isEmpty) return;
    if (!mounted) return;

    setState(() => _loading = true);
    try {
      final result = await PrayerService.fetchPrayerTimesForCity(city);
      setState(() {
        _result = result;
        _availabilityError = null;
        _loading = false;
      });
      _startCountdown();
      if (mounted) {
        unawaited(PrayerNotificationScheduler.rescheduleFromResult(context, result));
      }
    } catch (e) {
      setState(() => _loading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context).prayerCityNotFound(city))),
        );
      }
    }
  }

  void _startCountdown() {
    _timer?.cancel();
    _remindedForPrayer = null;
    _updateCountdown();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _updateCountdown());
  }

  void _updateCountdown() {
    final result = _result;
    if (result == null) return;

    final diff = result.next.dateTime.difference(DateTime.now());
    if (diff.isNegative) {
      _load();
      return;
    }

    final hours = diff.inHours.toString().padLeft(2, '0');
    final minutes = (diff.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (diff.inSeconds % 60).toString().padLeft(2, '0');

    if (mounted) setState(() => _countdown = '$hours:$minutes:$seconds');

    _maybeFireReminder(diff, result.next.name);
  }

  void _maybeFireReminder(Duration remaining, String prayerId) {
    if (!appSettings.prayerReminderEnabled) return;
    if (appSettings.prayerReminderMode == 'off') return;
    if (_remindedForPrayer == prayerId) return;

    final thresholdSeconds = appSettings.prayerReminderMinutesBefore * 60;
    if (remaining.inSeconds <= thresholdSeconds) {
      _remindedForPrayer = prayerId;
      _fireReminder(prayerId);
    }
  }

  void _fireReminder(String prayerId) {
    final mode = appSettings.prayerReminderMode;

    if (mode == 'beep') {
      SystemSound.play(SystemSoundType.alert);
      HapticFeedback.heavyImpact();
    } else if (mode == 'adhan') {
      _playAdhan();
    }

    if (mode != 'off') {
      if (mounted) {
        final l10n = AppLocalizations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.prayerReminderApproaching(
              prayerDisplayName(l10n, prayerId),
              appSettings.prayerReminderMinutesBefore,
            )),
            duration: const Duration(seconds: 6),
            backgroundColor: AppColors.primaryEmerald,
          ),
        );
      }
    }
  }

  Future<void> _playAdhan() async {
    final option = AppSources.adhanOptions.firstWhere(
      (a) => a.id == appSettings.adhanId,
      orElse: () => AppSources.adhanOptions.first,
    );
    try {
      try {
        await _adhanPlayer.stop();
      } catch (_) {
        // Nothing loaded yet — expected on first play.
      }
      await _adhanPlayer.play(UrlSource(option.url));
    } catch (e, st) {
      AppLogger.error('Adhan playback failed', error: e, stackTrace: st);
    }
  }

  String _availabilityMessage(AppLocalizations l10n, PrayerAvailability e) => switch (e) {
        PrayerAvailability.locationServiceDisabled => l10n.prayerAvailabilityLocationDisabled,
        PrayerAvailability.permissionDenied => l10n.prayerAvailabilityPermissionDenied,
        PrayerAvailability.permissionDeniedForever => l10n.prayerAvailabilityPermissionDeniedForever,
        PrayerAvailability.networkErrorNoCache => l10n.prayerAvailabilityNetworkError,
        PrayerAvailability.ok => '',
      };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (_availabilityError != null) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.prayerTimesTitle), centerTitle: true),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.location_off_outlined, size: 52, color: AppColors.mutedText),
                const SizedBox(height: 16),
                Text(_availabilityMessage(l10n, _availabilityError!),
                    textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, color: AppColors.mutedText)),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: _load, child: Text(l10n.prayerRetry)),
                const SizedBox(height: 10),
                OutlinedButton.icon(
                  onPressed: _pickCityManually,
                  icon: const Icon(Icons.location_city),
                  label: Text(l10n.prayerSetCityManually),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final result = _result!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.prayerTimesTitle),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'gps') _useGpsLocation();
              if (value == 'city') _pickCityManually();
            },
            itemBuilder: (context) => [
              PopupMenuItem(value: 'gps', child: Text(l10n.prayerUseGps)),
              PopupMenuItem(value: 'city', child: Text(l10n.prayerSetCityManually)),
            ],
            icon: const Icon(Icons.tune),
          ),
          IconButton(onPressed: _load, icon: const Icon(Icons.refresh), tooltip: l10n.prayerRefresh),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          if (result.isFromCache)
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.goldAccent.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.wifi_off_rounded, size: 18, color: AppColors.goldAccent),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(l10n.prayerOfflineBanner, style: const TextStyle(fontSize: 13)),
                  ),
                ],
              ),
            ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primaryEmerald, Color(0xFF115E56)],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                if (result.locationLabel != null) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.location_on, size: 16, color: Colors.white70),
                      const SizedBox(width: 4),
                      Text(result.locationLabel!, style: const TextStyle(color: Colors.white70, fontSize: 13)),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
                Text(l10n.prayerNextPrayerLabel, style: const TextStyle(color: Colors.white70, fontSize: 16)),
                const SizedBox(height: 10),
                Text(prayerDisplayName(l10n, result.next.name),
                    style: const TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text(_countdown, style: const TextStyle(color: AppColors.goldAccent, fontSize: 24, fontWeight: FontWeight.w700, letterSpacing: 1.5)),
                const SizedBox(height: 6),
                Text(l10n.prayerTimeRemaining, style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ...result.prayers.map((prayer) {
            final isNext = prayer.name == result.next.name;
            final isPrayed = _prayedToday.contains(prayer.name);
            final hasPassed = prayer.dateTime.isBefore(DateTime.now());
            final displayName = prayerDisplayName(l10n, prayer.name);
            return Card(
              color: isNext ? AppColors.primaryEmerald.withValues(alpha: 0.08) : null,
              child: ListTile(
                leading: Icon(Icons.mosque_outlined, color: isNext ? AppColors.primaryEmerald : AppColors.mutedText),
                title: Text(displayName, style: TextStyle(fontWeight: isNext ? FontWeight.bold : FontWeight.w600)),
                subtitle: Text(prayer.timeText, style: TextStyle(fontWeight: FontWeight.bold, color: isNext ? AppColors.primaryEmerald : null)),
                trailing: Semantics(
                  button: hasPassed,
                  label: !hasPassed
                      ? l10n.prayerNotYetDue(displayName)
                      : (isPrayed ? l10n.prayerMarkedDone(displayName) : l10n.prayerNotDoneYet(displayName)),
                  child: Checkbox(
                    value: isPrayed,
                    activeColor: AppColors.primaryEmerald,
                    onChanged: hasPassed ? (_) => _togglePrayed(prayer.name) : null,
                  ),
                ),
              ),
            );
          }),
          const SizedBox(height: 12),
          Text(
            l10n.prayerFootnote,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: AppColors.mutedText),
          ),
        ],
      ),
    );
  }
}
