
import 'dart:io';

import '../../core/services/backup_service.dart';
import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart' hide TextDirection;

import '../../core/data/app_sources.dart';
import '../../core/data/adhan_option.dart';
import '../../core/services/audio_download_service.dart';
import '../../core/services/azkar_repository.dart';
import '../../core/services/notification_service.dart';
import '../../core/services/prayer_display.dart';
import '../../core/services/daily_reminder_scheduler.dart';
import '../../core/services/quran_repository.dart';
import '../../core/services/settings_service.dart';
import '../../core/services/user_progress_service.dart';
import '../../core/theme/app_theme.dart';
import '../../l10n/generated/app_localizations.dart';
import 'about_screen.dart';
import 'privacy_center_screen.dart';
import 'privacy_policy_screen.dart';
import 'sources_licenses_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _wirdTarget = 5;
  final AudioPlayer _previewPlayer = AudioPlayer();
  String? _previewingAdhanId;
  DateTime? _quranCachedAt;
  DateTime? _azkarCachedAt;
  int _downloadedAudioBytes = 0;

  @override
  void initState() {
    super.initState();
    _loadWirdTarget();
    _loadCacheInfo();
    _loadDownloadedAudioSize();
    _previewPlayer.onPlayerComplete.listen((_) {
      if (mounted) setState(() => _previewingAdhanId = null);
    });
  }

  Future<void> _loadDownloadedAudioSize() async {
    final bytes = await AudioDownloadService.totalStorageUsedBytes();
    if (mounted) setState(() => _downloadedAudioBytes = bytes);
  }

  String _downloadedAudioSize(AppLocalizations l10n) {
    if (_downloadedAudioBytes == 0) return l10n.settingsNoDownloadedAudio;
    final mb = _downloadedAudioBytes / (1024 * 1024);
    return l10n.settingsMbDownloaded(mb.toStringAsFixed(1));
  }

  Future<void> _confirmDeleteAllDownloads() async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.settingsDeleteAllDownloadsTitle),
        content: Text(l10n.settingsDeleteAllDownloadsBody),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(l10n.commonCancel)),
          TextButton(onPressed: () => Navigator.pop(context, true), child: Text(l10n.commonDelete, style: const TextStyle(color: Colors.red))),
        ],
      ),
    );
    if (confirmed == true) {
      await AudioDownloadService.deleteAllDownloads();
      _loadDownloadedAudioSize();
    }
  }

  @override
  void dispose() {
    _previewPlayer.dispose();
    super.dispose();
  }

  Future<void> _togglePreviewAdhan(AdhanOption option) async {
    if (_previewingAdhanId == option.id) {
      try {
        await _previewPlayer.stop();
      } catch (_) {
        // Nothing loaded — fine.
      }
      setState(() => _previewingAdhanId = null);
      return;
    }

    setState(() => _previewingAdhanId = option.id);
    try {
      try {
        await _previewPlayer.stop();
      } catch (_) {
        // Nothing loaded yet — expected on first preview, safe to ignore.
      }
      await _previewPlayer.play(UrlSource(option.url));
    } catch (e) {
      if (mounted) {
        setState(() => _previewingAdhanId = null);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context).settingsPreviewFailed)),
        );
      }
    }
  }

  Future<void> _loadCacheInfo() async {
    final quranAt = await QuranRepository.cachedAt();
    final azkarAt = await AzkarRepository.cachedAt();
    if (mounted) {
      setState(() {
        _quranCachedAt = quranAt;
        _azkarCachedAt = azkarAt;
      });
    }
  }

  String _formatCacheDate(DateTime? date, String languageCode, AppLocalizations l10n) {
    if (date == null) return l10n.settingsNotDownloadedYet;
    // Falls back to 'en' formatting for locales without an intl date
    // pattern registered (all four we ship are registered in main.dart).
    return DateFormat('d MMMM y, h:mm a', languageCode).format(date);
  }

  Future<void> _loadWirdTarget() async {
    final target = await UserProgressService.dailyWirdTarget();
    if (mounted) setState(() => _wirdTarget = target);
  }

  Future<void> _setWirdTarget(int value) async {
    if (value < 1) return;
    await UserProgressService.setDailyWirdTarget(value);
    setState(() => _wirdTarget = value);
  }

  Future<void> _confirmClearData() async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.settingsDeleteLocalData),
        content: Text(l10n.settingsDeleteLocalDataBody),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(l10n.commonCancel)),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(l10n.commonDelete, style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await UserProgressService.clearAllLocalData();
      await appSettings.load();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.settingsLocalDataDeleted)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final languageCode = Localizations.localeOf(context).languageCode;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle), centerTitle: true),
      body: ListenableBuilder(
        listenable: appSettings,
        builder: (context, _) {
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
                        // ── Language ──────────────────────────────────────────────────
                        const SizedBox(height: 12),
                        ListTile(
                          leading: const Icon(Icons.language),
                          title: Text(l10n.settingsLanguage),
                          subtitle: Text(l10n.settingsLanguageSubtitle),
                          trailing: DropdownButton<String>(
                            value: appSettings.locale.languageCode,
                            underline: const SizedBox(),
                            items: kLanguageNames.entries
                                .map((e) => DropdownMenuItem(
                                      value: e.key,
                                      child: Text(e.value),
                                    ))
                                .toList(),
                            onChanged: (code) {
                              if (code != null) appSettings.setLocale(Locale(code));
                            },
                          ),
                        ),
              _SectionLabel(l10n.settingsAppearance),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l10n.settingsMode, style: const TextStyle(fontWeight: FontWeight.w700)),
                      const SizedBox(height: 10),
                      SegmentedButton<ThemeMode>(
                        segments: [
                          ButtonSegment(value: ThemeMode.light, label: Text(l10n.settingsModeLight), icon: const Icon(Icons.light_mode_outlined)),
                          ButtonSegment(value: ThemeMode.dark, label: Text(l10n.settingsModeDark), icon: const Icon(Icons.dark_mode_outlined)),
                          ButtonSegment(value: ThemeMode.system, label: Text(l10n.settingsModeAuto), icon: const Icon(Icons.brightness_auto_outlined)),
                        ],
                        selected: {appSettings.themeMode},
                        onSelectionChanged: (set) => appSettings.setThemeMode(set.first),
                      ),
                      const SizedBox(height: 20),
                      Text(l10n.settingsFontSize, style: const TextStyle(fontWeight: FontWeight.w700)),
                      Slider(
                        value: appSettings.fontScale,
                        min: 0.85,
                        max: 1.4,
                        divisions: 11,
                        label: '${(appSettings.fontScale * 100).round()}%',
                        onChanged: (value) => appSettings.setFontScale(value),
                      ),
                      Text(
                        l10n.settingsFontPreview,
                        style: TextStyle(fontSize: 16 * appSettings.fontScale),
                      ),
                      const SizedBox(height: 12),
                      SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(l10n.settingsShowTransliteration),
                        subtitle: Text(l10n.settingsShowTransliterationSubtitle),
                        value: appSettings.showTransliteration,
                        activeTrackColor: AppColors.primaryEmerald,
                        onChanged: (value) => appSettings.setShowTransliteration(value),
                      ),
                      SwitchListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(l10n.settingsTajweedColoring),
                        subtitle: Text(l10n.settingsTajweedColoringSubtitle),
                        value: appSettings.showTajweedColoring,
                        activeTrackColor: AppColors.primaryEmerald,
                        onChanged: (value) => appSettings.setShowTajweedColoring(value),
                      ),
                      const Divider(height: 24),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const Icon(Icons.language_outlined, color: AppColors.mutedText),
                        title: Text(l10n.settingsLanguage),
                        subtitle: Text(l10n.settingsLanguageSubtitle),
                        trailing: Text(
                          appSettings.explicitLocale == null
                              ? l10n.settingsLanguageSystem
                              : {
                                  'ar': l10n.languageName_ar,
                                  'en': l10n.languageName_en,
                                  'de': l10n.languageName_de,
                                  'tr': l10n.languageName_tr,
                                }[appSettings.explicitLocale!.languageCode] ?? '',
                          style: const TextStyle(color: AppColors.mutedText),
                        ),
                        onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
              const SizedBox(height: 20),
