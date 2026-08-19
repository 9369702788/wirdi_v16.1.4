import 'dart:convert';

import 'package:http/http.dart' as http;

import '../data/app_sources.dart';
import '../models/azkar_models.dart';
import 'app_logger.dart';
import 'local_cache_service.dart';

/// Offline-first repository for the full Hisn Al Muslim azkar collection.
/// Same cache-first / background-refresh strategy as [QuranRepository].
class AzkarRepository {
  AzkarRepository._();

  static const String _cacheKey = 'cache_azkar_json_v1';

  static Future<List<AzkarCategoryModel>> load({bool forceRefresh = false}) async {
    if (!forceRefresh) {
      final cached = await LocalCacheService.getString(_cacheKey);
      if (cached != null) {
        // ignore: unawaited_futures
        _refreshInBackground();
        return _parse(cached);
      }
    }

    try {
      final raw = await _fetchRaw();
      await LocalCacheService.setString(_cacheKey, raw);
      return _parse(raw);
    } catch (e, st) {
      final cached = await LocalCacheService.getString(_cacheKey);
      if (cached != null) {
        AppLogger.error('Azkar fetch failed, falling back to cache', error: e, stackTrace: st);
        return _parse(cached);
      }
      AppLogger.error('Azkar fetch failed with no cache available', error: e, stackTrace: st);
      rethrow;
    }
  }

  static Future<void> _refreshInBackground() async {
    try {
      final raw = await _fetchRaw();
      await LocalCacheService.setString(_cacheKey, raw);
    } catch (e, st) {
      AppLogger.error('Azkar background refresh failed, serving cached copy', error: e, stackTrace: st);
    }
  }

  static Future<String> _fetchRaw() async {
    final response = await http
        .get(Uri.parse(AppSources.azkarJsonUrl))
        .timeout(const Duration(seconds: 20));

    if (response.statusCode != 200) {
      throw Exception('Failed to load Azkar (HTTP ${response.statusCode})');
    }

    // Explicitly decode as UTF-8 — response.body defaults to
    // Latin-1 when a server doesn't declare charset=utf-8, which
    // mangles Arabic text into unreadable symbols.
    return utf8.decode(response.bodyBytes);
  }

  static Future<DateTime?> cachedAt() => LocalCacheService.getCachedAt(_cacheKey);

  static List<AzkarCategoryModel> _parse(String raw) {
    final decoded = jsonDecode(raw);

    if (decoded is! List) {
      throw Exception('Unexpected Azkar JSON format');
    }

    return decoded.map<AzkarCategoryModel>((item) {
      final map = item as Map<String, dynamic>;
      final categoryId = _readInt(map, ['id']);
      final arrayRaw = (map['array'] as List<dynamic>? ?? []);

      final items = arrayRaw.map<AzkarItemModel>((entry) {
        final entryMap = entry as Map<String, dynamic>;
        final itemId = _readInt(entryMap, ['id']);

        return AzkarItemModel(
          uid: '${categoryId}_$itemId',
          id: itemId,
          text: _readString(entryMap, ['text']),
          targetCount: _readInt(entryMap, ['count']) == 0
              ? 1
              : _readInt(entryMap, ['count']),
        );
      }).where((item) => item.text.trim().isNotEmpty).toList();

      return AzkarCategoryModel(
        id: categoryId,
        category: _readString(map, ['category']),
        items: items,
      );
    }).where((cat) => cat.items.isNotEmpty).toList();
  }

  static int _readInt(Map<String, dynamic> map, List<String> keys) {
    for (final key in keys) {
      final value = map[key];
      if (value is int) return value;
      if (value is String) return int.tryParse(value) ?? 0;
    }
    return 0;
  }

  static String _readString(Map<String, dynamic> map, List<String> keys) {
    for (final key in keys) {
      final value = map[key];
      if (value != null) return value.toString();
    }
    return '';
  }
}
