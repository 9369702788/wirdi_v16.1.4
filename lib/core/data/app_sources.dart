import 'adhan_option.dart';

class AppSources {
  AppSources._();

  static const String quranJsonUrl =
      'https://cdn.jsdelivr.net/npm/quran-json@3.1.2/dist/quran.json';

  static const String azkarJsonUrl =
      'https://raw.githubusercontent.com/YousefAsalya/Islamic-Pro-azkar-API/main/data/ar.json';

  /// Tafsir Al-Muyassar (Arabic), one concise commentary entry per ayah,
  /// 6236 entries. Verified real dataset — checked structure and HTTP
  /// 200 before wiring in.
  static const String tafsirJsonUrl =
      'https://raw.githubusercontent.com/00AhmedMokhtar00/QuranTafseer-ar-json/master/tafseer.json';

  /// English transliteration, same underlying project (risan/quran-json)
  /// and Tanzil.net sourcing as the main Quran text, same surah/ayah
  /// numbering — verified structure and completeness (6236 verses)
  /// before wiring in.
  static const String transliterationJsonUrl =
      'https://raw.githubusercontent.com/risan/quran-json/main/dist/quran_transliteration.json';

  /// Real 604-page Madani Mushaf ayah-to-page mapping. Verified
  /// structure and HTTP 200 before wiring in.
  static const String mushafPagesJsonUrl =
      'https://raw.githubusercontent.com/hamzakat/madani-muhsaf-json/main/madani-muhsaf.json';

  /// QuranEnc.com (Encyclopedia of the Noble Quran / King Fahd Complex
  /// affiliated project) — per-language meaning translations, fetched
  /// per-surah. Free to use and redistribute per their terms, provided
  /// the source is credited (see Sources & Licenses) and the text isn't
  /// altered. https://quranenc.com/en/home/api
  static const String quranEncApiBase = 'https://quranenc.com/api/v1/translation';

  /// Maps this app's UI language to a specific QuranEnc.com translation
  /// edition. Arabic has no entry: for the 'ar' locale the app shows the
  /// Quran's own Arabic text directly, there's no separate "translation"
  /// to fetch. Picking a specific edition per language (rather than just
  /// "the English one") matters because QuranEnc hosts several editions
  /// per language from different translators — these are the widely-used
  /// default editions for each.
  static const Map<String, String> quranEncTranslationKeyByLocale = {
    'en': 'english_saheeh', // Saheeh International
    'de': 'german_bubenheim', // Frank Bubenheim & Nadeem Elyas
    'tr': 'turkish_shahin', // Dr. Ali Özek and others (Diyanet-affiliated team)
  };

  static String? quranEncTranslationKeyFor(String languageCode) =>
      quranEncTranslationKeyByLocale[languageCode];

  /// fawazahmed0/hadith-api — free, no API key, served via the jsDelivr
  /// GitHub CDN (same trust model as [quranJsonUrl], which already uses
  /// a jsDelivr-hosted GitHub project). Verified structure and content
  /// before wiring in: https://github.com/fawazahmed0/hadith-api
  static const String hadithApiBase = 'https://cdn.jsdelivr.net/gh/fawazahmed0/hadith-api@1/editions';

  /// Collection slugs available from the API that this app exposes.
  /// Starting with the 40 (really 42) Hadith of an-Nawawi: a compact,
  /// foundational, universally-taught collection — the natural starting
  /// point before adding the much larger Bukhari/Muslim collections in
  /// a future update.
  static const String hadithCollectionNawawi = 'nawawi';

  /// Verified real edition names for the Nawawi collection (see
  /// hadithApiBase/../editions.json). Arabic is always shown as the
  /// source text (same principle as Quran/azkar text elsewhere in this
  /// app); translation editions are layered on top per UI language.
  /// No German edition exists in this dataset for any collection, so
  /// German falls back to English — same fallback pattern already used
  /// by [DailyQuote.translationFor].
  static const String hadithArabicEdition = 'ara-nawawi';
  static const Map<String, String> hadithTranslationEditionByLocale = {
    'ar': 'ara-nawawi',
    'en': 'eng-nawawi',
    'tr': 'tur-nawawi',
  };

