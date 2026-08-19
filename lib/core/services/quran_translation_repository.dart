import 'dart:convert';

import 'package:http/http.dart' as http;

import '../data/app_sources.dart';
import 'app_logger.dart';
import 'local_cache_service.dart';

/// Offline-first repository for verse-by-verse meaning translations,
/// sourced from QuranEnc.com (see [AppSources.quranEncApiBase]).
///
/// Unlike [QuranRepository] (which loads the whole Arabic mus'haf in one
/// request), QuranEnc's API is per-surah, and there's a different edition
/// per language — so this fetches and caches **one surah's translation,
/// in one language, at a time**, lazily as the reader opens that surah.
/// That keeps the common case (someone reading a few surahs) cheap,
/// instead of pulling down 114 surahs x N languages up front.
///
/// Same cache-first / background-refresh strategy as the other
/// repositories: a cached surah is served instantly and refreshed
/// silently in the background; a cold fetch with no cache surfaces
/// errors so the UI can show a real error/retry state.
class QuranTranslationRepository {
  QuranTranslationRepository._();

  static String _cacheKey(String translationKey, int surahNumber) =>
      'cache_quranenc_${translationKey}_surah_$surahNumber';

  /// In-memory, keyed the same way as the cache key, so re-opening a
  /// surah already viewed this session is instant with no I/O at all.
  static final Map<String, Map<int, String>> _memoryCache = {};

  /// Returns a map of ayah number -> translated text for the given
  /// surah, in the QuranEnc edition identified by [translationKey]
  /// (see [AppSources.quranEncTranslationKeyByLocale]). Returns null if
  /// [translationKey] is null (i.e. the caller's language has no
  /// QuranEnc edition configured, e.g. Arabic, which doesn't need one).
  static Future<Map<int, String>?> loadSurah({
    required String? translationKey,
    required int surahNumber,
    bool forceRefresh = false,
  }) async {
    if (translationKey == null) return null;

    final cacheKey = _cacheKey(translationKey, surahNumber);
    final memoKey = cacheKey;

    if (!forceRefresh && _memoryCache.containsKey(memoKey)) {
      return _memoryCache[memoKey];
    }

    if (!forceRefresh) {
      final cached = await LocalCacheService.getString(cacheKey);
      if (cached != null) {
        final parsed = _parse(cached);
        _memoryCache[memoKey] = parsed;
        // ignore: unawaited_futures
        _refreshInBackground(translationKey, surahNumber, cacheKey, memoKey);
        return parsed;
      }
    }

    try {
      final raw = await _fetchRaw(translationKey, surahNumber);
      await LocalCacheService.setString(cacheKey, raw);
      final parsed = _parse(raw);
      _memoryCache[memoKey] = parsed;
      return parsed;
    } catch (e, st) {
      final cached = await LocalCacheService.getString(cacheKey);
      if (cached != null) {
        AppLogger.error(
          'QuranEnc fetch failed for $translationKey/$surahNumber, falling back to cache',
          error: e,
          stackTrace: st,
        );
        final parsed = _parse(cached);
        _memoryCache[memoKey] = parsed;
        return parsed;
      }
      AppLogger.error(
        'QuranEnc fetch failed for $translationKey/$surahNumber with no cache available',
        error: e,
        stackTrace: st,
      );
      rethrow;
    }
  }

  static Future<void> _refreshInBackground(
    String translationKey,
    int surahNumber,
    String cacheKey,
    String memoKey,
  ) async {
    try {
      final raw = await _fetchRaw(translationKey, surahNumber);
      await LocalCacheService.setString(cacheKey, raw);
      _memoryCache[memoKey] = _parse(raw);
    } catch (e, st) {
      AppLogger.error(
        'QuranEnc background refresh failed for $translationKey/$surahNumber, serving cached copy',
        error: e,
        stackTrace: st,
      );
    }
  }

  static Future<String> _fetchRaw(String translationKey, int surahNumber) async {
    final uri = Uri.parse('${AppSources.quranEncApiBase}/sura/$translationKey/$surahNumber');
    final response = await http
        .get(uri, headers: {'Accept': 'application/json'})
        .timeout(const Duration(seconds: 20));

    if (response.statusCode != 200) {
      throw Exception('Failed to load QuranEnc translation (HTTP ${response.statusCode})');
    }

    // Explicitly decode as UTF-8 — response.body defaults to Latin-1
    // when a server doesn't declare charset=utf-8, which mangles
    // non-ASCII text (Turkish, German diacritics) into garbage.
    return utf8.decode(response.bodyBytes);
  }

  /// QuranEnc's sura endpoint returns either `{"result": [...]}` or a
  /// bare `[...]` depending on edition/endpoint version — handle both
  /// defensively rather than assuming one shape.
  static Map<int, String> _parse(String raw) {
    final decoded = jsonDecode(raw);
    final List<dynamic> items;
    if (decoded is Map<String, dynamic> && decoded['result'] is List) {
      items = decoded['result'] as List<dynamic>;
    } else if (decoded is List) {
      items = decoded;
    } else {
      throw Exception('Unexpected QuranEnc JSON format');
    }

    final map = <int, String>{};
    for (final item in items) {
      final entry = item as Map<String, dynamic>;
      final ayah = entry['aya'];
      final translation = entry['translation']?.toString();
      final ayahNumber = ayah is int ? ayah : int.tryParse(ayah?.toString() ?? '');
      if (ayahNumber != null && translation != null) {
        map[ayahNumber] = translation;
      }
    }
    return map;
  }

  static String? translationFor(Map<int, String>? data, int ayahNumber) => data?[ayahNumber];
}
