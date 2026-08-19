/// Curated rotation of short, well-known Quranic verses and prophetic
/// sayings for the Home Dashboard's "quote of the day". Rotates
/// deterministically by day-of-year, so it's stable for a given date and
/// requires no network call. This is authored reference content (public
/// domain Islamic text), not placeholder/lorem-ipsum data.
///
/// The Arabic verse text is never translated (it's the source text,
/// same as anywhere else in the app the Quran/hadith wording appears)
/// -- [DailyQuote.translationFor] gives an approximate rendering in the
/// active UI language to show alongside it.
class DailyQuote {
  final String arabic;
  final Map<String, String> _translationByLocale;
  const DailyQuote(this.arabic, this._translationByLocale);

  String translationFor(String languageCode) =>
      _translationByLocale[languageCode] ?? _translationByLocale['en'] ?? arabic;

  /// What to actually show in the UI for a given locale: the Arabic source
  /// text itself for the 'ar' locale, otherwise the translation.
  String displayFor(String languageCode) =>
      languageCode == 'ar' ? arabic : translationFor(languageCode);
}

class DailyQuotes {
  DailyQuotes._();

  static const List<DailyQuote> _quotes = [
    DailyQuote('وَمَن يَتَّقِ اللَّهَ يَجْعَل لَّهُ مَخْرَجًا', {'en': 'Whoever is mindful of Allah, He will make a way out for them.', 'de': 'Wer Allah fürchtet, dem schafft Er einen Ausweg.', 'tr': 'Kim Allah\'a karşı gelmekten sakınırsa, Allah ona bir çıkış yolu sağlar.'}),
    DailyQuote('إِنَّ مَعَ الْعُسْرِ يُسْرًا', {'en': 'Indeed, with hardship comes ease.', 'de': 'Wahrlich, mit der Schwierigkeit kommt Erleichterung.', 'tr': 'Şüphesiz güçlükle beraber bir kolaylık vardır.'}),
    DailyQuote('وَبَشِّرِ الصَّابِرِينَ', {'en': 'And give good tidings to the patient.', 'de': 'Und verkünde den Geduldigen frohe Botschaft.', 'tr': 'Sabredenleri müjdele.'}),
    DailyQuote('فَاذْكُرُونِي أَذْكُرْكُمْ', {'en': 'So remember Me; I will remember you.', 'de': 'So gedenkt Meiner, so gedenke Ich euer.', 'tr': 'Öyleyse siz beni anın ki ben de sizi anayım.'}),
    DailyQuote('إِنَّ اللَّهَ مَعَ الصَّابِرِينَ', {'en': 'Indeed, Allah is with the patient.', 'de': 'Wahrlich, Allah ist mit den Geduldigen.', 'tr': 'Şüphesiz Allah sabredenlerle beraberdir.'}),
    DailyQuote('وَقُل رَّبِّ زِدْنِي عِلْمًا', {'en': 'And say: My Lord, increase me in knowledge.', 'de': 'Und sprich: Mein Herr, mehre mir das Wissen.', 'tr': 'Ve de ki: Rabbim, ilmimi artır.'}),
    DailyQuote('رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً', {'en': 'Our Lord, give us good in this world and good in the Hereafter.', 'de': 'Unser Herr, gib uns Gutes im Diesseits und Gutes im Jenseits.', 'tr': 'Rabbimiz! Bize dünyada da iyilik ver, ahirette de iyilik ver.'}),
    DailyQuote('الدُّعَاءُ هُوَ الْعِبَادَةُ', {'en': 'Supplication is worship. (Hadith)', 'de': 'Das Bittgebet ist Gottesdienst. (Hadith)', 'tr': 'Dua ibadettir. (Hadis)'}),
    DailyQuote('خَيْرُكُمْ مَن تَعَلَّمَ الْقُرْآنَ وَعَلَّمَهُ', {'en': 'The best among you are those who learn the Quran and teach it. (Hadith)', 'de': 'Der Beste von euch ist, wer den Koran lernt und ihn lehrt. (Hadith)', 'tr': 'Sizin en hayırlınız Kur\'an\'ı öğrenen ve öğretendir. (Hadis)'}),
    DailyQuote('مَن سَلَكَ طَرِيقًا يَلْتَمِسُ فِيهِ عِلْمًا سَهَّلَ اللَّهُ لَهُ طَرِيقًا إِلَى الْجَنَّةِ', {'en': 'Whoever takes a path seeking knowledge, Allah makes easy for him a path to Paradise. (Hadith)', 'de': 'Wer einen Weg beschreitet, um Wissen zu suchen, dem erleichtert Allah einen Weg ins Paradies. (Hadith)', 'tr': 'Kim ilim öğrenmek için bir yola girerse, Allah ona cennete giden bir yolu kolaylaştırır. (Hadis)'}),
    DailyQuote('الطُّهُورُ شَطْرُ الْإِيمَانِ', {'en': 'Cleanliness is half of faith. (Hadith)', 'de': 'Reinheit ist die Hälfte des Glaubens. (Hadith)', 'tr': 'Temizlik imanın yarısıdır. (Hadis)'}),
    DailyQuote('الْمُؤْمِنُ الْقَوِيُّ خَيْرٌ وَأَحَبُّ إِلَى اللَّهِ مِنَ الْمُؤْمِنِ الضَّعِيفِ', {'en': 'The strong believer is better and more beloved to Allah than the weak believer. (Hadith)', 'de': 'Der starke Gläubige ist besser und Allah lieber als der schwache Gläubige. (Hadith)', 'tr': 'Kuvvetli mümin, Allah katında zayıf müminden daha hayırlı ve daha sevgilidir. (Hadis)'}),
    DailyQuote('مَن لَا يَرْحَمِ النَّاسَ لَا يَرْحَمْهُ اللَّهُ', {'en': 'Whoever does not show mercy to people, Allah will not show mercy to him. (Hadith)', 'de': 'Wer den Menschen keine Barmherzigkeit erweist, dem erweist Allah keine Barmherzigkeit. (Hadith)', 'tr': 'İnsanlara merhamet etmeyene Allah da merhamet etmez. (Hadis)'}),
    DailyQuote('الْكَلِمَةُ الطَّيِّبَةُ صَدَقَةٌ', {'en': 'A good word is charity. (Hadith)', 'de': 'Ein gutes Wort ist Almosen. (Hadith)', 'tr': 'Güzel söz sadakadır. (Hadis)'}),
    DailyQuote('إِنَّمَا الْأَعْمَالُ بِالنِّيَّاتِ', {'en': 'Actions are judged by intentions. (Hadith)', 'de': 'Taten werden nach den Absichten beurteilt. (Hadith)', 'tr': 'Ameller niyetlere göredir. (Hadis)'}),
  ];

  static DailyQuote forToday() {
    final now = DateTime.now();
    final dayOfYear = now.difference(DateTime(now.year, 1, 1)).inDays;
    return _quotes[dayOfYear % _quotes.length];
  }
}