  static String hadithTranslationEditionFor(String languageCode) =>
      hadithTranslationEditionByLocale[languageCode] ?? hadithTranslationEditionByLocale['en']!;

  /// Adhan audio recordings, officially hosted by AlAdhan (the same
  /// provider already used for prayer times), listed at
  /// https://aladhan.com/download-adhans
  static const List<AdhanOption> adhanOptions = [
    AdhanOption('a9', 'مشاري راشد العفاسي', 'Mishari Rashid Alafasy', 'https://cdn.aladhan.com/audio/adhans/a9.mp3'),
    AdhanOption('a4', 'أذان دبي (مشاري العفاسي)', 'Dubai Adhan (Mishari Alafasy)', 'https://cdn.aladhan.com/audio/adhans/a4.mp3'),
    AdhanOption('a7', 'مشاري راشد العفاسي (نسخة أخرى)', 'Mishari Rashid Alafasy (alternate)', 'https://cdn.aladhan.com/audio/adhans/a7.mp3'),
    AdhanOption('a1', 'أحمد النفيس', 'Ahmad Al-Nafees', 'https://cdn.aladhan.com/audio/adhans/a1.mp3'),
    AdhanOption('a11', 'منصور الزهراني', 'Mansour Al-Zahrani', 'https://cdn.aladhan.com/audio/adhans/a11-mansour-al-zahrani.mp3'),
    AdhanOption('a2', 'حافظ مصطفى أوزجان (تركيا)', 'Hafız Mustafa Özcan (Turkey)', 'https://cdn.aladhan.com/audio/adhans/a2.mp3'),
  ];

  static String prayerTimesUrl({
    required double latitude,
    required double longitude,
    DateTime? date,
  }) {
    final datePath = date == null ? '' : '/${_ddmmyyyy(date)}';
    return 'https://api.aladhan.com/v1/timings$datePath?latitude=$latitude&longitude=$longitude&method=5';
  }

  /// Documented AlAdhan endpoint that geocodes the address server-side,
  /// so no separate geocoding call is needed for manual city entry.
  static String prayerTimesByAddressUrl(String address, {DateTime? date}) {
    final encoded = Uri.encodeComponent(address);
    final datePath = date == null ? '' : '/${_ddmmyyyy(date)}';
    return 'https://api.aladhan.com/v1/timingsByAddress$datePath?address=$encoded&method=5';
  }

