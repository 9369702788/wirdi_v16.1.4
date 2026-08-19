import 'package:flutter/widgets.dart';

import '../../l10n/generated/app_localizations.dart';
import '../models/prayer_models.dart';
import 'notification_service.dart';
import 'prayer_display.dart';
import 'prayer_service.dart';
import 'settings_service.dart';

class PrayerNotificationScheduler {
  PrayerNotificationScheduler._();

  static int _idFor(DateTime date, int prayerIndex, int kind) {
    final epoch = DateTime(2020, 1, 1);
    final days = DateTime(date.year, date.month, date.day).difference(epoch).inDays;
    return days * 30 + prayerIndex * 3 + kind;
  }

  static Future<void> rescheduleFromResult(BuildContext context, PrayerTimesResult result) async {
    if (!appSettings.prayerReminderEnabled) {
      await NotificationService.cancelAllScheduled();
      return;
    }

    final l10n = AppLocalizations.of(context);
    final minutesBefore = appSettings.prayerReminderMinutesBefore;
    final silent = appSettings.prayerReminderMode == 'banner';
    final notifications = <ScheduledPrayerNotification>[];

    void addFor(List<PrayerItem> prayers, DateTime date) {
      for (var i = 0; i < prayers.length; i++) {
        final prayer = prayers[i];
        if (!appSettings.isPrayerReminderEnabledFor(prayer.name)) continue;

        final displayName = prayerDisplayName(l10n, prayer.name);

        if (minutesBefore > 0) {
          notifications.add(ScheduledPrayerNotification(
            id: _idFor(date, i, 0),
            fireAt: prayer.dateTime.subtract(Duration(minutes: minutesBefore)),
            title: l10n.appTitle,
            body: l10n.prayerReminderApproaching(displayName, minutesBefore),
            silent: silent,
          ));
        }

        if (appSettings.notifyAtPrayerTime) {
          notifications.add(ScheduledPrayerNotification(
            id: _idFor(date, i, 1),
            fireAt: prayer.dateTime,
            title: l10n.appTitle,
            body: l10n.prayerTimeNowBody(displayName),
            silent: silent,
          ));
        }

        if (appSettings.postPrayerReminderEnabled) {
          notifications.add(ScheduledPrayerNotification(
            id: _idFor(date, i, 2),
            fireAt: prayer.dateTime.add(Duration(minutes: appSettings.postPrayerReminderMinutesAfter)),
            title: l10n.appTitle,
            body: l10n.postPrayerReminderBody(displayName),
            silent: silent,
          ));
        }
      }
    }

    final today = DateTime.now();
    addFor(result.prayers, today);

    final tomorrowPrayers = await PrayerService.fetchTomorrowPrayers();
    if (tomorrowPrayers != null) {
      addFor(tomorrowPrayers, today.add(const Duration(days: 1)));
    }

    await NotificationService.scheduleAll(notifications);
  }
}
