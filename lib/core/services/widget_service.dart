import 'package:home_widget/home_widget.dart';
import '../models/hadith_models.dart';

class WidgetService {
  WidgetService._();

  static const String _androidWidgetName = 'WirdiWidgetProvider';
  static const String _iosWidgetName = 'WirdiWidget';

  static Future<void> updateHadith(HadithModel hadith) async {
    try {
      await HomeWidget.saveWidgetData<String>('hadith_text', hadith.translatedText);
      await HomeWidget.saveWidgetData<String>('hadith_arabic', hadith.arabicText);
      await _update();
    } catch (_) {}
  }

  static Future<void> updatePrayerTimes(dynamic timings, String nextPrayerName, String nextPrayerTime) async {
    try {
      await HomeWidget.saveWidgetData<String>('next_prayer_name', nextPrayerName);
      await HomeWidget.saveWidgetData<String>('next_prayer_time', nextPrayerTime);
      await HomeWidget.saveWidgetData<String>('fajr', timings.fajr);
      await HomeWidget.saveWidgetData<String>('dhuhr', timings.dhuhr);
      await HomeWidget.saveWidgetData<String>('asr', timings.asr);
      await HomeWidget.saveWidgetData<String>('maghrib', timings.maghrib);
      await HomeWidget.saveWidgetData<String>('isha', timings.isha);
      await _update();
    } catch (_) {}
  }

  static Future<void> _update() async {
    await HomeWidget.updateWidget(
      androidName: _androidWidgetName,
      iOSName: _iosWidgetName,
    );
  }
}
