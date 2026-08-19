import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Top-level aliases so the settings screen and main.dart can import
/// a single canonical list without accessing the class directly.
const List<Locale> kSupportedLocales = AppSettings.supportedLocales;

const Map<String, String> kLanguageNames = {
  'ar': 'العربية',
  'en': 'English',
  'de': 'Deutsch',
  'tr': 'Türkçe',
  'fr': 'Français',
  'es': 'Español',
  'id': 'Bahasa Indonesia',
};


/// App-wide settings, persisted and reactive via ChangeNotifier so
/// MaterialApp can rebuild its theme/text scale live without adding a
/// state-management package. Instantiate once and pass down; call
/// [load] before runApp so the first frame already has saved prefs.
class DailyReminderSetting {
  final bool enabled;
  final int hour;
  final int minute;
  const DailyReminderSetting({required this.enabled, required this.hour, required this.minute});

  DailyReminderSetting copyWith({bool? enabled, int? hour, int? minute}) => DailyReminderSetting(
        enabled: enabled ?? this.enabled,
        hour: hour ?? this.hour,
        minute: minute ?? this.minute,
      );

  Map<String, dynamic> toJson() => {'enabled': enabled, 'hour': hour, 'minute': minute};

  factory DailyReminderSetting.fromJson(Map<String, dynamic> json) => DailyReminderSetting(
        enabled: json['enabled'] as bool? ?? false,
        hour: json['hour'] as int? ?? 8,
        minute: json['minute'] as int? ?? 0,
      );
}

