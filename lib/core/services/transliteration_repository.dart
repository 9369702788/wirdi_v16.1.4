import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../data/app_sources.dart';
import 'app_logger.dart';
import 'local_cache_service.dart';

/// Offline-first repository for English transliteration. Keyed by
/// "surah_ayah" for O(1) lookup, same pattern as [TafsirRepository].
class TransliterationRepository {
  TransliterationRepository._();

  static const String _cacheKey = 'cache_transliteration_json_v1';
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
        AppLogger.error('Transliteration fetch failed, falling back to cache', error: e, stackTrace: st);
        _memoryCache = await compute(_parse, cached);
        return _memoryCache!;
      }
      AppLogger.error('Transliteration fetch failed with no cache available', error: e, stackTrace: st);
      rethrow;
    }
  }

  static Future<void> _refreshInBackground() async {
    try {
      final raw = await _fetchRaw();
      await LocalCacheService.setString(_cacheKey, raw);
      _memoryCache = await compute(_parse, raw);
    } catch (e, st) {
      AppLogger.error('Transliteration background refresh failed, serving cached copy', error: e, stackTrace: st);
    }
  }

  static Future<String> _fetchRaw() async {
    final response = await http.get(
      Uri.parse(AppSources.transliterationJsonUrl),
      headers: {'Accept': 'application/json'},
    ).timeout(const Duration(seconds: 45));

    if (response.statusCode != 200) {
      throw Exception('Failed to load transliteration (HTTP ${response.statusCode})');
    }
    return utf8.decode(response.bodyBytes);
  }

  // Top-level-callable (static) so it can run in a background isolate
  // via compute().
  static Map<String, String> _parse(String raw) {
    final decoded = jsonDecode(raw) as List<dynamic>;
    final map = <String, String>{};
    for (final surah in decoded) {
      final surahMap = surah as Map<String, dynamic>;
      final surahId = surahMap['id']?.toString();
      final verses = surahMap['verses'] as List<dynamic>? ?? [];
      for (final verse in verses) {
        final verseMap = verse as Map<String, dynamic>;
        final ayahId = verseMap['id']?.toString();
        final transliteration = verseMap['transliteration']?.toString();
        if (surahId != null && ayahId != null && transliteration != null) {
          map['${surahId}_$ayahId'] = transliteration;
        }
      }
    }
    return map;
  }

  static String? transliterationFor(Map<String, String> data, int surah, int ayah) =>
      data['${surah}_$ayah'];
}
