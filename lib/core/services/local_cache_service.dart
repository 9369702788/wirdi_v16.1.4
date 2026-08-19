import 'package:shared_preferences/shared_preferences.dart';

/// Thin wrapper around SharedPreferences for the offline-first caches
/// (Quran text, Azkar dataset, last-known prayer times). Centralized here
/// so every repository caches/reads data the same way and cache keys are
/// declared in one place.
class LocalCacheService {
  LocalCacheService._();

  static Future<void> setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
    await prefs.setString('${key}_cached_at', DateTime.now().toIso8601String());
  }

  static Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  static Future<DateTime?> getCachedAt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString('${key}_cached_at');
    if (raw == null) return null;
    return DateTime.tryParse(raw);
  }

  static Future<void> clearAll(List<String> keys) async {
    final prefs = await SharedPreferences.getInstance();
    for (final key in keys) {
      await prefs.remove(key);
      await prefs.remove('${key}_cached_at');
    }
  }
}
