import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BackupService {
  BackupService._();

  static Future<void> exportBackup() async {
    final prefs = await SharedPreferences.getInstance();
    final allPrefs = <String, dynamic>{};
    for (final key in prefs.getKeys()) {
      allPrefs[key] = prefs.get(key);
    }

    final backupData = {
      'version': 1,
      'timestamp': DateTime.now().toIso8601String(),
      'preferences': allPrefs,
    };

    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/wirdi_backup.json');
    await file.writeAsString(jsonEncode(backupData));

    await Share.shareXFiles([XFile(file.path)], text: 'Wirdi App Backup');
  }

  static Future<bool> importBackup(String jsonString) async {
    try {
      final data = jsonDecode(jsonString) as Map<String, dynamic>;
      if (data['version'] != 1) return false;

      final prefs = await SharedPreferences.getInstance();
      final newPrefs = data['preferences'] as Map<String, dynamic>;

      for (final entry in newPrefs.entries) {
        final val = entry.value;
        if (val is String) { await prefs.setString(entry.key, val); }
        else if (val is bool) { await prefs.setBool(entry.key, val); }
        else if (val is int) { await prefs.setInt(entry.key, val); }
        else if (val is double) { await prefs.setDouble(entry.key, val); }
        else if (val is List) { await prefs.setStringList(entry.key, val.cast<String>()); }
      }
      return true;
    } catch (_) {
      return false;
    }
  }
}
