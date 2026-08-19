import 'dart:developer' as developer;

/// Minimal logging wrapper around dart:developer's log() — zero new
/// dependencies, visible in `flutter run`/adb logcat/DevTools. Used in
/// repository/service catch blocks so offline-fallback paths leave a
/// real trace instead of silently swallowing the underlying error.
class AppLogger {
  AppLogger._();

  static void error(String message, {String name = 'Wirdi', Object? error, StackTrace? stackTrace}) {
    developer.log(message, name: name, error: error, stackTrace: stackTrace, level: 1000);
  }

  static void info(String message, {String name = 'Wirdi'}) {
    developer.log(message, name: name, level: 800);
  }
}
