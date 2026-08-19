import 'package:flutter/material.dart';

import '../../l10n/generated/app_localizations.dart';

/// Genuine privacy policy text describing exactly what this codebase does
/// as of this version: local-only storage, location used solely for
/// prayer-time calculation via AlAdhan, no accounts, no ads, no analytics
/// SDKs. Keep this in sync with the actual data flows if any are added.
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  static const Map<String, List<(String, String)>> _sectionsByLocale = {
    'ar': [
      ('البيانات التي يجمعها التطبيق', 'لا ينشئ التطبيق حسابًا للمستخدم ولا يجمع اسمك أو بريدك الإلكتروني. يُستخدم موقعك الجغرافي (خطوط الطول والعرض) فقط عند فتح شاشة مواقيت الصلاة، لحساب أوقات الصلاة عبر خدمة AlAdhan الخارجية، ولا يُخزَّن هذا الموقع أو يُشارك لأي غرض آخر.'),
      ('أين تُخزَّن بياناتك', 'كل بيانات الاستخدام — المفضلة، عدادات الأذكار، إحصاءات التسبيح، آخر قراءة، إعدادات الوضع الليلي وحجم الخط — تُخزَّن محليًا على جهازك فقط باستخدام SharedPreferences، ولا تُرسَل إلى أي خادم تابع للتطبيق. حذف التطبيق أو استخدام خيار "حذف البيانات المحلية" في الإعدادات يمسحها نهائيًا.'),
      ('خدمات خارجية يتصل بها التطبيق', '• نص القرآن الكريم: يُحمَّل من مصدر Quran JSON (المبني على بيانات Tanzil).\n• الأذكار: تُحمَّل من مصدر Hisn Al-Muslim / Islamic Pro Azkar API.\n• مواقيت الصلاة: تُحسب عبر AlAdhan Prayer Times API باستخدام موقعك الحالي.\nهذه الطلبات تذهب مباشرة من جهازك إلى تلك الخدمات؛ يُرجى مراجعة سياسات الخصوصية الخاصة بها لمزيد من التفاصيل حول كيفية معالجتها للطلبات.'),
      ('الإعلانات والتحليلات', 'لا يحتوي التطبيق على إعلانات، ولا يستخدم أي أداة تحليلات أو تتبع لسلوك المستخدم في هذا الإصدار.'),
      ('أذونات الجهاز', 'يطلب التطبيق إذن الموقع فقط لعرض مواقيت صلاة دقيقة، ويمكنك رفضه أو إلغاءه في أي وقت من إعدادات النظام؛ ستظل بقية ميزات التطبيق تعمل بدونه.'),
      ('تواصل معنا', 'لأي استفسار بخصوص هذه السياسة، يرجى التواصل عبر معلومات المطوّر الموضحة في صفحة التطبيق على المتجر.'),
    ],
    'en': [
      ('Data the app collects', 'The app does not create a user account and does not collect your name or email. Your location (latitude and longitude) is used only when you open the Prayer Times screen, to calculate prayer times via the external AlAdhan service, and is never stored or shared for any other purpose.'),
      ('Where your data is stored', 'All usage data — favorites, azkar counters, tasbeeh stats, your last reading position, dark-mode and font-size settings — is stored locally on your device only, using SharedPreferences, and is never sent to any server run by the app. Deleting the app, or using "Delete local data" in Settings, erases it permanently.'),
      ('External services the app connects to', '• Quran text: loaded from the Quran JSON source (built on Tanzil data).\n• Azkar: loaded from the Hisn Al-Muslim / Islamic Pro Azkar API.\n• Prayer times: calculated via the AlAdhan Prayer Times API using your current location.\nThese requests go directly from your device to those services; please review their own privacy policies for details on how they handle requests.'),
      ('Ads and analytics', 'The app contains no ads and uses no analytics or user-tracking tools in this version.'),
      ('Device permissions', 'The app only requests location permission to show accurate prayer times, and you can deny or revoke it at any time from your system settings; the rest of the app\'s features will keep working without it.'),
      ('Contact us', 'For any question about this policy, please get in touch via the developer information shown on the app\'s store listing.'),
    ],
    'de': [
      ('Welche Daten die App sammelt', 'Die App legt kein Benutzerkonto an und erfasst weder deinen Namen noch deine E-Mail-Adresse. Dein Standort (Breiten- und Längengrad) wird nur verwendet, wenn du den Gebetszeiten-Bildschirm öffnest, um die Gebetszeiten über den externen Dienst AlAdhan zu berechnen, und wird zu keinem anderen Zweck gespeichert oder weitergegeben.'),
      ('Wo deine Daten gespeichert werden', 'Alle Nutzungsdaten — Favoriten, Adhkar-Zähler, Tasbih-Statistiken, deine letzte Leseposition, Dunkelmodus- und Schriftgrößeneinstellungen — werden ausschließlich lokal auf deinem Gerät über SharedPreferences gespeichert und niemals an einen von der App betriebenen Server gesendet. Das Löschen der App oder die Option „Lokale Daten löschen” in den Einstellungen entfernt sie dauerhaft.'),
      ('Externe Dienste, mit denen sich die App verbindet', '• Korantext: geladen aus der Quran-JSON-Quelle (basierend auf Tanzil-Daten).\n• Adhkar: geladen aus der Hisn Al-Muslim / Islamic Pro Azkar API.\n• Gebetszeiten: berechnet über die AlAdhan Prayer Times API anhand deines aktuellen Standorts.\nDiese Anfragen gehen direkt von deinem Gerät an diese Dienste; bitte lies deren eigene Datenschutzerklärungen für Details zur Verarbeitung der Anfragen.'),
      ('Werbung und Analyse', 'Die App enthält in dieser Version keine Werbung und nutzt keine Analyse- oder Nutzer-Tracking-Tools.'),
      ('Geräteberechtigungen', 'Die App fragt nur die Standortberechtigung ab, um genaue Gebetszeiten anzuzeigen; du kannst sie jederzeit in den Systemeinstellungen verweigern oder widerrufen — die übrigen Funktionen der App funktionieren weiterhin ohne sie.'),
      ('Kontakt', 'Bei Fragen zu dieser Richtlinie wende dich bitte über die Entwicklerinformationen auf der Store-Seite der App an uns.'),
    ],
    'tr': [
      ('Uygulamanın topladığı veriler', 'Uygulama bir kullanıcı hesabı oluşturmaz, adınızı veya e-posta adresinizi toplamaz. Konumunuz (enlem ve boylam) yalnızca Namaz Vakitleri ekranını açtığınızda, harici AlAdhan servisi üzerinden namaz vakitlerini hesaplamak için kullanılır ve başka hiçbir amaçla saklanmaz veya paylaşılmaz.'),
      ('Verileriniz nerede saklanır', 'Tüm kullanım verileri — favoriler, zikir sayaçları, tesbih istatistikleri, son okuma konumunuz, karanlık mod ve yazı tipi boyutu ayarları — yalnızca SharedPreferences kullanılarak cihazınızda yerel olarak saklanır ve uygulamanın çalıştırdığı hiçbir sunucuya gönderilmez. Uygulamayı silmek veya Ayarlar\'daki "Yerel verileri sil" seçeneğini kullanmak bu verileri kalıcı olarak siler.'),
      ('Uygulamanın bağlandığı harici servisler', '• Kur\'an metni: Quran JSON kaynağından yüklenir (Tanzil verilerine dayanır).\n• Zikirler: Hisn Al-Muslim / Islamic Pro Azkar API\'sinden yüklenir.\n• Namaz vakitleri: mevcut konumunuz kullanılarak AlAdhan Prayer Times API üzerinden hesaplanır.\nBu istekler cihazınızdan doğrudan bu servislere gider; istekleri nasıl işlediklerine dair ayrıntılar için lütfen kendi gizlilik politikalarını inceleyin.'),
      ('Reklamlar ve analiz', 'Uygulama bu sürümde hiçbir reklam içermez ve hiçbir analiz veya kullanıcı takip aracı kullanmaz.'),
      ('Cihaz izinleri', 'Uygulama yalnızca doğru namaz vakitlerini gösterebilmek için konum izni ister; bunu istediğiniz zaman sistem ayarlarınızdan reddedebilir veya iptal edebilirsiniz; uygulamanın diğer özellikleri bu izin olmadan da çalışmaya devam eder.'),
      ('Bize ulaşın', 'Bu politikayla ilgili herhangi bir sorunuz için lütfen uygulamanın mağaza sayfasında belirtilen geliştirici bilgileri üzerinden bizimle iletişime geçin.'),
    ],
  };

  static const Map<String, String> _lastUpdatedByLocale = {
    'ar': 'آخر تحديث: يوليو 2026',
    'en': 'Last updated: July 2026',
    'de': 'Zuletzt aktualisiert: Juli 2026',
    'tr': 'Son güncelleme: Temmuz 2026',
  };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final languageCode = Localizations.localeOf(context).languageCode;
    final sections = _sectionsByLocale[languageCode] ?? _sectionsByLocale['en']!;
    final lastUpdated = _lastUpdatedByLocale[languageCode] ?? _lastUpdatedByLocale['en']!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.privacyPolicyTitle), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            lastUpdated,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 16),
          for (final (title, body) in sections) ...[
            Text(title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17)),
            const SizedBox(height: 6),
            Text(body, style: const TextStyle(height: 1.7)),
            const SizedBox(height: 20),
          ],
        ],
      ),
    );
  }
}
