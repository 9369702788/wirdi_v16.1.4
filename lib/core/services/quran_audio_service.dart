import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

import '../data/app_sources.dart';
import '../models/quran_models.dart';
import 'app_logger.dart';
import 'audio_download_service.dart';
import 'settings_service.dart';

/// App-wide Quran audio playback, deliberately NOT owned by any single
/// screen's State — a screen-owned player is destroyed the moment the
/// user navigates away (e.g. switching bottom-nav tabs), which used to
/// stop playback. Living here means playback survives navigation, and
/// both the Surah reader and the Mushaf page view can control/observe
/// the exact same playback session.
///
/// Uses two alternating players for gapless "play whole surah": while
/// one ayah plays, the next is silently preloaded into the other, so
/// advancing doesn't need to wait for a fresh network fetch.
class QuranAudioService extends ChangeNotifier {
  QuranAudioService._();
  static final QuranAudioService instance = QuranAudioService._();

  final AudioPlayer _playerA = AudioPlayer();
  final AudioPlayer _playerB = AudioPlayer();
  late AudioPlayer _active;
  late AudioPlayer _standby;
  bool _initialized = false;

  int? _surahNumber;
  int _surahAyahOffset = 0;
  int _totalAyahsInSurah = 0;

  int? playingAyah;
  bool playingWholeSurah = false;
  bool repeatCurrent = false;
  bool isBuffering = false;

  bool isPlayingFor(int surahNumber, int ayahNumber) =>
      _surahNumber == surahNumber && playingAyah == ayahNumber;

  bool isSurahActive(int surahNumber) => _surahNumber == surahNumber;

  void _ensureInit() {
    if (_initialized) return;
    _active = _playerA;
    _standby = _playerB;

    // Capture the concrete player objects in local variables so each
    // listener always reports which physical player actually fired the
    // event — using the mutable _active/_standby fields here directly
    // would be wrong, since they get swapped during playback and the
    // closures would then misreport which one completed.
    final playerA = _playerA;
    final playerB = _playerB;
    playerA.onPlayerComplete.listen((_) => _handleComplete(playerA));
    playerB.onPlayerComplete.listen((_) => _handleComplete(playerB));

    _initialized = true;
  }

  void _loadSurahContext(SurahModel surah, List<SurahModel> allSurahs) {
    _surahNumber = surah.number;
    _totalAyahsInSurah = surah.ayahs.length;
    _surahAyahOffset = allSurahs
        .where((s) => s.number < surah.number)
        .fold(0, (sum, s) => sum + s.ayahs.length);
  }

  Future<void> playAyah(SurahModel surah, List<SurahModel> allSurahs, int ayahNumber, {bool keepRepeat = false}) async {
    _ensureInit();
    _loadSurahContext(surah, allSurahs);
    playingWholeSurah = false;
    if (!keepRepeat) repeatCurrent = false;
    notifyListeners();
    await _playAyahAudio(ayahNumber);
  }

  Future<void> playWholeSurah(SurahModel surah, List<SurahModel> allSurahs) async {
    _ensureInit();
    _loadSurahContext(surah, allSurahs);
    playingWholeSurah = true;
    repeatCurrent = false;
    notifyListeners();
    await _playAyahAudio(1);
    _preloadNext(2);
  }

  Future<void> _playAyahAudio(int ayahNumber) async {
    final globalNumber = _surahAyahOffset + ayahNumber;
    playingAyah = ayahNumber;
    isBuffering = true;
    notifyListeners();

    try {
      await _active.stop();
    } catch (_) {
      // Nothing loaded yet — expected on first play, safe to ignore.
    }

    try {
      final localPath = await AudioDownloadService.localPathFor(appSettings.reciterId, globalNumber);
      if (localPath != null) {
        await _active.play(DeviceFileSource(localPath));
      } else {
        await _active.play(UrlSource(AppSources.ayahAudioUrl(globalNumber, reciter: appSettings.reciterId)));
      }
    } catch (e, st) {
      AppLogger.error('Ayah audio playback failed', error: e, stackTrace: st);
      playingAyah = null;
      playingWholeSurah = false;
    } finally {
      isBuffering = false;
      notifyListeners();
    }
  }

  Future<void> _preloadNext(int ayahNumber) async {
    if (!playingWholeSurah) return;
    if (ayahNumber > _totalAyahsInSurah) return;
    final globalNumber = _surahAyahOffset + ayahNumber;

    final localPath = await AudioDownloadService.localPathFor(appSettings.reciterId, globalNumber);
    if (localPath != null) return; // already instant to play locally, no network preload needed

    _standby
        .setSourceUrl(AppSources.ayahAudioUrl(globalNumber, reciter: appSettings.reciterId))
        .catchError((_) {});
  }

  Future<void> _advanceSequential(int nextAyah) async {
    final previousActive = _active;
    _active = _standby;
    _standby = previousActive;

    playingAyah = nextAyah;
    notifyListeners();

    try {
      await _active.resume();
    } catch (e, st) {
      AppLogger.error('Preloaded ayah playback failed, falling back to fresh fetch', error: e, stackTrace: st);
      await _playAyahAudio(nextAyah);
      return;
    }

    _preloadNext(nextAyah + 1);
  }

  void _handleComplete(AudioPlayer source) {
    if (source != _active) return; // stray event from the preloading standby player

    if (repeatCurrent && playingAyah != null) {
      _playAyahAudio(playingAyah!);
      return;
    }

    if (playingWholeSurah && playingAyah != null) {
      final nextAyah = playingAyah! + 1;
      if (nextAyah <= _totalAyahsInSurah) {
        _advanceSequential(nextAyah);
        return;
      }
    }

    playingAyah = null;
    playingWholeSurah = false;
    notifyListeners();
  }

  Future<void> stop() async {
    try {
      await _active.stop();
    } catch (_) {
      // Already stopped/nothing loaded — fine.
    }
    try {
      await _standby.stop();
    } catch (_) {
      // Nothing preloaded — fine.
    }
    playingAyah = null;
    playingWholeSurah = false;
    notifyListeners();
  }

  void toggleRepeat() {
    repeatCurrent = !repeatCurrent;
    notifyListeners();
  }
}

/// Single app-wide instance — playback survives navigation between
/// screens because it isn't tied to any one screen's lifecycle.
final QuranAudioService quranAudio = QuranAudioService.instance;