class AppSettings extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  double _fontScale = 1.0;
  String _reciterId = 'ar.alafasy';
  bool _loaded = false;

  /// null = follow system locale (falls back to Arabic if the system
  /// locale isn't one we support). Non-null = explicit user choice,
  /// persisted across launches.
  Locale? _locale;

  /// Locales the app ships real translations for. Order here also
  /// drives the order shown in the language picker.
  static const List<Locale> supportedLocales = [
    Locale('ar'),
    Locale('en'),
    Locale('de'),
    Locale('tr'),
    Locale('fr'),
    Locale('es'),
    Locale('id'),
  ];

  static const List<String> _rtlLanguageCodes = ['ar'];

  static const List<String> remindablePrayerKeys = ['Fajr', 'Dhuhr', 'Asr', 'Maghrib', 'Isha'];

  Set<String> _enabledPrayerReminders = {'Fajr', 'Dhuhr', 'Asr', 'Maghrib', 'Isha'};
  bool _notifyAtPrayerTime = true;
  bool _postPrayerReminderEnabled = false;
  int _postPrayerReminderMinutesAfter = 30;
  int _prayerReminderMinutesBefore = 10;
  // 'banner' | 'beep' | 'adhan'
  String _prayerReminderMode = 'adhan';
  String _adhanId = 'a9';
  bool _showTransliteration = false;
  bool _showTajweedColoring = true;

  static const List<String> dailyReminderKeys = [
    'friday',
    'morningAzkar',
    'eveningAzkar',
    'dailyWird',
    'sleepAzkar',
  ];

  final Map<String, DailyReminderSetting> _dailyReminders = {
    'friday': const DailyReminderSetting(enabled: false, hour: 8, minute: 0),
    'morningAzkar': const DailyReminderSetting(enabled: false, hour: 6, minute: 0),
    'eveningAzkar': const DailyReminderSetting(enabled: false, hour: 17, minute: 0),
    'dailyWird': const DailyReminderSetting(enabled: false, hour: 20, minute: 0),
    'sleepAzkar': const DailyReminderSetting(enabled: false, hour: 22, minute: 0),
  };

  ThemeMode get themeMode => _themeMode;
  double get fontScale => _fontScale;
  String get reciterId => _reciterId;
  bool get loaded => _loaded;
  bool get prayerReminderEnabled => _enabledPrayerReminders.isNotEmpty;
  Set<String> get enabledPrayerReminders => _enabledPrayerReminders;
  bool isPrayerReminderEnabledFor(String prayerId) => _enabledPrayerReminders.contains(prayerId);
  bool get notifyAtPrayerTime => _notifyAtPrayerTime;
  bool get postPrayerReminderEnabled => _postPrayerReminderEnabled;
  int get postPrayerReminderMinutesAfter => _postPrayerReminderMinutesAfter;
  int get prayerReminderMinutesBefore => _prayerReminderMinutesBefore;
  String get prayerReminderMode => _prayerReminderMode;
  String get adhanId => _adhanId;
  bool get showTransliteration => _showTransliteration;
  bool get showTajweedColoring => _showTajweedColoring;

  DailyReminderSetting dailyReminder(String key) =>
      _dailyReminders[key] ?? const DailyReminderSetting(enabled: false, hour: 8, minute: 0);

  /// The effective locale: explicit user choice, else the device locale
  /// if we support it, else Arabic (this app's original default).
  Locale get locale {
    if (_locale != null) return _locale!;
    final deviceLocale = PlatformDispatcher.instance.locale;
    final match = supportedLocales.firstWhere(
      (l) => l.languageCode == deviceLocale.languageCode,
      orElse: () => const Locale('ar'),
    );
    return match;
  }

  /// null means "follow system" — used by the settings UI to show the
  /// "System default" option as selected.
  Locale? get explicitLocale => _locale;

  TextDirection get textDirection =>
      _rtlLanguageCodes.contains(locale.languageCode) ? TextDirection.rtl : TextDirection.ltr;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();

    final storedTheme = prefs.getString('settings_theme_mode');
    _themeMode = switch (storedTheme) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };

    _fontScale = prefs.getDouble('settings_font_scale') ?? 1.0;
    _reciterId = prefs.getString('settings_reciter_id') ?? 'ar.alafasy';
    final storedEnabledPrayers = prefs.getStringList('settings_enabled_prayer_reminders');
    if (storedEnabledPrayers != null) {
      _enabledPrayerReminders = storedEnabledPrayers.toSet();
    } else {
      final legacyEnabled = prefs.getBool('settings_prayer_reminder_enabled') ?? false;
      _enabledPrayerReminders = legacyEnabled ? remindablePrayerKeys.toSet() : <String>{};
    }
    _notifyAtPrayerTime = prefs.getBool('settings_notify_at_prayer_time') ?? true;
    _postPrayerReminderEnabled = prefs.getBool('settings_post_prayer_reminder_enabled') ?? false;
    _postPrayerReminderMinutesAfter = prefs.getInt('settings_post_prayer_reminder_minutes') ?? 30;
    _prayerReminderMinutesBefore = prefs.getInt('settings_prayer_reminder_minutes') ?? 10;
    _prayerReminderMode = prefs.getString('settings_prayer_reminder_mode') ?? 'adhan';
    _adhanId = prefs.getString('settings_adhan_id') ?? 'a9';
    _showTransliteration = prefs.getBool('settings_show_transliteration') ?? false;
    _showTajweedColoring = prefs.getBool('settings_show_tajweed_coloring') ?? true;

    final storedDailyReminders = prefs.getString('settings_daily_reminders_json');
    if (storedDailyReminders != null) {
      try {
        final decoded = jsonDecode(storedDailyReminders) as Map<String, dynamic>;
        for (final key in dailyReminderKeys) {
          final raw = decoded[key];
          if (raw is Map<String, dynamic>) {
            _dailyReminders[key] = DailyReminderSetting.fromJson(raw);
          }
        }
      } catch (_) {
        // Corrupt/legacy data -- keep the defaults rather than crashing load().
      }
    }

    final storedLocale = prefs.getString('settings_locale');
    _locale = storedLocale == null ? null : Locale(storedLocale);

    _loaded = true;
    notifyListeners();
  }

  /// Pass null to reset to "follow system".
  Future<void> setLocale(Locale? locale) async {
    _locale = locale;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    if (locale == null) {
      await prefs.remove('settings_locale');
    } else {
      await prefs.setString('settings_locale', locale.languageCode);
    }
  }

  Future<void> setShowTransliteration(bool value) async {
    _showTransliteration = value;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('settings_show_transliteration', value);
  }

  Future<void> setDailyReminder(String key, DailyReminderSetting setting) async {
    _dailyReminders[key] = setting;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(_dailyReminders.map((k, v) => MapEntry(k, v.toJson())));
    await prefs.setString('settings_daily_reminders_json', encoded);
  }

  Future<void> setAdhanId(String id) async {
    _adhanId = id;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('settings_adhan_id', id);
  }

  Future<void> setReciterId(String id) async {
    _reciterId = id;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('settings_reciter_id', id);
  }

  Future<void> setPrayerReminderEnabledFor(String prayerId, bool enabled) async {
    if (enabled) {
      _enabledPrayerReminders.add(prayerId);
    } else {
      _enabledPrayerReminders.remove(prayerId);
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('settings_enabled_prayer_reminders', _enabledPrayerReminders.toList());
  }

  Future<void> setNotifyAtPrayerTime(bool value) async {
    _notifyAtPrayerTime = value;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('settings_notify_at_prayer_time', value);
  }

  Future<void> setPostPrayerReminderEnabled(bool value) async {
    _postPrayerReminderEnabled = value;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('settings_post_prayer_reminder_enabled', value);
  }

  Future<void> setPostPrayerReminderMinutesAfter(int minutes) async {
    _postPrayerReminderMinutesAfter = minutes;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('settings_post_prayer_reminder_minutes', minutes);
  }

  Future<void> setPrayerReminderMinutesBefore(int minutes) async {
    _prayerReminderMinutesBefore = minutes;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('settings_prayer_reminder_minutes', minutes);
  }

  Future<void> setPrayerReminderMode(String mode) async {
    _prayerReminderMode = mode;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('settings_prayer_reminder_mode', mode);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('settings_theme_mode', switch (mode) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      ThemeMode.system => 'system',
    });
  }

  Future<void> setFontScale(double scale) async {
    _fontScale = scale;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('settings_font_scale', scale);
  }
  Future<void> setShowTajweedColoring(bool value) async {
    _showTajweedColoring = value;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('settings_show_tajweed_coloring', value);
  }
}

/// Single app-wide instance. Simple top-level singleton — avoids pulling
/// in Provider/Riverpod purely to broadcast theme changes.
final AppSettings appSettings = AppSettings();
