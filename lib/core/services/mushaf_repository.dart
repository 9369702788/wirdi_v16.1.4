import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../data/app_sources.dart';
import '../models/mushaf_models.dart';
import 'app_logger.dart';
import 'local_cache_service.dart';

/// Offline-first repository for the real 604-page Madani Mushaf
/// ayah-to-page mapping, used to render a genuine page-by-page reading
/// view (as opposed to the continuous per-surah list view).
class MushafRepository {
  MushafRepository._();

  static const String _cacheKey = 'cache_mushaf_pages_json_v1';
  static List<MushafPage>? _memoryCache;

  static Future<List<MushafPage>> load({bool forceRefresh = false}) async {
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
        AppLogger.error('Mushaf pages fetch failed, falling back to cache', error: e, stackTrace: st);
        _memoryCache = await compute(_parse, cached);
        return _memoryCache!;
      }
      AppLogger.error('Mushaf pages fetch failed with no cache available', error: e, stackTrace: st);
      rethrow;
    }
  }

  static Future<void> _refreshInBackground() async {
    try {
      final raw = await _fetchRaw();
      await LocalCacheService.setString(_cacheKey, raw);
      _memoryCache = await compute(_parse, raw);
    } catch (e, st) {
      AppLogger.error('Mushaf pages background refresh failed, serving cached copy', error: e, stackTrace: st);
    }
  }

  static Future<String> _fetchRaw() async {
    final response = await http.get(
      Uri.parse(AppSources.mushafPagesJsonUrl),
      headers: {'Accept': 'application/json'},
    ).timeout(const Duration(seconds: 45));

    if (response.statusCode != 200) {
      throw Exception('Failed to load Mushaf pages (HTTP ${response.statusCode})');
    }
    // Explicitly decode as UTF-8 — response.body defaults to
    // Latin-1 when a server doesn't declare charset=utf-8, which
    // mangles Arabic text into unreadable symbols.
    return utf8.decode(response.bodyBytes);
  }

  /// The source file is a 605-length array; index 0 is empty/unused and
  /// indices 1-604 hold each page, keyed by chapter number, e.g.:
  /// `{"2": {"chapterNumber": "2", "text": [{"verseNumber": "1", "text": "..."}]}, "juzNumber": "1"}`
  static List<MushafPage> _parse(String raw) {
    final decoded = jsonDecode(raw) as List<dynamic>;
    final pages = <MushafPage>[];

    for (var pageNumber = 1; pageNumber < decoded.length; pageNumber++) {
      final pageData = decoded[pageNumber];
      if (pageData is! Map<String, dynamic>) continue;

      final ayahs = <MushafAyahRef>[];
      int juzNumber = 0;

      for (final entry in pageData.entries) {
        if (entry.key == 'juzNumber') {
          juzNumber = int.tryParse(entry.value.toString()) ?? 0;
          continue;
        }
        final chapterData = entry.value;
        if (chapterData is! Map<String, dynamic>) continue;

        final surahNumber = int.tryParse(entry.key) ?? 0;
        final versesRaw = chapterData['text'] as List<dynamic>? ?? [];

        for (final verse in versesRaw) {
          final verseMap = verse as Map<String, dynamic>;
          final ayahNumber = int.tryParse(verseMap['verseNumber']?.toString() ?? '') ?? 0;
          final text = verseMap['text']?.toString() ?? '';
          if (ayahNumber > 0 && text.isNotEmpty) {
            ayahs.add(MushafAyahRef(surahNumber: surahNumber, ayahNumber: ayahNumber, text: text));
          }
        }
      }

      pages.add(MushafPage(pageNumber: pageNumber, juzNumber: juzNumber, ayahs: ayahs));
    }

    return pages;
  }

  /// The first mushaf page containing the given surah — used to deep-link
  /// from the Surah reader into the Mushaf page view at the right spot.
  static int? firstPageForSurah(List<MushafPage> pages, int surahNumber) {
    for (final page in pages) {
      if (page.ayahs.any((a) => a.surahNumber == surahNumber)) {
        return page.pageNumber;
      }
    }
    return null;
  }
}