  static String _ddmmyyyy(DateTime date) {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(date.day)}-${two(date.month)}-${date.year}';
  }

  // Recitation. Verified reciter identifiers from the islamic.network CDN
  // docs (https://alquran.cloud/cdn). Default kept as Alafasy for
  // backward compatibility with existing cached audio behavior.
  static const String _audioBitrate = '128';

  static String surahAudioUrl(int surahNumber, {String reciter = 'ar.alafasy', String bitrate = '128'}) =>
      'https://cdn.islamic.network/quran/audio-surah/$bitrate/$reciter/$surahNumber.mp3';

  /// [globalAyahNumber] is the ayah's position across the whole Quran
  /// (1-6236), not its position within its surah.
  static String ayahAudioUrl(int globalAyahNumber, {String reciter = 'ar.alafasy'}) =>
      'https://cdn.islamic.network/quran/audio/$_audioBitrate/$reciter/$globalAyahNumber.mp3';

  static String sourcesAndLicensesFor(String languageCode) =>
      _sourcesAndLicensesByLocale[languageCode] ?? _sourcesAndLicensesByLocale['en']!;

  /// Kept for call sites not yet migrated to [sourcesAndLicensesFor];
  /// prefer the localized version in new code.
  static String get sourcesAndLicenses => _sourcesAndLicensesByLocale['ar']!;

  static const Map<String, String> _sourcesAndLicensesByLocale = {
    'ar': '''
المصادر والتراخيص

نص القرآن الكريم:
Quran JSON
https://github.com/risan/quran-json

مصدر نص القرآن:
Tanzil Project
https://tanzil.net

الأذكار:
Hisn Al-Muslim / Islamic Pro Azkar API
https://github.com/YousefAsalya/Islamic-Pro-azkar-API

مواقيت الصلاة:
AlAdhan Prayer Times API
https://aladhan.com/prayer-times-api

تلاوة القرآن الكريم:
عدة قراء (راجع قائمة القراء داخل شاشة القراءة)
عبر شبكة Islamic Network CDN
https://alquran.cloud/cdn

ترجمات معاني القرآن الكريم:
عدة لغات (الإنجليزية، الألمانية، التركية)
عبر Encyclopedia of the Noble Quran
https://quranenc.com

الأحاديث النبوية (الأربعون النووية):
مصدر بيانات JSON مفتوح على GitHub (بالعربية والإنجليزية والتركية)
https://github.com/fawazahmed0/hadith-api

التفسير الميسر:
مصدر بيانات JSON مفتوح على GitHub
https://github.com/00AhmedMokhtar00/QuranTafseer-ar-json

ترقيم صفحات المصحف (604 صفحة):
مصدر بيانات JSON مفتوح على GitHub
https://github.com/hamzakat/madani-muhsaf-json

أصوات الأذان:
AlAdhan (Islamic Network)
https://aladhan.com/download-adhans

خط عرض القرآن الكريم:
Amiri Quran — Khaled Hosny / The Amiri Project
مرخص بموجب SIL Open Font License 1.1
https://github.com/aliftype/amiri

بيانات المساجد والمطاعم الحلال القريبة:
© مساهمو OpenStreetMap، عبر Overpass API
مرخصة بموجب Open Database License (ODbL)
https://www.openstreetmap.org/copyright

ملاحظات مهمة:
- يجب عدم تعديل نص القرآن الكريم.
- يجب ذكر مصدر Tanzil داخل صفحة المصادر والتراخيص.
- مواقيت الصلاة قد تختلف عن توقيت المسجد المحلي إذا كانت هناك تعديلات محلية.
''',
    'en': '''
Sources & Licenses

Quran text:
Quran JSON
https://github.com/risan/quran-json

Quran text source:
Tanzil Project
https://tanzil.net

Azkar (remembrances):
Hisn Al-Muslim / Islamic Pro Azkar API
https://github.com/YousefAsalya/Islamic-Pro-azkar-API

Prayer times:
AlAdhan Prayer Times API
https://aladhan.com/prayer-times-api

Quran recitation:
Multiple reciters (see the reciter list inside the reading screen)
Served via the Islamic Network CDN
https://alquran.cloud/cdn

Quran meaning translations:
Multiple languages (English, German, Turkish)
Via the Encyclopedia of the Noble Quran
https://quranenc.com

Hadith collection (Forty Hadith of an-Nawawi):
Open JSON dataset on GitHub (Arabic, English, and Turkish)
https://github.com/fawazahmed0/hadith-api

Simplified Tafsir (Al-Muyassar):
Open JSON dataset on GitHub
https://github.com/00AhmedMokhtar00/QuranTafseer-ar-json

Mushaf page numbering (604 pages):
Open JSON dataset on GitHub
https://github.com/hamzakat/madani-muhsaf-json

Adhan audio:
AlAdhan (Islamic Network)
https://aladhan.com/download-adhans

Quran display font:
Amiri Quran — Khaled Hosny / The Amiri Project
Licensed under the SIL Open Font License 1.1
https://github.com/aliftype/amiri

Nearby mosque & halal restaurant data:
© OpenStreetMap contributors, via the Overpass API
Licensed under the Open Database License (ODbL)
https://www.openstreetmap.org/copyright

Important notes:
- The Quran text must not be modified.
- The Tanzil source must be credited on the Sources & Licenses page.
- Prayer times may differ from your local mosque's schedule where local adjustments apply.
''',
    'de': '''
Quellen & Lizenzen

Korantext:
Quran JSON
https://github.com/risan/quran-json

Quelle des Korantextes:
Tanzil Project
https://tanzil.net

Adhkar (Gedenkformeln):
Hisn Al-Muslim / Islamic Pro Azkar API
https://github.com/YousefAsalya/Islamic-Pro-azkar-API

Gebetszeiten:
AlAdhan Prayer Times API
https://aladhan.com/prayer-times-api

Koran-Rezitation:
Mehrere Rezitatoren (siehe Rezitatorenliste im Leseansicht)
Bereitgestellt über das Islamic Network CDN
https://alquran.cloud/cdn

Koran-Bedeutungsübersetzungen:
Mehrere Sprachen (Englisch, Deutsch, Türkisch)
Über die Encyclopedia of the Noble Quran
https://quranenc.com

Hadith-Sammlung (Vierzig Hadithe von an-Nawawi):
Offener JSON-Datensatz auf GitHub (Arabisch, Englisch und Türkisch)
https://github.com/fawazahmed0/hadith-api

Vereinfachter Tafsir (Al-Muyassar):
Offener JSON-Datensatz auf GitHub
https://github.com/00AhmedMokhtar00/QuranTafseer-ar-json

Mushaf-Seitennummerierung (604 Seiten):
Offener JSON-Datensatz auf GitHub
https://github.com/hamzakat/madani-muhsaf-json

Adhan-Audio:
AlAdhan (Islamic Network)
https://aladhan.com/download-adhans

Koran-Anzeigeschrift:
Amiri Quran — Khaled Hosny / The Amiri Project
Lizenziert unter der SIL Open Font License 1.1
https://github.com/aliftype/amiri

Daten zu Moscheen & Halal-Restaurants in der Nähe:
© OpenStreetMap-Mitwirkende, über die Overpass API
Lizenziert unter der Open Database License (ODbL)
https://www.openstreetmap.org/copyright

Wichtige Hinweise:
- Der Korantext darf nicht verändert werden.
- Die Quelle Tanzil muss auf der Seite „Quellen & Lizenzen" genannt werden.
- Gebetszeiten können bei lokalen Anpassungen von der Moscheenzeit vor Ort abweichen.
''',
    'tr': '''
Kaynaklar ve Lisanslar

Kur'an metni:
Quran JSON
https://github.com/risan/quran-json

Kur'an metni kaynağı:
Tanzil Project
https://tanzil.net

Zikirler:
Hisn Al-Muslim / Islamic Pro Azkar API
https://github.com/YousefAsalya/Islamic-Pro-azkar-API

Namaz vakitleri:
AlAdhan Prayer Times API
https://aladhan.com/prayer-times-api

Kur'an tilaveti:
Birden fazla kâri (kâri listesi okuma ekranında)
Islamic Network CDN üzerinden sunulur
https://alquran.cloud/cdn

Kur'an meal çevirileri:
Birden fazla dil (İngilizce, Almanca, Türkçe)
Encyclopedia of the Noble Quran üzerinden
https://quranenc.com

Hadis derlemesi (Kırk Hadis - Nevevî):
GitHub üzerinde açık JSON veri seti (Arapça, İngilizce ve Türkçe)
https://github.com/fawazahmed0/hadith-api

Muyesser Tefsir:
GitHub üzerinde açık JSON veri seti
https://github.com/00AhmedMokhtar00/QuranTafseer-ar-json

Mushaf sayfa numaralandırması (604 sayfa):
GitHub üzerinde açık JSON veri seti
https://github.com/hamzakat/madani-muhsaf-json

Ezan sesleri:
AlAdhan (Islamic Network)
https://aladhan.com/download-adhans

Kur'an gösterim yazı tipi:
Amiri Quran — Khaled Hosny / The Amiri Project
SIL Open Font License 1.1 ile lisanslanmıştır
https://github.com/aliftype/amiri

Yakındaki cami ve helal restoran verileri:
© OpenStreetMap katkıda bulunanları, Overpass API aracılığıyla
Open Database License (ODbL) ile lisanslanmıştır
https://www.openstreetmap.org/copyright

Önemli notlar:
- Kur'an metni değiştirilemez.
- Tanzil kaynağı, Kaynaklar ve Lisanslar sayfasında belirtilmelidir.
- Namaz vakitleri, yerel düzenlemeler olduğunda yerel cami vaktinden farklı olabilir.
''',
  };
}
