import 'dart:convert';

import 'package:http/http.dart' as http;

import '../data/app_sources.dart';
import '../models/hadith_models.dart';
import 'app_logger.dart';
import 'local_cache_service.dart';

/// Offline-first repository for the Forty (42) Hadith of an-Nawawi,
/// sourced from the fawazahmed0/hadith-api dataset (see
/// [AppSources.hadithApiBase]). Same cache-first / background-refresh
/// strategy as [QuranRepository] / [AzkarRepository], but fetches two
/// editions (Arabic source + a translation) and merges them by hadith
/// number, since this dataset splits each language into its own file.
class HadithRepository {
  HadithRepository._();

  static String _cacheKey(String edition) => 'cache_hadith_${edition}_v1';

  static Future<List<HadithModel>> load({
    required String languageCode,
    bool forceRefresh = false,
  }) async {
    final translationEdition = AppSources.hadithTranslationEditionFor(languageCode);

    final arabicRaw = await _loadEdition(AppSources.hadithArabicEdition, forceRefresh: forceRefresh);
    final translationRaw = await _loadEdition(translationEdition, forceRefresh: forceRefresh);

    return _merge(arabicRaw, translationRaw);
  }

  static Future<String> _loadEdition(String edition, {required bool forceRefresh}) async {
    final cacheKey = _cacheKey(edition);

    if (!forceRefresh) {
      final cached = await LocalCacheService.getString(cacheKey);
      if (cached != null) {
        // ignore: unawaited_futures
        _refreshInBackground(edition);
        return cached;
      }
    }

    try {
      final raw = await _fetchRaw(edition);
      await LocalCacheService.setString(cacheKey, raw);
      return raw;
    } catch (e, st) {
      final cached = await LocalCacheService.getString(cacheKey);
      if (cached != null) {
        AppLogger.error('Hadith fetch failed for $edition, falling back to cache', error: e, stackTrace: st);
        return cached;
      }
      AppLogger.error('Hadith fetch failed for $edition with no cache available', error: e, stackTrace: st);
      rethrow;
    }
  }

  static Future<void> _refreshInBackground(String edition) async {
    try {
      final raw = await _fetchRaw(edition);
      await LocalCacheService.setString(_cacheKey(edition), raw);
    } catch (e, st) {
      AppLogger.error('Hadith background refresh failed for $edition, serving cached copy', error: e, stackTrace: st);
    }
  }

  static Future<String> _fetchRaw(String edition) async {
    final uri = Uri.parse('${AppSources.hadithApiBase}/$edition.min.json');
    final response = await http.get(uri, headers: {'Accept': 'application/json'}).timeout(const Duration(seconds: 20));

    if (response.statusCode != 200) {
      throw Exception('Failed to load hadith edition $edition (HTTP ${response.statusCode})');
    }

    // Explicitly decode as UTF-8 — response.body defaults to Latin-1
    // when a server doesn't declare charset=utf-8, which mangles Arabic
    // and other non-ASCII text into garbage.
    return utf8.decode(response.bodyBytes);
  }

  static Future<DateTime?> cachedAt(String languageCode) =>
      LocalCacheService.getCachedAt(_cacheKey(AppSources.hadithTranslationEditionFor(languageCode)));

  static List<HadithModel> _merge(String arabicRaw, String translationRaw) {
    final arabicByNumber = _parseEdition(arabicRaw);
    final translationByNumber = _parseEdition(translationRaw);

    final numbers = arabicByNumber.keys.toSet()..addAll(translationByNumber.keys);
    final sorted = numbers.toList()..sort();

    return sorted
        .map((n) => HadithModel(
              number: n,
              arabicText: arabicByNumber[n] ?? '',
              translatedText: translationByNumber[n] ?? arabicByNumber[n] ?? '',
            ))
        .where((h) => h.arabicText.isNotEmpty || h.translatedText.isNotEmpty)
        .toList();
  }

  static Map<int, String> _parseEdition(String raw) {
    final decoded = jsonDecode(raw);
    if (decoded is! Map<String, dynamic> || decoded['hadiths'] is! List) {
      throw Exception('Unexpected hadith JSON format');
    }

    final map = <int, String>{};
    for (final item in decoded['hadiths'] as List) {
      final entry = item as Map<String, dynamic>;
      final number = entry['hadithnumber'];
      final text = entry['text']?.toString();
      final n = number is int ? number : int.tryParse(number?.toString() ?? '');
      if (n != null && text != null && text.trim().isNotEmpty) {
        map[n] = text;
      }
    }
    return map;
  }

  static Future<HadithModel> forToday(String languageCode) async {
    final all = await load(languageCode: languageCode);
    final now = DateTime.now();
    final dayOfYear = now.difference(DateTime(now.year, 1, 1)).inDays;
    return all[dayOfYear % all.length];
  }
}
