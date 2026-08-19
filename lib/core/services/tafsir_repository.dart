import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../data/app_sources.dart';
import 'app_logger.dart';
import 'local_cache_service.dart';

/// Offline-first repository for Tafsir Al-Muyassar. Keyed by
/// "surah_ayah" for O(1) lookup once loaded. Same cache-first /
/// background-refresh strategy as [QuranRepository] / [AzkarRepository].
///
/// This file is ~2.7MB, larger than Quran/Azkar — so unlike those two,
/// parsing happens in a background isolate via [compute] rather than on
/// the UI thread, and the network timeout is longer to tolerate slower
/// mobile connections.
class TafsirRepository {
  TafsirRepository._();

  static const String _cacheKey = 'cache_tafsir_json_v1';
  static Map<String, String>? _memoryCache;

  static Future<Map<String, String>> load({bool forceRefresh = false}) async {
    if (_memoryCache != null && !forceRefresh) return _memoryCache!;

    if (!forceRefresh) {
      final cached = await LocalCacheService.getString(_cacheKey);
      if (cached != null) {
        // ignore: unawaited_futures
        _refreshInBackground();
        _memoryCache = await compute(_parse, cached);
        return _memoryCache!;
      }
    }

    try {
      final raw = await _fetchRaw();
      await LocalCacheService.setString(_cacheKey, raw);
      _memoryCache = await compute(_parse, raw);
      return _memoryCache!;
    } catch (e, st) {
      final cached = await LocalCacheService.getString(_cacheKey);
      if (cached != null) {
        AppLogger.error('Tafsir fetch failed, falling back to cache', error: e, stackTrace: st);
        _memoryCache = await compute(_parse, cached);
        return _memoryCache!;
      }
      AppLogger.error('Tafsir fetch failed with no cache available', error: e, stackTrace: st);
      rethrow;
    }
  }

  static Future<void> _refreshInBackground() async {
    try {
      final raw = await _fetchRaw();
      await LocalCacheService.setString(_cacheKey, raw);
      _memoryCache = await compute(_parse, raw);
    } catch (e, st) {
      AppLogger.error('Tafsir background refresh failed, serving cached copy', error: e, stackTrace: st);
    }
  }

  static Future<String> _fetchRaw() async {
    final response = await http.get(
      Uri.parse(AppSources.tafsirJsonUrl),
      headers: {'Accept': 'application/json'},
    ).timeout(const Duration(seconds: 45));

    if (response.statusCode != 200) {
      throw Exception('Failed to load Tafsir (HTTP ${response.statusCode})');
    }
    // Explicitly decode as UTF-8 — response.body defaults to
    // Latin-1 when a server doesn't declare charset=utf-8, which
    // mangles Arabic text into unreadable symbols.
    return utf8.decode(response.bodyBytes);
  }

  // Top-level-callable (static) so it can run in a background isolate
  // via compute() — must not touch any instance/static mutable state
  // beyond its own arguments and return value.
  static Map<String, String> _parse(String raw) {
    final decoded = jsonDecode(raw) as List<dynamic>;
    final map = <String, String>{};
    for (final item in decoded) {
      final entry = item as Map<String, dynamic>;
      final surah = entry['number']?.toString();
      final ayah = entry['aya']?.toString();
      final text = entry['text']?.toString();
      if (surah != null && ayah != null && text != null) {
        map['${surah}_$ayah'] = text;
      }
    }
    return map;
  }

  static String? tafsirFor(Map<String, String> data, int surah, int ayah) =>
      data['${surah}_$ayah'];
}
