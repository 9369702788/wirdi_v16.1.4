import '../../l10n/generated/app_localizations.dart';
import 'notification_service.dart';
import 'settings_service.dart';

class DailyReminderScheduler {
  DailyReminderScheduler._();

  static const _idFriday = 900000000;
  static const _idMorningAzkar = 900000001;
  static const _idEveningAzkar = 900000002;
  static const _idDailyWird = 900000003;
  static const _idSleepAzkar = 900000004;

  static Future<void> rescheduleAll(AppLocalizations l10n) async {
    final reminders = <RecurringReminder>[];

    final friday = appSettings.dailyReminder('friday');
    if (friday.enabled) {
      reminders.add(RecurringReminder(
        id: _idFriday,
        hour: friday.hour,
        minute: friday.minute,
        title: l10n.appTitle,
        body: l10n.reminderFridayBody,
        recurrence: RecurrenceType.weeklyFriday,
      ));
    }

    final morning = appSettings.dailyReminder('morningAzkar');
    if (morning.enabled) {
      reminders.add(RecurringReminder(
        id: _idMorningAzkar,
        hour: morning.hour,
        minute: morning.minute,
        title: l10n.appTitle,
        body: l10n.reminderMorningAzkarBody,
        recurrence: RecurrenceType.daily,
      ));
    }

    final evening = appSettings.dailyReminder('eveningAzkar');
    if (evening.enabled) {
      reminders.add(RecurringReminder(
        id: _idEveningAzkar,
        hour: evening.hour,
        minute: evening.minute,
        title: l10n.appTitle,
        body: l10n.reminderEveningAzkarBody,
        recurrence: RecurrenceType.daily,
      ));
    }

    final wird = appSettings.dailyReminder('dailyWird');
    if (wird.enabled) {
      reminders.add(RecurringReminder(
        id: _idDailyWird,
        hour: wird.hour,
        minute: wird.minute,
        title: l10n.appTitle,
        body: l10n.reminderDailyWirdBody,
        recurrence: RecurrenceType.daily,
      ));
    }

    final sleep = appSettings.dailyReminder('sleepAzkar');
    if (sleep.enabled) {
      reminders.add(RecurringReminder(
        id: _idSleepAzkar,
        hour: sleep.hour,
        minute: sleep.minute,
        title: l10n.appTitle,
        body: l10n.reminderSleepAzkarBody,
        recurrence: RecurrenceType.daily,
      ));
    }

    if (reminders.isEmpty) {
      await NotificationService.cancelAllRecurring();
      return;
    }

    await NotificationService.scheduleRecurring(reminders);
  }
}