_SectionLabel(l10n.settingsDataManagement),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.menu_book_outlined, color: AppColors.mutedText),
                      title: Text(l10n.settingsQuranLastUpdate),
                      subtitle: Text(_formatCacheDate(_quranCachedAt, languageCode, l10n)),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.favorite_outline, color: AppColors.mutedText),
                      title: Text(l10n.settingsAzkarLastUpdate),
                      subtitle: Text(_formatCacheDate(_azkarCachedAt, languageCode, l10n)),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.refresh, color: AppColors.primaryEmerald),
                      title: Text(l10n.settingsUpdateNow),
                      subtitle: Text(l10n.settingsRequiresInternet),
                      onTap: () async {
                        await QuranRepository.load(forceRefresh: true);
                        await AzkarRepository.load(forceRefresh: true);
                        await _loadCacheInfo();
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(l10n.settingsDataUpdated)),
                          );
                        }
                      },
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.download_outlined, color: AppColors.mutedText),
                      title: Text(l10n.settingsDownloadedAudio),
                      subtitle: Text(_downloadedAudioSize(l10n)),
                      trailing: _downloadedAudioBytes > 0
                          ? TextButton(
                              onPressed: _confirmDeleteAllDownloads,
                              child: Text(l10n.settingsDeleteAll, style: const TextStyle(color: Colors.red)),
                            )
                          : null,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.restart_alt, color: Colors.orange),
                      title: Text(l10n.settingsResetKhatma),
                      subtitle: Text(l10n.settingsResetKhatmaSubtitle),
                      onTap: () async {
                        final confirmed = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text(l10n.settingsResetKhatma),
                            content: Text(l10n.settingsResetKhatmaBody),
                            actions: [
                              TextButton(onPressed: () => Navigator.pop(context, false), child: Text(l10n.commonCancel)),
                              TextButton(onPressed: () => Navigator.pop(context, true), child: Text(l10n.settingsResetKhatmaConfirm)),
                            ],
                          ),
                        );
                        if (confirmed == true) {
                          await UserProgressService.resetKhatmaProgress();
                          if (mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(l10n.settingsKhatmaResetDone)),
                            );
                          }
                        }
                      },
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.delete_outline, color: Colors.red),
                      title: Text(l10n.settingsDeleteLocalData, style: const TextStyle(color: Colors.red)),
                      onTap: _confirmClearData,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  /// Shows the language picker sheet and applies the choice. Uses a
  /// dedicated "was it dismissed or was System default tapped" signal
  /// (a sentinel Locale) since both map to `null` from Navigator.pop
  /// otherwise.
  Future<void> _showLanguageSheet(BuildContext context, AppLocalizations l10n) async {
    String nameFor(Locale locale) {
      switch (locale.languageCode) {
        case 'ar':
          return l10n.languageName_ar;
        case 'de':
          return l10n.languageName_de;
        case 'tr':
          return l10n.languageName_tr;
        default:
          return l10n.languageName_en;
      }
    }

    final choice = await showModalBottomSheet<Locale>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(l10n.settingsLanguage, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                ),
              ),
              RadioListTile<bool>(
                value: true,
                groupValue: appSettings.explicitLocale == null,
                activeColor: AppColors.primaryEmerald,
                title: Text(l10n.settingsLanguageSystem),
                onChanged: (_) => Navigator.pop(sheetContext, const Locale('system')),
              ),
              for (final locale in AppSettings.supportedLocales)
                RadioListTile<bool>(
                  value: true,
                  groupValue: appSettings.explicitLocale?.languageCode == locale.languageCode,
                  activeColor: AppColors.primaryEmerald,
                  title: Text(nameFor(locale)),
                  onChanged: (_) => Navigator.pop(sheetContext, locale),
                ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );

    if (choice == null) return; // sheet dismissed without a tap
    if (choice.languageCode == 'system') {
      await appSettings.setLocale(null); // "System default"
    } else {
      await appSettings.setLocale(choice);
    }
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 8),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.mutedText, fontSize: 13),
      ),
    );
  }
}


