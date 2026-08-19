
import 'dart:async';
import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/radio_station.dart';
import '../data/radio_stations.dart';

enum RadioState { stopped, loading, playing, error }

class RadioService extends ChangeNotifier {
  RadioService._();
  static final RadioService instance = RadioService._();

  AudioPlayer _player = AudioPlayer();
  RadioState _state = RadioState.stopped;
  RadioStation? _currentStation;
  String? _errorMessage;
  Timer? _sleepTimer;
  Timer? _sleepCountdown;
  int? _sleepMinutesRemaining;
  Set<String> _favoriteIds = {};
  bool _initialized = false;

  // Live stations fetched from radio-browser.info
  List<RadioStation> _liveStations = [];
  bool _loadingLive = false;

  static const _favsKey = 'radio_favorites';

  // ── Getters ───────────────────────────────────────────────────────────────
  RadioState get state             => _state;
  RadioStation? get currentStation => _currentStation;
  String? get errorMessage         => _errorMessage;
  bool get isPlaying               => _state == RadioState.playing;
  bool get isLoading               => _state == RadioState.loading;
  int? get sleepMinutesRemaining   => _sleepMinutesRemaining;
  bool get hasSleepTimer           => _sleepTimer != null;
  bool get loadingLive             => _loadingLive;
  bool isFavorite(String id)       => _favoriteIds.contains(id);

  /// All stations: live (from radio-browser.info) + curated fallback
  List<RadioStation> get allStations {
    if (_liveStations.isNotEmpty) return _liveStations;
    return kCuratedStations;
  }

  List<RadioStation> get favoriteStations =>
      allStations.where((s) => _favoriteIds.contains(s.id)).toList();

  // ── Init ──────────────────────────────────────────────────────────────────
  Future<void> init() async {
    if (_initialized) return;
    _initialized = true;
    await _loadFavorites();
    _setupPlayerListeners();
    // Fetch live stations in background — don't block UI
    _fetchLiveStations();
  }

  void _setupPlayerListeners() {
    _player.onPlayerStateChanged.listen((ps) {
      switch (ps) {
        case PlayerState.playing:
          _state = RadioState.playing;
          break;
        case PlayerState.stopped:
        case PlayerState.completed:
        case PlayerState.paused:
          if (_state != RadioState.error) _state = RadioState.stopped;
          break;
        default:
          break;
      }
      notifyListeners();
    });
  }

  // ── Fetch live stations from radio-browser.info ───────────────────────────
  Future<void> _fetchLiveStations() async {
    _loadingLive = true;
    notifyListeners();
    try {
      // radio-browser.info: free, open, community-maintained radio directory.
      // Returns url_resolved = direct playable stream URL (verified working).
      // We search for Islamic/Quran stations, sorted by votes, hiding broken ones.
      final uri = Uri.parse(
        'https://de1.api.radio-browser.info/json/stations/search'
        '?tag=quran&limit=40&hidebroken=true&order=votes&reverse=true',
      );
      final resp = await http.get(uri, headers: {
        'User-Agent': 'WirdiApp/1.50 (Islamic companion app; contact@wirdi.app)',
        'Accept': 'application/json',
      }).timeout(const Duration(seconds: 10));

      if (resp.statusCode == 200) {
        final List<dynamic> data = jsonDecode(resp.body);
        final stations = data
            .map((j) => RadioStation.fromRadioBrowser(j as Map<String, dynamic>))
            .where((s) => s.streamUrl.isNotEmpty &&
                (s.streamUrl.startsWith('http://') ||
                 s.streamUrl.startsWith('https://')))
            .toList();

        if (stations.isNotEmpty) {
          _liveStations = stations;
        }
      }
    } catch (_) {
      // Silently fall back to curated list — no error shown to user
    } finally {
      _loadingLive = false;
      notifyListeners();
    }
  }

