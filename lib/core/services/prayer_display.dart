import '../../l10n/generated/app_localizations.dart';

/// Maps a [PrayerItem.name] (which, despite the field name, holds a
/// stable locale-independent ID like 'Fajr', 'Dhuhr', ... — see
/// prayer_service.dart) to the display name in the app's active
/// language. Centralized here so every screen shows the same name.
String prayerDisplayName(AppLocalizations l10n, String id) {
  switch (id) {
    case 'Fajr':
      return l10n.prayerFajr;
    case 'Dhuhr':
      return l10n.prayerDhuhr;
    case 'Asr':
      return l10n.prayerAsr;
    case 'Maghrib':
      return l10n.prayerMaghrib;
    case 'Isha':
      return l10n.prayerIsha;
    default:
      return id;
  }
}