class _DailyReminderTile extends StatelessWidget {
  final String reminderKey;
  final String title;
  final String subtitle;
  const _DailyReminderTile({required this.reminderKey, required this.title, required this.subtitle});

  String _formatTime(BuildContext context, int hour, int minute) {
    return TimeOfDay(hour: hour, minute: minute).format(context);
  }

  @override
  Widget build(BuildContext context) {
    final setting = appSettings.dailyReminder(reminderKey);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(title),
          subtitle: Text(subtitle),
          value: setting.enabled,
          activeTrackColor: AppColors.primaryEmerald,
          onChanged: (value) async {
            final l10n = AppLocalizations.of(context);
            await appSettings.setDailyReminder(reminderKey, setting.copyWith(enabled: value));
            unawaited(DailyReminderScheduler.rescheduleAll(l10n));
            if (value) {
              unawaited(NotificationService.requestPermission());
            }
          },
        ),
        if (setting.enabled)
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 4),
            child: OutlinedButton.icon(
              onPressed: () async {
                final picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay(hour: setting.hour, minute: setting.minute),
                );
                if (picked == null) return;
                if (!context.mounted) return;
                final l10n = AppLocalizations.of(context);
                await appSettings.setDailyReminder(
                  reminderKey,
                  setting.copyWith(hour: picked.hour, minute: picked.minute),
                );
                unawaited(DailyReminderScheduler.rescheduleAll(l10n));
              },
              icon: const Icon(Icons.access_time_outlined),
              label: Text(_formatTime(context, setting.hour, setting.minute)),
            ),
          ),
      ],
    );
  }
}