  /// Public refresh — called when user pulls to refresh
  Future<void> refreshStations() => _fetchLiveStations();

  // ── Playback ──────────────────────────────────────────────────────────────
  Future<void> play(RadioStation station) async {
    try {
      if (_currentStation?.id == station.id && isPlaying) return;

      _state = RadioState.loading;
      _currentStation = station;
      _errorMessage = null;
      notifyListeners();

      // Dispose old player — fresh player per station is most reliable for streams
      await _player.dispose();
      _player = AudioPlayer();
      _setupPlayerListeners();

      // Configure for streaming
      await _player.setReleaseMode(ReleaseMode.stop);
      await _player.setAudioContext(AudioContext(
        android: AudioContextAndroid(
          isSpeakerphoneOn: false,
          stayAwake: true,
          contentType: AndroidContentType.music,
          usageType: AndroidUsageType.media,
          audioFocus: AndroidAudioFocus.gain,
        ),
        iOS: AudioContextIOS(
          category: AVAudioSessionCategory.playback,
          options: {
            AVAudioSessionOptions.mixWithOthers,
            AVAudioSessionOptions.allowBluetooth,
          },
        ),
      ));

      // play(UrlSource) is the correct API for live HTTP streams
      await _player.play(UrlSource(station.streamUrl));

      // Track click on radio-browser.info (good citizenship)
      if (station.stationUuid != null && station.stationUuid!.length > 10) {
        _trackClick(station.stationUuid!);
      }

    } catch (e) {
      _state = RadioState.error;
      _errorMessage = 'Could not connect. Check your internet connection.';
      notifyListeners();
    }
  }

  Future<void> stop() async {
    try { await _player.stop(); } catch (_) {}
    _state = RadioState.stopped;
    _currentStation = null;
    cancelSleepTimer();
    notifyListeners();
  }

  Future<void> togglePlay(RadioStation station) async {
    if (_currentStation?.id == station.id && isPlaying) {
      await stop();
    } else {
      await play(station);
    }
  }

  // ── Sleep Timer ───────────────────────────────────────────────────────────
  void setSleepTimer(int minutes) {
    cancelSleepTimer();
    _sleepMinutesRemaining = minutes;
    _sleepTimer = Timer(Duration(minutes: minutes), () async {
      await stop();
      _sleepMinutesRemaining = null;
      notifyListeners();
    });
    _sleepCountdown = Timer.periodic(const Duration(minutes: 1), (_) {
      if (_sleepMinutesRemaining != null && _sleepMinutesRemaining! > 0) {
        _sleepMinutesRemaining = _sleepMinutesRemaining! - 1;
        notifyListeners();
      }
    });
    notifyListeners();
  }

  void cancelSleepTimer() {
    _sleepTimer?.cancel();
    _sleepCountdown?.cancel();
    _sleepTimer = null;
    _sleepCountdown = null;
    _sleepMinutesRemaining = null;
  }

  // ── Favorites ─────────────────────────────────────────────────────────────
  Future<void> toggleFavorite(String stationId) async {
    if (_favoriteIds.contains(stationId)) {
      _favoriteIds.remove(stationId);
    } else {
      _favoriteIds.add(stationId);
    }
    await _saveFavorites();
    notifyListeners();
  }

  Future<void> _loadFavorites() async {
    final p = await SharedPreferences.getInstance();
    _favoriteIds = (p.getStringList(_favsKey) ?? []).toSet();
  }

  Future<void> _saveFavorites() async {
    final p = await SharedPreferences.getInstance();
    await p.setStringList(_favsKey, _favoriteIds.toList());
  }

  // ── radio-browser.info click tracking (good citizenship) ─────────────────
  void _trackClick(String uuid) {
    http.get(
      Uri.parse('https://de1.api.radio-browser.info/json/url/$uuid'),
      headers: {'User-Agent': 'WirdiApp/1.50'},
    ).catchError((_) {});
  }
}
