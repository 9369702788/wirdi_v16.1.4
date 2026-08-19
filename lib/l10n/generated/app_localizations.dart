// AUTO-GENERATED — Wirdi v1.50.0 i18n (includes Islamic Radio keys)
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

abstract class AppLocalizations {
  AppLocalizations(this.localeName);
  final String localeName;
  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  static const LocalizationsDelegate<AppLocalizations> delegate = _WirdiDelegate();
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
  static const List<Locale> supportedLocales = [
    Locale('ar'), Locale('en'), Locale('de'),
    Locale('tr'), Locale('fr'), Locale('es'), Locale('id'),
  ];
  String get appTitle;
  String get navHome;
  String get navQuran;
  String get navAzkar;
  String get navPrayer;
  String get navTasbeeh;
  String get navMore;
  String get commonCancel;
  String get commonSave;
  String get commonDelete;
  String get commonClose;
  String get commonOk;
  String get commonBack;
  String get commonNext;
  String get commonSkip;
  String get commonDone;
  String get commonRetry;
  String get commonShare;
  String get commonSearch;
  String get commonEdit;
  String get commonConfirm;
  String get commonLoading;
  String get commonError;
  String get commonYes;
  String get commonNo;
  String get languageName_ar;
  String get languageName_en;
  String get languageName_de;
  String get languageName_tr;
  String get settingsLanguage;
  String get settingsLanguageSystem;
  String get settingsLanguageSubtitle;
  String get asmaUlHusnaTitle;
  String get sourcesLicensesTitle;
  String get sourcesOssLicensesButton;
  String get aboutTitle;
  String get aboutTagline;
  String get aboutVersion;
  String get aboutBody;
  String get onboardingSkip;
  String get onboardingSlide1;
  String get onboardingSlide2;
  String get onboardingSlide3;
  String get onboardingStart;
  String get onboardingNext;
  String get privacyPolicyTitle;
  String get favoritesTitle;
  String get favoritesTabAyahs;
  String get favoritesTabAzkar;
  String get favoritesLoadError;
  String get favoritesEmptyAyahs;
  String get favoritesEmptyAzkar;
  String favoritesAyahSubtitle(Object surahName, Object ayahNumber);
  String get zakatTitle;
  String get zakatNisabHint;
  String get zakatCurrentNisab;
  String get zakatableAssets;
  String get zakatCash;
  String get zakatGoldSilver;
  String get zakatInvestments;
  String get zakatBusiness;
  String get zakatReceivables;
  String get zakatOwedDebts;
  String get zakatCurrentDebts;
  String get zakatNetWealth;
  String get zakatEnterNisabFirst;
  String get zakatBelowNisab;
  String get zakatDue;
  String get zakatFootnote;
  String get settingsTitle;
  String get settingsAppearance;
  String get settingsMode;
  String get settingsModeLight;
  String get settingsModeDark;
  String get settingsModeAuto;
  String get settingsFontSize;
  String get settingsFontPreview;
  String get settingsShowTransliteration;
  String get settingsShowTransliterationSubtitle;
  String get settingsPrayerReminder;
  String get settingsPrayerReminderEnable;
  String get settingsPrayerReminderSubtitle;
  String get settingsPrayerReminderMinutesBefore;
  String settingsPrayerReminderMinutesLabel(Object minutes);
  String get settingsPrayerReminderMethod;
  String get settingsReminderBanner;
  String get settingsReminderBeep;
  String get settingsReminderAdhan;
  String get settingsTestTone;
  String get settingsAdhanSound;
  String get settingsStopPreview;
  String get settingsListen;
  String get settingsReminderNote;
  String get settingsDailyWird;
  String get settingsDailyWirdTarget;
  String settingsDailyWirdPerDay(Object count);
  String get settingsAboutSupport;
  String get settingsAbout;
  String get settingsSourcesLicenses;
  String get settingsPrivacyPolicy;
  String get settingsDataManagement;
  String get settingsQuranLastUpdate;
  String get settingsAzkarLastUpdate;
  String get settingsNotDownloadedYet;
  String get settingsUpdateNow;
  String get settingsRequiresInternet;
  String get settingsDataUpdated;
  String get settingsDownloadedAudio;
  String get settingsNoDownloadedAudio;
  String settingsMbDownloaded(Object size);
  String get settingsDeleteAll;
  String get settingsDeleteAllDownloadsTitle;
  String get settingsDeleteAllDownloadsBody;
  String get settingsResetKhatma;
  String get settingsResetKhatmaSubtitle;
  String get settingsResetKhatmaBody;
  String get settingsResetKhatmaConfirm;
  String get settingsKhatmaResetDone;
  String get settingsDeleteLocalData;
  String get settingsDeleteLocalDataBody;
  String get settingsLocalDataDeleted;
  String get settingsPreviewFailed;
  String get quranTranslationUnavailable;
  String get quranTranslationLoadFailed;
  String get quranTranslationRetry;
  String get quranTranslationSourceNote;
  String get homeGreetingNight;
  String get homeGreetingMorning;
  String get homeGreetingAfternoon;
  String get homeGreetingEvening;
  String homeStreakDays(Object days);
  String get homeContinueToday;
  String homeKhatmaProgress(Object percent);
  String get homeIslamicTools;
  String get homeNextPrayer;
  String homeInLabel(Object countdown);
  String get homeCachedPrayerTimes;
  String get homeEnableLocationForPrayer;
  String get homeDailyWird;
  String get homeWirdCompleted;
  String homeWirdProgress(Object pages, Object target);
  String get homeContinueReading;
  String get homeNoLastReading;
  String homeLastReadingSubtitle(Object surahName, Object ayahNumber);
  String get homeFavorites;
  String get homeNoFavoritesYet;
  String homeFavoritesSavedCount(Object count);
  String get homeQuoteOfTheDay;
  String get homeThisWeek;
  String homeActiveDaysOf(Object active, Object total);
  String homeWirdTargetMetSummary(Object met, Object total);
  String get homeQuickActions;
  String get homeQuickAzkar;
  String get homeQuickTasbeeh;
  String get homeQuickPrayer;
  String homeCompletionPercent(Object percent);
  String homeDayNotYet(Object day);
  String homeDaySummary(Object day, Object pages, Object azkar, Object tasbeeh, Object prayers);
  String get dayNameSat;
  String get dayNameSun;
  String get dayNameMon;
  String get dayNameTue;
  String get dayNameWed;
  String get dayNameThu;
  String get dayNameFri;
  String get prayerFajr;
  String get prayerDhuhr;
  String get prayerAsr;
  String get prayerMaghrib;
  String get prayerIsha;
  String get prayerTimesTitle;
  String get prayerSetCityManually;
  String get prayerCityHint;
  String get prayerSearch;
  String prayerCityNotFound(Object city);
  String get prayerAvailabilityLocationDisabled;
  String get prayerAvailabilityPermissionDenied;
  String get prayerAvailabilityPermissionDeniedForever;
  String get prayerAvailabilityNetworkError;
  String get prayerRetry;
  String get prayerUseGps;
  String get prayerRefresh;
  String get prayerOfflineBanner;
  String get prayerNextPrayerLabel;
  String get prayerTimeRemaining;
  String prayerNotYetDue(Object prayer);
  String prayerMarkedDone(Object prayer);
  String prayerNotDoneYet(Object prayer);
  String get prayerFootnote;
  String prayerReminderApproaching(Object prayer, Object minutes);
  String get tasbeehTitle;
  String get tasbeehResetToday;
  String get tasbeehCustom;
  String get tasbeehToday;
  String get tasbeehTarget;
  String get tasbeehPhraseTotal;
  String get tasbeehGrandTotal;
  String tasbeehCounterLabel(Object phrase, Object count, Object target);
  String get tasbeehTapHint;
  String get tasbeehAddCustomTitle;
  String get tasbeehPhraseTextLabel;
  String get tasbeehPhraseTextHint;
  String get tasbeehTargetLabel;
  String get tasbeehAdd;
  String get tasbeehGlossSubhanallah;
  String get tasbeehGlossAlhamdulillah;
  String get tasbeehGlossAllahuakbar;
  String get tasbeehGlossLaIlaha;
  String get tasbeehGlossAstaghfirullah;
  String get tasbeehGlossSalawat;
  String get azkarDuasTitle;
  String get azkarTabAzkar;
  String get azkarTabDuas;
  String get azkarFavoritesTooltip;
  String get azkarLoadError;
  String get azkarSearchHint;
  String get azkarNoResults;
  String azkarCategorySubtitle(Object count, Object completed);
  String get azkarAllDoneInSection;
  String get azkarShowCompleted;
  String get azkarHideCompleted;
  String get azkarCompletedSnackbar;
  String get azkarCopiedSnackbar;
  String get azkarPlusOne;
  String get azkarFavoritesTitle;
  String get azkarNoFavoritesYet;
  String get azkarRetry;
  String get quranTitle;
  String get quranViewMushaf;
  String get quranTabSurahs;
  String get quranTabJuz;
  String get quranTabSearch;
  String get quranTabFavorites;
  String get quranLoadError;
  String get quranViewMode;
  String get quranMushafPagesLoadError;
  String get quranViewAsMushafPages;
  String quranCompletionPercent(Object percent);
  String get quranKhatmaProgress;
  String get quranSearchSurahHint;
  String quranSurahSubtitle(Object englishName, Object count);
  String quranJuzNumber(Object number);
  String quranJuzStartsFrom(Object surahName, Object ayahNumber);
  String get quranSearchAyahHint;
  String get quranSearchMinChars;
  String quranAyahLocation(Object surahName, Object ayahNumber);
  String get quranNoFavoriteAyahsYet;
  String get quranChooseReciter;
  String get quranTafsirTimeoutError;
  String get quranTafsirLoadError;
  String quranLastReadingSaved(Object surahName, Object ayahNumber);
  String quranAyahCopyFormat(Object text, Object surahName, Object ayahNumber);
  String get quranAyahCopiedSnackbar;
  String get quranAddedToWird;
  String quranSurahAppBarTitle(Object name);
  String get quranViewAsMushafPageTooltip;
  String quranChooseReciterTooltip(Object reciterName);
  String get quranDecreaseFontTooltip;
  String get quranIncreaseFontTooltip;
  String get quranAddToWirdTooltip;
  String quranAyahCountLabel(Object count);
  String get quranStopSurahRecitationLabel;
  String get quranPlaySurahRecitationLabel;
  String get quranStopLabel;
  String get quranPlayWholeSurahLabel;
  String get quranNoTafsirAvailable;
  String get quranStopPlayingAyahLabel;
  String quranPlayAyahLabel(Object number);
  String get quranPlayAyahTooltip;
  String get quranRepeatAyahTooltip;
  String get quranHideTafsirTooltip;
  String get quranShowTafsirTooltip;
  String get quranSaveAsLastReadingTooltip;
  String get quranCopyAyahTooltip;
  String get quranRemoveFromFavoritesLabel;
  String get quranAddToFavoritesLabel;
  String get quranRetry;
  String get quranDownloadedForOfflineSnackbar;
  String get quranDeleteDownloadTitle;
  String get quranDeleteDownloadBody;
  String quranStopDownloadTooltip(Object done, Object total);
  String get quranDeleteDownloadedTooltip;
  String get quranDownloadForOfflineTooltip;
  String get qiblaTitle;
  String get qiblaRetry;
  String get qiblaLocationServiceDisabled;
  String get qiblaPermissionDenied;
  String get qiblaLocationError;
  String get qiblaNoCompassSensor;
  String get qiblaBearingFromNorth;
  String get qiblaCompassNorth;
  String get qiblaCompassSouth;
  String get qiblaCompassEast;
  String get qiblaCompassWest;
  String get qiblaAligned;
  String get qiblaNotAligned;
  String qiblaBearingValue(Object degrees);
  String get qiblaCalibrationHint;
  String get toolQiblaTitle;
  String get toolQiblaSubtitle;
  String get toolsTitle;
  String get toolZakatTitle;
  String get toolZakatSubtitle;
  String get toolAsmaTitle;
  String get toolAsmaSubtitle;
  String get toolRamadanTitle;
  String get toolRamadanSubtitle;
  String get toolDuasTitle;
  String get toolDuasSubtitle;
  String get toolMosqueTitle;
  String get toolMosqueSubtitle;
  String get hadithTitle;
  String get hadithSubtitle;
  String get hadithLoadError;
  String get hadithRetry;
  String hadithNumberLabel(Object number);
  String get hadithSearchHint;
  String get hadithNoResults;
  String get hadithCopiedSnackbar;
  String get hadithAddToFavoritesLabel;
  String get hadithRemoveFromFavoritesLabel;
  String get hadithCopyTooltip;
  String get hadithTranslationNote;
  String get toolHadithTitle;
  String get toolHadithSubtitle;
  String get homeHadithOfTheDay;
  String get homeShareHadith;
  String get homeHadithSource;
  String get toolKhatmaTitle;
  String get toolKhatmaSubtitle;
  String get khatmaTrackerTitle;
  String get khatmaNoPlanTitle;
  String get khatmaNoPlanBody;
  String get khatmaChooseDuration;
  String get khatmaDuration7Days;
  String get khatmaDuration30Days;
  String get khatmaDuration60Days;
  String get khatmaDuration90Days;
  String get khatmaCustomDate;
  String khatmaProgressLabel(Object completed, Object total);
  String get khatmaDaysElapsed;
  String get khatmaDaysRemaining;
  String get khatmaTargetDate;
  String get khatmaOnTrack;
  String get khatmaBehindSchedule;
  String khatmaPaceNeeded(Object count);
  String get khatmaCompletedCelebration;
  String get khatmaContinueReading;
  String get khatmaEditPlan;
  String get khatmaResetPlanTitle;
  String get khatmaResetPlanBody;
  String get khatmaResetPlanConfirm;
  String get khatmaPlanReset;
  String get settingsRemindMeFor;
  String get settingsNotifyAtPrayerTime;
  String get settingsNotifyAtPrayerTimeSubtitle;
  String get settingsPostPrayerReminder;
  String get settingsPostPrayerReminderSubtitle;
  String settingsPostPrayerReminderMinutesLabel(Object minutes);
  String get settingsReminderOff;
  String prayerTimeNowBody(Object prayer);
  String postPrayerReminderBody(Object prayer);
  String get settingsMoreReminders;
  String get settingsFridayReminder;
  String get settingsFridayReminderSubtitle;
  String get settingsMorningAzkarReminder;
  String get settingsMorningAzkarReminderSubtitle;
  String get settingsEveningAzkarReminder;
  String get settingsEveningAzkarReminderSubtitle;
  String get settingsDailyWirdReminder;
  String get settingsDailyWirdReminderSubtitle;
  String get settingsSleepAzkarReminder;
  String get settingsSleepAzkarReminderSubtitle;
  String get reminderFridayBody;
  String get reminderMorningAzkarBody;
  String get reminderEveningAzkarBody;
  String get reminderDailyWirdBody;
  String get reminderSleepAzkarBody;
  String get khatmaMyPlans;
  String get khatmaStartNewPlan;
  String get khatmaPlanLabelHint;
  String khatmaBehindByCount(Object count);
  String khatmaNewPaceLabel(Object count);
  String get khatmaDeletePlanTitle;
  String get khatmaDeletePlanBody;
  String get khatmaDeletePlanConfirm;
  String khatmaDefaultPlanLabel(Object number);
  String get khatmaAddAnother;
  String get toolInsightsTitle;
  String get toolInsightsSubtitle;
  String get insightsTitle;
  String get insightsThisWeek;
  String get insightsQuranPages;
  String get insightsAzkarCompleted;
  String get insightsPrayers;
  String get insightsTasbeeh;
  String get insightsCurrentStreak;
  String insightsDaysCount(Object count);
  String get insightsWeeklyActivity;
  String get insightsBestDay;
  String get insightsMostConsistent;
  String get insightsWeekComparisonTitle;
  String insightsImproved(Object percent);
  String insightsDeclined(Object percent);
  String get insightsFirstActiveWeek;
  String get insightsNoActivityYet;
  String get insightsSameAsLastWeek;
  String get insightsNoBestDayYet;
  String get toolMyWirdiTitle;
  String get toolMyWirdiSubtitle;
  String get myWirdiTitle;
  String get myWirdiToday;
  String get myWirdiCompleted;
  String myWirdiRemaining(Object percent);
  String get myWirdiPersonalDua;
  String get myWirdiDuaDone;
  String get myWirdiDuaNotYet;
  String get homeMyWirdiCardTitle;
  String get homeQuickQibla;
  String get qiblaDistanceLabel;
  String qiblaDistanceValue(Object km);
  String get achievementStreak3Title;
  String get achievementStreak3Desc;
  String get achievementStreak7Title;
  String get achievementStreak7Desc;
  String get achievementStreak30Title;
  String get achievementStreak30Desc;
  String get achievementStreak100Title;
  String get achievementStreak100Desc;
  String get achievementQuran10Title;
  String get achievementQuran10Desc;
  String get achievementQuran25Title;
  String get achievementQuran25Desc;
  String get achievementQuran50Title;
  String get achievementQuran50Desc;
  String get achievementQuran100Title;
  String get achievementQuran100Desc;
  String get achievementKhatma1Title;
  String get achievementKhatma1Desc;
  String get achievementKhatma3Title;
  String get achievementKhatma3Desc;
  String get achievementPages50Title;
  String get achievementPages50Desc;
  String get achievementPages200Title;
  String get achievementPages200Desc;
  String get achievementPages604Title;
  String get achievementPages604Desc;
  String get achievementAzkar50Title;
  String get achievementAzkar50Desc;
  String get achievementAzkar500Title;
  String get achievementAzkar500Desc;
  String get achievementTasbeeh100Title;
  String get achievementTasbeeh100Desc;
  String get achievementTasbeeh1000Title;
  String get achievementTasbeeh1000Desc;
  String get achievementPrayers50Title;
  String get achievementPrayers50Desc;
  String get achievementPrayers350Title;
  String get achievementPrayers350Desc;
  String get achievementFavorites10Title;
  String get achievementFavorites10Desc;
  String get achievementsTitle;
  String achievementsUnlockedCount(Object unlocked, Object total);
  String get toolAchievementsTitle;
  String get toolAchievementsSubtitle;
  String get quranShareAsImageTooltip;
  String get ayahShareTitle;
  String get ayahShareIncludeTranslation;
  String get ayahShareButton;
  String get myDuasDialogTitleNew;
  String get myDuasDialogTitleEdit;
  String get myDuasTitleFieldLabel;
  String get myDuasTextFieldLabel;
  String get myDuasEmptyTitle;
  String get myDuasEmptySubtitle;
  String get ramadanCountdownToSuhoor;
  String get ramadanCountdownToIftar;
  String get ramadanCountdownToSuhoorTomorrow;
  String get ramadanLoadError;
  String ramadanDayOfRamadan(Object day);
  String get ramadanFastingToday;
  String get ramadanFastingSubtitle;
  String get ramadanDaysLoggedTitle;
  String get ramadanHijriFootnote;
  String get mushafTitle;
  String get mushafStopAudioTooltip;
  String get mushafLoadError;
  String get mushafTapAyahHint;
  String mushafPageNumber(Object number);
  String get mosqueLocationServiceDisabled;
  String get mosqueLocationPermissionNeeded;
  String get mosqueSearchError;
  String get mosqueTabMosques;
  String get mosqueTabHalalRestaurants;
  String get mosqueNoMosquesFound;
  String get mosqueNoHalalFound;
  String get onboardingGoalTitle;
  String get onboardingGoalLight;
  String get onboardingGoalLightDesc;
  String get onboardingGoalRegular;
  String get onboardingGoalRegularDesc;
  String get onboardingGoalAdvanced;
  String get onboardingGoalAdvancedDesc;
  String get onboardingEnableReminders;
  String get onboardingEnableRemindersDesc;
  String get toolBookmarksTitle;
  String get toolBookmarksSubtitle;
  String get bookmarksTitle;
  String get bookmarksEmptyTitle;
  String get bookmarksEmptySubtitle;
  String get bookmarkAddTooltip;
  String get bookmarkDialogTitle;
  String get bookmarkNoteLabel;
  String get bookmarkCategoryLabel;
  String get bookmarkCategoryRamadan;
  String get bookmarkCategoryDua;
  String get bookmarkCategoryFamily;
  String get bookmarkCategoryStudy;
  String get bookmarkCategoryPersonal;
  String get bookmarkCategoryOther;
  String get bookmarkSavedSnackbar;
  String get bookmarkDeleteConfirmTitle;
  String get bookmarkDeleteConfirmBody;
  String get bookmarkDeleteConfirm;
  String get settingsPrivacyCenter;
  String get settingsPrivacyCenterSubtitle;
  String get privacyCenterTitle;
  String get privacyCenterIntro;
  String get privacyCenterLocalDataTitle;
  String get privacyCenterLocalDataBody;
  String get privacyCenterLocationTitle;
  String get privacyCenterLocationBody;
  String get privacyCenterNoAccountsTitle;
  String get privacyCenterNoAccountsBody;
  String get privacyCenterExportButton;
  String get privacyCenterExportSuccessSnackbar;
  String get privacyCenterDeleteButton;
  String get privacyCenterDeleteConfirmTitle;
  String get privacyCenterDeleteConfirmBody;
  String get privacyCenterDeleteConfirmButton;
  String get privacyCenterDeleteDoneSnackbar;
  String get privacyCenterViewPolicy;
  String homeRamadanBannerTitle(Object day);
  String get homeRamadanBannerSubtitle;
  String get ramadanLast10NightsTitle;
  String get ramadanLast10NightsBody;
  String get ramadanPossibleLaylatAlQadr;
  String get commonEditTooltip;
  String get commonDeleteTooltip;
  String get commonSettingsTooltip;
  String get commonDecreaseTooltip;
  String get commonIncreaseTooltip;
  String get commonShareTooltip;
  String get commonRefreshTooltip;
  String get homeNextPrayerCardLabel;
  String get homeWeeklyInsightsCardLabel;
  String get settingsTajweedColoring;
  String get settingsTajweedColoringSubtitle;
  String get settingsBackupRestore;
  String get settingsExportBackup;
  String get settingsExportBackupSubtitle;
  String get settingsImportBackup;
  String get settingsImportBackupSubtitle;
  String get settingsImportSuccess;
  String get settingsImportError;
  String get tajweedLegendTitle;
  String get tajweedLegendIntro;
  String get tajweedQalqalahLabel;
  String get tajweedGhunnahLabel;
  String get tajweedIkhfaLabel;
  String get tajweedIdghamGhunnahLabel;
  String get tajweedIdghamNoGhunnahLabel;
  String get tajweedIqlabLabel;
  String get tajweedLegendClose;
  String get radioTitle;
  String get radioSubtitle;
  String get radioAll;
  String get radioNowPlaying;
  String get radioFavorites;
  String get radioNoFavorites;
  String get radioNoStations;
  String get radioAddFavorite;
  String get radioRemoveFavorite;
  String get radioSleepTimer;
  String get radioSleepTimerSubtitle;
  String get radioSleepTimerCancel;
  String get radioMinutes;
  String radioSleepTimerActive(Object minutes);
  String get radioOfficial;
  String get radioStreamError;
}
class _WirdiDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _WirdiDelegate();
  static final _cache = <String, AppLocalizations>{
    'ar': _AppLocalizations_ar(),
    'en': _AppLocalizations_en(),
    'de': _AppLocalizations_de(),
    'tr': _AppLocalizations_tr(),
    'fr': _AppLocalizations_fr(),
    'es': _AppLocalizations_es(),
    'id': _AppLocalizations_id(),
  };
  @override bool isSupported(Locale l) => _cache.containsKey(l.languageCode);
  @override Future<AppLocalizations> load(Locale l) async => _cache[l.languageCode] ?? _cache['en']!;
  @override bool shouldReload(_WirdiDelegate o) => false;
}

class _AppLocalizations_ar extends AppLocalizations {
  _AppLocalizations_ar() : super('ar');
  @override
  String get appTitle => 'وردي';
  @override
  String get navHome => 'الرئيسية';
  @override
  String get navQuran => 'القرآن';
  @override
  String get navAzkar => 'الأذكار';
  @override
  String get navPrayer => 'الصلاة';
  @override
  String get navTasbeeh => 'التسبيح';
  @override
  String get navMore => 'المزيد';
  @override
  String get commonCancel => 'إلغاء';
  @override
  String get commonSave => 'حفظ';
  @override
  String get commonDelete => 'حذف';
  @override
  String get commonClose => 'إغلاق';
  @override
  String get commonOk => 'حسنًا';
  @override
  String get commonBack => 'رجوع';
  @override
  String get commonNext => 'التالي';
  @override
  String get commonSkip => 'تخطي';
  @override
  String get commonDone => 'تم';
  @override
  String get commonRetry => 'إعادة المحاولة';
  @override
  String get commonShare => 'مشاركة';
  @override
  String get commonSearch => 'بحث';
  @override
  String get commonEdit => 'تعديل';
  @override
  String get commonConfirm => 'تأكيد';
  @override
  String get commonLoading => 'جارٍ التحميل…';
  @override
  String get commonError => 'حدث خطأ ما';
  @override
  String get commonYes => 'نعم';
  @override
  String get commonNo => 'لا';
  @override
  String get languageName_ar => 'العربية';
  @override
  String get languageName_en => 'الإنجليزية';
  @override
  String get languageName_de => 'الألمانية';
  @override
  String get languageName_tr => 'التركية';
  @override
  String get settingsLanguage => 'اللغة';
  @override
  String get settingsLanguageSystem => 'لغة النظام';
  @override
  String get settingsLanguageSubtitle => 'اختر لغة عرض التطبيق';
  @override
  String get asmaUlHusnaTitle => 'أسماء الله الحسنى';
  @override
  String get sourcesLicensesTitle => 'المصادر والتراخيص';
  @override
  String get sourcesOssLicensesButton => 'تراخيص حزم البرمجيات مفتوحة المصدر';
  @override
  String get aboutTitle => 'عن التطبيق';
  @override
  String get aboutTagline => 'رفيقك اليومي للذكر والقرآن';
  @override
  String get aboutVersion => 'الإصدار 1.0.0';
  @override
  String get aboutBody => 'وردي تطبيق إسلامي يومي يساعدك على متابعة قراءة القرآن، وأذكارك، ومواقيت صلاتك، وتسبيحك، في مكان واحد بتصميم هادئ وبسيط. لا يحتوي التطبيق على إعلانات أو تتبع، وجميع بياناتك تبقى على جهازك.';
  @override
  String get onboardingSkip => 'تخطي';
  @override
  String get onboardingSlide1 => 'اجعل القرآن جزءًا من يومك';
  @override
  String get onboardingSlide2 => 'تابع وردك اليومي وابنِ عادة';
  @override
  String get onboardingSlide3 => 'ذكّر قلبك قبل أن يذكرك الوقت';
  @override
  String get onboardingStart => 'ابدأ رحلتك';
  @override
  String get onboardingNext => 'التالي';
  @override
  String get privacyPolicyTitle => 'سياسة الخصوصية';
  @override
  String get favoritesTitle => 'المفضلة';
  @override
  String get favoritesTabAyahs => 'آيات القرآن';
  @override
  String get favoritesTabAzkar => 'الأذكار';
  @override
  String get favoritesLoadError => 'تعذر تحميل المفضلة';
  @override
  String get favoritesEmptyAyahs => 'لا توجد آيات مفضلة بعد';
  @override
  String get favoritesEmptyAzkar => 'لا توجد أذكار مفضلة بعد';
  @override
  String favoritesAyahSubtitle(Object surahName, Object ayahNumber) => 'سورة {surahName} - آية {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get zakatTitle => 'حاسبة الزكاة';
  @override
  String get zakatNisabHint => 'حدد قيمة النصاب الحالية (بقيمة السوق الحالية للذهب أو الفضة) قبل الحساب، لأن سعر النصاب يتغير يوميًا ولا يمكن تثبيته داخل التطبيق. يمكنك سؤال دار الإفتاء المحلية أو مراجعة سعر جرام الذهب الحالي (85 جرامًا من الذهب أو ما يعادلها من الفضة).';
  @override
  String get zakatCurrentNisab => 'قيمة النصاب الحالية';
  @override
  String get zakatableAssets => 'الأصول الزكوية';
  @override
  String get zakatCash => 'النقد وما في حكمه (البنك، المحفظة)';
  @override
  String get zakatGoldSilver => 'الذهب والفضة (بالقيمة السوقية)';
  @override
  String get zakatInvestments => 'الاستثمارات والأسهم';
  @override
  String get zakatBusiness => 'عروض التجارة (بضاعة معدة للبيع)';
  @override
  String get zakatReceivables => 'الديون المرجو تحصيلها';
  @override
  String get zakatOwedDebts => 'الديون المستحقة عليك';
  @override
  String get zakatCurrentDebts => 'ديون وفواتير مستحقة عليك حاليًا';
  @override
  String get zakatNetWealth => 'صافي المال الزكوي';
  @override
  String get zakatEnterNisabFirst => 'أدخل قيمة النصاب أولًا';
  @override
  String get zakatBelowNisab => 'المال لم يبلغ النصاب — لا زكاة واجبة';
  @override
  String get zakatDue => 'الزكاة المستحقة (2.5%)';
  @override
  String get zakatFootnote => 'ملاحظة: هذه الحاسبة تقدّم تقديرًا عامًا وفق النسبة القياسية (2.5%) على المال الذي حال عليه الحول وبلغ النصاب. الزكاة على الزروع والثروة الحيوانية والمعادن لها أحكام مختلفة غير مشمولة هنا. للحالات الخاصة يُستحسن سؤال أهل العلم.';
  @override
  String get settingsTitle => 'الإعدادات';
  @override
  String get settingsAppearance => 'المظهر';
  @override
  String get settingsMode => 'الوضع';
  @override
  String get settingsModeLight => 'فاتح';
  @override
  String get settingsModeDark => 'داكن';
  @override
  String get settingsModeAuto => 'تلقائي';
  @override
  String get settingsFontSize => 'حجم الخط';
  @override
  String get settingsFontPreview => 'نص تجريبي لمعاينة حجم الخط';
  @override
  String get settingsShowTransliteration => 'إظهار النطق بالحروف اللاتينية';
  @override
  String get settingsShowTransliterationSubtitle => 'مفيد لمن يتعلم القراءة — يظهر تحت كل آية';
  @override
  String get settingsPrayerReminder => 'تذكير الصلاة';
  @override
  String get settingsPrayerReminderEnable => 'تفعيل تذكير اقتراب الصلاة';
  @override
  String get settingsPrayerReminderSubtitle => 'يعمل التذكير أثناء فتح التطبيق فقط';
  @override
  String get settingsPrayerReminderMinutesBefore => 'التذكير قبل الصلاة بـ (دقائق)';
  @override
  String settingsPrayerReminderMinutesLabel(Object minutes) => '{minutes} دقيقة'.replaceAll('{minutes}', minutes.toString());
  @override
  String get settingsPrayerReminderMethod => 'طريقة التذكير';
  @override
  String get settingsReminderBanner => 'إشعار فقط';
  @override
  String get settingsReminderBeep => 'نغمة تنبيه';
  @override
  String get settingsReminderAdhan => 'أذان كامل';
  @override
  String get settingsTestTone => 'تجربة النغمة';
  @override
  String get settingsAdhanSound => 'صوت الأذان';
  @override
  String get settingsStopPreview => 'إيقاف المعاينة';
  @override
  String get settingsListen => 'استماع';
  @override
  String get settingsReminderNote => 'ملاحظة: يرسل التطبيق إشعارًا حقيقيًا حتى لو كان مغلقًا، لكن يلزم منح إذن الإشعارات (وإذن التنبيهات الدقيقة على أندرويد 12+) عند تفعيل الخيار. يُعاد جدولة إشعارات اليوم وغدًا في كل مرة تُفتح فيها الشاشة الرئيسية أو مواقيت الصلاة.';
  @override
  String get settingsDailyWird => 'الورد اليومي';
  @override
  String get settingsDailyWirdTarget => 'الهدف اليومي (صفحات/سور)';
  @override
  String settingsDailyWirdPerDay(Object count) => '{count} في اليوم'.replaceAll('{count}', count.toString());
  @override
  String get settingsAboutSupport => 'حول ودعم';
  @override
  String get settingsAbout => 'عن التطبيق';
  @override
  String get settingsSourcesLicenses => 'المصادر والتراخيص';
  @override
  String get settingsPrivacyPolicy => 'سياسة الخصوصية';
  @override
  String get settingsDataManagement => 'إدارة البيانات';
  @override
  String get settingsQuranLastUpdate => 'آخر تحديث للقرآن الكريم';
  @override
  String get settingsAzkarLastUpdate => 'آخر تحديث للأذكار';
  @override
  String get settingsNotDownloadedYet => 'لم يتم التحميل بعد';
  @override
  String get settingsUpdateNow => 'تحديث البيانات الآن';
  @override
  String get settingsRequiresInternet => 'يتطلب اتصالاً بالإنترنت';
  @override
  String get settingsDataUpdated => 'تم تحديث بيانات القرآن والأذكار';
  @override
  String get settingsDownloadedAudio => 'التلاوات المحمّلة للاستماع بدون اتصال';
  @override
  String get settingsNoDownloadedAudio => 'لا توجد تلاوات محمّلة';
  @override
  String settingsMbDownloaded(Object size) => '{size} ميجابايت محمّلة'.replaceAll('{size}', size.toString());
  @override
  String get settingsDeleteAll => 'حذف الكل';
  @override
  String get settingsDeleteAllDownloadsTitle => 'حذف كل التلاوات المحمّلة';
  @override
  String get settingsDeleteAllDownloadsBody => 'سيتم حذف جميع الملفات الصوتية المحملة لجميع السور. سيعود الاستماع للتشغيل عبر الإنترنت.';
  @override
  String get settingsResetKhatma => 'إعادة تعيين تقدّم الختمة';
  @override
  String get settingsResetKhatmaSubtitle => 'لبدء ختمة جديدة من الصفر';
  @override
  String get settingsResetKhatmaBody => 'سيتم اعتبار كل السور غير مقروءة من جديد لبدء ختمة جديدة. لن يتأثر وردك اليومي أو المفضلة.';
  @override
  String get settingsResetKhatmaConfirm => 'إعادة التعيين';
  @override
  String get settingsKhatmaResetDone => 'تم بدء ختمة جديدة، بالتوفيق 🌿';
  @override
  String get settingsDeleteLocalData => 'حذف جميع البيانات المحلية';
  @override
  String get settingsDeleteLocalDataBody => 'سيتم حذف المفضلة وإحصاءات التسبيح وتقدم الورد اليومي وكل الإعدادات المحفوظة على هذا الجهاز. لا يمكن التراجع عن هذا الإجراء.';
  @override
  String get settingsLocalDataDeleted => 'تم حذف جميع البيانات المحلية';
  @override
  String get settingsPreviewFailed => 'تعذر تشغيل المعاينة — تحقق من الاتصال';
  @override
  String get quranTranslationUnavailable => 'الترجمة غير متوفرة لهذه الآية';
  @override
  String get quranTranslationLoadFailed => 'تعذر تحميل الترجمة';
  @override
  String get quranTranslationRetry => 'إعادة المحاولة';
  @override
  String get quranTranslationSourceNote => 'الترجمة من QuranEnc.com';
  @override
  String get homeGreetingNight => 'ليلة مباركة 🌙';
  @override
  String get homeGreetingMorning => 'صباح الخير 👋';
  @override
  String get homeGreetingAfternoon => 'نهارك سعيد ☀️';
  @override
  String get homeGreetingEvening => 'مساء الخير 👋';
  @override
  String homeStreakDays(Object days) => 'متتالية الورد: {days} يوم 🔥'.replaceAll('{days}', days.toString());
  @override
  String get homeContinueToday => 'واصل ما بدأته اليوم';
  @override
  String homeKhatmaProgress(Object percent) => 'تقدّم الختمة: {percent}%'.replaceAll('{percent}', percent.toString());
  @override
  String get homeIslamicTools => 'أدوات إسلامية';
  @override
  String get homeNextPrayer => 'الصلاة القادمة';
  @override
  String homeInLabel(Object countdown) => 'بعد {countdown}'.replaceAll('{countdown}', countdown.toString());
  @override
  String get homeCachedPrayerTimes => 'آخر مواقيت محفوظة (بدون اتصال)';
  @override
  String get homeEnableLocationForPrayer => 'فعّل الموقع لعرض الصلاة القادمة';
  @override
  String get homeDailyWird => 'الورد اليومي';
  @override
  String get homeWirdCompleted => 'أتممت وردك اليوم، بارك الله فيك 🎉';
  @override
  String homeWirdProgress(Object pages, Object target) => '{pages} من {target} صفحات/سور'.replaceAll('{pages}', pages.toString()).replaceAll('{target}', target.toString());
  @override
  String get homeContinueReading => 'متابعة القراءة';
  @override
  String get homeNoLastReading => 'لم يتم تحديد آخر قراءة بعد';
  @override
  String homeLastReadingSubtitle(Object surahName, Object ayahNumber) => 'سورة {surahName} — آية {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get homeFavorites => 'المفضلة';
  @override
  String get homeNoFavoritesYet => 'لا توجد عناصر مفضلة بعد';
  @override
  String homeFavoritesSavedCount(Object count) => '{count} عنصر محفوظ'.replaceAll('{count}', count.toString());
  @override
  String get homeQuoteOfTheDay => 'وقفة اليوم';
  @override
  String get homeThisWeek => 'هذا الأسبوع';
  @override
  String homeActiveDaysOf(Object active, Object total) => '{active} من {total} أيام نشطة'.replaceAll('{active}', active.toString()).replaceAll('{total}', total.toString());
  @override
  String homeWirdTargetMetSummary(Object met, Object total) => 'أتممت هدف الورد اليومي في {met} من {total} أيام هذا الأسبوع'.replaceAll('{met}', met.toString()).replaceAll('{total}', total.toString());
  @override
  String get homeQuickActions => 'إجراءات سريعة';
  @override
  String get homeQuickAzkar => 'الأذكار';
  @override
  String get homeQuickTasbeeh => 'التسبيح';
  @override
  String get homeQuickPrayer => 'الصلاة';
  @override
  String homeCompletionPercent(Object percent) => 'نسبة الإنجاز {percent} بالمئة'.replaceAll('{percent}', percent.toString());
  @override
  String homeDayNotYet(Object day) => '{day}: لم يأتِ بعد'.replaceAll('{day}', day.toString());
  @override
  String homeDaySummary(Object day, Object pages, Object azkar, Object tasbeeh, Object prayers) => '{day}: {pages} صفحة، {azkar} ذكر، {tasbeeh} تسبيحة، {prayers} صلوات'.replaceAll('{day}', day.toString()).replaceAll('{pages}', pages.toString()).replaceAll('{azkar}', azkar.toString()).replaceAll('{tasbeeh}', tasbeeh.toString()).replaceAll('{prayers}', prayers.toString());
  @override
  String get dayNameSat => 'السبت';
  @override
  String get dayNameSun => 'الأحد';
  @override
  String get dayNameMon => 'الاثنين';
  @override
  String get dayNameTue => 'الثلاثاء';
  @override
  String get dayNameWed => 'الأربعاء';
  @override
  String get dayNameThu => 'الخميس';
  @override
  String get dayNameFri => 'الجمعة';
  @override
  String get prayerFajr => 'الفجر';
  @override
  String get prayerDhuhr => 'الظهر';
  @override
  String get prayerAsr => 'العصر';
  @override
  String get prayerMaghrib => 'المغرب';
  @override
  String get prayerIsha => 'العشاء';
  @override
  String get prayerTimesTitle => 'مواقيت الصلاة';
  @override
  String get prayerSetCityManually => 'تحديد المدينة يدويًا';
  @override
  String get prayerCityHint => 'مثال: القاهرة، مصر';
  @override
  String get prayerSearch => 'بحث';
  @override
  String prayerCityNotFound(Object city) => 'تعذر العثور على "{city}" — تحقق من الاسم وحاول مرة أخرى'.replaceAll('{city}', city.toString());
  @override
  String get prayerAvailabilityLocationDisabled => 'خدمة الموقع غير مفعّلة على جهازك. فعّلها أو حدد مدينتك يدويًا.';
  @override
  String get prayerAvailabilityPermissionDenied => 'التطبيق يحتاج إذن الوصول إلى الموقع لعرض مواقيت صلاة دقيقة، أو يمكنك تحديد مدينتك يدويًا.';
  @override
  String get prayerAvailabilityPermissionDeniedForever => 'تم رفض إذن الموقع بشكل دائم. فعّله من إعدادات النظام، أو حدد مدينتك يدويًا.';
  @override
  String get prayerAvailabilityNetworkError => 'تعذر الاتصال بالإنترنت ولا توجد مواقيت محفوظة مسبقًا.';
  @override
  String get prayerRetry => 'إعادة المحاولة';
  @override
  String get prayerUseGps => 'استخدام الموقع الحالي (GPS)';
  @override
  String get prayerRefresh => 'تحديث';
  @override
  String get prayerOfflineBanner => 'لا يوجد اتصال — تُعرض آخر مواقيت محفوظة';
  @override
  String get prayerNextPrayerLabel => 'الصلاة القادمة';
  @override
  String get prayerTimeRemaining => 'الوقت المتبقي';
  @override
  String prayerNotYetDue(Object prayer) => 'لم يحن وقت صلاة {prayer} بعد'.replaceAll('{prayer}', prayer.toString());
  @override
  String prayerMarkedDone(Object prayer) => 'تم أداء صلاة {prayer}'.replaceAll('{prayer}', prayer.toString());
  @override
  String prayerNotDoneYet(Object prayer) => 'صلاة {prayer} لم تؤدَ بعد'.replaceAll('{prayer}', prayer.toString());
  @override
  String get prayerFootnote => 'ملاحظة: المواقيت تعتمد على موقعك أو المدينة المحددة، وخدمة AlAdhan بطريقة الحساب المصرية.';
  @override
  String prayerReminderApproaching(Object prayer, Object minutes) => 'اقترب وقت صلاة {prayer} بعد {minutes} دقائق'.replaceAll('{prayer}', prayer.toString()).replaceAll('{minutes}', minutes.toString());
  @override
  String get tasbeehTitle => 'التسبيح';
  @override
  String get tasbeehResetToday => 'إعادة تعيين اليوم';
  @override
  String get tasbeehCustom => 'سبحة مخصصة';
  @override
  String get tasbeehToday => 'اليوم';
  @override
  String get tasbeehTarget => 'الهدف';
  @override
  String get tasbeehPhraseTotal => 'إجمالي الذكر';
  @override
  String get tasbeehGrandTotal => 'الإجمالي الكلي';
  @override
  String tasbeehCounterLabel(Object phrase, Object count, Object target) => 'عداد تسبيح {phrase}، العدد الحالي {count} من {target}'.replaceAll('{phrase}', phrase.toString()).replaceAll('{count}', count.toString()).replaceAll('{target}', target.toString());
  @override
  String get tasbeehTapHint => 'اضغط للتسبيح — اضغط مطولًا على سبحة مخصصة لحذفها';
  @override
  String get tasbeehAddCustomTitle => 'سبحة مخصصة';
  @override
  String get tasbeehPhraseTextLabel => 'نص الذكر';
  @override
  String get tasbeehPhraseTextHint => 'مثال: لا حول ولا قوة إلا بالله';
  @override
  String get tasbeehTargetLabel => 'الهدف';
  @override
  String get tasbeehAdd => 'إضافة';
  @override
  String get tasbeehGlossSubhanallah => '';
  @override
  String get tasbeehGlossAlhamdulillah => '';
  @override
  String get tasbeehGlossAllahuakbar => '';
  @override
  String get tasbeehGlossLaIlaha => '';
  @override
  String get tasbeehGlossAstaghfirullah => '';
  @override
  String get tasbeehGlossSalawat => '';
  @override
  String get azkarDuasTitle => 'الأذكار والأدعية';
  @override
  String get azkarTabAzkar => 'الأذكار';
  @override
  String get azkarTabDuas => 'الأدعية';
  @override
  String get azkarFavoritesTooltip => 'المفضلة';
  @override
  String get azkarLoadError => 'تعذر تحميل الأذكار. تأكد من اتصال الإنترنت.';
  @override
  String get azkarSearchHint => 'ابحث في الأذكار';
  @override
  String get azkarNoResults => 'لا توجد نتائج';
  @override
  String azkarCategorySubtitle(Object count, Object completed) => '{count} ذكر — أُنجز {completed} اليوم'.replaceAll('{count}', count.toString()).replaceAll('{completed}', completed.toString());
  @override
  String get azkarAllDoneInSection => 'أتممت كل أذكار هذا القسم 🌿';
  @override
  String get azkarShowCompleted => 'إظهار المكتمل';
  @override
  String get azkarHideCompleted => 'إخفاء المكتمل';
  @override
  String get azkarCompletedSnackbar => 'أحسنت 🌿 تم إكمال هذا الذكر';
  @override
  String get azkarCopiedSnackbar => 'تم نسخ الذكر — يمكنك لصقه للمشاركة';
  @override
  String get azkarPlusOne => '+1';
  @override
  String get azkarFavoritesTitle => 'الأذكار المفضلة';
  @override
  String get azkarNoFavoritesYet => 'لا توجد أذكار مفضلة بعد';
  @override
  String get azkarRetry => 'إعادة المحاولة';
  @override
  String get quranTitle => 'القرآن الكريم';
  @override
  String get quranViewMushaf => 'عرض المصحف';
  @override
  String get quranTabSurahs => 'السور';
  @override
  String get quranTabJuz => 'الأجزاء';
  @override
  String get quranTabSearch => 'البحث';
  @override
  String get quranTabFavorites => 'المفضلة';
  @override
  String get quranLoadError => 'تعذر تحميل القرآن الكريم. تأكد من اتصال الإنترنت.';
  @override
  String get quranViewMode => 'طريقة العرض';
  @override
  String get quranMushafPagesLoadError => 'تعذر تحميل صفحات المصحف — تحقق من الاتصال';
  @override
  String get quranViewAsMushafPages => 'عرض كصفحات المصحف';
  @override
  String quranCompletionPercent(Object percent) => 'نسبة إتمام القرآن الكريم {percent} بالمئة'.replaceAll('{percent}', percent.toString());
  @override
  String get quranKhatmaProgress => 'تقدّم الختمة';
  @override
  String get quranSearchSurahHint => 'ابحث باسم السورة أو رقمها';
  @override
  String quranSurahSubtitle(Object englishName, Object count) => '{englishName} - {count} آية'.replaceAll('{englishName}', englishName.toString()).replaceAll('{count}', count.toString());
  @override
  String quranJuzNumber(Object number) => 'الجزء {number}'.replaceAll('{number}', number.toString());
  @override
  String quranJuzStartsFrom(Object surahName, Object ayahNumber) => 'يبدأ من سورة {surahName} - آية {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get quranSearchAyahHint => 'ابحث في نص الآيات';
  @override
  String get quranSearchMinChars => 'اكتب حرفين على الأقل للبحث';
  @override
  String quranAyahLocation(Object surahName, Object ayahNumber) => 'سورة {surahName} - آية {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get quranNoFavoriteAyahsYet => 'لا توجد آيات مفضلة بعد';
  @override
  String get quranChooseReciter => 'اختر القارئ';
  @override
  String get quranTafsirTimeoutError => 'تحميل التفسير أخذ وقتًا طويلًا — الملف كبير الحجم (2.7 ميجابايت)، حاول على اتصال أسرع';
  @override
  String get quranTafsirLoadError => 'تعذر تحميل التفسير — تحقق من الاتصال';
  @override
  String quranLastReadingSaved(Object surahName, Object ayahNumber) => 'تم حفظ آخر قراءة: سورة {surahName} - آية {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String quranAyahCopyFormat(Object text, Object surahName, Object ayahNumber) => '{text} (سورة {surahName}: {ayahNumber})'.replaceAll('{text}', text.toString()).replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get quranAyahCopiedSnackbar => 'تم نسخ الآية';
  @override
  String get quranAddedToWird => 'أُضيفت هذه القراءة إلى وردك اليومي 🌿';
  @override
  String quranSurahAppBarTitle(Object name) => 'سورة {name}'.replaceAll('{name}', name.toString());
  @override
  String get quranViewAsMushafPageTooltip => 'عرض هذه السورة كصفحة مصحف';
  @override
  String quranChooseReciterTooltip(Object reciterName) => 'اختيار القارئ ({reciterName})'.replaceAll('{reciterName}', reciterName.toString());
  @override
  String get quranDecreaseFontTooltip => 'تصغير الخط';
  @override
  String get quranIncreaseFontTooltip => 'تكبير الخط';
  @override
  String get quranAddToWirdTooltip => 'أضف إلى الورد اليومي';
  @override
  String quranAyahCountLabel(Object count) => '{count} آية'.replaceAll('{count}', count.toString());
  @override
  String get quranStopSurahRecitationLabel => 'إيقاف تلاوة السورة';
  @override
  String get quranPlaySurahRecitationLabel => 'تشغيل تلاوة السورة كاملة';
  @override
  String get quranStopLabel => 'إيقاف';
  @override
  String get quranPlayWholeSurahLabel => 'تشغيل السورة كاملة';
  @override
  String get quranNoTafsirAvailable => 'لا يتوفر تفسير لهذه الآية';
  @override
  String get quranStopPlayingAyahLabel => 'إيقاف تشغيل الآية';
  @override
  String quranPlayAyahLabel(Object number) => 'تشغيل الآية {number}'.replaceAll('{number}', number.toString());
  @override
  String get quranPlayAyahTooltip => 'تشغيل الآية';
  @override
  String get quranRepeatAyahTooltip => 'تكرار هذه الآية';
  @override
  String get quranHideTafsirTooltip => 'إخفاء التفسير';
  @override
  String get quranShowTafsirTooltip => 'عرض التفسير الميسر';
  @override
  String get quranSaveAsLastReadingTooltip => 'حفظ كآخر قراءة';
  @override
  String get quranCopyAyahTooltip => 'نسخ الآية';
  @override
  String get quranRemoveFromFavoritesLabel => 'إزالة من المفضلة';
  @override
  String get quranAddToFavoritesLabel => 'إضافة للمفضلة';
  @override
  String get quranRetry => 'إعادة المحاولة';
  @override
  String get quranDownloadedForOfflineSnackbar => 'تم تحميل السورة للاستماع بدون اتصال';
  @override
  String get quranDeleteDownloadTitle => 'حذف التحميل';
  @override
  String get quranDeleteDownloadBody => 'سيتم حذف الملفات الصوتية المحملة لهذه السورة.';
  @override
  String quranStopDownloadTooltip(Object done, Object total) => 'إيقاف التحميل ({done}/{total})'.replaceAll('{done}', done.toString()).replaceAll('{total}', total.toString());
  @override
  String get quranDeleteDownloadedTooltip => 'محملة للاستماع بدون اتصال — اضغط للحذف';
  @override
  String get quranDownloadForOfflineTooltip => 'تحميل السورة للاستماع بدون اتصال';
  @override
  String get qiblaTitle => 'اتجاه القبلة';
  @override
  String get qiblaRetry => 'إعادة المحاولة';
  @override
  String get qiblaLocationServiceDisabled => 'خدمة الموقع غير مفعّلة على جهازك. فعّلها لتحديد اتجاه القبلة.';
  @override
  String get qiblaPermissionDenied => 'يحتاج التطبيق إذن الوصول إلى الموقع لتحديد اتجاه القبلة بدقة.';
  @override
  String get qiblaLocationError => 'تعذر تحديد موقعك. تحقق من الاتصال وحاول مرة أخرى.';
  @override
  String get qiblaNoCompassSensor => 'لا يحتوي جهازك على حساس بوصلة. استخدم القيمة أدناه مع بوصلة أخرى لتحديد الاتجاه.';
  @override
  String get qiblaBearingFromNorth => 'الاتجاه من الشمال الحقيقي';
  @override
  String get qiblaCompassNorth => 'ش';
  @override
  String get qiblaCompassSouth => 'ج';
  @override
  String get qiblaCompassEast => 'شرق';
  @override
  String get qiblaCompassWest => 'غرب';
  @override
  String get qiblaAligned => 'أنت متجه نحو القبلة ✓';
  @override
  String get qiblaNotAligned => 'أدر جهازك حتى يتوسط المؤشر البوصلة';
  @override
  String qiblaBearingValue(Object degrees) => 'اتجاه القبلة: {degrees}° من الشمال'.replaceAll('{degrees}', degrees.toString());
  @override
  String get qiblaCalibrationHint => 'إذا بدت البوصلة غير دقيقة، حرّك جهازك على شكل رقم 8 لمعايرتها بعيدًا عن الأجهزة المغناطيسية';
  @override
  String get toolQiblaTitle => 'اتجاه القبلة';
  @override
  String get toolQiblaSubtitle => 'بوصلة لتحديد اتجاه القبلة أينما كنت';
  @override
  String get toolsTitle => 'أدوات إسلامية';
  @override
  String get toolZakatTitle => 'حاسبة الزكاة';
  @override
  String get toolZakatSubtitle => 'احسب زكاة مالك بسهولة';
  @override
  String get toolAsmaTitle => 'أسماء الله الحسنى';
  @override
  String get toolAsmaSubtitle => 'الأسماء التسعة والتسعون ومعانيها';
  @override
  String get toolRamadanTitle => 'رفيق رمضان';
  @override
  String get toolRamadanSubtitle => 'عد تنازلي للسحور والإفطار، وتتبع الصيام';
  @override
  String get toolDuasTitle => 'أدعيتي';
  @override
  String get toolDuasSubtitle => 'احفظ أدعيتك الخاصة';
  @override
  String get toolMosqueTitle => 'المساجد والمطاعم الحلال القريبة';
  @override
  String get toolMosqueSubtitle => 'بحث مجاني عبر بيانات OpenStreetMap';
  @override
  String get hadithTitle => 'الأربعون النووية';
  @override
  String get hadithSubtitle => 'مجموعة مختصرة من الأحاديث الجامعة لأصول الدين';
  @override
  String get hadithLoadError => 'تعذر تحميل الأحاديث. تأكد من اتصال الإنترنت.';
  @override
  String get hadithRetry => 'إعادة المحاولة';
  @override
  String hadithNumberLabel(Object number) => 'الحديث {number}'.replaceAll('{number}', number.toString());
  @override
  String get hadithSearchHint => 'ابحث في الأحاديث';
  @override
  String get hadithNoResults => 'لا توجد نتائج';
  @override
  String get hadithCopiedSnackbar => 'تم نسخ الحديث';
  @override
  String get hadithAddToFavoritesLabel => 'إضافة للمفضلة';
  @override
  String get hadithRemoveFromFavoritesLabel => 'إزالة من المفضلة';
  @override
  String get hadithCopyTooltip => 'نسخ الحديث';
  @override
  String get hadithTranslationNote => 'عرض بالعربية والإنجليزية — لا تتوفر ترجمة ألمانية لهذه المجموعة بعد';
  @override
  String get toolHadithTitle => 'الأربعون النووية';
  @override
  String get toolHadithSubtitle => 'مجموعة الأحاديث الأربعين النووية بشرحها';
  @override
  String get homeHadithOfTheDay => 'حديث اليوم';
  @override
  String get homeShareHadith => 'مشاركة الحديث';
  @override
  String get homeHadithSource => 'المصدر: الأربعون النووية';
  @override
  String get toolKhatmaTitle => 'متابعة الختمة';
  @override
  String get toolKhatmaSubtitle => 'خطّط لختم القرآن وتابع تقدمك';
  @override
  String get khatmaTrackerTitle => 'متابعة الختمة';
  @override
  String get khatmaNoPlanTitle => 'ابدأ رحلة ختمتك';
  @override
  String get khatmaNoPlanBody => 'حدّد تاريخاً مستهدفاً لختم القرآن الكريم، وسنساعدك على الالتزام بخطتك';
  @override
  String get khatmaChooseDuration => 'اختر المدة';
  @override
  String get khatmaDuration7Days => '٥ أيام';
  @override
  String get khatmaDuration30Days => '٣٠ يوماً';
  @override
  String get khatmaDuration60Days => '٦٠ يوماً';
  @override
  String get khatmaDuration90Days => '٩٠ يوماً';
  @override
  String get khatmaCustomDate => 'اختر تاريخاً مخصصاً';
  @override
  String khatmaProgressLabel(Object completed, Object total) => '{completed} من {total} سورة'.replaceAll('{completed}', completed.toString()).replaceAll('{total}', total.toString());
  @override
  String get khatmaDaysElapsed => 'الأيام المنقضية';
  @override
  String get khatmaDaysRemaining => 'الأيام المتبقية';
  @override
  String get khatmaTargetDate => 'التاريخ المستهدف';
  @override
  String get khatmaOnTrack => 'أنت على المسار الصحيح — واصل!';
  @override
  String get khatmaBehindSchedule => 'أنت متأخر قليلاً عن الخطة';
  @override
  String khatmaPaceNeeded(Object count) => 'اقرأ حوالي {count} سورة/يوم لتنتهي في الموعد'.replaceAll('{count}', count.toString());
  @override
  String get khatmaCompletedCelebration => 'الحمد لله! أتممت ختمتك 🎉';
  @override
  String get khatmaContinueReading => 'متابعة القراءة';
  @override
  String get khatmaEditPlan => 'تغيير التاريخ المستهدف';
  @override
  String get khatmaResetPlanTitle => 'إعادة تعيين خطة الختمة';
  @override
  String get khatmaResetPlanBody => 'سيؤدي هذا إلى مسح خطتك وتقدم قراءتك لبدء ختمة جديدة. لا يمكن التراجع عن هذا.';
  @override
  String get khatmaResetPlanConfirm => 'إعادة التعيين';
  @override
  String get khatmaPlanReset => 'بدأت ختمة جديدة، بالتوفيق! 🌟';
  @override
  String get settingsRemindMeFor => 'ذكّرني بـ';
  @override
  String get settingsNotifyAtPrayerTime => 'التنبيه عند دخول الوقت';
  @override
  String get settingsNotifyAtPrayerTimeSubtitle => 'احصل على تنبيه بمجرد دخول وقت الصلاة';
  @override
  String get settingsPostPrayerReminder => 'تذكير بالصلاة';
  @override
  String get settingsPostPrayerReminderSubtitle => 'تذكير لطيف إن لم تُسجّل الصلاة كمؤداة';
  @override
  String settingsPostPrayerReminderMinutesLabel(Object minutes) => 'بعد {minutes} دقيقة'.replaceAll('{minutes}', minutes.toString());
  @override
  String get settingsReminderOff => 'إيقاف';
  @override
  String prayerTimeNowBody(Object prayer) => 'حان الآن وقت صلاة {prayer}'.replaceAll('{prayer}', prayer.toString());
  @override
  String postPrayerReminderBody(Object prayer) => 'هل صلّيت {prayer} بعد؟'.replaceAll('{prayer}', prayer.toString());
  @override
  String get settingsMoreReminders => 'تذكيرات إضافية';
  @override
  String get settingsFridayReminder => 'تذكير الجمعة';
  @override
  String get settingsFridayReminderSubtitle => 'تذكير أسبوعي بصلاة الجمعة وقراءة سورة الكهف';
  @override
  String get settingsMorningAzkarReminder => 'أذكار الصباح';
  @override
  String get settingsMorningAzkarReminderSubtitle => 'تذكير يومي لقراءة أذكار الصباح';
  @override
  String get settingsEveningAzkarReminder => 'أذكار المساء';
  @override
  String get settingsEveningAzkarReminderSubtitle => 'تذكير يومي لقراءة أذكار المساء';
  @override
  String get settingsDailyWirdReminder => 'الورد اليومي';
  @override
  String get settingsDailyWirdReminderSubtitle => 'تذكير يومي لإتمام وردك من القرآن';
  @override
  String get settingsSleepAzkarReminder => 'أذكار النوم';
  @override
  String get settingsSleepAzkarReminderSubtitle => 'تذكير ليلي لقراءة أذكار النوم';
  @override
  String get reminderFridayBody => 'جمعة مباركة! لا تنسَ قراءة سورة الكهف اليوم 🕌';
  @override
  String get reminderMorningAzkarBody => 'حان وقت أذكار الصباح 🌞';
  @override
  String get reminderEveningAzkarBody => 'حان وقت أذكار المساء 🌇';
  @override
  String get reminderDailyWirdBody => 'هل أتممت وردك من القرآن اليوم؟ 📖';
  @override
  String get reminderSleepAzkarBody => 'قبل أن تنام، اقرأ أذكار النوم 🌙';
  @override
  String get khatmaMyPlans => 'خطط ختمي';
  @override
  String get khatmaStartNewPlan => 'ابدأ ختمة جديدة';
  @override
  String get khatmaPlanLabelHint => 'اسم هذه الختمة (اختياري)';
  @override
  String khatmaBehindByCount(Object count) => 'متأخر {count} سورة عن الخطة'.replaceAll('{count}', count.toString());
  @override
  String khatmaNewPaceLabel(Object count) => 'الهدف اليومي الجديد: {count} سورة/يوم'.replaceAll('{count}', count.toString());
  @override
  String get khatmaDeletePlanTitle => 'حذف هذه الختمة؟';
  @override
  String get khatmaDeletePlanBody => 'سيؤدي هذا إلى حذف الخطة ومتابعتها. لا يمكن التراجع عن هذا.';
  @override
  String get khatmaDeletePlanConfirm => 'حذف';
  @override
  String khatmaDefaultPlanLabel(Object number) => 'ختمة رقم {number}'.replaceAll('{number}', number.toString());
  @override
  String get khatmaAddAnother => 'أضف ختمة أخرى';
  @override
  String get toolInsightsTitle => 'إحصائيات وردي';
  @override
  String get toolInsightsSubtitle => 'تابع إحصائيات عباداتك الأسبوعية واتجاهاتها';
  @override
  String get insightsTitle => 'إحصائيات وردي';
  @override
  String get insightsThisWeek => 'هذا الأسبوع';
  @override
  String get insightsQuranPages => 'صفحات القرآن';
  @override
  String get insightsAzkarCompleted => 'الأذكار المكتملة';
  @override
  String get insightsPrayers => 'الصلوات';
  @override
  String get insightsTasbeeh => 'التسبيح';
  @override
  String get insightsCurrentStreak => 'التتابع الحالي';
  @override
  String insightsDaysCount(Object count) => '{count} يوم'.replaceAll('{count}', count.toString());
  @override
  String get insightsWeeklyActivity => 'النشاط الأسبوعي';
  @override
  String get insightsBestDay => 'أفضل يوم';
  @override
  String get insightsMostConsistent => 'الأكثر انتظاماً';
  @override
  String get insightsWeekComparisonTitle => 'هذا الأسبوع مقابل الأسبوع الماضي';
  @override
  String insightsImproved(Object percent) => 'أكثر نشاطًا بنسبة {percent}% عن الأسبوع الماضي'.replaceAll('{percent}', percent.toString());
  @override
  String insightsDeclined(Object percent) => 'أقل نشاطًا بنسبة {percent}% عن الأسبوع الماضي'.replaceAll('{percent}', percent.toString());
  @override
  String get insightsFirstActiveWeek => 'أول أسبوع نشط لك — واصل!';
  @override
  String get insightsNoActivityYet => 'لم يتم تسجيل أي نشاط بعد هذا الأسبوع';
  @override
  String get insightsSameAsLastWeek => 'نفس مستوى النشاط كالأسبوع الماضي';
  @override
  String get insightsNoBestDayYet => 'لا يوجد نشاط كافٍ بعد';
  @override
  String get toolMyWirdiTitle => 'وردي';
  @override
  String get toolMyWirdiSubtitle => 'تابع أداءك اليوم في كل عباداتك';
  @override
  String get myWirdiTitle => 'وردي';
  @override
  String get myWirdiToday => 'اليوم';
  @override
  String get myWirdiCompleted => 'الحمد لله! أتممت وردك اليوم 🎉';
  @override
  String myWirdiRemaining(Object percent) => 'تبقى {percent}% لإتمام وردك اليوم'.replaceAll('{percent}', percent.toString());
  @override
  String get myWirdiPersonalDua => 'دعاء شخصي';
  @override
  String get myWirdiDuaDone => 'تم قراءته اليوم';
  @override
  String get myWirdiDuaNotYet => 'لم يُقرأ بعد اليوم';
  @override
  String get homeMyWirdiCardTitle => 'وردي اليوم';
  @override
  String get homeQuickQibla => 'القبلة';
  @override
  String get qiblaDistanceLabel => 'المسافة إلى مكة';
  @override
  String qiblaDistanceValue(Object km) => '{km} كم'.replaceAll('{km}', km.toString());
  @override
  String get achievementStreak3Title => 'بداية الطريق';
  @override
  String get achievementStreak3Desc => 'وصلت إلى تتابع 3 أيام في الورد';
  @override
  String get achievementStreak7Title => 'أسبوع قوي';
  @override
  String get achievementStreak7Desc => 'وصلت إلى تتابع 7 أيام في الورد';
  @override
  String get achievementStreak30Title => 'عادة راسخة';
  @override
  String get achievementStreak30Desc => 'وصلت إلى تتابع 30 يومًا في الورد';
  @override
  String get achievementStreak100Title => 'لا يُوقف';
  @override
  String get achievementStreak100Desc => 'وصلت إلى تتابع 100 يوم في الورد';
  @override
  String get achievementQuran10Title => 'الخطوات الأولى';
  @override
  String get achievementQuran10Desc => 'أكملت 10% من القرآن';
  @override
  String get achievementQuran25Title => 'ربع الطريق';
  @override
  String get achievementQuran25Desc => 'أكملت 25% من القرآن';
  @override
  String get achievementQuran50Title => 'منتصف الطريق';
  @override
  String get achievementQuran50Desc => 'أكملت 50% من القرآن';
  @override
  String get achievementQuran100Title => 'ختم القرآن';
  @override
  String get achievementQuran100Desc => 'أكملت القرآن الكريم كاملاً';
  @override
  String get achievementKhatma1Title => 'أول ختمة';
  @override
  String get achievementKhatma1Desc => 'أتممت أول ختمة لك';
  @override
  String get achievementKhatma3Title => 'محب الختمات';
  @override
  String get achievementKhatma3Desc => 'أتممت 3 ختمات';
  @override
  String get achievementPages50Title => 'محب القراءة';
  @override
  String get achievementPages50Desc => 'قرأت 50 صفحة إجمالاً';
  @override
  String get achievementPages200Title => 'قارئ مُلتزم';
  @override
  String get achievementPages200Desc => 'قرأت 200 صفحة إجمالاً';
  @override
  String get achievementPages604Title => 'مصحف كامل';
  @override
  String get achievementPages604Desc => 'قرأت 604 صفحات -- مصحف كامل';
  @override
  String get achievementAzkar50Title => 'مبتدئ في الذكر';
  @override
  String get achievementAzkar50Desc => 'أكملت 50 ذكرًا';
  @override
  String get achievementAzkar500Title => 'خبير في الذكر';
  @override
  String get achievementAzkar500Desc => 'أكملت 500 ذكر';
  @override
  String get achievementTasbeeh100Title => 'أول تسبيح';
  @override
  String get achievementTasbeeh100Desc => 'سبّحت 100 مرة';
  @override
  String get achievementTasbeeh1000Title => 'محب التسبيح';
  @override
  String get achievementTasbeeh1000Desc => 'سبّحت 1,000 مرة';
  @override
  String get achievementPrayers50Title => 'مصلٍّ منتظم';
  @override
  String get achievementPrayers50Desc => 'سجّلت 50 صلاة كمؤداة';
  @override
  String get achievementPrayers350Title => 'بطل الصلاة';
  @override
  String get achievementPrayers350Desc => 'سجّلت 350 صلاة كمؤداة';
  @override
  String get achievementFavorites10Title => 'جامع';
  @override
  String get achievementFavorites10Desc => 'حفظت 10 عناصر في المفضلة';
  @override
  String get achievementsTitle => 'الإنجازات';
  @override
  String achievementsUnlockedCount(Object unlocked, Object total) => '{unlocked} من {total} مُنجَز'.replaceAll('{unlocked}', unlocked.toString()).replaceAll('{total}', total.toString());
  @override
  String get toolAchievementsTitle => 'الإنجازات';
  @override
  String get toolAchievementsSubtitle => 'تابع إنجازاتك وأوسمتك';
  @override
  String get quranShareAsImageTooltip => 'مشاركة كصورة';
  @override
  String get ayahShareTitle => 'مشاركة الآية';
  @override
  String get ayahShareIncludeTranslation => 'تضمين الترجمة';
  @override
  String get ayahShareButton => 'مشاركة';
  @override
  String get myDuasDialogTitleNew => 'دعاء جديد';
  @override
  String get myDuasDialogTitleEdit => 'تعديل الدعاء';
  @override
  String get myDuasTitleFieldLabel => 'عنوان (اختياري)';
  @override
  String get myDuasTextFieldLabel => 'نص الدعاء';
  @override
  String get myDuasEmptyTitle => 'لم تُضِف أي دعاء بعد';
  @override
  String get myDuasEmptySubtitle => 'اضغط + لإضافة دعائك الخاص';
  @override
  String get ramadanCountdownToSuhoor => 'الوقت المتبقي على السحور (أذان الفجر)';
  @override
  String get ramadanCountdownToIftar => 'الوقت المتبقي على الإفطار (أذان المغرب)';
  @override
  String get ramadanCountdownToSuhoorTomorrow => 'الوقت المتبقي على السحور غدًا';
  @override
  String get ramadanLoadError => 'تعذر تحميل مواقيت الصلاة اللازمة للسحور والإفطار.';
  @override
  String ramadanDayOfRamadan(Object day) => 'اليوم {day} من رمضان'.replaceAll('{day}', day.toString());
  @override
  String get ramadanFastingToday => 'صائم اليوم';
  @override
  String get ramadanFastingSubtitle => 'سجّل صيامك اليوم لمتابعة تقدمك';
  @override
  String get ramadanDaysLoggedTitle => 'أيام الصيام المسجّلة هذا الشهر';
  @override
  String get ramadanHijriFootnote => 'ملاحظة: التاريخ الهجري هنا تقديري حسابي وقد يختلف يومًا واحدًا عن الإعلان الرسمي لبداية الشهر في بلدك.';
  @override
  String get mushafTitle => 'المصحف';
  @override
  String get mushafStopAudioTooltip => 'إيقاف الصوت';
  @override
  String get mushafLoadError => 'تعذر تحميل صفحات المصحف. تأكد من اتصال الإنترنت.';
  @override
  String get mushafTapAyahHint => 'اضغط على أي آية لتشغيل تلاوتها';
  @override
  String mushafPageNumber(Object number) => 'صفحة {number}'.replaceAll('{number}', number.toString());
  @override
  String get mosqueLocationServiceDisabled => 'خدمة الموقع غير مفعّلة على جهازك.';
  @override
  String get mosqueLocationPermissionNeeded => 'التطبيق يحتاج إذن الوصول إلى الموقع للبحث عن أماكن قريبة.';
  @override
  String get mosqueSearchError => 'تعذر البحث عن الأماكن القريبة — تحقق من اتصال الإنترنت.';
  @override
  String get mosqueTabMosques => 'مساجد';
  @override
  String get mosqueTabHalalRestaurants => 'مطاعم حلال';
  @override
  String get mosqueNoMosquesFound => 'لم يتم العثور على مساجد قريبة في بيانات OpenStreetMap';
  @override
  String get mosqueNoHalalFound => 'لم يتم العثور على مطاعم موسومة "حلال" قريبة — بيانات المطاعم الحلال في OpenStreetMap غير مكتملة في كثير من المناطق';
  @override
  String get onboardingGoalTitle => 'كم تريد أن تقرأ من القرآن يوميًا؟';
  @override
  String get onboardingGoalLight => 'خفيف';
  @override
  String get onboardingGoalLightDesc => 'صفحتان يوميًا';
  @override
  String get onboardingGoalRegular => 'معتاد';
  @override
  String get onboardingGoalRegularDesc => '5 صفحات يوميًا';
  @override
  String get onboardingGoalAdvanced => 'متقدم';
  @override
  String get onboardingGoalAdvancedDesc => '10 صفحات يوميًا';
  @override
  String get onboardingEnableReminders => 'تفعيل التذكيرات اليومية';
  @override
  String get onboardingEnableRemindersDesc => 'احصل على تذكير لوردك وأذكارك اليومية';
  @override
  String get toolBookmarksTitle => 'الإشارات المرجعية';
  @override
  String get toolBookmarksSubtitle => 'احفظ آيات مع ملاحظات وتصنيفات';
  @override
  String get bookmarksTitle => 'الإشارات المرجعية';
  @override
  String get bookmarksEmptyTitle => 'لا توجد إشارات مرجعية بعد';
  @override
  String get bookmarksEmptySubtitle => 'اضغط على أيقونة الإشارة المرجعية على أي آية أثناء القراءة لحفظها هنا';
  @override
  String get bookmarkAddTooltip => 'إضافة إشارة مرجعية';
  @override
  String get bookmarkDialogTitle => 'إضافة إشارة مرجعية';
  @override
  String get bookmarkNoteLabel => 'ملاحظة (اختيارية)';
  @override
  String get bookmarkCategoryLabel => 'التصنيف';
  @override
  String get bookmarkCategoryRamadan => 'رمضان';
  @override
  String get bookmarkCategoryDua => 'دعاء';
  @override
  String get bookmarkCategoryFamily => 'العائلة';
  @override
  String get bookmarkCategoryStudy => 'دراسة';
  @override
  String get bookmarkCategoryPersonal => 'شخصي';
  @override
  String get bookmarkCategoryOther => 'الكل';
  @override
  String get bookmarkSavedSnackbar => 'تم حفظ الإشارة المرجعية';
  @override
  String get bookmarkDeleteConfirmTitle => 'حذف هذه الإشارة المرجعية؟';
  @override
  String get bookmarkDeleteConfirmBody => 'لا يمكن التراجع عن هذا.';
  @override
  String get bookmarkDeleteConfirm => 'حذف';
  @override
  String get settingsPrivacyCenter => 'مركز الخصوصية';
  @override
  String get settingsPrivacyCenterSubtitle => 'اطلع على البيانات المخزّنة، صّدّرها أو احذفها';
  @override
  String get privacyCenterTitle => 'مركز الخصوصية';
  @override
  String get privacyCenterIntro => 'بيانات عبادتك تخصّك.';
  @override
  String get privacyCenterLocalDataTitle => 'ما الذي يُحفظ محليًا';
  @override
  String get privacyCenterLocalDataBody => 'تقدم القراءة، أعداد الأذكار/التسبيح، المفضلة، الإشارات المرجعية، الأدعية الشخصية، خطط الختمة، الإنجازات، والإعدادات — تُحفظ فقط على هذا الجهاز باستخدام SharedPreferences. لا يُرفع شيء إلى أي خادم.';
  @override
  String get privacyCenterLocationTitle => 'استخدام الموقع';
  @override
  String get privacyCenterLocationBody => 'يُستخدم موقع جهازك فقط لحساب مواقيت الصلاة، وتحديد اتجاه القبلة، والبحث عن المساجد/المطاعم الحلال القريبة. لا يُحفظ أو يُشارك مع أي خدمة أخرى.';
  @override
  String get privacyCenterNoAccountsTitle => 'لا حسابات أو إعلانات أو تتبّع';
  @override
  String get privacyCenterNoAccountsBody => 'لا يتطلب التطبيق حسابًا، ولا يعرض إعلانات، ولا يستخدم أي أدوات تحليل أو تتبّع.';
  @override
  String get privacyCenterExportButton => 'تصدير بياناتي';
  @override
  String get privacyCenterExportSuccessSnackbar => 'تم تجهيز بياناتك للتصدير';
  @override
  String get privacyCenterDeleteButton => 'حذف بياناتي';
  @override
  String get privacyCenterDeleteConfirmTitle => 'حذف جميع البيانات المحلية؟';
  @override
  String get privacyCenterDeleteConfirmBody => 'سيؤدي هذا إلى مسح جميع تقدمك ومفضلاتك وإشاراتك المرجعية وأدعيتك وإنجازاتك وإعداداتك نهائيًا من هذا الجهاز. لا يمكن التراجع عن هذا.';
  @override
  String get privacyCenterDeleteConfirmButton => 'حذف كل شيء';
  @override
  String get privacyCenterDeleteDoneSnackbar => 'تم حذف جميع البيانات المحلية';
  @override
  String get privacyCenterViewPolicy => 'عرض سياسة الخصوصية الكاملة';
  @override
  String homeRamadanBannerTitle(Object day) => 'اليوم {day} من رمضان'.replaceAll('{day}', day.toString());
  @override
  String get homeRamadanBannerSubtitle => 'اضغط لفتح رفيق رمضان';
  @override
  String get ramadanLast10NightsTitle => 'العشر الأواخر';
  @override
  String get ramadanLast10NightsBody => 'هذه الليالي الأخيرة من رمضان هي الأكثر بركة — أكثر من العبادة والقرآن والدعاء.';
  @override
  String get ramadanPossibleLaylatAlQadr => 'قد تكون هذه الليلة هي ليلة القدر';
  @override
  String get commonEditTooltip => 'تعديل';
  @override
  String get commonDeleteTooltip => 'حذف';
  @override
  String get commonSettingsTooltip => 'الإعدادات';
  @override
  String get commonDecreaseTooltip => 'تقليل';
  @override
  String get commonIncreaseTooltip => 'زيادة';
  @override
  String get commonShareTooltip => 'مشاركة';
  @override
  String get commonRefreshTooltip => 'تحديث';
  @override
  String get homeNextPrayerCardLabel => 'موعد الصلاة التالية';
  @override
  String get homeWeeklyInsightsCardLabel => 'الإحصائيات الأسبوعية';
  @override
  String get settingsTajweedColoring => 'تلوين التجويد';
  @override
  String get settingsTajweedColoringSubtitle => 'تلوين النص القرآني حسب أحكام التجويد';
  @override
  String get settingsBackupRestore => 'النسخ الاحتياطي والاستعادة';
  @override
  String get settingsExportBackup => 'تصدير نسخة احتياطية';
  @override
  String get settingsExportBackupSubtitle => 'حفظ تقدمك وإعداداتك في ملف';
  @override
  String get settingsImportBackup => 'استيراد نسخة احتياطية';
  @override
  String get settingsImportBackupSubtitle => 'استعادة البيانات من ملف محفوظ مسبقًا';
  @override
  String get settingsImportSuccess => 'تم استعادة البيانات بنجاح! يرجى إعادة تشغيل التطبيق.';
  @override
  String get settingsImportError => 'فشل استيراد النسخة الاحتياطية. تأكد من صحة الملف.';
  @override
  String get tajweedLegendTitle => 'أحكام التجويد';
  @override
  String get tajweedLegendIntro => 'دليل الألوان لأحكام التجويد في القرآن الكريم:';
  @override
  String get tajweedQalqalahLabel => 'قلقلة';
  @override
  String get tajweedGhunnahLabel => 'غنة';
  @override
  String get tajweedIkhfaLabel => 'إخفاء';
  @override
  String get tajweedIdghamGhunnahLabel => 'إدغام بغنة';
  @override
  String get tajweedIdghamNoGhunnahLabel => 'إدغام بغير غنة';
  @override
  String get tajweedIqlabLabel => 'إقلاب';
  @override
  String get tajweedLegendClose => 'إغلاق';
  @override
  String get radioTitle => 'الراديو الإسلامي';
  @override
  String get radioSubtitle => 'استمع إلى القرآن والمحاضرات مباشرةً';
  @override
  String get radioAll => 'الكل';
  @override
  String get radioNowPlaying => 'يُشغَّل الآن';
  @override
  String get radioFavorites => 'المفضلة';
  @override
  String get radioNoFavorites => 'لا توجد محطات مفضلة بعد';
  @override
  String get radioNoStations => 'لا توجد محطات في هذه الفئة';
  @override
  String get radioAddFavorite => 'إضافة إلى المفضلة';
  @override
  String get radioRemoveFavorite => 'إزالة من المفضلة';
  @override
  String get radioSleepTimer => 'مؤقت النوم';
  @override
  String get radioSleepTimerSubtitle => 'يوقف الراديو تلقائياً بعد الوقت المحدد';
  @override
  String get radioSleepTimerCancel => 'إلغاء المؤقت';
  @override
  String get radioMinutes => 'دقيقة';
  @override
  String radioSleepTimerActive(Object minutes) => 'يتوقف خلال {minutes} دقيقة'.replaceAll('{minutes}', minutes.toString());
  @override
  String get radioOfficial => 'رسمي';
  @override
  String get radioStreamError => 'تعذّر الاتصال بالمحطة. تحقق من اتصالك.';
}
class _AppLocalizations_en extends AppLocalizations {
  _AppLocalizations_en() : super('en');
  @override
  String get appTitle => 'Wirdi';
  @override
  String get navHome => 'Home';
  @override
  String get navQuran => 'Quran';
  @override
  String get navAzkar => 'Azkar';
  @override
  String get navPrayer => 'Prayer';
  @override
  String get navTasbeeh => 'Tasbeeh';
  @override
  String get navMore => 'More';
  @override
  String get commonCancel => 'Cancel';
  @override
  String get commonSave => 'Save';
  @override
  String get commonDelete => 'Delete';
  @override
  String get commonClose => 'Close';
  @override
  String get commonOk => 'OK';
  @override
  String get commonBack => 'Back';
  @override
  String get commonNext => 'Next';
  @override
  String get commonSkip => 'Skip';
  @override
  String get commonDone => 'Done';
  @override
  String get commonRetry => 'Retry';
  @override
  String get commonShare => 'Share';
  @override
  String get commonSearch => 'Search';
  @override
  String get commonEdit => 'Edit';
  @override
  String get commonConfirm => 'Confirm';
  @override
  String get commonLoading => 'Loading…';
  @override
  String get commonError => 'Something went wrong';
  @override
  String get commonYes => 'Yes';
  @override
  String get commonNo => 'No';
  @override
  String get languageName_ar => 'Arabic';
  @override
  String get languageName_en => 'English';
  @override
  String get languageName_de => 'German';
  @override
  String get languageName_tr => 'Turkish';
  @override
  String get settingsLanguage => 'Language';
  @override
  String get settingsLanguageSystem => 'System default';
  @override
  String get settingsLanguageSubtitle => 'Choose the app\'s display language';
  @override
  String get asmaUlHusnaTitle => 'The 99 Names of Allah';
  @override
  String get sourcesLicensesTitle => 'Sources & Licenses';
  @override
  String get sourcesOssLicensesButton => 'Open-source package licenses';
  @override
  String get aboutTitle => 'About';
  @override
  String get aboutTagline => 'Your daily companion for dhikr and Quran';
  @override
  String get aboutVersion => 'Version 1.0.0';
  @override
  String get aboutBody => 'Wirdi is a daily Islamic companion app that helps you keep up with Quran reading, your azkar, prayer times, and tasbeeh, all in one calm, simple design. The app has no ads or tracking, and all your data stays on your device.';
  @override
  String get onboardingSkip => 'Skip';
  @override
  String get onboardingSlide1 => 'Make the Quran part of your day';
  @override
  String get onboardingSlide2 => 'Track your daily wird and build a habit';
  @override
  String get onboardingSlide3 => 'Remind your heart before time reminds you';
  @override
  String get onboardingStart => 'Start your journey';
  @override
  String get onboardingNext => 'Next';
  @override
  String get privacyPolicyTitle => 'Privacy Policy';
  @override
  String get favoritesTitle => 'Favorites';
  @override
  String get favoritesTabAyahs => 'Quran Verses';
  @override
  String get favoritesTabAzkar => 'Azkar';
  @override
  String get favoritesLoadError => 'Couldn\'t load favorites';
  @override
  String get favoritesEmptyAyahs => 'No favorite verses yet';
  @override
  String get favoritesEmptyAzkar => 'No favorite azkar yet';
  @override
  String favoritesAyahSubtitle(Object surahName, Object ayahNumber) => 'Surah {surahName} - Ayah {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get zakatTitle => 'Zakat Calculator';
  @override
  String get zakatNisabHint => 'Enter today\'s nisab value (at the current market price of gold or silver) before calculating, since the nisab price changes daily and can\'t be hardcoded in the app. You can check with your local fatwa authority or look up the current gold price (85 grams of gold, or its equivalent in silver).';
  @override
  String get zakatCurrentNisab => 'Current nisab value';
  @override
  String get zakatableAssets => 'Zakatable assets';
  @override
  String get zakatCash => 'Cash and equivalents (bank, wallet)';
  @override
  String get zakatGoldSilver => 'Gold and silver (market value)';
  @override
  String get zakatInvestments => 'Investments and stocks';
  @override
  String get zakatBusiness => 'Trade goods (merchandise for sale)';
  @override
  String get zakatReceivables => 'Debts owed to you (expected to be recovered)';
  @override
  String get zakatOwedDebts => 'Debts you owe';
  @override
  String get zakatCurrentDebts => 'Debts and bills currently owed by you';
  @override
  String get zakatNetWealth => 'Net zakatable wealth';
  @override
  String get zakatEnterNisabFirst => 'Enter the nisab value first';
  @override
  String get zakatBelowNisab => 'Your wealth is below nisab — no zakat is due';
  @override
  String get zakatDue => 'Zakat due (2.5%)';
  @override
  String get zakatFootnote => 'Note: this calculator gives a general estimate at the standard rate (2.5%) on wealth that has been held for a full lunar year and reached nisab. Zakat on crops, livestock, and minerals follows different rules not covered here. For specific situations, it\'s best to ask a qualified scholar.';
  @override
  String get settingsTitle => 'Settings';
  @override
  String get settingsAppearance => 'Appearance';
  @override
  String get settingsMode => 'Mode';
  @override
  String get settingsModeLight => 'Light';
  @override
  String get settingsModeDark => 'Dark';
  @override
  String get settingsModeAuto => 'Automatic';
  @override
  String get settingsFontSize => 'Font size';
  @override
  String get settingsFontPreview => 'Sample text to preview font size';
  @override
  String get settingsShowTransliteration => 'Show Latin transliteration';
  @override
  String get settingsShowTransliterationSubtitle => 'Helpful for those learning to read — appears under every verse';
  @override
  String get settingsPrayerReminder => 'Prayer Reminder';
  @override
  String get settingsPrayerReminderEnable => 'Enable upcoming prayer reminder';
  @override
  String get settingsPrayerReminderSubtitle => 'The reminder only works while the app is open';
  @override
  String get settingsPrayerReminderMinutesBefore => 'Remind before prayer by (minutes)';
  @override
  String settingsPrayerReminderMinutesLabel(Object minutes) => '{minutes} min'.replaceAll('{minutes}', minutes.toString());
  @override
  String get settingsPrayerReminderMethod => 'Reminder method';
  @override
  String get settingsReminderBanner => 'Notification only';
  @override
  String get settingsReminderBeep => 'Alert tone';
  @override
  String get settingsReminderAdhan => 'Full adhan';
  @override
  String get settingsTestTone => 'Test tone';
  @override
  String get settingsAdhanSound => 'Adhan sound';
  @override
  String get settingsStopPreview => 'Stop preview';
  @override
  String get settingsListen => 'Listen';
  @override
  String get settingsReminderNote => 'Note: the app sends a real notification even when it\'s closed, but you\'ll need to grant notification permission (and exact-alarm permission on Android 12+) when you turn this on. Today\'s and tomorrow\'s reminders are rescheduled every time you open the Home or Prayer Times screen.';
  @override
  String get settingsDailyWird => 'Daily Wird';
  @override
  String get settingsDailyWirdTarget => 'Daily target (pages/surahs)';
  @override
  String settingsDailyWirdPerDay(Object count) => '{count} per day'.replaceAll('{count}', count.toString());
  @override
  String get settingsAboutSupport => 'About & Support';
  @override
  String get settingsAbout => 'About';
  @override
  String get settingsSourcesLicenses => 'Sources & Licenses';
  @override
  String get settingsPrivacyPolicy => 'Privacy Policy';
  @override
  String get settingsDataManagement => 'Data Management';
  @override
  String get settingsQuranLastUpdate => 'Quran last updated';
  @override
  String get settingsAzkarLastUpdate => 'Azkar last updated';
  @override
  String get settingsNotDownloadedYet => 'Not downloaded yet';
  @override
  String get settingsUpdateNow => 'Update data now';
  @override
  String get settingsRequiresInternet => 'Requires an internet connection';
  @override
  String get settingsDataUpdated => 'Quran and azkar data updated';
  @override
  String get settingsDownloadedAudio => 'Downloaded recitations for offline listening';
  @override
  String get settingsNoDownloadedAudio => 'No downloaded recitations';
  @override
  String settingsMbDownloaded(Object size) => '{size} MB downloaded'.replaceAll('{size}', size.toString());
  @override
  String get settingsDeleteAll => 'Delete all';
  @override
  String get settingsDeleteAllDownloadsTitle => 'Delete all downloaded recitations';
  @override
  String get settingsDeleteAllDownloadsBody => 'All downloaded audio files for every surah will be deleted. Listening will fall back to online streaming.';
  @override
  String get settingsResetKhatma => 'Reset Khatma progress';
  @override
  String get settingsResetKhatmaSubtitle => 'Start a fresh Khatma from scratch';
  @override
  String get settingsResetKhatmaBody => 'Every surah will be marked unread again to start a new Khatma. Your daily wird and favorites won\'t be affected.';
  @override
  String get settingsResetKhatmaConfirm => 'Reset';
  @override
  String get settingsKhatmaResetDone => 'A new Khatma has started, good luck! 🌿';
  @override
  String get settingsDeleteLocalData => 'Delete all local data';
  @override
  String get settingsDeleteLocalDataBody => 'Favorites, tasbeeh stats, daily wird progress, and all settings saved on this device will be deleted. This cannot be undone.';
  @override
  String get settingsLocalDataDeleted => 'All local data has been deleted';
  @override
  String get settingsPreviewFailed => 'Couldn\'t play the preview — check your connection';
  @override
  String get quranTranslationUnavailable => 'Translation unavailable for this verse';
  @override
  String get quranTranslationLoadFailed => 'Couldn\'t load the translation';
  @override
  String get quranTranslationRetry => 'Retry';
  @override
  String get quranTranslationSourceNote => 'Translation from QuranEnc.com';
  @override
  String get homeGreetingNight => 'Blessed night 🌙';
  @override
  String get homeGreetingMorning => 'Good morning 👋';
  @override
  String get homeGreetingAfternoon => 'Have a great day ☀️';
  @override
  String get homeGreetingEvening => 'Good evening 👋';
  @override
  String homeStreakDays(Object days) => 'Wird streak: {days} days 🔥'.replaceAll('{days}', days.toString());
  @override
  String get homeContinueToday => 'Keep up what you started today';
  @override
  String homeKhatmaProgress(Object percent) => 'Khatma progress: {percent}%'.replaceAll('{percent}', percent.toString());
  @override
  String get homeIslamicTools => 'Islamic Tools';
  @override
  String get homeNextPrayer => 'Next Prayer';
  @override
  String homeInLabel(Object countdown) => 'in {countdown}'.replaceAll('{countdown}', countdown.toString());
  @override
  String get homeCachedPrayerTimes => 'Last saved times (offline)';
  @override
  String get homeEnableLocationForPrayer => 'Enable location to see the next prayer';
  @override
  String get homeDailyWird => 'Daily Wird';
  @override
  String get homeWirdCompleted => 'You\'ve completed today\'s wird, may Allah bless you 🎉';
  @override
  String homeWirdProgress(Object pages, Object target) => '{pages} of {target} pages/surahs'.replaceAll('{pages}', pages.toString()).replaceAll('{target}', target.toString());
  @override
  String get homeContinueReading => 'Continue Reading';
  @override
  String get homeNoLastReading => 'No last reading position yet';
  @override
  String homeLastReadingSubtitle(Object surahName, Object ayahNumber) => 'Surah {surahName} — Ayah {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get homeFavorites => 'Favorites';
  @override
  String get homeNoFavoritesYet => 'No favorite items yet';
  @override
  String homeFavoritesSavedCount(Object count) => '{count} items saved'.replaceAll('{count}', count.toString());
  @override
  String get homeQuoteOfTheDay => 'Quote of the Day';
  @override
  String get homeThisWeek => 'This Week';
  @override
  String homeActiveDaysOf(Object active, Object total) => '{active} of {total} active days'.replaceAll('{active}', active.toString()).replaceAll('{total}', total.toString());
  @override
  String homeWirdTargetMetSummary(Object met, Object total) => 'You met the daily wird target on {met} of {total} days this week'.replaceAll('{met}', met.toString()).replaceAll('{total}', total.toString());
  @override
  String get homeQuickActions => 'Quick Actions';
  @override
  String get homeQuickAzkar => 'Azkar';
  @override
  String get homeQuickTasbeeh => 'Tasbeeh';
  @override
  String get homeQuickPrayer => 'Prayer';
  @override
  String homeCompletionPercent(Object percent) => 'Completion {percent} percent'.replaceAll('{percent}', percent.toString());
  @override
  String homeDayNotYet(Object day) => '{day}: hasn\'t come yet'.replaceAll('{day}', day.toString());
  @override
  String homeDaySummary(Object day, Object pages, Object azkar, Object tasbeeh, Object prayers) => '{day}: {pages} pages, {azkar} azkar, {tasbeeh} tasbeeh, {prayers} prayers'.replaceAll('{day}', day.toString()).replaceAll('{pages}', pages.toString()).replaceAll('{azkar}', azkar.toString()).replaceAll('{tasbeeh}', tasbeeh.toString()).replaceAll('{prayers}', prayers.toString());
  @override
  String get dayNameSat => 'Sat';
  @override
  String get dayNameSun => 'Sun';
  @override
  String get dayNameMon => 'Mon';
  @override
  String get dayNameTue => 'Tue';
  @override
  String get dayNameWed => 'Wed';
  @override
  String get dayNameThu => 'Thu';
  @override
  String get dayNameFri => 'Fri';
  @override
  String get prayerFajr => 'Fajr';
  @override
  String get prayerDhuhr => 'Dhuhr';
  @override
  String get prayerAsr => 'Asr';
  @override
  String get prayerMaghrib => 'Maghrib';
  @override
  String get prayerIsha => 'Isha';
  @override
  String get prayerTimesTitle => 'Prayer Times';
  @override
  String get prayerSetCityManually => 'Set city manually';
  @override
  String get prayerCityHint => 'Example: Cairo, Egypt';
  @override
  String get prayerSearch => 'Search';
  @override
  String prayerCityNotFound(Object city) => 'Couldn\'t find "{city}" — check the spelling and try again'.replaceAll('{city}', city.toString());
  @override
  String get prayerAvailabilityLocationDisabled => 'Location services are disabled on your device. Enable them, or set your city manually.';
  @override
  String get prayerAvailabilityPermissionDenied => 'The app needs location access to show accurate prayer times, or you can set your city manually.';
  @override
  String get prayerAvailabilityPermissionDeniedForever => 'Location permission was permanently denied. Enable it from system settings, or set your city manually.';
  @override
  String get prayerAvailabilityNetworkError => 'Couldn\'t connect to the internet and no saved prayer times were found.';
  @override
  String get prayerRetry => 'Retry';
  @override
  String get prayerUseGps => 'Use current location (GPS)';
  @override
  String get prayerRefresh => 'Refresh';
  @override
  String get prayerOfflineBanner => 'No connection — showing last saved times';
  @override
  String get prayerNextPrayerLabel => 'Next Prayer';
  @override
  String get prayerTimeRemaining => 'Time remaining';
  @override
  String prayerNotYetDue(Object prayer) => '{prayer} prayer time hasn\'t come yet'.replaceAll('{prayer}', prayer.toString());
  @override
  String prayerMarkedDone(Object prayer) => '{prayer} prayer marked as done'.replaceAll('{prayer}', prayer.toString());
  @override
  String prayerNotDoneYet(Object prayer) => '{prayer} prayer not done yet'.replaceAll('{prayer}', prayer.toString());
  @override
  String get prayerFootnote => 'Note: times are based on your location or selected city, using the AlAdhan service with the Egyptian calculation method.';
  @override
  String prayerReminderApproaching(Object prayer, Object minutes) => '{prayer} prayer is coming up in {minutes} minutes'.replaceAll('{prayer}', prayer.toString()).replaceAll('{minutes}', minutes.toString());
  @override
  String get tasbeehTitle => 'Tasbeeh';
  @override
  String get tasbeehResetToday => 'Reset today\'s count';
  @override
  String get tasbeehCustom => 'Custom phrase';
  @override
  String get tasbeehToday => 'Today';
  @override
  String get tasbeehTarget => 'Target';
  @override
  String get tasbeehPhraseTotal => 'Phrase total';
  @override
  String get tasbeehGrandTotal => 'Grand total';
  @override
  String tasbeehCounterLabel(Object phrase, Object count, Object target) => '{phrase} tasbeeh counter, currently {count} of {target}'.replaceAll('{phrase}', phrase.toString()).replaceAll('{count}', count.toString()).replaceAll('{target}', target.toString());
  @override
  String get tasbeehTapHint => 'Tap to count — long-press a custom phrase to delete it';
  @override
  String get tasbeehAddCustomTitle => 'Custom phrase';
  @override
  String get tasbeehPhraseTextLabel => 'Phrase text';
  @override
  String get tasbeehPhraseTextHint => 'Example: La hawla wa la quwwata illa billah';
  @override
  String get tasbeehTargetLabel => 'Target';
  @override
  String get tasbeehAdd => 'Add';
  @override
  String get tasbeehGlossSubhanallah => 'SubhanAllah — Glory be to Allah';
  @override
  String get tasbeehGlossAlhamdulillah => 'Alhamdulillah — Praise be to Allah';
  @override
  String get tasbeehGlossAllahuakbar => 'Allahu Akbar — Allah is the Greatest';
  @override
  String get tasbeehGlossLaIlaha => 'La ilaha illallah — There is no god but Allah';
  @override
  String get tasbeehGlossAstaghfirullah => 'Astaghfirullah — I seek Allah\'s forgiveness';
  @override
  String get tasbeehGlossSalawat => 'Allahumma salli ala Muhammad — O Allah, send blessings upon Muhammad';
  @override
  String get azkarDuasTitle => 'Azkar & Duas';
  @override
  String get azkarTabAzkar => 'Azkar';
  @override
  String get azkarTabDuas => 'Duas';
  @override
  String get azkarFavoritesTooltip => 'Favorites';
  @override
  String get azkarLoadError => 'Couldn\'t load azkar. Check your internet connection.';
  @override
  String get azkarSearchHint => 'Search azkar';
  @override
  String get azkarNoResults => 'No results';
  @override
  String azkarCategorySubtitle(Object count, Object completed) => '{count} azkar — {completed} completed today'.replaceAll('{count}', count.toString()).replaceAll('{completed}', completed.toString());
  @override
  String get azkarAllDoneInSection => 'You\'ve completed all azkar in this section 🌿';
  @override
  String get azkarShowCompleted => 'Show completed';
  @override
  String get azkarHideCompleted => 'Hide completed';
  @override
  String get azkarCompletedSnackbar => 'Well done 🌿 this dhikr is complete';
  @override
  String get azkarCopiedSnackbar => 'Dhikr copied — you can paste it to share';
  @override
  String get azkarPlusOne => '+1';
  @override
  String get azkarFavoritesTitle => 'Favorite Azkar';
  @override
  String get azkarNoFavoritesYet => 'No favorite azkar yet';
  @override
  String get azkarRetry => 'Retry';
  @override
  String get quranTitle => 'The Holy Quran';
  @override
  String get quranViewMushaf => 'View Mushaf';
  @override
  String get quranTabSurahs => 'Surahs';
  @override
  String get quranTabJuz => 'Juz';
  @override
  String get quranTabSearch => 'Search';
  @override
  String get quranTabFavorites => 'Favorites';
  @override
  String get quranLoadError => 'Couldn\'t load the Quran. Check your internet connection.';
  @override
  String get quranViewMode => 'View mode';
  @override
  String get quranMushafPagesLoadError => 'Couldn\'t load Mushaf pages — check your connection';
  @override
  String get quranViewAsMushafPages => 'View as Mushaf pages';
  @override
  String quranCompletionPercent(Object percent) => 'Quran completion {percent} percent'.replaceAll('{percent}', percent.toString());
  @override
  String get quranKhatmaProgress => 'Khatma progress';
  @override
  String get quranSearchSurahHint => 'Search by surah name or number';
  @override
  String quranSurahSubtitle(Object englishName, Object count) => '{englishName} - {count} ayahs'.replaceAll('{englishName}', englishName.toString()).replaceAll('{count}', count.toString());
  @override
  String quranJuzNumber(Object number) => 'Juz {number}'.replaceAll('{number}', number.toString());
  @override
  String quranJuzStartsFrom(Object surahName, Object ayahNumber) => 'Starts from Surah {surahName} - Ayah {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get quranSearchAyahHint => 'Search verse text';
  @override
  String get quranSearchMinChars => 'Type at least 2 characters to search';
  @override
  String quranAyahLocation(Object surahName, Object ayahNumber) => 'Surah {surahName} - Ayah {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get quranNoFavoriteAyahsYet => 'No favorite verses yet';
  @override
  String get quranChooseReciter => 'Choose Reciter';
  @override
  String get quranTafsirTimeoutError => 'Loading the tafsir took too long — the file is large (2.7 MB), try on a faster connection';
  @override
  String get quranTafsirLoadError => 'Couldn\'t load the tafsir — check your connection';
  @override
  String quranLastReadingSaved(Object surahName, Object ayahNumber) => 'Last reading saved: Surah {surahName} - Ayah {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String quranAyahCopyFormat(Object text, Object surahName, Object ayahNumber) => '{text} (Surah {surahName}: {ayahNumber})'.replaceAll('{text}', text.toString()).replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get quranAyahCopiedSnackbar => 'Verse copied';
  @override
  String get quranAddedToWird => 'This reading was added to your daily wird 🌿';
  @override
  String quranSurahAppBarTitle(Object name) => 'Surah {name}'.replaceAll('{name}', name.toString());
  @override
  String get quranViewAsMushafPageTooltip => 'View this surah as a Mushaf page';
  @override
  String quranChooseReciterTooltip(Object reciterName) => 'Choose reciter ({reciterName})'.replaceAll('{reciterName}', reciterName.toString());
  @override
  String get quranDecreaseFontTooltip => 'Decrease font size';
  @override
  String get quranIncreaseFontTooltip => 'Increase font size';
  @override
  String get quranAddToWirdTooltip => 'Add to daily wird';
  @override
  String quranAyahCountLabel(Object count) => '{count} ayahs'.replaceAll('{count}', count.toString());
  @override
  String get quranStopSurahRecitationLabel => 'Stop surah recitation';
  @override
  String get quranPlaySurahRecitationLabel => 'Play the whole surah\'s recitation';
  @override
  String get quranStopLabel => 'Stop';
  @override
  String get quranPlayWholeSurahLabel => 'Play whole surah';
  @override
  String get quranNoTafsirAvailable => 'No tafsir available for this verse';
  @override
  String get quranStopPlayingAyahLabel => 'Stop playing this verse';
  @override
  String quranPlayAyahLabel(Object number) => 'Play Ayah {number}'.replaceAll('{number}', number.toString());
  @override
  String get quranPlayAyahTooltip => 'Play verse';
  @override
  String get quranRepeatAyahTooltip => 'Repeat this verse';
  @override
  String get quranHideTafsirTooltip => 'Hide tafsir';
  @override
  String get quranShowTafsirTooltip => 'Show simplified tafsir';
  @override
  String get quranSaveAsLastReadingTooltip => 'Save as last reading';
  @override
  String get quranCopyAyahTooltip => 'Copy verse';
  @override
  String get quranRemoveFromFavoritesLabel => 'Remove from favorites';
  @override
  String get quranAddToFavoritesLabel => 'Add to favorites';
  @override
  String get quranRetry => 'Retry';
  @override
  String get quranDownloadedForOfflineSnackbar => 'Surah downloaded for offline listening';
  @override
  String get quranDeleteDownloadTitle => 'Delete download';
  @override
  String get quranDeleteDownloadBody => 'The downloaded audio files for this surah will be deleted.';
  @override
  String quranStopDownloadTooltip(Object done, Object total) => 'Stop downloading ({done}/{total})'.replaceAll('{done}', done.toString()).replaceAll('{total}', total.toString());
  @override
  String get quranDeleteDownloadedTooltip => 'Downloaded for offline listening — tap to delete';
  @override
  String get quranDownloadForOfflineTooltip => 'Download surah for offline listening';
  @override
  String get qiblaTitle => 'Qibla Direction';
  @override
  String get qiblaRetry => 'Retry';
  @override
  String get qiblaLocationServiceDisabled => 'Location services are disabled on your device. Enable them to find the Qibla direction.';
  @override
  String get qiblaPermissionDenied => 'The app needs location access to find the Qibla direction accurately.';
  @override
  String get qiblaLocationError => 'Couldn\'t determine your location. Check your connection and try again.';
  @override
  String get qiblaNoCompassSensor => 'Your device doesn\'t have a compass sensor. Use the value below with another compass to orient yourself.';
  @override
  String get qiblaBearingFromNorth => 'Direction from true north';
  @override
  String get qiblaCompassNorth => 'N';
  @override
  String get qiblaCompassSouth => 'S';
  @override
  String get qiblaCompassEast => 'E';
  @override
  String get qiblaCompassWest => 'W';
  @override
  String get qiblaAligned => 'You\'re facing the Qibla ✓';
  @override
  String get qiblaNotAligned => 'Turn your device until the marker points up';
  @override
  String qiblaBearingValue(Object degrees) => 'Qibla bearing: {degrees}° from north'.replaceAll('{degrees}', degrees.toString());
  @override
  String get qiblaCalibrationHint => 'If the compass seems inaccurate, move your device in a figure-8 motion, away from magnetic objects, to calibrate it';
  @override
  String get toolQiblaTitle => 'Qibla Direction';
  @override
  String get toolQiblaSubtitle => 'A compass to find the Qibla direction wherever you are';
  @override
  String get toolsTitle => 'Islamic Tools';
  @override
  String get toolZakatTitle => 'Zakat Calculator';
  @override
  String get toolZakatSubtitle => 'Calculate your Zakat with ease';
  @override
  String get toolAsmaTitle => 'The 99 Names of Allah';
  @override
  String get toolAsmaSubtitle => 'The 99 Names and their meanings';
  @override
  String get toolRamadanTitle => 'Ramadan Companion';
  @override
  String get toolRamadanSubtitle => 'Countdown to suhoor and iftar, and fasting tracker';
  @override
  String get toolDuasTitle => 'My Duas';
  @override
  String get toolDuasSubtitle => 'Save your own personal duas';
  @override
  String get toolMosqueTitle => 'Nearby Mosques & Halal Food';
  @override
  String get toolMosqueSubtitle => 'Free search powered by OpenStreetMap data';
  @override
  String get hadithTitle => 'Forty Hadith of an-Nawawi';
  @override
  String get hadithSubtitle => 'A concise collection of hadiths covering the fundamentals of the religion';
  @override
  String get hadithLoadError => 'Couldn\'t load the hadiths. Check your internet connection.';
  @override
  String get hadithRetry => 'Retry';
  @override
  String hadithNumberLabel(Object number) => 'Hadith {number}'.replaceAll('{number}', number.toString());
  @override
  String get hadithSearchHint => 'Search hadiths';
  @override
  String get hadithNoResults => 'No results';
  @override
  String get hadithCopiedSnackbar => 'Hadith copied';
  @override
  String get hadithAddToFavoritesLabel => 'Add to favorites';
  @override
  String get hadithRemoveFromFavoritesLabel => 'Remove from favorites';
  @override
  String get hadithCopyTooltip => 'Copy hadith';
  @override
  String get hadithTranslationNote => 'Shown in Arabic and English — a German translation isn\'t available for this collection yet';
  @override
  String get toolHadithTitle => 'Forty Hadith of an-Nawawi';
  @override
  String get toolHadithSubtitle => 'The 40 (42) hadiths compiled by Imam an-Nawawi';
  @override
  String get homeHadithOfTheDay => 'Hadith of the Day';
  @override
  String get homeShareHadith => 'Share Hadith';
  @override
  String get homeHadithSource => 'Source: 40 Hadith an-Nawawi';
  @override
  String get toolKhatmaTitle => 'Khatma Tracker';
  @override
  String get toolKhatmaSubtitle => 'Plan and track finishing the Quran';
  @override
  String get khatmaTrackerTitle => 'Khatma Tracker';
  @override
  String get khatmaNoPlanTitle => 'Start Your Khatma Journey';
  @override
  String get khatmaNoPlanBody => 'Set a target date to finish reading the entire Quran, and we\'ll help you stay on track.';
  @override
  String get khatmaChooseDuration => 'Choose a duration';
  @override
  String get khatmaDuration7Days => '7 days';
  @override
  String get khatmaDuration30Days => '30 days';
  @override
  String get khatmaDuration60Days => '60 days';
  @override
  String get khatmaDuration90Days => '90 days';
  @override
  String get khatmaCustomDate => 'Pick a custom date';
  @override
  String khatmaProgressLabel(Object completed, Object total) => '{completed} of {total} surahs'.replaceAll('{completed}', completed.toString()).replaceAll('{total}', total.toString());
  @override
  String get khatmaDaysElapsed => 'Days elapsed';
  @override
  String get khatmaDaysRemaining => 'Days remaining';
  @override
  String get khatmaTargetDate => 'Target date';
  @override
  String get khatmaOnTrack => 'You\'re on track — keep it up!';
  @override
  String get khatmaBehindSchedule => 'You\'re a bit behind schedule';
  @override
  String khatmaPaceNeeded(Object count) => 'Read about {count} surahs/day to finish on time'.replaceAll('{count}', count.toString());
  @override
  String get khatmaCompletedCelebration => 'Alhamdulillah! You completed your Khatma 🎉';
  @override
  String get khatmaContinueReading => 'Continue Reading';
  @override
  String get khatmaEditPlan => 'Change Target Date';
  @override
  String get khatmaResetPlanTitle => 'Reset Khatma Plan';
  @override
  String get khatmaResetPlanBody => 'This will clear your plan and reading progress so you can start a new Khatma. This cannot be undone.';
  @override
  String get khatmaResetPlanConfirm => 'Reset';
  @override
  String get khatmaPlanReset => 'Started a new Khatma, good luck! 🌿';
  @override
  String get settingsRemindMeFor => 'Remind me for';
  @override
  String get settingsNotifyAtPrayerTime => 'Notify at prayer time';
  @override
  String get settingsNotifyAtPrayerTimeSubtitle => 'Get an alert exactly when the prayer time begins';
  @override
  String get settingsPostPrayerReminder => 'Remind me to pray';
  @override
  String get settingsPostPrayerReminderSubtitle => 'A gentle follow-up if you haven\'t marked the prayer as done';
  @override
  String settingsPostPrayerReminderMinutesLabel(Object minutes) => '{minutes} min after'.replaceAll('{minutes}', minutes.toString());
  @override
  String get settingsReminderOff => 'Off';
  @override
  String prayerTimeNowBody(Object prayer) => 'It\'s time for {prayer} prayer'.replaceAll('{prayer}', prayer.toString());
  @override
  String postPrayerReminderBody(Object prayer) => 'Have you prayed {prayer} yet?'.replaceAll('{prayer}', prayer.toString());
  @override
  String get settingsMoreReminders => 'More Reminders';
  @override
  String get settingsFridayReminder => 'Friday Reminder';
  @override
  String get settingsFridayReminderSubtitle => 'A weekly reminder for Jumu\'ah and reading Surah Al-Kahf';
  @override
  String get settingsMorningAzkarReminder => 'Morning Azkar';
  @override
  String get settingsMorningAzkarReminderSubtitle => 'A daily reminder to recite your morning remembrance';
  @override
  String get settingsEveningAzkarReminder => 'Evening Azkar';
  @override
  String get settingsEveningAzkarReminderSubtitle => 'A daily reminder to recite your evening remembrance';
  @override
  String get settingsDailyWirdReminder => 'Daily Wird';
  @override
  String get settingsDailyWirdReminderSubtitle => 'A daily reminder to complete today\'s Quran reading';
  @override
  String get settingsSleepAzkarReminder => 'Sleep Azkar';
  @override
  String get settingsSleepAzkarReminderSubtitle => 'A nightly reminder to recite your bedtime remembrance';
  @override
  String get reminderFridayBody => 'Jumu\'ah Mubarak! Don\'t forget to read Surah Al-Kahf today 🕌';
  @override
  String get reminderMorningAzkarBody => 'Time for your morning Azkar 🌞';
  @override
  String get reminderEveningAzkarBody => 'Time for your evening Azkar 🌇';
  @override
  String get reminderDailyWirdBody => 'Have you completed today\'s Quran wird yet? 📖';
  @override
  String get reminderSleepAzkarBody => 'Before you sleep, recite your bedtime Azkar 🌙';
  @override
  String get khatmaMyPlans => 'My Khatma Plans';
  @override
  String get khatmaStartNewPlan => 'Start New Khatma';
  @override
  String get khatmaPlanLabelHint => 'Name this Khatma (optional)';
  @override
  String khatmaBehindByCount(Object count) => '{count} surahs behind schedule'.replaceAll('{count}', count.toString());
  @override
  String khatmaNewPaceLabel(Object count) => 'New daily target: {count} surahs/day'.replaceAll('{count}', count.toString());
  @override
  String get khatmaDeletePlanTitle => 'Delete this Khatma?';
  @override
  String get khatmaDeletePlanBody => 'This will remove the plan and its tracking. This cannot be undone.';
  @override
  String get khatmaDeletePlanConfirm => 'Delete';
  @override
  String khatmaDefaultPlanLabel(Object number) => 'Khatma #{number}'.replaceAll('{number}', number.toString());
  @override
  String get khatmaAddAnother => 'Add Another Khatma';
  @override
  String get toolInsightsTitle => 'Wirdi Insights';
  @override
  String get toolInsightsSubtitle => 'See your weekly worship stats and trends';
  @override
  String get insightsTitle => 'Wirdi Insights';
  @override
  String get insightsThisWeek => 'This Week';
  @override
  String get insightsQuranPages => 'Quran Pages';
  @override
  String get insightsAzkarCompleted => 'Azkar Completed';
  @override
  String get insightsPrayers => 'Prayers';
  @override
  String get insightsTasbeeh => 'Tasbeeh';
  @override
  String get insightsCurrentStreak => 'Current Streak';
  @override
  String insightsDaysCount(Object count) => '{count} days'.replaceAll('{count}', count.toString());
  @override
  String get insightsWeeklyActivity => 'Weekly Activity';
  @override
  String get insightsBestDay => 'Best Day';
  @override
  String get insightsMostConsistent => 'Most Consistent';
  @override
  String get insightsWeekComparisonTitle => 'This Week vs Last Week';
  @override
  String insightsImproved(Object percent) => '{percent}% more active than last week'.replaceAll('{percent}', percent.toString());
  @override
  String insightsDeclined(Object percent) => '{percent}% less active than last week'.replaceAll('{percent}', percent.toString());
  @override
  String get insightsFirstActiveWeek => 'Your first active week -- keep it up!';
  @override
  String get insightsNoActivityYet => 'No activity recorded yet this week';
  @override
  String get insightsSameAsLastWeek => 'Same activity level as last week';
  @override
  String get insightsNoBestDayYet => 'Not enough activity yet';
  @override
  String get toolMyWirdiTitle => 'My Wirdi';
  @override
  String get toolMyWirdiSubtitle => 'See how you\'re doing today across all your worship';
  @override
  String get myWirdiTitle => 'My Wirdi';
  @override
  String get myWirdiToday => 'Today';
  @override
  String get myWirdiCompleted => 'Alhamdulillah! You completed today\'s Wird 🎉';
  @override
  String myWirdiRemaining(Object percent) => '{percent}% left to complete today\'s Wird'.replaceAll('{percent}', percent.toString());
  @override
  String get myWirdiPersonalDua => 'Personal Dua';
  @override
  String get myWirdiDuaDone => 'Recited today';
  @override
  String get myWirdiDuaNotYet => 'Not yet today';
  @override
  String get homeMyWirdiCardTitle => 'My Wirdi Today';
  @override
  String get homeQuickQibla => 'Qibla';
  @override
  String get qiblaDistanceLabel => 'Distance to Makkah';
  @override
  String qiblaDistanceValue(Object km) => '{km} km'.replaceAll('{km}', km.toString());
  @override
  String get achievementStreak3Title => 'Getting Started';
  @override
  String get achievementStreak3Desc => 'Reached a 3-day Wird streak';
  @override
  String get achievementStreak7Title => 'One Week Strong';
  @override
  String get achievementStreak7Desc => 'Reached a 7-day Wird streak';
  @override
  String get achievementStreak30Title => 'Habit Formed';
  @override
  String get achievementStreak30Desc => 'Reached a 30-day Wird streak';
  @override
  String get achievementStreak100Title => 'Unstoppable';
  @override
  String get achievementStreak100Desc => 'Reached a 100-day Wird streak';
  @override
  String get achievementQuran10Title => 'First Steps';
  @override
  String get achievementQuran10Desc => 'Completed 10% of the Quran';
  @override
  String get achievementQuran25Title => 'Quarter Way';
  @override
  String get achievementQuran25Desc => 'Completed 25% of the Quran';
  @override
  String get achievementQuran50Title => 'Halfway There';
  @override
  String get achievementQuran50Desc => 'Completed 50% of the Quran';
  @override
  String get achievementQuran100Title => 'Khatm al-Quran';
  @override
  String get achievementQuran100Desc => 'Completed the entire Quran';
  @override
  String get achievementKhatma1Title => 'First Khatma';
  @override
  String get achievementKhatma1Desc => 'Completed your first Khatma plan';
  @override
  String get achievementKhatma3Title => 'Khatma Devotee';
  @override
  String get achievementKhatma3Desc => 'Completed 3 Khatma plans';
  @override
  String get achievementPages50Title => 'Bookworm';
  @override
  String get achievementPages50Desc => 'Read 50 pages total';
  @override
  String get achievementPages200Title => 'Dedicated Reader';
  @override
  String get achievementPages200Desc => 'Read 200 pages total';
  @override
  String get achievementPages604Title => 'Full Mushaf';
  @override
  String get achievementPages604Desc => 'Read 604 pages total -- a full Mushaf';
  @override
  String get achievementAzkar50Title => 'Remembrance Beginner';
  @override
  String get achievementAzkar50Desc => 'Completed 50 Azkar';
  @override
  String get achievementAzkar500Title => 'Remembrance Master';
  @override
  String get achievementAzkar500Desc => 'Completed 500 Azkar';
  @override
  String get achievementTasbeeh100Title => 'First Tasbeeh';
  @override
  String get achievementTasbeeh100Desc => 'Counted 100 Tasbeeh';
  @override
  String get achievementTasbeeh1000Title => 'Tasbeeh Devotee';
  @override
  String get achievementTasbeeh1000Desc => 'Counted 1,000 Tasbeeh';
  @override
  String get achievementPrayers50Title => 'Consistent Worshipper';
  @override
  String get achievementPrayers50Desc => 'Marked 50 prayers as done';
  @override
  String get achievementPrayers350Title => 'Prayer Champion';
  @override
  String get achievementPrayers350Desc => 'Marked 350 prayers as done';
  @override
  String get achievementFavorites10Title => 'Collector';
  @override
  String get achievementFavorites10Desc => 'Saved 10 favorites';
  @override
  String get achievementsTitle => 'Achievements';
  @override
  String achievementsUnlockedCount(Object unlocked, Object total) => '{unlocked} of {total} unlocked'.replaceAll('{unlocked}', unlocked.toString()).replaceAll('{total}', total.toString());
  @override
  String get toolAchievementsTitle => 'Achievements';
  @override
  String get toolAchievementsSubtitle => 'Track your milestones and badges';
  @override
  String get quranShareAsImageTooltip => 'Share as image';
  @override
  String get ayahShareTitle => 'Share Ayah';
  @override
  String get ayahShareIncludeTranslation => 'Include translation';
  @override
  String get ayahShareButton => 'Share';
  @override
  String get myDuasDialogTitleNew => 'New Dua';
  @override
  String get myDuasDialogTitleEdit => 'Edit Dua';
  @override
  String get myDuasTitleFieldLabel => 'Title (optional)';
  @override
  String get myDuasTextFieldLabel => 'Dua text';
  @override
  String get myDuasEmptyTitle => 'No duas added yet';
  @override
  String get myDuasEmptySubtitle => 'Tap + to add your own dua';
  @override
  String get ramadanCountdownToSuhoor => 'Time remaining until Suhoor (Fajr Adhan)';
  @override
  String get ramadanCountdownToIftar => 'Time remaining until Iftar (Maghrib Adhan)';
  @override
  String get ramadanCountdownToSuhoorTomorrow => 'Time remaining until tomorrow\'s Suhoor';
  @override
  String get ramadanLoadError => 'Couldn\'t load the prayer times needed for Suhoor and Iftar.';
  @override
  String ramadanDayOfRamadan(Object day) => 'Day {day} of Ramadan'.replaceAll('{day}', day.toString());
  @override
  String get ramadanFastingToday => 'Fasting today';
  @override
  String get ramadanFastingSubtitle => 'Log your fast today to track your progress';
  @override
  String get ramadanDaysLoggedTitle => 'Fasting days logged this month';
  @override
  String get ramadanHijriFootnote => 'Note: the Hijri date here is a computed estimate and may differ by a day from your country\'s official start-of-month announcement.';
  @override
  String get mushafTitle => 'The Mushaf';
  @override
  String get mushafStopAudioTooltip => 'Stop audio';
  @override
  String get mushafLoadError => 'Couldn\'t load Mushaf pages. Check your internet connection.';
  @override
  String get mushafTapAyahHint => 'Tap any ayah to play its recitation';
  @override
  String mushafPageNumber(Object number) => 'Page {number}'.replaceAll('{number}', number.toString());
  @override
  String get mosqueLocationServiceDisabled => 'Location service is disabled on your device.';
  @override
  String get mosqueLocationPermissionNeeded => 'The app needs location access to search for nearby places.';
  @override
  String get mosqueSearchError => 'Couldn\'t search for nearby places -- check your internet connection.';
  @override
  String get mosqueTabMosques => 'Mosques';
  @override
  String get mosqueTabHalalRestaurants => 'Halal Restaurants';
  @override
  String get mosqueNoMosquesFound => 'No nearby mosques found in OpenStreetMap data';
  @override
  String get mosqueNoHalalFound => 'No nearby restaurants tagged \'halal\' found -- halal restaurant data on OpenStreetMap is incomplete in many areas';
  @override
  String get onboardingGoalTitle => 'How much Quran do you want to read daily?';
  @override
  String get onboardingGoalLight => 'Light';
  @override
  String get onboardingGoalLightDesc => '2 pages a day';
  @override
  String get onboardingGoalRegular => 'Regular';
  @override
  String get onboardingGoalRegularDesc => '5 pages a day';
  @override
  String get onboardingGoalAdvanced => 'Advanced';
  @override
  String get onboardingGoalAdvancedDesc => '10 pages a day';
  @override
  String get onboardingEnableReminders => 'Enable daily reminders';
  @override
  String get onboardingEnableRemindersDesc => 'Get nudged for your daily Wird and Azkar';
  @override
  String get toolBookmarksTitle => 'Bookmarks';
  @override
  String get toolBookmarksSubtitle => 'Save ayahs with notes and categories';
  @override
  String get bookmarksTitle => 'Bookmarks';
  @override
  String get bookmarksEmptyTitle => 'No bookmarks yet';
  @override
  String get bookmarksEmptySubtitle => 'Tap the bookmark icon on any ayah while reading to save it here';
  @override
  String get bookmarkAddTooltip => 'Add bookmark';
  @override
  String get bookmarkDialogTitle => 'Add Bookmark';
  @override
  String get bookmarkNoteLabel => 'Note (optional)';
  @override
  String get bookmarkCategoryLabel => 'Category';
  @override
  String get bookmarkCategoryRamadan => 'Ramadan';
  @override
  String get bookmarkCategoryDua => 'Dua';
  @override
  String get bookmarkCategoryFamily => 'Family';
  @override
  String get bookmarkCategoryStudy => 'Study';
  @override
  String get bookmarkCategoryPersonal => 'Personal';
  @override
  String get bookmarkCategoryOther => 'All';
  @override
  String get bookmarkSavedSnackbar => 'Bookmark saved';
  @override
  String get bookmarkDeleteConfirmTitle => 'Delete this bookmark?';
  @override
  String get bookmarkDeleteConfirmBody => 'This cannot be undone.';
  @override
  String get bookmarkDeleteConfirm => 'Delete';
  @override
  String get settingsPrivacyCenter => 'Privacy Center';
  @override
  String get settingsPrivacyCenterSubtitle => 'See what\'s stored, export or delete your data';
  @override
  String get privacyCenterTitle => 'Privacy Center';
  @override
  String get privacyCenterIntro => 'Your worship data belongs to you.';
  @override
  String get privacyCenterLocalDataTitle => 'What\'s stored locally';
  @override
  String get privacyCenterLocalDataBody => 'Reading progress, Azkar/Tasbeeh counts, favorites, bookmarks, personal duas, Khatma plans, achievements, and settings -- stored only on this device using SharedPreferences. Nothing is uploaded to a server.';
  @override
  String get privacyCenterLocationTitle => 'Location usage';
  @override
  String get privacyCenterLocationBody => 'Your device\'s location is used only to calculate prayer times, find the Qibla direction, and search for nearby mosques/halal restaurants. It is never stored or shared with any other service.';
  @override
  String get privacyCenterNoAccountsTitle => 'No accounts, ads, or tracking';
  @override
  String get privacyCenterNoAccountsBody => 'This app does not require an account, does not show ads, and does not use any analytics or tracking SDKs.';
  @override
  String get privacyCenterExportButton => 'Export My Data';
  @override
  String get privacyCenterExportSuccessSnackbar => 'Your data has been prepared for export';
  @override
  String get privacyCenterDeleteButton => 'Delete My Data';
  @override
  String get privacyCenterDeleteConfirmTitle => 'Delete all local data?';
  @override
  String get privacyCenterDeleteConfirmBody => 'This permanently erases all your progress, favorites, bookmarks, duas, achievements, and settings from this device. This cannot be undone.';
  @override
  String get privacyCenterDeleteConfirmButton => 'Delete Everything';
  @override
  String get privacyCenterDeleteDoneSnackbar => 'All local data has been deleted';
  @override
  String get privacyCenterViewPolicy => 'View Full Privacy Policy';
  @override
  String homeRamadanBannerTitle(Object day) => 'Day {day} of Ramadan'.replaceAll('{day}', day.toString());
  @override
  String get homeRamadanBannerSubtitle => 'Tap for your Ramadan companion';
  @override
  String get ramadanLast10NightsTitle => 'The Last 10 Nights';
  @override
  String get ramadanLast10NightsBody => 'These final nights of Ramadan are the most blessed -- increase your worship, Quran, and dua.';
  @override
  String get ramadanPossibleLaylatAlQadr => 'Tonight may be Laylat al-Qadr';
  @override
  String get commonEditTooltip => 'Edit';
  @override
  String get commonDeleteTooltip => 'Delete';
  @override
  String get commonSettingsTooltip => 'Settings';
  @override
  String get commonDecreaseTooltip => 'Decrease';
  @override
  String get commonIncreaseTooltip => 'Increase';
  @override
  String get commonShareTooltip => 'Share';
  @override
  String get commonRefreshTooltip => 'Refresh';
  @override
  String get homeNextPrayerCardLabel => 'Next prayer time';
  @override
  String get homeWeeklyInsightsCardLabel => 'Weekly insights';
  @override
  String get settingsTajweedColoring => 'Tajweed Coloring';
  @override
  String get settingsTajweedColoringSubtitle => 'Color Quranic text based on Tajweed rules';
  @override
  String get settingsBackupRestore => 'Backup & Restore';
  @override
  String get settingsExportBackup => 'Export Backup';
  @override
  String get settingsExportBackupSubtitle => 'Save your progress and settings to a file';
  @override
  String get settingsImportBackup => 'Import Backup';
  @override
  String get settingsImportBackupSubtitle => 'Restore data from a previously saved file';
  @override
  String get settingsImportSuccess => 'Backup imported successfully! Please restart the app.';
  @override
  String get settingsImportError => 'Failed to import backup. Ensure the file is valid.';
  @override
  String get tajweedLegendTitle => 'Tajweed Rules';
  @override
  String get tajweedLegendIntro => 'Color coding for Quranic recitation rules:';
  @override
  String get tajweedQalqalahLabel => 'Qalqalah (Echoing)';
  @override
  String get tajweedGhunnahLabel => 'Ghunnah (Nasalization)';
  @override
  String get tajweedIkhfaLabel => 'Ikhfa (Hiding)';
  @override
  String get tajweedIdghamGhunnahLabel => 'Idgham with Ghunnah';
  @override
  String get tajweedIdghamNoGhunnahLabel => 'Idgham without Ghunnah';
  @override
  String get tajweedIqlabLabel => 'Iqlab (Conversion)';
  @override
  String get tajweedLegendClose => 'Close';
  @override
  String get radioTitle => 'Islamic Radio';
  @override
  String get radioSubtitle => 'Listen to Quran & lectures live';
  @override
  String get radioAll => 'All';
  @override
  String get radioNowPlaying => 'Now Playing';
  @override
  String get radioFavorites => 'Favorites';
  @override
  String get radioNoFavorites => 'No favorite stations yet';
  @override
  String get radioNoStations => 'No stations in this category';
  @override
  String get radioAddFavorite => 'Add to favorites';
  @override
  String get radioRemoveFavorite => 'Remove from favorites';
  @override
  String get radioSleepTimer => 'Sleep Timer';
  @override
  String get radioSleepTimerSubtitle => 'Automatically stops radio after the set time';
  @override
  String get radioSleepTimerCancel => 'Cancel timer';
  @override
  String get radioMinutes => 'min';
  @override
  String radioSleepTimerActive(Object minutes) => 'Stops in {minutes} min'.replaceAll('{minutes}', minutes.toString());
  @override
  String get radioOfficial => 'Official';
  @override
  String get radioStreamError => 'Could not connect to station. Check your connection.';
}
class _AppLocalizations_de extends AppLocalizations {
  _AppLocalizations_de() : super('de');
  @override
  String get appTitle => 'Wirdi';
  @override
  String get navHome => 'Start';
  @override
  String get navQuran => 'Koran';
  @override
  String get navAzkar => 'Adhkar';
  @override
  String get navPrayer => 'Gebet';
  @override
  String get navTasbeeh => 'Tasbih';
  @override
  String get navMore => 'Mehr';
  @override
  String get commonCancel => 'Abbrechen';
  @override
  String get commonSave => 'Speichern';
  @override
  String get commonDelete => 'Löschen';
  @override
  String get commonClose => 'Schließen';
  @override
  String get commonOk => 'OK';
  @override
  String get commonBack => 'Zurück';
  @override
  String get commonNext => 'Weiter';
  @override
  String get commonSkip => 'Überspringen';
  @override
  String get commonDone => 'Fertig';
  @override
  String get commonRetry => 'Erneut versuchen';
  @override
  String get commonShare => 'Teilen';
  @override
  String get commonSearch => 'Suchen';
  @override
  String get commonEdit => 'Bearbeiten';
  @override
  String get commonConfirm => 'Bestätigen';
  @override
  String get commonLoading => 'Wird geladen…';
  @override
  String get commonError => 'Etwas ist schiefgelaufen';
  @override
  String get commonYes => 'Ja';
  @override
  String get commonNo => 'Nein';
  @override
  String get languageName_ar => 'Arabisch';
  @override
  String get languageName_en => 'Englisch';
  @override
  String get languageName_de => 'Deutsch';
  @override
  String get languageName_tr => 'Türkisch';
  @override
  String get settingsLanguage => 'Sprache';
  @override
  String get settingsLanguageSystem => 'Systemsprache';
  @override
  String get settingsLanguageSubtitle => 'Wähle die Anzeigesprache der App';
  @override
  String get asmaUlHusnaTitle => 'Die 99 Namen Allahs';
  @override
  String get sourcesLicensesTitle => 'Quellen & Lizenzen';
  @override
  String get sourcesOssLicensesButton => 'Lizenzen der Open-Source-Pakete';
  @override
  String get aboutTitle => 'Über die App';
  @override
  String get aboutTagline => 'Dein täglicher Begleiter für Dhikr und Koran';
  @override
  String get aboutVersion => 'Version 1.0.0';
  @override
  String get aboutBody => 'Wirdi ist eine tägliche islamische Begleit-App, die dir hilft, deine Koranlektüre, deine Adhkar, deine Gebetszeiten und dein Tasbih an einem Ort im Blick zu behalten, in einem ruhigen, einfachen Design. Die App enthält keine Werbung und kein Tracking, und alle deine Daten bleiben auf deinem Gerät.';
  @override
  String get onboardingSkip => 'Überspringen';
  @override
  String get onboardingSlide1 => 'Mach den Koran zu einem Teil deines Tages';
  @override
  String get onboardingSlide2 => 'Verfolge dein tägliches Wird und baue eine Gewohnheit auf';
  @override
  String get onboardingSlide3 => 'Erinnere dein Herz, bevor die Zeit dich erinnert';
  @override
  String get onboardingStart => 'Beginne deine Reise';
  @override
  String get onboardingNext => 'Weiter';
  @override
  String get privacyPolicyTitle => 'Datenschutzerklärung';
  @override
  String get favoritesTitle => 'Favoriten';
  @override
  String get favoritesTabAyahs => 'Koranverse';
  @override
  String get favoritesTabAzkar => 'Adhkar';
  @override
  String get favoritesLoadError => 'Favoriten konnten nicht geladen werden';
  @override
  String get favoritesEmptyAyahs => 'Noch keine favorisierten Verse';
  @override
  String get favoritesEmptyAzkar => 'Noch keine favorisierten Adhkar';
  @override
  String favoritesAyahSubtitle(Object surahName, Object ayahNumber) => 'Sure {surahName} - Vers {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get zakatTitle => 'Zakat-Rechner';
  @override
  String get zakatNisabHint => 'Gib den aktuellen Nisab-Wert ein (zum aktuellen Marktpreis von Gold oder Silber), bevor du rechnest, da sich der Nisab-Preis täglich ändert und nicht fest in der App hinterlegt werden kann. Du kannst dich an deine örtliche Fatwa-Stelle wenden oder den aktuellen Goldpreis (85 Gramm Gold oder den entsprechenden Silberwert) nachschlagen.';
  @override
  String get zakatCurrentNisab => 'Aktueller Nisab-Wert';
  @override
  String get zakatableAssets => 'Zakatpflichtige Vermögenswerte';
  @override
  String get zakatCash => 'Bargeld und Äquivalente (Bank, Geldbörse)';
  @override
  String get zakatGoldSilver => 'Gold und Silber (Marktwert)';
  @override
  String get zakatInvestments => 'Investitionen und Aktien';
  @override
  String get zakatBusiness => 'Handelswaren (zum Verkauf bestimmte Ware)';
  @override
  String get zakatReceivables => 'Dir geschuldete Schulden (voraussichtlich einbringbar)';
  @override
  String get zakatOwedDebts => 'Deine Schulden';
  @override
  String get zakatCurrentDebts => 'Aktuell fällige Schulden und Rechnungen';
  @override
  String get zakatNetWealth => 'Zakatpflichtiges Nettovermögen';
  @override
  String get zakatEnterNisabFirst => 'Gib zuerst den Nisab-Wert ein';
  @override
  String get zakatBelowNisab => 'Dein Vermögen erreicht den Nisab nicht — keine Zakat fällig';
  @override
  String get zakatDue => 'Fällige Zakat (2,5 %)';
  @override
  String get zakatFootnote => 'Hinweis: Dieser Rechner liefert eine allgemeine Schätzung zum Standardsatz (2,5 %) auf Vermögen, das ein volles Mondjahr gehalten wurde und den Nisab erreicht hat. Zakat auf Feldfrüchte, Vieh und Metalle folgt anderen, hier nicht behandelten Regeln. Für spezielle Fälle sollte man einen qualifizierten Gelehrten fragen.';
  @override
  String get settingsTitle => 'Einstellungen';
  @override
  String get settingsAppearance => 'Erscheinungsbild';
  @override
  String get settingsMode => 'Modus';
  @override
  String get settingsModeLight => 'Hell';
  @override
  String get settingsModeDark => 'Dunkel';
  @override
  String get settingsModeAuto => 'Automatisch';
  @override
  String get settingsFontSize => 'Schriftgröße';
  @override
  String get settingsFontPreview => 'Beispieltext zur Vorschau der Schriftgröße';
  @override
  String get settingsShowTransliteration => 'Lateinische Transliteration anzeigen';
  @override
  String get settingsShowTransliterationSubtitle => 'Hilfreich für Lernende — erscheint unter jedem Vers';
  @override
  String get settingsPrayerReminder => 'Gebetserinnerung';
  @override
  String get settingsPrayerReminderEnable => 'Erinnerung an bevorstehendes Gebet aktivieren';
  @override
  String get settingsPrayerReminderSubtitle => 'Die Erinnerung funktioniert nur bei geöffneter App';
  @override
  String get settingsPrayerReminderMinutesBefore => 'Erinnerung vor dem Gebet um (Minuten)';
  @override
  String settingsPrayerReminderMinutesLabel(Object minutes) => '{minutes} Min.'.replaceAll('{minutes}', minutes.toString());
  @override
  String get settingsPrayerReminderMethod => 'Erinnerungsmethode';
  @override
  String get settingsReminderBanner => 'Nur Benachrichtigung';
  @override
  String get settingsReminderBeep => 'Alarmton';
  @override
  String get settingsReminderAdhan => 'Vollständiger Adhan';
  @override
  String get settingsTestTone => 'Ton testen';
  @override
  String get settingsAdhanSound => 'Adhan-Ton';
  @override
  String get settingsStopPreview => 'Vorschau stoppen';
  @override
  String get settingsListen => 'Anhören';
  @override
  String get settingsReminderNote => 'Hinweis: Die App sendet eine echte Benachrichtigung, auch wenn sie geschlossen ist, aber du musst beim Aktivieren die Benachrichtigungsberechtigung (und unter Android 12+ die Berechtigung für exakte Alarme) erteilen. Die Erinnerungen für heute und morgen werden bei jedem Öffnen der Start- oder Gebetszeiten-Seite neu geplant.';
  @override
  String get settingsDailyWird => 'Tägliches Wird';
  @override
  String get settingsDailyWirdTarget => 'Tagesziel (Seiten/Suren)';
  @override
  String settingsDailyWirdPerDay(Object count) => '{count} pro Tag'.replaceAll('{count}', count.toString());
  @override
  String get settingsAboutSupport => 'Über & Support';
  @override
  String get settingsAbout => 'Über die App';
  @override
  String get settingsSourcesLicenses => 'Quellen & Lizenzen';
  @override
  String get settingsPrivacyPolicy => 'Datenschutzerklärung';
  @override
  String get settingsDataManagement => 'Datenverwaltung';
  @override
  String get settingsQuranLastUpdate => 'Koran zuletzt aktualisiert';
  @override
  String get settingsAzkarLastUpdate => 'Adhkar zuletzt aktualisiert';
  @override
  String get settingsNotDownloadedYet => 'Noch nicht heruntergeladen';
  @override
  String get settingsUpdateNow => 'Daten jetzt aktualisieren';
  @override
  String get settingsRequiresInternet => 'Erfordert eine Internetverbindung';
  @override
  String get settingsDataUpdated => 'Koran- und Adhkar-Daten aktualisiert';
  @override
  String get settingsDownloadedAudio => 'Heruntergeladene Rezitationen zum Offline-Hören';
  @override
  String get settingsNoDownloadedAudio => 'Keine heruntergeladenen Rezitationen';
  @override
  String settingsMbDownloaded(Object size) => '{size} MB heruntergeladen'.replaceAll('{size}', size.toString());
  @override
  String get settingsDeleteAll => 'Alle löschen';
  @override
  String get settingsDeleteAllDownloadsTitle => 'Alle heruntergeladenen Rezitationen löschen';
  @override
  String get settingsDeleteAllDownloadsBody => 'Alle heruntergeladenen Audiodateien für alle Suren werden gelöscht. Das Anhören wird auf Online-Streaming zurückgreifen.';
  @override
  String get settingsResetKhatma => 'Khatma-Fortschritt zurücksetzen';
  @override
  String get settingsResetKhatmaSubtitle => 'Eine neue Khatma von vorn beginnen';
  @override
  String get settingsResetKhatmaBody => 'Alle Suren werden wieder als ungelesen markiert, um eine neue Khatma zu beginnen. Dein tägliches Wird und deine Favoriten bleiben unberührt.';
  @override
  String get settingsResetKhatmaConfirm => 'Zurücksetzen';
  @override
  String get settingsKhatmaResetDone => 'Eine neue Khatma hat begonnen, viel Erfolg! 🌿';
  @override
  String get settingsDeleteLocalData => 'Alle lokalen Daten löschen';
  @override
  String get settingsDeleteLocalDataBody => 'Favoriten, Tasbih-Statistiken, täglicher Wird-Fortschritt und alle auf diesem Gerät gespeicherten Einstellungen werden gelöscht. Dies kann nicht rückgängig gemacht werden.';
  @override
  String get settingsLocalDataDeleted => 'Alle lokalen Daten wurden gelöscht';
  @override
  String get settingsPreviewFailed => 'Vorschau konnte nicht abgespielt werden — Verbindung prüfen';
  @override
  String get quranTranslationUnavailable => 'Übersetzung für diesen Vers nicht verfügbar';
  @override
  String get quranTranslationLoadFailed => 'Übersetzung konnte nicht geladen werden';
  @override
  String get quranTranslationRetry => 'Erneut versuchen';
  @override
  String get quranTranslationSourceNote => 'Übersetzung von QuranEnc.com';
  @override
  String get homeGreetingNight => 'Gesegnete Nacht 🌙';
  @override
  String get homeGreetingMorning => 'Guten Morgen 👋';
  @override
  String get homeGreetingAfternoon => 'Einen schönen Tag ☀️';
  @override
  String get homeGreetingEvening => 'Guten Abend 👋';
  @override
  String homeStreakDays(Object days) => 'Wird-Serie: {days} Tage 🔥'.replaceAll('{days}', days.toString());
  @override
  String get homeContinueToday => 'Setze fort, was du heute begonnen hast';
  @override
  String homeKhatmaProgress(Object percent) => 'Khatma-Fortschritt: {percent}%'.replaceAll('{percent}', percent.toString());
  @override
  String get homeIslamicTools => 'Islamische Werkzeuge';
  @override
  String get homeNextPrayer => 'Nächstes Gebet';
  @override
  String homeInLabel(Object countdown) => 'in {countdown}'.replaceAll('{countdown}', countdown.toString());
  @override
  String get homeCachedPrayerTimes => 'Zuletzt gespeicherte Zeiten (offline)';
  @override
  String get homeEnableLocationForPrayer => 'Standort aktivieren, um das nächste Gebet zu sehen';
  @override
  String get homeDailyWird => 'Tägliches Wird';
  @override
  String get homeWirdCompleted => 'Du hast dein heutiges Wird abgeschlossen, möge Allah dich segnen 🎉';
  @override
  String homeWirdProgress(Object pages, Object target) => '{pages} von {target} Seiten/Suren'.replaceAll('{pages}', pages.toString()).replaceAll('{target}', target.toString());
  @override
  String get homeContinueReading => 'Weiterlesen';
  @override
  String get homeNoLastReading => 'Noch keine letzte Leseposition';
  @override
  String homeLastReadingSubtitle(Object surahName, Object ayahNumber) => 'Sure {surahName} — Vers {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get homeFavorites => 'Favoriten';
  @override
  String get homeNoFavoritesYet => 'Noch keine favorisierten Elemente';
  @override
  String homeFavoritesSavedCount(Object count) => '{count} gespeicherte Elemente'.replaceAll('{count}', count.toString());
  @override
  String get homeQuoteOfTheDay => 'Zitat des Tages';
  @override
  String get homeThisWeek => 'Diese Woche';
  @override
  String homeActiveDaysOf(Object active, Object total) => '{active} von {total} aktiven Tagen'.replaceAll('{active}', active.toString()).replaceAll('{total}', total.toString());
  @override
  String homeWirdTargetMetSummary(Object met, Object total) => 'Du hast das tägliche Wird-Ziel an {met} von {total} Tagen diese Woche erreicht'.replaceAll('{met}', met.toString()).replaceAll('{total}', total.toString());
  @override
  String get homeQuickActions => 'Schnellzugriff';
  @override
  String get homeQuickAzkar => 'Adhkar';
  @override
  String get homeQuickTasbeeh => 'Tasbih';
  @override
  String get homeQuickPrayer => 'Gebet';
  @override
  String homeCompletionPercent(Object percent) => 'Fortschritt {percent} Prozent'.replaceAll('{percent}', percent.toString());
  @override
  String homeDayNotYet(Object day) => '{day}: noch nicht gekommen'.replaceAll('{day}', day.toString());
  @override
  String homeDaySummary(Object day, Object pages, Object azkar, Object tasbeeh, Object prayers) => '{day}: {pages} Seiten, {azkar} Adhkar, {tasbeeh} Tasbih, {prayers} Gebete'.replaceAll('{day}', day.toString()).replaceAll('{pages}', pages.toString()).replaceAll('{azkar}', azkar.toString()).replaceAll('{tasbeeh}', tasbeeh.toString()).replaceAll('{prayers}', prayers.toString());
  @override
  String get dayNameSat => 'Sa';
  @override
  String get dayNameSun => 'So';
  @override
  String get dayNameMon => 'Mo';
  @override
  String get dayNameTue => 'Di';
  @override
  String get dayNameWed => 'Mi';
  @override
  String get dayNameThu => 'Do';
  @override
  String get dayNameFri => 'Fr';
  @override
  String get prayerFajr => 'Fajr';
  @override
  String get prayerDhuhr => 'Dhuhr';
  @override
  String get prayerAsr => 'Asr';
  @override
  String get prayerMaghrib => 'Maghrib';
  @override
  String get prayerIsha => 'Isha';
  @override
  String get prayerTimesTitle => 'Gebetszeiten';
  @override
  String get prayerSetCityManually => 'Stadt manuell festlegen';
  @override
  String get prayerCityHint => 'Beispiel: Kairo, Ägypten';
  @override
  String get prayerSearch => 'Suchen';
  @override
  String prayerCityNotFound(Object city) => '„{city}" konnte nicht gefunden werden — bitte Schreibweise prüfen und erneut versuchen'.replaceAll('{city}', city.toString());
  @override
  String get prayerAvailabilityLocationDisabled => 'Standortdienste sind auf deinem Gerät deaktiviert. Aktiviere sie oder lege deine Stadt manuell fest.';
  @override
  String get prayerAvailabilityPermissionDenied => 'Die App benötigt Standortzugriff, um genaue Gebetszeiten anzuzeigen, oder du kannst deine Stadt manuell festlegen.';
  @override
  String get prayerAvailabilityPermissionDeniedForever => 'Der Standortzugriff wurde dauerhaft verweigert. Aktiviere ihn in den Systemeinstellungen oder lege deine Stadt manuell fest.';
  @override
  String get prayerAvailabilityNetworkError => 'Keine Internetverbindung und keine gespeicherten Gebetszeiten gefunden.';
  @override
  String get prayerRetry => 'Erneut versuchen';
  @override
  String get prayerUseGps => 'Aktuellen Standort verwenden (GPS)';
  @override
  String get prayerRefresh => 'Aktualisieren';
  @override
  String get prayerOfflineBanner => 'Keine Verbindung — zeigt zuletzt gespeicherte Zeiten';
  @override
  String get prayerNextPrayerLabel => 'Nächstes Gebet';
  @override
  String get prayerTimeRemaining => 'Verbleibende Zeit';
  @override
  String prayerNotYetDue(Object prayer) => 'Die Gebetszeit für {prayer} ist noch nicht gekommen'.replaceAll('{prayer}', prayer.toString());
  @override
  String prayerMarkedDone(Object prayer) => '{prayer}-Gebet als erledigt markiert'.replaceAll('{prayer}', prayer.toString());
  @override
  String prayerNotDoneYet(Object prayer) => '{prayer}-Gebet noch nicht erledigt'.replaceAll('{prayer}', prayer.toString());
  @override
  String get prayerFootnote => 'Hinweis: Die Zeiten basieren auf deinem Standort oder der ausgewählten Stadt, unter Verwendung des AlAdhan-Dienstes mit der ägyptischen Berechnungsmethode.';
  @override
  String prayerReminderApproaching(Object prayer, Object minutes) => 'Das {prayer}-Gebet beginnt in {minutes} Minuten'.replaceAll('{prayer}', prayer.toString()).replaceAll('{minutes}', minutes.toString());
  @override
  String get tasbeehTitle => 'Tasbih';
  @override
  String get tasbeehResetToday => 'Heutigen Zähler zurücksetzen';
  @override
  String get tasbeehCustom => 'Eigene Formel';
  @override
  String get tasbeehToday => 'Heute';
  @override
  String get tasbeehTarget => 'Ziel';
  @override
  String get tasbeehPhraseTotal => 'Formel-Gesamt';
  @override
  String get tasbeehGrandTotal => 'Gesamtsumme';
  @override
  String tasbeehCounterLabel(Object phrase, Object count, Object target) => 'Tasbih-Zähler für {phrase}, aktuell {count} von {target}'.replaceAll('{phrase}', phrase.toString()).replaceAll('{count}', count.toString()).replaceAll('{target}', target.toString());
  @override
  String get tasbeehTapHint => 'Tippen zum Zählen — eigene Formel lange drücken zum Löschen';
  @override
  String get tasbeehAddCustomTitle => 'Eigene Formel';
  @override
  String get tasbeehPhraseTextLabel => 'Formeltext';
  @override
  String get tasbeehPhraseTextHint => 'Beispiel: La hawla wa la quwwata illa billah';
  @override
  String get tasbeehTargetLabel => 'Ziel';
  @override
  String get tasbeehAdd => 'Hinzufügen';
  @override
  String get tasbeehGlossSubhanallah => 'SubhanAllah — Gepriesen sei Allah';
  @override
  String get tasbeehGlossAlhamdulillah => 'Alhamdulillah — Alles Lob gebührt Allah';
  @override
  String get tasbeehGlossAllahuakbar => 'Allahu Akbar — Allah ist der Größte';
  @override
  String get tasbeehGlossLaIlaha => 'La ilaha illallah — Es gibt keinen Gott außer Allah';
  @override
  String get tasbeehGlossAstaghfirullah => 'Astaghfirullah — Ich bitte Allah um Vergebung';
  @override
  String get tasbeehGlossSalawat => 'Allahumma salli ala Muhammad — O Allah, sende Segen über Muhammad';
  @override
  String get azkarDuasTitle => 'Adhkar & Bittgebete';
  @override
  String get azkarTabAzkar => 'Adhkar';
  @override
  String get azkarTabDuas => 'Bittgebete';
  @override
  String get azkarFavoritesTooltip => 'Favoriten';
  @override
  String get azkarLoadError => 'Adhkar konnten nicht geladen werden. Überprüfe deine Internetverbindung.';
  @override
  String get azkarSearchHint => 'Adhkar durchsuchen';
  @override
  String get azkarNoResults => 'Keine Ergebnisse';
  @override
  String azkarCategorySubtitle(Object count, Object completed) => '{count} Adhkar — {completed} heute erledigt'.replaceAll('{count}', count.toString()).replaceAll('{completed}', completed.toString());
  @override
  String get azkarAllDoneInSection => 'Du hast alle Adhkar in diesem Abschnitt abgeschlossen 🌿';
  @override
  String get azkarShowCompleted => 'Erledigte anzeigen';
  @override
  String get azkarHideCompleted => 'Erledigte ausblenden';
  @override
  String get azkarCompletedSnackbar => 'Gut gemacht 🌿 dieser Dhikr ist abgeschlossen';
  @override
  String get azkarCopiedSnackbar => 'Dhikr kopiert — du kannst ihn zum Teilen einfügen';
  @override
  String get azkarPlusOne => '+1';
  @override
  String get azkarFavoritesTitle => 'Favorisierte Adhkar';
  @override
  String get azkarNoFavoritesYet => 'Noch keine favorisierten Adhkar';
  @override
  String get azkarRetry => 'Erneut versuchen';
  @override
  String get quranTitle => 'Der Heilige Koran';
  @override
  String get quranViewMushaf => 'Mushaf anzeigen';
  @override
  String get quranTabSurahs => 'Suren';
  @override
  String get quranTabJuz => 'Juz';
  @override
  String get quranTabSearch => 'Suche';
  @override
  String get quranTabFavorites => 'Favoriten';
  @override
  String get quranLoadError => 'Der Koran konnte nicht geladen werden. Überprüfe deine Internetverbindung.';
  @override
  String get quranViewMode => 'Ansichtsmodus';
  @override
  String get quranMushafPagesLoadError => 'Mushaf-Seiten konnten nicht geladen werden — Verbindung prüfen';
  @override
  String get quranViewAsMushafPages => 'Als Mushaf-Seiten anzeigen';
  @override
  String quranCompletionPercent(Object percent) => 'Koran-Fortschritt {percent} Prozent'.replaceAll('{percent}', percent.toString());
  @override
  String get quranKhatmaProgress => 'Khatma-Fortschritt';
  @override
  String get quranSearchSurahHint => 'Nach Surenname oder -nummer suchen';
  @override
  String quranSurahSubtitle(Object englishName, Object count) => '{englishName} - {count} Verse'.replaceAll('{englishName}', englishName.toString()).replaceAll('{count}', count.toString());
  @override
  String quranJuzNumber(Object number) => 'Juz {number}'.replaceAll('{number}', number.toString());
  @override
  String quranJuzStartsFrom(Object surahName, Object ayahNumber) => 'Beginnt bei Sure {surahName} - Vers {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get quranSearchAyahHint => 'Verstext durchsuchen';
  @override
  String get quranSearchMinChars => 'Gib mindestens 2 Zeichen ein, um zu suchen';
  @override
  String quranAyahLocation(Object surahName, Object ayahNumber) => 'Sure {surahName} - Vers {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get quranNoFavoriteAyahsYet => 'Noch keine favorisierten Verse';
  @override
  String get quranChooseReciter => 'Rezitator wählen';
  @override
  String get quranTafsirTimeoutError => 'Das Laden des Tafsir hat zu lange gedauert — die Datei ist groß (2,7 MB), versuche es mit einer schnelleren Verbindung';
  @override
  String get quranTafsirLoadError => 'Tafsir konnte nicht geladen werden — Verbindung prüfen';
  @override
  String quranLastReadingSaved(Object surahName, Object ayahNumber) => 'Letzte Lektüre gespeichert: Sure {surahName} - Vers {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String quranAyahCopyFormat(Object text, Object surahName, Object ayahNumber) => '{text} (Sure {surahName}: {ayahNumber})'.replaceAll('{text}', text.toString()).replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get quranAyahCopiedSnackbar => 'Vers kopiert';
  @override
  String get quranAddedToWird => 'Diese Lektüre wurde zu deinem täglichen Wird hinzugefügt 🌿';
  @override
  String quranSurahAppBarTitle(Object name) => 'Sure {name}'.replaceAll('{name}', name.toString());
  @override
  String get quranViewAsMushafPageTooltip => 'Diese Sure als Mushaf-Seite anzeigen';
  @override
  String quranChooseReciterTooltip(Object reciterName) => 'Rezitator wählen ({reciterName})'.replaceAll('{reciterName}', reciterName.toString());
  @override
  String get quranDecreaseFontTooltip => 'Schrift verkleinern';
  @override
  String get quranIncreaseFontTooltip => 'Schrift vergrößern';
  @override
  String get quranAddToWirdTooltip => 'Zum täglichen Wird hinzufügen';
  @override
  String quranAyahCountLabel(Object count) => '{count} Verse'.replaceAll('{count}', count.toString());
  @override
  String get quranStopSurahRecitationLabel => 'Suren-Rezitation stoppen';
  @override
  String get quranPlaySurahRecitationLabel => 'Die gesamte Suren-Rezitation abspielen';
  @override
  String get quranStopLabel => 'Stopp';
  @override
  String get quranPlayWholeSurahLabel => 'Ganze Sure abspielen';
  @override
  String get quranNoTafsirAvailable => 'Für diesen Vers ist kein Tafsir verfügbar';
  @override
  String get quranStopPlayingAyahLabel => 'Wiedergabe dieses Verses stoppen';
  @override
  String quranPlayAyahLabel(Object number) => 'Vers {number} abspielen'.replaceAll('{number}', number.toString());
  @override
  String get quranPlayAyahTooltip => 'Vers abspielen';
  @override
  String get quranRepeatAyahTooltip => 'Diesen Vers wiederholen';
  @override
  String get quranHideTafsirTooltip => 'Tafsir ausblenden';
  @override
  String get quranShowTafsirTooltip => 'Vereinfachten Tafsir anzeigen';
  @override
  String get quranSaveAsLastReadingTooltip => 'Als letzte Lektüre speichern';
  @override
  String get quranCopyAyahTooltip => 'Vers kopieren';
  @override
  String get quranRemoveFromFavoritesLabel => 'Aus Favoriten entfernen';
  @override
  String get quranAddToFavoritesLabel => 'Zu Favoriten hinzufügen';
  @override
  String get quranRetry => 'Erneut versuchen';
  @override
  String get quranDownloadedForOfflineSnackbar => 'Sure für Offline-Hören heruntergeladen';
  @override
  String get quranDeleteDownloadTitle => 'Download löschen';
  @override
  String get quranDeleteDownloadBody => 'Die heruntergeladenen Audiodateien für diese Sure werden gelöscht.';
  @override
  String quranStopDownloadTooltip(Object done, Object total) => 'Download stoppen ({done}/{total})'.replaceAll('{done}', done.toString()).replaceAll('{total}', total.toString());
  @override
  String get quranDeleteDownloadedTooltip => 'Für Offline-Hören heruntergeladen — zum Löschen tippen';
  @override
  String get quranDownloadForOfflineTooltip => 'Sure für Offline-Hören herunterladen';
  @override
  String get qiblaTitle => 'Qibla-Richtung';
  @override
  String get qiblaRetry => 'Erneut versuchen';
  @override
  String get qiblaLocationServiceDisabled => 'Standortdienste sind auf deinem Gerät deaktiviert. Aktiviere sie, um die Qibla-Richtung zu finden.';
  @override
  String get qiblaPermissionDenied => 'Die App benötigt Standortzugriff, um die Qibla-Richtung genau zu bestimmen.';
  @override
  String get qiblaLocationError => 'Dein Standort konnte nicht ermittelt werden. Überprüfe deine Verbindung und versuche es erneut.';
  @override
  String get qiblaNoCompassSensor => 'Dein Gerät verfügt über keinen Kompass-Sensor. Nutze den unten stehenden Wert mit einem anderen Kompass zur Orientierung.';
  @override
  String get qiblaBearingFromNorth => 'Richtung vom wahren Norden';
  @override
  String get qiblaCompassNorth => 'N';
  @override
  String get qiblaCompassSouth => 'S';
  @override
  String get qiblaCompassEast => 'O';
  @override
  String get qiblaCompassWest => 'W';
  @override
  String get qiblaAligned => 'Du bist zur Qibla ausgerichtet ✓';
  @override
  String get qiblaNotAligned => 'Drehe dein Gerät, bis die Markierung nach oben zeigt';
  @override
  String qiblaBearingValue(Object degrees) => 'Qibla-Richtung: {degrees}° vom Norden'.replaceAll('{degrees}', degrees.toString());
  @override
  String get qiblaCalibrationHint => 'Wenn der Kompass ungenau erscheint, bewege dein Gerät in einer 8er-Bewegung, fern von magnetischen Objekten, um ihn zu kalibrieren';
  @override
  String get toolQiblaTitle => 'Qibla-Richtung';
  @override
  String get toolQiblaSubtitle => 'Ein Kompass, um die Qibla-Richtung überall zu finden';
  @override
  String get toolsTitle => 'Islamische Werkzeuge';
  @override
  String get toolZakatTitle => 'Zakat-Rechner';
  @override
  String get toolZakatSubtitle => 'Berechne deine Zakat ganz einfach';
  @override
  String get toolAsmaTitle => 'Die 99 Namen Allahs';
  @override
  String get toolAsmaSubtitle => 'Die 99 Namen und ihre Bedeutungen';
  @override
  String get toolRamadanTitle => 'Ramadan-Begleiter';
  @override
  String get toolRamadanSubtitle => 'Countdown zu Suhoor und Iftar sowie Fastentracker';
  @override
  String get toolDuasTitle => 'Meine Bittgebete';
  @override
  String get toolDuasSubtitle => 'Speichere deine eigenen Bittgebete';
  @override
  String get toolMosqueTitle => 'Moscheen & Halal-Essen in der Nähe';
  @override
  String get toolMosqueSubtitle => 'Kostenlose Suche mit OpenStreetMap-Daten';
  @override
  String get hadithTitle => 'Vierzig Hadithe von an-Nawawi';
  @override
  String get hadithSubtitle => 'Eine kurze Sammlung von Hadithen zu den Grundlagen der Religion';
  @override
  String get hadithLoadError => 'Die Hadithe konnten nicht geladen werden. Überprüfe deine Internetverbindung.';
  @override
  String get hadithRetry => 'Erneut versuchen';
  @override
  String hadithNumberLabel(Object number) => 'Hadith {number}'.replaceAll('{number}', number.toString());
  @override
  String get hadithSearchHint => 'Hadithe durchsuchen';
  @override
  String get hadithNoResults => 'Keine Ergebnisse';
  @override
  String get hadithCopiedSnackbar => 'Hadith kopiert';
  @override
  String get hadithAddToFavoritesLabel => 'Zu Favoriten hinzufügen';
  @override
  String get hadithRemoveFromFavoritesLabel => 'Aus Favoriten entfernen';
  @override
  String get hadithCopyTooltip => 'Hadith kopieren';
  @override
  String get hadithTranslationNote => 'Auf Arabisch und Englisch angezeigt — für diese Sammlung ist noch keine deutsche Übersetzung verfügbar';
  @override
  String get toolHadithTitle => 'Vierzig Hadithe von an-Nawawi';
  @override
  String get toolHadithSubtitle => 'Die 40 (42) von Imam an-Nawawi zusammengestellten Hadithe';
  @override
  String get homeHadithOfTheDay => 'Hadith des Tages';
  @override
  String get homeShareHadith => 'Hadith teilen';
  @override
  String get homeHadithSource => 'Quelle: 40 Hadith an-Nawawi';
  @override
  String get toolKhatmaTitle => 'Khatma-Tracker';
  @override
  String get toolKhatmaSubtitle => 'Plane und verfolge deine Koran-Lesung';
  @override
  String get khatmaTrackerTitle => 'Khatma-Tracker';
  @override
  String get khatmaNoPlanTitle => 'Beginne deine Khatma-Reise';
  @override
  String get khatmaNoPlanBody => 'Lege ein Zieldatum fest, um den ganzen Koran zu lesen — wir helfen dir, auf Kurs zu bleiben.';
  @override
  String get khatmaChooseDuration => 'Wähle eine Dauer';
  @override
  String get khatmaDuration7Days => '7 Tage';
  @override
  String get khatmaDuration30Days => '30 Tage';
  @override
  String get khatmaDuration60Days => '60 Tage';
  @override
  String get khatmaDuration90Days => '90 Tage';
  @override
  String get khatmaCustomDate => 'Eigenes Datum wählen';
  @override
  String khatmaProgressLabel(Object completed, Object total) => '{completed} von {total} Suren'.replaceAll('{completed}', completed.toString()).replaceAll('{total}', total.toString());
  @override
  String get khatmaDaysElapsed => 'Vergangene Tage';
  @override
  String get khatmaDaysRemaining => 'Verbleibende Tage';
  @override
  String get khatmaTargetDate => 'Zieldatum';
  @override
  String get khatmaOnTrack => 'Du bist auf Kurs — weiter so!';
  @override
  String get khatmaBehindSchedule => 'Du bist etwas im Rückstand';
  @override
  String khatmaPaceNeeded(Object count) => 'Lies etwa {count} Suren/Tag, um rechtzeitig fertig zu werden'.replaceAll('{count}', count.toString());
  @override
  String get khatmaCompletedCelebration => 'Alhamdulillah! Du hast deine Khatma abgeschlossen 🎉';
  @override
  String get khatmaContinueReading => 'Weiterlesen';
  @override
  String get khatmaEditPlan => 'Zieldatum ändern';
  @override
  String get khatmaResetPlanTitle => 'Khatma-Plan zurücksetzen';
  @override
  String get khatmaResetPlanBody => 'Dadurch werden dein Plan und dein Lesefortschritt gelöscht, damit du eine neue Khatma beginnen kannst. Dies kann nicht rückgängig gemacht werden.';
  @override
  String get khatmaResetPlanConfirm => 'Zurücksetzen';
  @override
  String get khatmaPlanReset => 'Neue Khatma gestartet, viel Erfolg! 🌟';
  @override
  String get settingsRemindMeFor => 'Erinnere mich an';
  @override
  String get settingsNotifyAtPrayerTime => 'Bei Gebetszeit benachrichtigen';
  @override
  String get settingsNotifyAtPrayerTimeSubtitle => 'Erhalte eine Benachrichtigung genau zu Beginn der Gebetszeit';
  @override
  String get settingsPostPrayerReminder => 'An das Gebet erinnern';
  @override
  String get settingsPostPrayerReminderSubtitle => 'Eine sanfte Nachfrage, falls das Gebet nicht als erledigt markiert wurde';
  @override
  String settingsPostPrayerReminderMinutesLabel(Object minutes) => '{minutes} Min. danach'.replaceAll('{minutes}', minutes.toString());
  @override
  String get settingsReminderOff => 'Aus';
  @override
  String prayerTimeNowBody(Object prayer) => 'Es ist Zeit für das {prayer}-Gebet'.replaceAll('{prayer}', prayer.toString());
  @override
  String postPrayerReminderBody(Object prayer) => 'Hast du {prayer} schon gebetet?'.replaceAll('{prayer}', prayer.toString());
  @override
  String get settingsMoreReminders => 'Weitere Erinnerungen';
  @override
  String get settingsFridayReminder => 'Freitagserinnerung';
  @override
  String get settingsFridayReminderSubtitle => 'Eine wöchentliche Erinnerung an das Freitagsgebet und Surah Al-Kahf';
  @override
  String get settingsMorningAzkarReminder => 'Morgen-Azkar';
  @override
  String get settingsMorningAzkarReminderSubtitle => 'Eine tägliche Erinnerung, deine Morgen-Gedenken zu rezitieren';
  @override
  String get settingsEveningAzkarReminder => 'Abend-Azkar';
  @override
  String get settingsEveningAzkarReminderSubtitle => 'Eine tägliche Erinnerung, deine Abend-Gedenken zu rezitieren';
  @override
  String get settingsDailyWirdReminder => 'Täglicher Wird';
  @override
  String get settingsDailyWirdReminderSubtitle => 'Eine tägliche Erinnerung, dein heutiges Koran-Pensum abzuschließen';
  @override
  String get settingsSleepAzkarReminder => 'Schlaf-Azkar';
  @override
  String get settingsSleepAzkarReminderSubtitle => 'Eine nächtliche Erinnerung, deine Schlaf-Gedenken zu rezitieren';
  @override
  String get reminderFridayBody => 'Gesegneten Freitag! Vergiss nicht, heute Surah Al-Kahf zu lesen 🕌';
  @override
  String get reminderMorningAzkarBody => 'Zeit für deine Morgen-Azkar 🌞';
  @override
  String get reminderEveningAzkarBody => 'Zeit für deine Abend-Azkar 🌇';
  @override
  String get reminderDailyWirdBody => 'Hast du dein heutiges Koran-Pensum schon abgeschlossen? 📖';
  @override
  String get reminderSleepAzkarBody => 'Rezitiere vor dem Schlafen deine Azkar 🌙';
  @override
  String get khatmaMyPlans => 'Meine Khatma-Pläne';
  @override
  String get khatmaStartNewPlan => 'Neue Khatma starten';
  @override
  String get khatmaPlanLabelHint => 'Name dieser Khatma (optional)';
  @override
  String khatmaBehindByCount(Object count) => '{count} Suren im Rückstand'.replaceAll('{count}', count.toString());
  @override
  String khatmaNewPaceLabel(Object count) => 'Neues Tagesziel: {count} Suren/Tag'.replaceAll('{count}', count.toString());
  @override
  String get khatmaDeletePlanTitle => 'Diese Khatma löschen?';
  @override
  String get khatmaDeletePlanBody => 'Dadurch werden der Plan und sein Fortschritt entfernt. Dies kann nicht rückgängig gemacht werden.';
  @override
  String get khatmaDeletePlanConfirm => 'Löschen';
  @override
  String khatmaDefaultPlanLabel(Object number) => 'Khatma Nr. {number}'.replaceAll('{number}', number.toString());
  @override
  String get khatmaAddAnother => 'Weitere Khatma hinzufügen';
  @override
  String get toolInsightsTitle => 'Wirdi Einblicke';
  @override
  String get toolInsightsSubtitle => 'Sieh deine wöchentlichen Andachts-Statistiken und Trends';
  @override
  String get insightsTitle => 'Wirdi Einblicke';
  @override
  String get insightsThisWeek => 'Diese Woche';
  @override
  String get insightsQuranPages => 'Koranseiten';
  @override
  String get insightsAzkarCompleted => 'Abgeschlossene Azkar';
  @override
  String get insightsPrayers => 'Gebete';
  @override
  String get insightsTasbeeh => 'Tasbeeh';
  @override
  String get insightsCurrentStreak => 'Aktuelle Serie';
  @override
  String insightsDaysCount(Object count) => '{count} Tage'.replaceAll('{count}', count.toString());
  @override
  String get insightsWeeklyActivity => 'Wöchentliche Aktivität';
  @override
  String get insightsBestDay => 'Bester Tag';
  @override
  String get insightsMostConsistent => 'Am konsequentesten';
  @override
  String get insightsWeekComparisonTitle => 'Diese Woche vs. letzte Woche';
  @override
  String insightsImproved(Object percent) => '{percent}% aktiver als letzte Woche'.replaceAll('{percent}', percent.toString());
  @override
  String insightsDeclined(Object percent) => '{percent}% weniger aktiv als letzte Woche'.replaceAll('{percent}', percent.toString());
  @override
  String get insightsFirstActiveWeek => 'Deine erste aktive Woche -- weiter so!';
  @override
  String get insightsNoActivityYet => 'Diese Woche wurde noch keine Aktivität erfasst';
  @override
  String get insightsSameAsLastWeek => 'Gleiches Aktivitätsniveau wie letzte Woche';
  @override
  String get insightsNoBestDayYet => 'Noch nicht genug Aktivität';
  @override
  String get toolMyWirdiTitle => 'Mein Wirdi';
  @override
  String get toolMyWirdiSubtitle => 'Sieh, wie du heute bei all deinen Andachten stehst';
  @override
  String get myWirdiTitle => 'Mein Wirdi';
  @override
  String get myWirdiToday => 'Heute';
  @override
  String get myWirdiCompleted => 'Alhamdulillah! Du hast dein heutiges Wird abgeschlossen 🎉';
  @override
  String myWirdiRemaining(Object percent) => '{percent}% verbleibend, um dein heutiges Wird abzuschließen'.replaceAll('{percent}', percent.toString());
  @override
  String get myWirdiPersonalDua => 'Persönliches Bittgebet';
  @override
  String get myWirdiDuaDone => 'Heute rezitiert';
  @override
  String get myWirdiDuaNotYet => 'Noch nicht heute';
  @override
  String get homeMyWirdiCardTitle => 'Mein Wirdi heute';
  @override
  String get homeQuickQibla => 'Qibla';
  @override
  String get qiblaDistanceLabel => 'Entfernung nach Mekka';
  @override
  String qiblaDistanceValue(Object km) => '{km} km'.replaceAll('{km}', km.toString());
  @override
  String get achievementStreak3Title => 'Guter Anfang';
  @override
  String get achievementStreak3Desc => '3-Tage-Wird-Serie erreicht';
  @override
  String get achievementStreak7Title => 'Eine starke Woche';
  @override
  String get achievementStreak7Desc => '7-Tage-Wird-Serie erreicht';
  @override
  String get achievementStreak30Title => 'Gewohnheit gebildet';
  @override
  String get achievementStreak30Desc => '30-Tage-Wird-Serie erreicht';
  @override
  String get achievementStreak100Title => 'Unaufhaltsam';
  @override
  String get achievementStreak100Desc => '100-Tage-Wird-Serie erreicht';
  @override
  String get achievementQuran10Title => 'Erste Schritte';
  @override
  String get achievementQuran10Desc => '10% des Korans abgeschlossen';
  @override
  String get achievementQuran25Title => 'Ein Viertel geschafft';
  @override
  String get achievementQuran25Desc => '25% des Korans abgeschlossen';
  @override
  String get achievementQuran50Title => 'Die Hälfte geschafft';
  @override
  String get achievementQuran50Desc => '50% des Korans abgeschlossen';
  @override
  String get achievementQuran100Title => 'Khatm al-Quran';
  @override
  String get achievementQuran100Desc => 'Den gesamten Koran abgeschlossen';
  @override
  String get achievementKhatma1Title => 'Erste Khatma';
  @override
  String get achievementKhatma1Desc => 'Deine erste Khatma abgeschlossen';
  @override
  String get achievementKhatma3Title => 'Khatma-Liebhaber';
  @override
  String get achievementKhatma3Desc => '3 Khatma-Pläne abgeschlossen';
  @override
  String get achievementPages50Title => 'Bücherwurm';
  @override
  String get achievementPages50Desc => 'Insgesamt 50 Seiten gelesen';
  @override
  String get achievementPages200Title => 'Engagierter Leser';
  @override
  String get achievementPages200Desc => 'Insgesamt 200 Seiten gelesen';
  @override
  String get achievementPages604Title => 'Vollständiger Mushaf';
  @override
  String get achievementPages604Desc => 'Insgesamt 604 Seiten gelesen -- ein kompletter Mushaf';
  @override
  String get achievementAzkar50Title => 'Anfänger im Gedenken';
  @override
  String get achievementAzkar50Desc => '50 Azkar abgeschlossen';
  @override
  String get achievementAzkar500Title => 'Meister im Gedenken';
  @override
  String get achievementAzkar500Desc => '500 Azkar abgeschlossen';
  @override
  String get achievementTasbeeh100Title => 'Erstes Tasbeeh';
  @override
  String get achievementTasbeeh100Desc => '100 Tasbeeh gezählt';
  @override
  String get achievementTasbeeh1000Title => 'Tasbeeh-Liebhaber';
  @override
  String get achievementTasbeeh1000Desc => '1.000 Tasbeeh gezählt';
  @override
  String get achievementPrayers50Title => 'Beständiger Beter';
  @override
  String get achievementPrayers50Desc => '50 Gebete als erledigt markiert';
  @override
  String get achievementPrayers350Title => 'Gebets-Champion';
  @override
  String get achievementPrayers350Desc => '350 Gebete als erledigt markiert';
  @override
  String get achievementFavorites10Title => 'Sammler';
  @override
  String get achievementFavorites10Desc => '10 Favoriten gespeichert';
  @override
  String get achievementsTitle => 'Erfolge';
  @override
  String achievementsUnlockedCount(Object unlocked, Object total) => '{unlocked} von {total} freigeschaltet'.replaceAll('{unlocked}', unlocked.toString()).replaceAll('{total}', total.toString());
  @override
  String get toolAchievementsTitle => 'Erfolge';
  @override
  String get toolAchievementsSubtitle => 'Verfolge deine Meilensteine und Abzeichen';
  @override
  String get quranShareAsImageTooltip => 'Als Bild teilen';
  @override
  String get ayahShareTitle => 'Vers teilen';
  @override
  String get ayahShareIncludeTranslation => 'Übersetzung einbeziehen';
  @override
  String get ayahShareButton => 'Teilen';
  @override
  String get myDuasDialogTitleNew => 'Neues Bittgebet';
  @override
  String get myDuasDialogTitleEdit => 'Bittgebet bearbeiten';
  @override
  String get myDuasTitleFieldLabel => 'Titel (optional)';
  @override
  String get myDuasTextFieldLabel => 'Text des Bittgebets';
  @override
  String get myDuasEmptyTitle => 'Noch keine Bittgebete hinzugefügt';
  @override
  String get myDuasEmptySubtitle => 'Tippe auf +, um dein eigenes Bittgebet hinzuzufügen';
  @override
  String get ramadanCountdownToSuhoor => 'Verbleibende Zeit bis zum Suhoor (Fajr-Adhan)';
  @override
  String get ramadanCountdownToIftar => 'Verbleibende Zeit bis zum Iftar (Maghrib-Adhan)';
  @override
  String get ramadanCountdownToSuhoorTomorrow => 'Verbleibende Zeit bis zum morgigen Suhoor';
  @override
  String get ramadanLoadError => 'Die für Suhoor und Iftar benötigten Gebetszeiten konnten nicht geladen werden.';
  @override
  String ramadanDayOfRamadan(Object day) => 'Tag {day} des Ramadan'.replaceAll('{day}', day.toString());
  @override
  String get ramadanFastingToday => 'Heute fastend';
  @override
  String get ramadanFastingSubtitle => 'Erfasse dein heutiges Fasten, um deinen Fortschritt zu verfolgen';
  @override
  String get ramadanDaysLoggedTitle => 'Diesen Monat erfasste Fastentage';
  @override
  String get ramadanHijriFootnote => 'Hinweis: Das Hijri-Datum hier ist eine berechnete Schätzung und kann um einen Tag von der offiziellen Ankündigung des Monatsbeginns in deinem Land abweichen.';
  @override
  String get mushafTitle => 'Der Mushaf';
  @override
  String get mushafStopAudioTooltip => 'Audio stoppen';
  @override
  String get mushafLoadError => 'Mushaf-Seiten konnten nicht geladen werden. Überprüfe deine Internetverbindung.';
  @override
  String get mushafTapAyahHint => 'Tippe auf einen Vers, um seine Rezitation abzuspielen';
  @override
  String mushafPageNumber(Object number) => 'Seite {number}'.replaceAll('{number}', number.toString());
  @override
  String get mosqueLocationServiceDisabled => 'Der Standortdienst ist auf deinem Gerät deaktiviert.';
  @override
  String get mosqueLocationPermissionNeeded => 'Die App benötigt Standortzugriff, um nach Orten in der Nähe zu suchen.';
  @override
  String get mosqueSearchError => 'Orte in der Nähe konnten nicht gesucht werden -- überprüfe deine Internetverbindung.';
  @override
  String get mosqueTabMosques => 'Moscheen';
  @override
  String get mosqueTabHalalRestaurants => 'Halal-Restaurants';
  @override
  String get mosqueNoMosquesFound => 'Keine Moscheen in der Nähe in den OpenStreetMap-Daten gefunden';
  @override
  String get mosqueNoHalalFound => 'Keine als \'halal\' gekennzeichneten Restaurants in der Nähe gefunden -- Halal-Restaurantdaten auf OpenStreetMap sind in vielen Regionen unvollständig';
  @override
  String get onboardingGoalTitle => 'Wie viel Koran möchtest du täglich lesen?';
  @override
  String get onboardingGoalLight => 'Leicht';
  @override
  String get onboardingGoalLightDesc => '2 Seiten pro Tag';
  @override
  String get onboardingGoalRegular => 'Normal';
  @override
  String get onboardingGoalRegularDesc => '5 Seiten pro Tag';
  @override
  String get onboardingGoalAdvanced => 'Fortgeschritten';
  @override
  String get onboardingGoalAdvancedDesc => '10 Seiten pro Tag';
  @override
  String get onboardingEnableReminders => 'Tägliche Erinnerungen aktivieren';
  @override
  String get onboardingEnableRemindersDesc => 'Erhalte Erinnerungen für dein tägliches Wird und Azkar';
  @override
  String get toolBookmarksTitle => 'Lesezeichen';
  @override
  String get toolBookmarksSubtitle => 'Verse mit Notizen und Kategorien speichern';
  @override
  String get bookmarksTitle => 'Lesezeichen';
  @override
  String get bookmarksEmptyTitle => 'Noch keine Lesezeichen';
  @override
  String get bookmarksEmptySubtitle => 'Tippe beim Lesen auf das Lesezeichen-Symbol eines Verses, um ihn hier zu speichern';
  @override
  String get bookmarkAddTooltip => 'Lesezeichen hinzufügen';
  @override
  String get bookmarkDialogTitle => 'Lesezeichen hinzufügen';
  @override
  String get bookmarkNoteLabel => 'Notiz (optional)';
  @override
  String get bookmarkCategoryLabel => 'Kategorie';
  @override
  String get bookmarkCategoryRamadan => 'Ramadan';
  @override
  String get bookmarkCategoryDua => 'Bittgebet';
  @override
  String get bookmarkCategoryFamily => 'Familie';
  @override
  String get bookmarkCategoryStudy => 'Studium';
  @override
  String get bookmarkCategoryPersonal => 'Persönlich';
  @override
  String get bookmarkCategoryOther => 'Alle';
  @override
  String get bookmarkSavedSnackbar => 'Lesezeichen gespeichert';
  @override
  String get bookmarkDeleteConfirmTitle => 'Dieses Lesezeichen löschen?';
  @override
  String get bookmarkDeleteConfirmBody => 'Dies kann nicht rückgängig gemacht werden.';
  @override
  String get bookmarkDeleteConfirm => 'Löschen';
  @override
  String get settingsPrivacyCenter => 'Datenschutz-Center';
  @override
  String get settingsPrivacyCenterSubtitle => 'Sieh, was gespeichert ist, exportiere oder lösche deine Daten';
  @override
  String get privacyCenterTitle => 'Datenschutz-Center';
  @override
  String get privacyCenterIntro => 'Deine Andachtsdaten gehören dir.';
  @override
  String get privacyCenterLocalDataTitle => 'Was lokal gespeichert wird';
  @override
  String get privacyCenterLocalDataBody => 'Lesefortschritt, Azkar-/Tasbeeh-Zähler, Favoriten, Lesezeichen, persönliche Bittgebete, Khatma-Pläne, Erfolge und Einstellungen -- nur auf diesem Gerät über SharedPreferences gespeichert. Nichts wird auf einen Server hochgeladen.';
  @override
  String get privacyCenterLocationTitle => 'Standortnutzung';
  @override
  String get privacyCenterLocationBody => 'Der Standort deines Geräts wird nur zur Berechnung der Gebetszeiten, zur Bestimmung der Qibla-Richtung und zur Suche nach Moscheen/Halal-Restaurants in der Nähe verwendet. Er wird niemals gespeichert oder an einen anderen Dienst weitergegeben.';
  @override
  String get privacyCenterNoAccountsTitle => 'Keine Konten, Werbung oder Tracking';
  @override
  String get privacyCenterNoAccountsBody => 'Diese App erfordert kein Konto, zeigt keine Werbung und verwendet keine Analyse- oder Tracking-SDKs.';
  @override
  String get privacyCenterExportButton => 'Meine Daten exportieren';
  @override
  String get privacyCenterExportSuccessSnackbar => 'Deine Daten wurden zum Export vorbereitet';
  @override
  String get privacyCenterDeleteButton => 'Meine Daten löschen';
  @override
  String get privacyCenterDeleteConfirmTitle => 'Alle lokalen Daten löschen?';
  @override
  String get privacyCenterDeleteConfirmBody => 'Dies löscht dauerhaft deinen gesamten Fortschritt, Favoriten, Lesezeichen, Bittgebete, Erfolge und Einstellungen von diesem Gerät. Dies kann nicht rückgängig gemacht werden.';
  @override
  String get privacyCenterDeleteConfirmButton => 'Alles löschen';
  @override
  String get privacyCenterDeleteDoneSnackbar => 'Alle lokalen Daten wurden gelöscht';
  @override
  String get privacyCenterViewPolicy => 'Vollständige Datenschutzerklärung ansehen';
  @override
  String homeRamadanBannerTitle(Object day) => 'Tag {day} des Ramadan'.replaceAll('{day}', day.toString());
  @override
  String get homeRamadanBannerSubtitle => 'Tippe für deinen Ramadan-Begleiter';
  @override
  String get ramadanLast10NightsTitle => 'Die letzten 10 Nächte';
  @override
  String get ramadanLast10NightsBody => 'Diese letzten Nächte des Ramadan sind die gesegnetsten -- intensiviere deine Andacht, den Koran und das Bittgebet.';
  @override
  String get ramadanPossibleLaylatAlQadr => 'Heute Nacht könnte Laylat al-Qadr sein';
  @override
  String get commonEditTooltip => 'Bearbeiten';
  @override
  String get commonDeleteTooltip => 'Löschen';
  @override
  String get commonSettingsTooltip => 'Einstellungen';
  @override
  String get commonDecreaseTooltip => 'Verringern';
  @override
  String get commonIncreaseTooltip => 'Erhöhen';
  @override
  String get commonShareTooltip => 'Teilen';
  @override
  String get commonRefreshTooltip => 'Aktualisieren';
  @override
  String get homeNextPrayerCardLabel => 'Nächste Gebetszeit';
  @override
  String get homeWeeklyInsightsCardLabel => 'Wöchentliche Einblicke';
  @override
  String get settingsTajweedColoring => 'Tajweed Coloring';
  @override
  String get settingsTajweedColoringSubtitle => 'Color Quranic text based on Tajweed rules';
  @override
  String get settingsBackupRestore => 'Backup & Restore';
  @override
  String get settingsExportBackup => 'Export Backup';
  @override
  String get settingsExportBackupSubtitle => 'Save your progress and settings to a file';
  @override
  String get settingsImportBackup => 'Import Backup';
  @override
  String get settingsImportBackupSubtitle => 'Restore data from a previously saved file';
  @override
  String get settingsImportSuccess => 'Backup imported successfully! Please restart the app.';
  @override
  String get settingsImportError => 'Failed to import backup. Ensure the file is valid.';
  @override
  String get tajweedLegendTitle => 'Tajweed Rules';
  @override
  String get tajweedLegendIntro => 'Color coding for Quranic recitation rules:';
  @override
  String get tajweedQalqalahLabel => 'Qalqalah (Echoing)';
  @override
  String get tajweedGhunnahLabel => 'Ghunnah (Nasalization)';
  @override
  String get tajweedIkhfaLabel => 'Ikhfa (Hiding)';
  @override
  String get tajweedIdghamGhunnahLabel => 'Idgham with Ghunnah';
  @override
  String get tajweedIdghamNoGhunnahLabel => 'Idgham without Ghunnah';
  @override
  String get tajweedIqlabLabel => 'Iqlab (Conversion)';
  @override
  String get tajweedLegendClose => 'Close';
  @override
  String get radioTitle => 'Islamisches Radio';
  @override
  String get radioSubtitle => 'Quran & Vorlesungen live hören';
  @override
  String get radioAll => 'Alle';
  @override
  String get radioNowPlaying => 'Wird gespielt';
  @override
  String get radioFavorites => 'Favoriten';
  @override
  String get radioNoFavorites => 'Noch keine Lieblingssender';
  @override
  String get radioNoStations => 'Keine Sender in dieser Kategorie';
  @override
  String get radioAddFavorite => 'Zu Favoriten hinzufügen';
  @override
  String get radioRemoveFavorite => 'Aus Favoriten entfernen';
  @override
  String get radioSleepTimer => 'Schlaf-Timer';
  @override
  String get radioSleepTimerSubtitle => 'Stoppt das Radio automatisch nach der eingestellten Zeit';
  @override
  String get radioSleepTimerCancel => 'Timer abbrechen';
  @override
  String get radioMinutes => 'Min';
  @override
  String radioSleepTimerActive(Object minutes) => 'Stoppt in {minutes} Min'.replaceAll('{minutes}', minutes.toString());
  @override
  String get radioOfficial => 'Offiziell';
  @override
  String get radioStreamError => 'Verbindung zum Sender nicht möglich. Überprüfen Sie Ihre Verbindung.';
}
class _AppLocalizations_tr extends AppLocalizations {
  _AppLocalizations_tr() : super('tr');
  @override
  String get appTitle => 'Wirdi';
  @override
  String get navHome => 'Ana Sayfa';
  @override
  String get navQuran => 'Kur\'an';
  @override
  String get navAzkar => 'Zikirler';
  @override
  String get navPrayer => 'Namaz';
  @override
  String get navTasbeeh => 'Tesbih';
  @override
  String get navMore => 'Diğer';
  @override
  String get commonCancel => 'İptal';
  @override
  String get commonSave => 'Kaydet';
  @override
  String get commonDelete => 'Sil';
  @override
  String get commonClose => 'Kapat';
  @override
  String get commonOk => 'Tamam';
  @override
  String get commonBack => 'Geri';
  @override
  String get commonNext => 'İleri';
  @override
  String get commonSkip => 'Atla';
  @override
  String get commonDone => 'Bitti';
  @override
  String get commonRetry => 'Tekrar Dene';
  @override
  String get commonShare => 'Paylaş';
  @override
  String get commonSearch => 'Ara';
  @override
  String get commonEdit => 'Düzenle';
  @override
  String get commonConfirm => 'Onayla';
  @override
  String get commonLoading => 'Yükleniyor…';
  @override
  String get commonError => 'Bir şeyler ters gitti';
  @override
  String get commonYes => 'Evet';
  @override
  String get commonNo => 'Hayır';
  @override
  String get languageName_ar => 'Arapça';
  @override
  String get languageName_en => 'İngilizce';
  @override
  String get languageName_de => 'Almanca';
  @override
  String get languageName_tr => 'Türkçe';
  @override
  String get settingsLanguage => 'Dil';
  @override
  String get settingsLanguageSystem => 'Sistem varsayılanı';
  @override
  String get settingsLanguageSubtitle => 'Uygulamanın görüntüleme dilini seçin';
  @override
  String get asmaUlHusnaTitle => 'Allah\'ın 99 İsmi (Esmâ-i Hüsnâ)';
  @override
  String get sourcesLicensesTitle => 'Kaynaklar ve Lisanslar';
  @override
  String get sourcesOssLicensesButton => 'Açık kaynak paket lisansları';
  @override
  String get aboutTitle => 'Uygulama Hakkında';
  @override
  String get aboutTagline => 'Zikir ve Kur\'an için günlük yol arkadaşınız';
  @override
  String get aboutVersion => 'Sürüm 1.0.0';
  @override
  String get aboutBody => 'Wirdi; Kur\'an okumanı, zikirlerini, namaz vakitlerini ve tesbihatını sade ve sakin bir tasarımda tek bir yerde takip etmeni sağlayan günlük bir İslami yol arkadaşı uygulamasıdır. Uygulamada reklam veya takip bulunmaz; tüm verilerin cihazında kalır.';
  @override
  String get onboardingSkip => 'Atla';
  @override
  String get onboardingSlide1 => 'Kur\'an\'ı gününün bir parçası yap';
  @override
  String get onboardingSlide2 => 'Günlük virdini takip et ve bir alışkanlık oluştur';
  @override
  String get onboardingSlide3 => 'Vakit seni hatırlatmadan önce kalbini hatırlat';
  @override
  String get onboardingStart => 'Yolculuğuna başla';
  @override
  String get onboardingNext => 'İleri';
  @override
  String get privacyPolicyTitle => 'Gizlilik Politikası';
  @override
  String get favoritesTitle => 'Favoriler';
  @override
  String get favoritesTabAyahs => 'Kur\'an Ayetleri';
  @override
  String get favoritesTabAzkar => 'Zikirler';
  @override
  String get favoritesLoadError => 'Favoriler yüklenemedi';
  @override
  String get favoritesEmptyAyahs => 'Henüz favori ayet yok';
  @override
  String get favoritesEmptyAzkar => 'Henüz favori zikir yok';
  @override
  String favoritesAyahSubtitle(Object surahName, Object ayahNumber) => '{surahName} Suresi - {ayahNumber}. Ayet'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get zakatTitle => 'Zekat Hesaplayıcı';
  @override
  String get zakatNisabHint => 'Hesaplamadan önce güncel nisap değerini (altın veya gümüşün güncel piyasa fiyatına göre) girin; çünkü nisap fiyatı her gün değişir ve uygulama içinde sabitlenemez. Yerel fetva merciine danışabilir veya güncel altın gramı fiyatını (85 gram altın veya karşılığı gümüş) kontrol edebilirsiniz.';
  @override
  String get zakatCurrentNisab => 'Güncel nisap değeri';
  @override
  String get zakatableAssets => 'Zekata tabi varlıklar';
  @override
  String get zakatCash => 'Nakit ve benzeri (banka, cüzdan)';
  @override
  String get zakatGoldSilver => 'Altın ve gümüş (piyasa değeri)';
  @override
  String get zakatInvestments => 'Yatırımlar ve hisseler';
  @override
  String get zakatBusiness => 'Ticaret malları (satış için hazırlanan mal)';
  @override
  String get zakatReceivables => 'Tahsili beklenen alacaklar';
  @override
  String get zakatOwedDebts => 'Üzerinizdeki borçlar';
  @override
  String get zakatCurrentDebts => 'Şu anda üzerinizdeki borç ve faturalar';
  @override
  String get zakatNetWealth => 'Net zekata tabi mal';
  @override
  String get zakatEnterNisabFirst => 'Önce nisap değerini girin';
  @override
  String get zakatBelowNisab => 'Malınız nisaba ulaşmadı — zekat gerekmez';
  @override
  String get zakatDue => 'Ödenecek zekat (%2,5)';
  @override
  String get zakatFootnote => 'Not: Bu hesaplayıcı, tam bir kamerî yıl elde tutulan ve nisaba ulaşan mal üzerinden standart oranda (%2,5) genel bir tahmin sunar. Ekinler, hayvanlar ve madenler için zekat farklı hükümlere tabidir ve burada ele alınmamıştır. Özel durumlar için ehil bir âlime danışmak en iyisidir.';
  @override
  String get settingsTitle => 'Ayarlar';
  @override
  String get settingsAppearance => 'Görünüm';
  @override
  String get settingsMode => 'Mod';
  @override
  String get settingsModeLight => 'Açık';
  @override
  String get settingsModeDark => 'Koyu';
  @override
  String get settingsModeAuto => 'Otomatik';
  @override
  String get settingsFontSize => 'Yazı boyutu';
  @override
  String get settingsFontPreview => 'Yazı boyutunu önizlemek için örnek metin';
  @override
  String get settingsShowTransliteration => 'Latin harfleriyle okunuşu göster';
  @override
  String get settingsShowTransliterationSubtitle => 'Okumayı öğrenenler için faydalıdır — her ayetin altında görünür';
  @override
  String get settingsPrayerReminder => 'Namaz Hatırlatıcı';
  @override
  String get settingsPrayerReminderEnable => 'Yaklaşan namaz hatırlatıcısını etkinleştir';
  @override
  String get settingsPrayerReminderSubtitle => 'Hatırlatıcı yalnızca uygulama açıkken çalışır';
  @override
  String get settingsPrayerReminderMinutesBefore => 'Namazdan önce hatırlat (dakika)';
  @override
  String settingsPrayerReminderMinutesLabel(Object minutes) => '{minutes} dakika'.replaceAll('{minutes}', minutes.toString());
  @override
  String get settingsPrayerReminderMethod => 'Hatırlatma yöntemi';
  @override
  String get settingsReminderBanner => 'Sadece bildirim';
  @override
  String get settingsReminderBeep => 'Uyarı tonu';
  @override
  String get settingsReminderAdhan => 'Tam ezan';
  @override
  String get settingsTestTone => 'Tonu dene';
  @override
  String get settingsAdhanSound => 'Ezan sesi';
  @override
  String get settingsStopPreview => 'Önizlemeyi durdur';
  @override
  String get settingsListen => 'Dinle';
  @override
  String get settingsReminderNote => 'Not: Uygulama kapalıyken bile gerçek bir bildirim gönderir, ancak bu seçeneği açtığınızda bildirim izni (ve Android 12+ üzerinde kesin alarm izni) vermeniz gerekir. Bugünün ve yarının hatırlatıcıları, Ana Sayfa veya Namaz Vakitleri ekranını her açtığınızda yeniden planlanır.';
  @override
  String get settingsDailyWird => 'Günlük Vird';
  @override
  String get settingsDailyWirdTarget => 'Günlük hedef (sayfa/sure)';
  @override
  String settingsDailyWirdPerDay(Object count) => 'Günde {count}'.replaceAll('{count}', count.toString());
  @override
  String get settingsAboutSupport => 'Hakkında ve Destek';
  @override
  String get settingsAbout => 'Hakkında';
  @override
  String get settingsSourcesLicenses => 'Kaynaklar ve Lisanslar';
  @override
  String get settingsPrivacyPolicy => 'Gizlilik Politikası';
  @override
  String get settingsDataManagement => 'Veri Yönetimi';
  @override
  String get settingsQuranLastUpdate => 'Kur\'an son güncelleme';
  @override
  String get settingsAzkarLastUpdate => 'Zikirler son güncelleme';
  @override
  String get settingsNotDownloadedYet => 'Henüz indirilmedi';
  @override
  String get settingsUpdateNow => 'Verileri şimdi güncelle';
  @override
  String get settingsRequiresInternet => 'İnternet bağlantısı gerektirir';
  @override
  String get settingsDataUpdated => 'Kur\'an ve zikir verileri güncellendi';
  @override
  String get settingsDownloadedAudio => 'Çevrimdışı dinleme için indirilen tilavetler';
  @override
  String get settingsNoDownloadedAudio => 'İndirilmiş tilavet yok';
  @override
  String settingsMbDownloaded(Object size) => '{size} MB indirildi'.replaceAll('{size}', size.toString());
  @override
  String get settingsDeleteAll => 'Tümünü sil';
  @override
  String get settingsDeleteAllDownloadsTitle => 'Tüm indirilmiş tilavetleri sil';
  @override
  String get settingsDeleteAllDownloadsBody => 'Tüm sureler için indirilmiş ses dosyaları silinecektir. Dinleme çevrimiçi akışa geri dönecektir.';
  @override
  String get settingsResetKhatma => 'Hatim ilerlemesini sıfırla';
  @override
  String get settingsResetKhatmaSubtitle => 'Sıfırdan yeni bir hatme başlat';
  @override
  String get settingsResetKhatmaBody => 'Yeni bir hatme başlatmak için tüm sureler yeniden okunmamış olarak işaretlenecek. Günlük virdiniz ve favorileriniz etkilenmeyecek.';
  @override
  String get settingsResetKhatmaConfirm => 'Sıfırla';
  @override
  String get settingsKhatmaResetDone => 'Yeni bir hatme başladı, başarılar! 🌿';
  @override
  String get settingsDeleteLocalData => 'Tüm yerel verileri sil';
  @override
  String get settingsDeleteLocalDataBody => 'Favoriler, tesbih istatistikleri, günlük vird ilerlemesi ve bu cihazda kayıtlı tüm ayarlar silinecektir. Bu işlem geri alınamaz.';
  @override
  String get settingsLocalDataDeleted => 'Tüm yerel veriler silindi';
  @override
  String get settingsPreviewFailed => 'Önizleme oynatılamadı — bağlantınızı kontrol edin';
  @override
  String get quranTranslationUnavailable => 'Bu ayet için çeviri mevcut değil';
  @override
  String get quranTranslationLoadFailed => 'Çeviri yüklenemedi';
  @override
  String get quranTranslationRetry => 'Tekrar dene';
  @override
  String get quranTranslationSourceNote => 'QuranEnc.com\'dan çeviri';
  @override
  String get homeGreetingNight => 'Mübarek geceler 🌙';
  @override
  String get homeGreetingMorning => 'Günaydın 👋';
  @override
  String get homeGreetingAfternoon => 'İyi günler ☀️';
  @override
  String get homeGreetingEvening => 'İyi akşamlar 👋';
  @override
  String homeStreakDays(Object days) => 'Vird serisi: {days} gün 🔥'.replaceAll('{days}', days.toString());
  @override
  String get homeContinueToday => 'Bugün başladığına devam et';
  @override
  String homeKhatmaProgress(Object percent) => 'Hatim ilerlemesi: %{percent}'.replaceAll('{percent}', percent.toString());
  @override
  String get homeIslamicTools => 'İslami Araçlar';
  @override
  String get homeNextPrayer => 'Sonraki Namaz';
  @override
  String homeInLabel(Object countdown) => '{countdown} sonra'.replaceAll('{countdown}', countdown.toString());
  @override
  String get homeCachedPrayerTimes => 'Son kayıtlı vakitler (çevrimdışı)';
  @override
  String get homeEnableLocationForPrayer => 'Sonraki namazı görmek için konumu etkinleştirin';
  @override
  String get homeDailyWird => 'Günlük Vird';
  @override
  String get homeWirdCompleted => 'Bugünkü virdini tamamladın, Allah razı olsun 🎉';
  @override
  String homeWirdProgress(Object pages, Object target) => '{target} sayfa/sureden {pages}'.replaceAll('{pages}', pages.toString()).replaceAll('{target}', target.toString());
  @override
  String get homeContinueReading => 'Okumaya Devam Et';
  @override
  String get homeNoLastReading => 'Henüz son okuma konumu yok';
  @override
  String homeLastReadingSubtitle(Object surahName, Object ayahNumber) => '{surahName} Suresi — {ayahNumber}. Ayet'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get homeFavorites => 'Favoriler';
  @override
  String get homeNoFavoritesYet => 'Henüz favori öğe yok';
  @override
  String homeFavoritesSavedCount(Object count) => '{count} öğe kaydedildi'.replaceAll('{count}', count.toString());
  @override
  String get homeQuoteOfTheDay => 'Günün Sözü';
  @override
  String get homeThisWeek => 'Bu Hafta';
  @override
  String homeActiveDaysOf(Object active, Object total) => '{total} günden {active} aktif'.replaceAll('{active}', active.toString()).replaceAll('{total}', total.toString());
  @override
  String homeWirdTargetMetSummary(Object met, Object total) => 'Bu hafta {total} günden {met} gününde günlük vird hedefine ulaştın'.replaceAll('{met}', met.toString()).replaceAll('{total}', total.toString());
  @override
  String get homeQuickActions => 'Hızlı İşlemler';
  @override
  String get homeQuickAzkar => 'Zikirler';
  @override
  String get homeQuickTasbeeh => 'Tesbih';
  @override
  String get homeQuickPrayer => 'Namaz';
  @override
  String homeCompletionPercent(Object percent) => 'Tamamlanma yüzde {percent}'.replaceAll('{percent}', percent.toString());
  @override
  String homeDayNotYet(Object day) => '{day}: henüz gelmedi'.replaceAll('{day}', day.toString());
  @override
  String homeDaySummary(Object day, Object pages, Object azkar, Object tasbeeh, Object prayers) => '{day}: {pages} sayfa, {azkar} zikir, {tasbeeh} tesbih, {prayers} namaz'.replaceAll('{day}', day.toString()).replaceAll('{pages}', pages.toString()).replaceAll('{azkar}', azkar.toString()).replaceAll('{tasbeeh}', tasbeeh.toString()).replaceAll('{prayers}', prayers.toString());
  @override
  String get dayNameSat => 'Cmt';
  @override
  String get dayNameSun => 'Paz';
  @override
  String get dayNameMon => 'Pzt';
  @override
  String get dayNameTue => 'Sal';
  @override
  String get dayNameWed => 'Çar';
  @override
  String get dayNameThu => 'Per';
  @override
  String get dayNameFri => 'Cum';
  @override
  String get prayerFajr => 'İmsak';
  @override
  String get prayerDhuhr => 'Öğle';
  @override
  String get prayerAsr => 'İkindi';
  @override
  String get prayerMaghrib => 'Akşam';
  @override
  String get prayerIsha => 'Yatsı';
  @override
  String get prayerTimesTitle => 'Namaz Vakitleri';
  @override
  String get prayerSetCityManually => 'Şehri manuel olarak belirle';
  @override
  String get prayerCityHint => 'Örnek: Kahire, Mısır';
  @override
  String get prayerSearch => 'Ara';
  @override
  String prayerCityNotFound(Object city) => '"{city}" bulunamadı — yazımı kontrol edip tekrar deneyin'.replaceAll('{city}', city.toString());
  @override
  String get prayerAvailabilityLocationDisabled => 'Konum hizmetleri cihazınızda devre dışı. Etkinleştirin veya şehrinizi manuel olarak belirleyin.';
  @override
  String get prayerAvailabilityPermissionDenied => 'Uygulamanın doğru namaz vakitlerini gösterebilmesi için konum izni gerekir, veya şehrinizi manuel olarak belirleyebilirsiniz.';
  @override
  String get prayerAvailabilityPermissionDeniedForever => 'Konum izni kalıcı olarak reddedildi. Sistem ayarlarından etkinleştirin veya şehrinizi manuel olarak belirleyin.';
  @override
  String get prayerAvailabilityNetworkError => 'İnternete bağlanılamadı ve kayıtlı namaz vakti bulunamadı.';
  @override
  String get prayerRetry => 'Tekrar Dene';
  @override
  String get prayerUseGps => 'Mevcut konumu kullan (GPS)';
  @override
  String get prayerRefresh => 'Yenile';
  @override
  String get prayerOfflineBanner => 'Bağlantı yok — son kayıtlı vakitler gösteriliyor';
  @override
  String get prayerNextPrayerLabel => 'Sonraki Namaz';
  @override
  String get prayerTimeRemaining => 'Kalan süre';
  @override
  String prayerNotYetDue(Object prayer) => '{prayer} namaz vakti henüz gelmedi'.replaceAll('{prayer}', prayer.toString());
  @override
  String prayerMarkedDone(Object prayer) => '{prayer} namazı kılındı olarak işaretlendi'.replaceAll('{prayer}', prayer.toString());
  @override
  String prayerNotDoneYet(Object prayer) => '{prayer} namazı henüz kılınmadı'.replaceAll('{prayer}', prayer.toString());
  @override
  String get prayerFootnote => 'Not: Vakitler, konumunuza veya seçilen şehre göre, AlAdhan servisi ve Mısır hesaplama yöntemi kullanılarak belirlenir.';
  @override
  String prayerReminderApproaching(Object prayer, Object minutes) => '{prayer} namazına {minutes} dakika kaldı'.replaceAll('{prayer}', prayer.toString()).replaceAll('{minutes}', minutes.toString());
  @override
  String get tasbeehTitle => 'Tesbih';
  @override
  String get tasbeehResetToday => 'Bugünkü sayacı sıfırla';
  @override
  String get tasbeehCustom => 'Özel zikir';
  @override
  String get tasbeehToday => 'Bugün';
  @override
  String get tasbeehTarget => 'Hedef';
  @override
  String get tasbeehPhraseTotal => 'Zikir toplamı';
  @override
  String get tasbeehGrandTotal => 'Genel toplam';
  @override
  String tasbeehCounterLabel(Object phrase, Object count, Object target) => '{phrase} tesbih sayacı, şu anda {target} üzerinden {count}'.replaceAll('{phrase}', phrase.toString()).replaceAll('{count}', count.toString()).replaceAll('{target}', target.toString());
  @override
  String get tasbeehTapHint => 'Saymak için dokunun — özel zikri silmek için basılı tutun';
  @override
  String get tasbeehAddCustomTitle => 'Özel zikir';
  @override
  String get tasbeehPhraseTextLabel => 'Zikir metni';
  @override
  String get tasbeehPhraseTextHint => 'Örnek: La havle vela kuvvete illa billah';
  @override
  String get tasbeehTargetLabel => 'Hedef';
  @override
  String get tasbeehAdd => 'Ekle';
  @override
  String get tasbeehGlossSubhanallah => 'Sübhanallah — Allah\'ı tesbih ederim';
  @override
  String get tasbeehGlossAlhamdulillah => 'Elhamdülillah — Hamd Allah\'a mahsustur';
  @override
  String get tasbeehGlossAllahuakbar => 'Allahu Ekber — Allah en büyüktür';
  @override
  String get tasbeehGlossLaIlaha => 'La ilahe illallah — Allah\'tan başka ilah yoktur';
  @override
  String get tasbeehGlossAstaghfirullah => 'Estağfirullah — Allah\'tan bağışlanma dilerim';
  @override
  String get tasbeehGlossSalawat => 'Allahümme salli ala Muhammed — Allah\'ım, Muhammed\'e salat eyle';
  @override
  String get azkarDuasTitle => 'Zikirler ve Dualar';
  @override
  String get azkarTabAzkar => 'Zikirler';
  @override
  String get azkarTabDuas => 'Dualar';
  @override
  String get azkarFavoritesTooltip => 'Favoriler';
  @override
  String get azkarLoadError => 'Zikirler yüklenemedi. İnternet bağlantınızı kontrol edin.';
  @override
  String get azkarSearchHint => 'Zikirlerde ara';
  @override
  String get azkarNoResults => 'Sonuç bulunamadı';
  @override
  String azkarCategorySubtitle(Object count, Object completed) => '{count} zikir — bugün {completed} tamamlandı'.replaceAll('{count}', count.toString()).replaceAll('{completed}', completed.toString());
  @override
  String get azkarAllDoneInSection => 'Bu bölümdeki tüm zikirleri tamamladın 🌿';
  @override
  String get azkarShowCompleted => 'Tamamlananları göster';
  @override
  String get azkarHideCompleted => 'Tamamlananları gizle';
  @override
  String get azkarCompletedSnackbar => 'Aferin 🌿 bu zikir tamamlandı';
  @override
  String get azkarCopiedSnackbar => 'Zikir kopyalandı — paylaşmak için yapıştırabilirsiniz';
  @override
  String get azkarPlusOne => '+1';
  @override
  String get azkarFavoritesTitle => 'Favori Zikirler';
  @override
  String get azkarNoFavoritesYet => 'Henüz favori zikir yok';
  @override
  String get azkarRetry => 'Tekrar Dene';
  @override
  String get quranTitle => 'Kur\'an-ı Kerim';
  @override
  String get quranViewMushaf => 'Mushaf\'ı görüntüle';
  @override
  String get quranTabSurahs => 'Sureler';
  @override
  String get quranTabJuz => 'Cüzler';
  @override
  String get quranTabSearch => 'Ara';
  @override
  String get quranTabFavorites => 'Favoriler';
  @override
  String get quranLoadError => 'Kur\'an yüklenemedi. İnternet bağlantınızı kontrol edin.';
  @override
  String get quranViewMode => 'Görüntüleme modu';
  @override
  String get quranMushafPagesLoadError => 'Mushaf sayfaları yüklenemedi — bağlantınızı kontrol edin';
  @override
  String get quranViewAsMushafPages => 'Mushaf sayfaları olarak görüntüle';
  @override
  String quranCompletionPercent(Object percent) => 'Kur\'an tamamlanma yüzdesi {percent}'.replaceAll('{percent}', percent.toString());
  @override
  String get quranKhatmaProgress => 'Hatim ilerlemesi';
  @override
  String get quranSearchSurahHint => 'Sure adına veya numarasına göre ara';
  @override
  String quranSurahSubtitle(Object englishName, Object count) => '{englishName} - {count} ayet'.replaceAll('{englishName}', englishName.toString()).replaceAll('{count}', count.toString());
  @override
  String quranJuzNumber(Object number) => '{number}. Cüz'.replaceAll('{number}', number.toString());
  @override
  String quranJuzStartsFrom(Object surahName, Object ayahNumber) => '{surahName} Suresi - {ayahNumber}. Ayetten başlar'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get quranSearchAyahHint => 'Ayet metninde ara';
  @override
  String get quranSearchMinChars => 'Aramak için en az 2 karakter yazın';
  @override
  String quranAyahLocation(Object surahName, Object ayahNumber) => '{surahName} Suresi - {ayahNumber}. Ayet'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get quranNoFavoriteAyahsYet => 'Henüz favori ayet yok';
  @override
  String get quranChooseReciter => 'Kâri Seç';
  @override
  String get quranTafsirTimeoutError => 'Tefsir yüklenmesi çok uzun sürdü — dosya büyük (2,7 MB), daha hızlı bir bağlantı deneyin';
  @override
  String get quranTafsirLoadError => 'Tefsir yüklenemedi — bağlantınızı kontrol edin';
  @override
  String quranLastReadingSaved(Object surahName, Object ayahNumber) => 'Son okuma kaydedildi: {surahName} Suresi - {ayahNumber}. Ayet'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String quranAyahCopyFormat(Object text, Object surahName, Object ayahNumber) => '{text} ({surahName} Suresi: {ayahNumber})'.replaceAll('{text}', text.toString()).replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get quranAyahCopiedSnackbar => 'Ayet kopyalandı';
  @override
  String get quranAddedToWird => 'Bu okuma günlük virdinize eklendi 🌿';
  @override
  String quranSurahAppBarTitle(Object name) => '{name} Suresi'.replaceAll('{name}', name.toString());
  @override
  String get quranViewAsMushafPageTooltip => 'Bu sureyi Mushaf sayfası olarak görüntüle';
  @override
  String quranChooseReciterTooltip(Object reciterName) => 'Kâri seç ({reciterName})'.replaceAll('{reciterName}', reciterName.toString());
  @override
  String get quranDecreaseFontTooltip => 'Yazı boyutunu küçült';
  @override
  String get quranIncreaseFontTooltip => 'Yazı boyutunu büyüt';
  @override
  String get quranAddToWirdTooltip => 'Günlük virde ekle';
  @override
  String quranAyahCountLabel(Object count) => '{count} ayet'.replaceAll('{count}', count.toString());
  @override
  String get quranStopSurahRecitationLabel => 'Sure tilavetini durdur';
  @override
  String get quranPlaySurahRecitationLabel => 'Surenin tamamının tilavetini oynat';
  @override
  String get quranStopLabel => 'Durdur';
  @override
  String get quranPlayWholeSurahLabel => 'Surenin tamamını oynat';
  @override
  String get quranNoTafsirAvailable => 'Bu ayet için tefsir mevcut değil';
  @override
  String get quranStopPlayingAyahLabel => 'Ayet oynatmayı durdur';
  @override
  String quranPlayAyahLabel(Object number) => '{number}. Ayeti oynat'.replaceAll('{number}', number.toString());
  @override
  String get quranPlayAyahTooltip => 'Ayeti oynat';
  @override
  String get quranRepeatAyahTooltip => 'Bu ayeti tekrarla';
  @override
  String get quranHideTafsirTooltip => 'Tefsiri gizle';
  @override
  String get quranShowTafsirTooltip => 'Muyesser tefsiri göster';
  @override
  String get quranSaveAsLastReadingTooltip => 'Son okuma olarak kaydet';
  @override
  String get quranCopyAyahTooltip => 'Ayeti kopyala';
  @override
  String get quranRemoveFromFavoritesLabel => 'Favorilerden kaldır';
  @override
  String get quranAddToFavoritesLabel => 'Favorilere ekle';
  @override
  String get quranRetry => 'Tekrar Dene';
  @override
  String get quranDownloadedForOfflineSnackbar => 'Sure çevrimdışı dinleme için indirildi';
  @override
  String get quranDeleteDownloadTitle => 'İndirmeyi sil';
  @override
  String get quranDeleteDownloadBody => 'Bu sure için indirilen ses dosyaları silinecek.';
  @override
  String quranStopDownloadTooltip(Object done, Object total) => 'İndirmeyi durdur ({done}/{total})'.replaceAll('{done}', done.toString()).replaceAll('{total}', total.toString());
  @override
  String get quranDeleteDownloadedTooltip => 'Çevrimdışı dinleme için indirildi — silmek için dokunun';
  @override
  String get quranDownloadForOfflineTooltip => 'Sureyi çevrimdışı dinleme için indir';
  @override
  String get qiblaTitle => 'Kıble Yönü';
  @override
  String get qiblaRetry => 'Tekrar Dene';
  @override
  String get qiblaLocationServiceDisabled => 'Konum hizmetleri cihazınızda devre dışı. Kıble yönünü bulmak için etkinleştirin.';
  @override
  String get qiblaPermissionDenied => 'Uygulamanın kıble yönünü doğru bulabilmesi için konum izni gerekir.';
  @override
  String get qiblaLocationError => 'Konumunuz belirlenemedi. Bağlantınızı kontrol edip tekrar deneyin.';
  @override
  String get qiblaNoCompassSensor => 'Cihazınızda pusula sensörü yok. Yönünüzü bulmak için aşağıdaki değeri başka bir pusulayla kullanın.';
  @override
  String get qiblaBearingFromNorth => 'Gerçek kuzeyden yön';
  @override
  String get qiblaCompassNorth => 'K';
  @override
  String get qiblaCompassSouth => 'G';
  @override
  String get qiblaCompassEast => 'D';
  @override
  String get qiblaCompassWest => 'B';
  @override
  String get qiblaAligned => 'Kıbleye dönüksünüz ✓';
  @override
  String get qiblaNotAligned => 'İşaretçi yukarı bakana kadar cihazınızı çevirin';
  @override
  String qiblaBearingValue(Object degrees) => 'Kıble yönü: kuzeyden {degrees}°'.replaceAll('{degrees}', degrees.toString());
  @override
  String get qiblaCalibrationHint => 'Pusula yanlış görünüyorsa, kalibre etmek için cihazınızı manyetik nesnelerden uzakta 8 çizerek hareket ettirin';
  @override
  String get toolQiblaTitle => 'Kıble Yönü';
  @override
  String get toolQiblaSubtitle => 'Nerede olursanız olun kıble yönünü bulan bir pusula';
  @override
  String get toolsTitle => 'İslami Araçlar';
  @override
  String get toolZakatTitle => 'Zekat Hesaplayıcı';
  @override
  String get toolZakatSubtitle => 'Zekatınızı kolayca hesaplayın';
  @override
  String get toolAsmaTitle => 'Allah\'ın 99 İsmi';
  @override
  String get toolAsmaSubtitle => '99 isim ve anlamları';
  @override
  String get toolRamadanTitle => 'Ramazan Yol Arkadaşı';
  @override
  String get toolRamadanSubtitle => 'Sahur ve iftara geri sayım, oruç takibi';
  @override
  String get toolDuasTitle => 'Dualarım';
  @override
  String get toolDuasSubtitle => 'Kendi dualarınızı kaydedin';
  @override
  String get toolMosqueTitle => 'Yakındaki Camiler ve Helal Yemek';
  @override
  String get toolMosqueSubtitle => 'OpenStreetMap verileriyle ücretsiz arama';
  @override
  String get hadithTitle => 'Kırk Hadis (Nevevî)';
  @override
  String get hadithSubtitle => 'Dinin temellerini kapsayan özlü bir hadis derlemesi';
  @override
  String get hadithLoadError => 'Hadisler yüklenemedi. İnternet bağlantınızı kontrol edin.';
  @override
  String get hadithRetry => 'Tekrar Dene';
  @override
  String hadithNumberLabel(Object number) => '{number}. Hadis'.replaceAll('{number}', number.toString());
  @override
  String get hadithSearchHint => 'Hadislerde ara';
  @override
  String get hadithNoResults => 'Sonuç bulunamadı';
  @override
  String get hadithCopiedSnackbar => 'Hadis kopyalandı';
  @override
  String get hadithAddToFavoritesLabel => 'Favorilere ekle';
  @override
  String get hadithRemoveFromFavoritesLabel => 'Favorilerden kaldır';
  @override
  String get hadithCopyTooltip => 'Hadisi kopyala';
  @override
  String get hadithTranslationNote => 'Arapça ve İngilizce gösterilmektedir — bu derleme için henüz Almanca çeviri mevcut değil';
  @override
  String get toolHadithTitle => 'Kırk Hadis (Nevevî)';
  @override
  String get toolHadithSubtitle => 'İmam Nevevî\'nin derlediği 40 (42) hadis';
  @override
  String get homeHadithOfTheDay => 'Günün Hadisi';
  @override
  String get homeShareHadith => 'Hadisi Paylaş';
  @override
  String get homeHadithSource => 'Kaynak: 40 Hadis en-Nevevi';
  @override
  String get toolKhatmaTitle => 'Hatim Takibi';
  @override
  String get toolKhatmaSubtitle => 'Kur\'an\'ı hatmetmeyi planla ve takip et';
  @override
  String get khatmaTrackerTitle => 'Hatim Takibi';
  @override
  String get khatmaNoPlanTitle => 'Hatim Yolculuğuna Başla';
  @override
  String get khatmaNoPlanBody => 'Kur\'an-ı Kerim\'i bitirmek için bir hedef tarih belirle, yolunda kalman için destekleyelim.';
  @override
  String get khatmaChooseDuration => 'Bir süre seç';
  @override
  String get khatmaDuration7Days => '7 gün';
  @override
  String get khatmaDuration30Days => '30 gün';
  @override
  String get khatmaDuration60Days => '60 gün';
  @override
  String get khatmaDuration90Days => '90 gün';
  @override
  String get khatmaCustomDate => 'Özel tarih seç';
  @override
  String khatmaProgressLabel(Object completed, Object total) => '{total} sureden {completed} tanesi'.replaceAll('{completed}', completed.toString()).replaceAll('{total}', total.toString());
  @override
  String get khatmaDaysElapsed => 'Geçen günler';
  @override
  String get khatmaDaysRemaining => 'Kalan günler';
  @override
  String get khatmaTargetDate => 'Hedef tarih';
  @override
  String get khatmaOnTrack => 'Yolundasın — devam et!';
  @override
  String get khatmaBehindSchedule => 'Planın biraz gerisindesin';
  @override
  String khatmaPaceNeeded(Object count) => 'Zamanında bitirmek için günde yaklaşık {count} sure oku'.replaceAll('{count}', count.toString());
  @override
  String get khatmaCompletedCelebration => 'Elhamdülillah! Hatmini tamamladın 🎉';
  @override
  String get khatmaContinueReading => 'Okumaya Devam Et';
  @override
  String get khatmaEditPlan => 'Hedef Tarihi Değiştir';
  @override
  String get khatmaResetPlanTitle => 'Hatim Planını Sıfırla';
  @override
  String get khatmaResetPlanBody => 'Bu, yeni bir hatme başlayabilmen için planını ve okuma ilerlemeni sıfırlayacak. Bu işlem geri alınamaz.';
  @override
  String get khatmaResetPlanConfirm => 'Sıfırla';
  @override
  String get khatmaPlanReset => 'Yeni bir hatme başladın, başarılar! 🌟';
  @override
  String get settingsRemindMeFor => 'Şunlar için hatırlat';
  @override
  String get settingsNotifyAtPrayerTime => 'Namaz vaktinde bildir';
  @override
  String get settingsNotifyAtPrayerTimeSubtitle => 'Namaz vakti başladığı anda bir uyarı al';
  @override
  String get settingsPostPrayerReminder => 'Namaz için hatırlat';
  @override
  String get settingsPostPrayerReminderSubtitle => 'Namazı tamamlandı olarak işaretlemediysen nazik bir hatırlatma';
  @override
  String settingsPostPrayerReminderMinutesLabel(Object minutes) => '{minutes} dakika sonra'.replaceAll('{minutes}', minutes.toString());
  @override
  String get settingsReminderOff => 'Kapalı';
  @override
  String prayerTimeNowBody(Object prayer) => '{prayer} namazı vakti geldi'.replaceAll('{prayer}', prayer.toString());
  @override
  String postPrayerReminderBody(Object prayer) => '{prayer} namazını kıldın mı?'.replaceAll('{prayer}', prayer.toString());
  @override
  String get settingsMoreReminders => 'Diğer Hatırlatmalar';
  @override
  String get settingsFridayReminder => 'Cuma Hatırlatması';
  @override
  String get settingsFridayReminderSubtitle => 'Cuma namazı ve Kehf Suresi okumak için haftalık hatırlatma';
  @override
  String get settingsMorningAzkarReminder => 'Sabah Zikirleri';
  @override
  String get settingsMorningAzkarReminderSubtitle => 'Sabah zikirlerini okuman için günlük hatırlatma';
  @override
  String get settingsEveningAzkarReminder => 'Akşam Zikirleri';
  @override
  String get settingsEveningAzkarReminderSubtitle => 'Akşam zikirlerini okuman için günlük hatırlatma';
  @override
  String get settingsDailyWirdReminder => 'Günlük Vird';
  @override
  String get settingsDailyWirdReminderSubtitle => 'Bugünkü Kur\'an virdini tamamlaman için günlük hatırlatma';
  @override
  String get settingsSleepAzkarReminder => 'Uyku Zikirleri';
  @override
  String get settingsSleepAzkarReminderSubtitle => 'Uyumadan önceki zikirlerini okuman için gece hatırlatması';
  @override
  String get reminderFridayBody => 'Hayırlı Cumalar! Bugün Kehf Suresi\'ni okumayı unutma 🕌';
  @override
  String get reminderMorningAzkarBody => 'Sabah zikirlerinin vakti geldi 🌞';
  @override
  String get reminderEveningAzkarBody => 'Akşam zikirlerinin vakti geldi 🌇';
  @override
  String get reminderDailyWirdBody => 'Bugünkü Kur\'an virdini tamamladın mı? 📖';
  @override
  String get reminderSleepAzkarBody => 'Uyumadan önce zikirlerini oku 🌙';
  @override
  String get khatmaMyPlans => 'Hatim Planlarım';
  @override
  String get khatmaStartNewPlan => 'Yeni Hatim Başlat';
  @override
  String get khatmaPlanLabelHint => 'Bu hatme bir isim ver (opsiyonel)';
  @override
  String khatmaBehindByCount(Object count) => 'Plandan {count} sure geride'.replaceAll('{count}', count.toString());
  @override
  String khatmaNewPaceLabel(Object count) => 'Yeni günlük hedef: {count} sure/gün'.replaceAll('{count}', count.toString());
  @override
  String get khatmaDeletePlanTitle => 'Bu hatim silinsin mi?';
  @override
  String get khatmaDeletePlanBody => 'Bu, planı ve takibini kaldıracak. Bu işlem geri alınamaz.';
  @override
  String get khatmaDeletePlanConfirm => 'Sil';
  @override
  String khatmaDefaultPlanLabel(Object number) => 'Hatim #{number}'.replaceAll('{number}', number.toString());
  @override
  String get khatmaAddAnother => 'Başka Hatim Ekle';
  @override
  String get toolInsightsTitle => 'Wirdi İstatistikleri';
  @override
  String get toolInsightsSubtitle => 'Haftalık ibadet istatistiklerini ve eğilimlerini gör';
  @override
  String get insightsTitle => 'Wirdi İstatistikleri';
  @override
  String get insightsThisWeek => 'Bu Hafta';
  @override
  String get insightsQuranPages => 'Kur\'an Sayfaları';
  @override
  String get insightsAzkarCompleted => 'Tamamlanan Zikirler';
  @override
  String get insightsPrayers => 'Namazlar';
  @override
  String get insightsTasbeeh => 'Tesbih';
  @override
  String get insightsCurrentStreak => 'Güncel Seri';
  @override
  String insightsDaysCount(Object count) => '{count} gün'.replaceAll('{count}', count.toString());
  @override
  String get insightsWeeklyActivity => 'Haftalık Aktivite';
  @override
  String get insightsBestDay => 'En İyi Gün';
  @override
  String get insightsMostConsistent => 'En Tutarlı';
  @override
  String get insightsWeekComparisonTitle => 'Bu Hafta vs Geçen Hafta';
  @override
  String insightsImproved(Object percent) => 'Geçen haftaya göre %{percent} daha aktif'.replaceAll('{percent}', percent.toString());
  @override
  String insightsDeclined(Object percent) => 'Geçen haftaya göre %{percent} daha az aktif'.replaceAll('{percent}', percent.toString());
  @override
  String get insightsFirstActiveWeek => 'İlk aktif haftan -- böyle devam et!';
  @override
  String get insightsNoActivityYet => 'Bu hafta henüz aktivite kaydedilmedi';
  @override
  String get insightsSameAsLastWeek => 'Geçen haftayla aynı aktivite seviyesi';
  @override
  String get insightsNoBestDayYet => 'Henüz yeterli aktivite yok';
  @override
  String get toolMyWirdiTitle => 'Wirdim';
  @override
  String get toolMyWirdiSubtitle => 'Bugün tüm ibadetlerinde nasıl gittiğini gör';
  @override
  String get myWirdiTitle => 'Wirdim';
  @override
  String get myWirdiToday => 'Bugün';
  @override
  String get myWirdiCompleted => 'Elhamdülillah! Bugünkü virdini tamamladın 🎉';
  @override
  String myWirdiRemaining(Object percent) => 'Bugünkü virdini tamamlamana %{percent} kaldı'.replaceAll('{percent}', percent.toString());
  @override
  String get myWirdiPersonalDua => 'Kişisel Dua';
  @override
  String get myWirdiDuaDone => 'Bugün okundu';
  @override
  String get myWirdiDuaNotYet => 'Henüz bugün okunmadı';
  @override
  String get homeMyWirdiCardTitle => 'Bugün Wirdim';
  @override
  String get homeQuickQibla => 'Kıble';
  @override
  String get qiblaDistanceLabel => 'Mekke\'ye Uzaklık';
  @override
  String qiblaDistanceValue(Object km) => '{km} km'.replaceAll('{km}', km.toString());
  @override
  String get achievementStreak3Title => 'Başlangıç';
  @override
  String get achievementStreak3Desc => '3 günlük Vird serisine ulaştın';
  @override
  String get achievementStreak7Title => 'Güçlü Bir Hafta';
  @override
  String get achievementStreak7Desc => '7 günlük Vird serisine ulaştın';
  @override
  String get achievementStreak30Title => 'Alışkanlık Oluştu';
  @override
  String get achievementStreak30Desc => '30 günlük Vird serisine ulaştın';
  @override
  String get achievementStreak100Title => 'Durdurulamaz';
  @override
  String get achievementStreak100Desc => '100 günlük Vird serisine ulaştın';
  @override
  String get achievementQuran10Title => 'İlk Adımlar';
  @override
  String get achievementQuran10Desc => 'Kur\'an\'ın %10\'unu tamamladın';
  @override
  String get achievementQuran25Title => 'Çeyrek Yol';
  @override
  String get achievementQuran25Desc => 'Kur\'an\'ın %25\'ini tamamladın';
  @override
  String get achievementQuran50Title => 'Yarı Yolda';
  @override
  String get achievementQuran50Desc => 'Kur\'an\'ın %50\'sini tamamladın';
  @override
  String get achievementQuran100Title => 'Hatm-i Kur\'an';
  @override
  String get achievementQuran100Desc => 'Kur\'an-ı Kerim\'in tamamını tamamladın';
  @override
  String get achievementKhatma1Title => 'İlk Hatim';
  @override
  String get achievementKhatma1Desc => 'İlk hatmini tamamladın';
  @override
  String get achievementKhatma3Title => 'Hatim Tutkunu';
  @override
  String get achievementKhatma3Desc => '3 hatim planını tamamladın';
  @override
  String get achievementPages50Title => 'Kitap Kurdu';
  @override
  String get achievementPages50Desc => 'Toplam 50 sayfa okudun';
  @override
  String get achievementPages200Title => 'Adanmış Okuyucu';
  @override
  String get achievementPages200Desc => 'Toplam 200 sayfa okudun';
  @override
  String get achievementPages604Title => 'Tam Mushaf';
  @override
  String get achievementPages604Desc => 'Toplam 604 sayfa okudun -- tam bir Mushaf';
  @override
  String get achievementAzkar50Title => 'Zikir Başlangıcı';
  @override
  String get achievementAzkar50Desc => '50 zikir tamamladın';
  @override
  String get achievementAzkar500Title => 'Zikir Ustası';
  @override
  String get achievementAzkar500Desc => '500 zikir tamamladın';
  @override
  String get achievementTasbeeh100Title => 'İlk Tesbih';
  @override
  String get achievementTasbeeh100Desc => '100 tesbih çektin';
  @override
  String get achievementTasbeeh1000Title => 'Tesbih Tutkunu';
  @override
  String get achievementTasbeeh1000Desc => '1.000 tesbih çektin';
  @override
  String get achievementPrayers50Title => 'Tutarlı İbadet Eden';
  @override
  String get achievementPrayers50Desc => '50 namazı kılındı olarak işaretledin';
  @override
  String get achievementPrayers350Title => 'Namaz Şampiyonu';
  @override
  String get achievementPrayers350Desc => '350 namazı kılındı olarak işaretledin';
  @override
  String get achievementFavorites10Title => 'Koleksiyoncu';
  @override
  String get achievementFavorites10Desc => '10 favori kaydettin';
  @override
  String get achievementsTitle => 'Başarılar';
  @override
  String achievementsUnlockedCount(Object unlocked, Object total) => '{total} içinden {unlocked} açıldı'.replaceAll('{unlocked}', unlocked.toString()).replaceAll('{total}', total.toString());
  @override
  String get toolAchievementsTitle => 'Başarılar';
  @override
  String get toolAchievementsSubtitle => 'Kilometre taşlarını ve rozetlerini takip et';
  @override
  String get quranShareAsImageTooltip => 'Resim olarak paylaş';
  @override
  String get ayahShareTitle => 'Ayeti Paylaş';
  @override
  String get ayahShareIncludeTranslation => 'Çeviriyi dahil et';
  @override
  String get ayahShareButton => 'Paylaş';
  @override
  String get myDuasDialogTitleNew => 'Yeni Dua';
  @override
  String get myDuasDialogTitleEdit => 'Duayı Düzenle';
  @override
  String get myDuasTitleFieldLabel => 'Başlık (opsiyonel)';
  @override
  String get myDuasTextFieldLabel => 'Dua metni';
  @override
  String get myDuasEmptyTitle => 'Henüz dua eklenmedi';
  @override
  String get myDuasEmptySubtitle => 'Kendi duanı eklemek için + işaretine dokun';
  @override
  String get ramadanCountdownToSuhoor => 'Sahura (Fecir Ezanı) kalan süre';
  @override
  String get ramadanCountdownToIftar => 'İftara (Akşam Ezanı) kalan süre';
  @override
  String get ramadanCountdownToSuhoorTomorrow => 'Yarınki sahura kalan süre';
  @override
  String get ramadanLoadError => 'Sahur ve iftar için gereken namaz vakitleri yüklenemedi.';
  @override
  String ramadanDayOfRamadan(Object day) => 'Ramazan\'ın {day}. günü'.replaceAll('{day}', day.toString());
  @override
  String get ramadanFastingToday => 'Bugün oruçlu';
  @override
  String get ramadanFastingSubtitle => 'İlerlemeni takip etmek için bugünkü orucunu kaydet';
  @override
  String get ramadanDaysLoggedTitle => 'Bu ay kaydedilen oruç günleri';
  @override
  String get ramadanHijriFootnote => 'Not: Buradaki Hicri tarih hesaplanmış bir tahmindir ve ülkenizdeki resmi ay başı duyurusundan bir gün farklı olabilir.';
  @override
  String get mushafTitle => 'Mushaf';
  @override
  String get mushafStopAudioTooltip => 'Sesi durdur';
  @override
  String get mushafLoadError => 'Mushaf sayfaları yüklenemedi. İnternet bağlantınızı kontrol edin.';
  @override
  String get mushafTapAyahHint => 'Okunuşunu dinlemek için herhangi bir ayete dokun';
  @override
  String mushafPageNumber(Object number) => 'Sayfa {number}'.replaceAll('{number}', number.toString());
  @override
  String get mosqueLocationServiceDisabled => 'Cihazınızda konum hizmeti devre dışı.';
  @override
  String get mosqueLocationPermissionNeeded => 'Uygulama, yakındaki yerleri aramak için konum erişimine ihtiyaç duyuyor.';
  @override
  String get mosqueSearchError => 'Yakındaki yerler aranamadı -- internet bağlantınızı kontrol edin.';
  @override
  String get mosqueTabMosques => 'Camiler';
  @override
  String get mosqueTabHalalRestaurants => 'Helal Restoranlar';
  @override
  String get mosqueNoMosquesFound => 'OpenStreetMap verilerinde yakında cami bulunamadı';
  @override
  String get mosqueNoHalalFound => 'Yakında \'helal\' etiketli restoran bulunamadı -- OpenStreetMap\'teki helal restoran verileri bircok bölgede eksik';
  @override
  String get onboardingGoalTitle => 'Günlük ne kadar Kur\'an okumak istiyorsun?';
  @override
  String get onboardingGoalLight => 'Hafif';
  @override
  String get onboardingGoalLightDesc => 'Günde 2 sayfa';
  @override
  String get onboardingGoalRegular => 'Normal';
  @override
  String get onboardingGoalRegularDesc => 'Günde 5 sayfa';
  @override
  String get onboardingGoalAdvanced => 'İleri';
  @override
  String get onboardingGoalAdvancedDesc => 'Günde 10 sayfa';
  @override
  String get onboardingEnableReminders => 'Günlük hatırlatmaları etkinleştir';
  @override
  String get onboardingEnableRemindersDesc => 'Günlük Vird ve Zikirlerin için hatırlatma al';
  @override
  String get toolBookmarksTitle => 'Yer İmleri';
  @override
  String get toolBookmarksSubtitle => 'Ayetleri not ve kategorilerle kaydet';
  @override
  String get bookmarksTitle => 'Yer İmleri';
  @override
  String get bookmarksEmptyTitle => 'Henüz yer imi yok';
  @override
  String get bookmarksEmptySubtitle => 'Okurken herhangi bir ayetteki yer imi simgesine dokunarak buraya kaydet';
  @override
  String get bookmarkAddTooltip => 'Yer imi ekle';
  @override
  String get bookmarkDialogTitle => 'Yer İmi Ekle';
  @override
  String get bookmarkNoteLabel => 'Not (opsiyonel)';
  @override
  String get bookmarkCategoryLabel => 'Kategori';
  @override
  String get bookmarkCategoryRamadan => 'Ramazan';
  @override
  String get bookmarkCategoryDua => 'Dua';
  @override
  String get bookmarkCategoryFamily => 'Aile';
  @override
  String get bookmarkCategoryStudy => 'Çalışma';
  @override
  String get bookmarkCategoryPersonal => 'Kişisel';
  @override
  String get bookmarkCategoryOther => 'Tümü';
  @override
  String get bookmarkSavedSnackbar => 'Yer imi kaydedildi';
  @override
  String get bookmarkDeleteConfirmTitle => 'Bu yer imi silinsin mi?';
  @override
  String get bookmarkDeleteConfirmBody => 'Bu işlem geri alınamaz.';
  @override
  String get bookmarkDeleteConfirm => 'Sil';
  @override
  String get settingsPrivacyCenter => 'Gizlilik Merkezi';
  @override
  String get settingsPrivacyCenterSubtitle => 'Neyin saklandığını gör, verilerini dışa aktar veya sil';
  @override
  String get privacyCenterTitle => 'Gizlilik Merkezi';
  @override
  String get privacyCenterIntro => 'İbadet verilerin sana aittir.';
  @override
  String get privacyCenterLocalDataTitle => 'Cihazda yerel olarak saklananlar';
  @override
  String get privacyCenterLocalDataBody => 'Okuma ilerlemesi, Zikir/Tesbih sayıları, favoriler, yer imleri, kişisel dualar, Hatim planları, başarılar ve ayarlar -- yalnızca bu cihazda SharedPreferences kullanılarak saklanır. Hiçbir şey bir sunucuya yüklenmez.';
  @override
  String get privacyCenterLocationTitle => 'Konum kullanımı';
  @override
  String get privacyCenterLocationBody => 'Cihazının konumu yalnızca namaz vakitlerini hesaplamak, kıble yönünü bulmak ve yakındaki camiler/helal restoranları aramak için kullanılır. Asla saklanmaz veya başka bir hizmetle paylaşılmaz.';
  @override
  String get privacyCenterNoAccountsTitle => 'Hesap, reklam veya takip yok';
  @override
  String get privacyCenterNoAccountsBody => 'Bu uygulama hesap gerektirmez, reklam göstermez ve herhangi bir analiz veya takip SDK\'sı kullanmaz.';
  @override
  String get privacyCenterExportButton => 'Verilerimi Dışa Aktar';
  @override
  String get privacyCenterExportSuccessSnackbar => 'Verilerin dışa aktarma için hazırlandı';
  @override
  String get privacyCenterDeleteButton => 'Verilerimi Sil';
  @override
  String get privacyCenterDeleteConfirmTitle => 'Tüm yerel veriler silinsin mi?';
  @override
  String get privacyCenterDeleteConfirmBody => 'Bu, tüm ilerlemeni, favorilerini, yer imlerini, dualarını, başarılarını ve ayarlarını bu cihazdan kalıcı olarak siler. Bu işlem geri alınamaz.';
  @override
  String get privacyCenterDeleteConfirmButton => 'Her Şeyi Sil';
  @override
  String get privacyCenterDeleteDoneSnackbar => 'Tüm yerel veriler silindi';
  @override
  String get privacyCenterViewPolicy => 'Tam Gizlilik Politikasını Görüntüle';
  @override
  String homeRamadanBannerTitle(Object day) => 'Ramazan\'ın {day}. günü'.replaceAll('{day}', day.toString());
  @override
  String get homeRamadanBannerSubtitle => 'Ramazan yoldaşın için dokun';
  @override
  String get ramadanLast10NightsTitle => 'Son 10 Gece';
  @override
  String get ramadanLast10NightsBody => 'Ramazan\'ın bu son geceleri en bereketli olanlardır -- ibadetini, Kur\'an okumayı ve duayı artır.';
  @override
  String get ramadanPossibleLaylatAlQadr => 'Bu gece Kadir Gecesi olabilir';
  @override
  String get commonEditTooltip => 'Düzenle';
  @override
  String get commonDeleteTooltip => 'Sil';
  @override
  String get commonSettingsTooltip => 'Ayarlar';
  @override
  String get commonDecreaseTooltip => 'Azalt';
  @override
  String get commonIncreaseTooltip => 'Artır';
  @override
  String get commonShareTooltip => 'Paylaş';
  @override
  String get commonRefreshTooltip => 'Yenile';
  @override
  String get homeNextPrayerCardLabel => 'Bir sonraki namaz vakti';
  @override
  String get homeWeeklyInsightsCardLabel => 'Haftalık istatistikler';
  @override
  String get settingsTajweedColoring => 'Tajweed Coloring';
  @override
  String get settingsTajweedColoringSubtitle => 'Color Quranic text based on Tajweed rules';
  @override
  String get settingsBackupRestore => 'Backup & Restore';
  @override
  String get settingsExportBackup => 'Export Backup';
  @override
  String get settingsExportBackupSubtitle => 'Save your progress and settings to a file';
  @override
  String get settingsImportBackup => 'Import Backup';
  @override
  String get settingsImportBackupSubtitle => 'Restore data from a previously saved file';
  @override
  String get settingsImportSuccess => 'Backup imported successfully! Please restart the app.';
  @override
  String get settingsImportError => 'Failed to import backup. Ensure the file is valid.';
  @override
  String get tajweedLegendTitle => 'Tajweed Rules';
  @override
  String get tajweedLegendIntro => 'Color coding for Quranic recitation rules:';
  @override
  String get tajweedQalqalahLabel => 'Qalqalah (Echoing)';
  @override
  String get tajweedGhunnahLabel => 'Ghunnah (Nasalization)';
  @override
  String get tajweedIkhfaLabel => 'Ikhfa (Hiding)';
  @override
  String get tajweedIdghamGhunnahLabel => 'Idgham with Ghunnah';
  @override
  String get tajweedIdghamNoGhunnahLabel => 'Idgham without Ghunnah';
  @override
  String get tajweedIqlabLabel => 'Iqlab (Conversion)';
  @override
  String get tajweedLegendClose => 'Close';
  @override
  String get radioTitle => 'İslami Radyo';
  @override
  String get radioSubtitle => 'Canlı Kuran ve ders dinle';
  @override
  String get radioAll => 'Tümü';
  @override
  String get radioNowPlaying => 'Şu an çalıyor';
  @override
  String get radioFavorites => 'Favoriler';
  @override
  String get radioNoFavorites => 'Henüz favori istasyon yok';
  @override
  String get radioNoStations => 'Bu kategoride istasyon yok';
  @override
  String get radioAddFavorite => 'Favorilere ekle';
  @override
  String get radioRemoveFavorite => 'Favorilerden kaldır';
  @override
  String get radioSleepTimer => 'Uyku Zamanlayıcısı';
  @override
  String get radioSleepTimerSubtitle => 'Ayarlanan süreden sonra radyoyu otomatik olarak durdurur';
  @override
  String get radioSleepTimerCancel => 'Zamanlayıcıyı iptal et';
  @override
  String get radioMinutes => 'dak';
  @override
  String radioSleepTimerActive(Object minutes) => '{minutes} dakika sonra duruyor'.replaceAll('{minutes}', minutes.toString());
  @override
  String get radioOfficial => 'Resmi';
  @override
  String get radioStreamError => 'İstasyona bağlanılamadı. Bağlantınızı kontrol edin.';
}
class _AppLocalizations_fr extends AppLocalizations {
  _AppLocalizations_fr() : super('fr');
  @override
  String get appTitle => 'Wirdi';
  @override
  String get navHome => 'Accueil';
  @override
  String get navQuran => 'Coran';
  @override
  String get navAzkar => 'Azkar';
  @override
  String get navPrayer => 'Prière';
  @override
  String get navTasbeeh => 'Tasbih';
  @override
  String get navMore => 'Plus';
  @override
  String get commonCancel => 'Annuler';
  @override
  String get commonSave => 'Enregistrer';
  @override
  String get commonDelete => 'Supprimer';
  @override
  String get commonClose => 'Fermer';
  @override
  String get commonOk => 'OK';
  @override
  String get commonBack => 'Retour';
  @override
  String get commonNext => 'Suivant';
  @override
  String get commonSkip => 'Passer';
  @override
  String get commonDone => 'Terminé';
  @override
  String get commonRetry => 'Réessayer';
  @override
  String get commonShare => 'Partager';
  @override
  String get commonSearch => 'Rechercher';
  @override
  String get commonEdit => 'Modifier';
  @override
  String get commonConfirm => 'Confirmer';
  @override
  String get commonLoading => 'Chargement…';
  @override
  String get commonError => 'Une erreur est survenue';
  @override
  String get commonYes => 'Oui';
  @override
  String get commonNo => 'Non';
  @override
  String get languageName_ar => 'Arabe';
  @override
  String get languageName_en => 'Anglais';
  @override
  String get languageName_de => 'Allemand';
  @override
  String get languageName_tr => 'Turc';
  @override
  String get settingsLanguage => 'Langue';
  @override
  String get settingsLanguageSystem => 'Par défaut du système';
  @override
  String get settingsLanguageSubtitle => 'Choisissez la langue d\'affichage';
  @override
  String get asmaUlHusnaTitle => 'Les 99 Noms d\'Allah';
  @override
  String get sourcesLicensesTitle => 'Sources & Licences';
  @override
  String get sourcesOssLicensesButton => 'Open-source package licenses';
  @override
  String get aboutTitle => 'À propos';
  @override
  String get aboutTagline => 'Votre compagnon quotidien pour le dhikr et le Coran';
  @override
  String get aboutVersion => 'Version 1.0.0';
  @override
  String get aboutBody => 'Wirdi est une application islamique quotidienne.';
  @override
  String get onboardingSkip => 'Passer';
  @override
  String get onboardingSlide1 => 'Faites du Coran une partie de votre journée';
  @override
  String get onboardingSlide2 => 'Suivez votre wird quotidien et créez une habitude';
  @override
  String get onboardingSlide3 => 'Rappelez votre cœur avant que le temps ne vous rappelle';
  @override
  String get onboardingStart => 'Commencer votre voyage';
  @override
  String get onboardingNext => 'Suivant';
  @override
  String get privacyPolicyTitle => 'Politique de confidentialité';
  @override
  String get favoritesTitle => 'Favoris';
  @override
  String get favoritesTabAyahs => 'Versets coraniques';
  @override
  String get favoritesTabAzkar => 'Azkar';
  @override
  String get favoritesLoadError => 'Impossible de charger les favoris';
  @override
  String get favoritesEmptyAyahs => 'Aucun verset favori pour l\'instant';
  @override
  String get favoritesEmptyAzkar => 'Aucun azkar favori pour l\'instant';
  @override
  String favoritesAyahSubtitle(Object surahName, Object ayahNumber) => 'Sourate {surahName} - Ayah {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get zakatTitle => 'Calculateur de Zakat';
  @override
  String get zakatNisabHint => 'Enter today\'s nisab value (at the current market price of gold or silver) before calculating, since the nisab price changes daily and can\'t be hardcoded in the app. You can check with your local fatwa authority or look up the current gold price (85 grams of gold, or its equivalent in silver).';
  @override
  String get zakatCurrentNisab => 'Current nisab value';
  @override
  String get zakatableAssets => 'Zakatable assets';
  @override
  String get zakatCash => 'Cash and equivalents (bank, wallet)';
  @override
  String get zakatGoldSilver => 'Gold and silver (market value)';
  @override
  String get zakatInvestments => 'Investments and stocks';
  @override
  String get zakatBusiness => 'Trade goods (merchandise for sale)';
  @override
  String get zakatReceivables => 'Debts owed to you (expected to be recovered)';
  @override
  String get zakatOwedDebts => 'Debts you owe';
  @override
  String get zakatCurrentDebts => 'Debts and bills currently owed by you';
  @override
  String get zakatNetWealth => 'Net zakatable wealth';
  @override
  String get zakatEnterNisabFirst => 'Enter the nisab value first';
  @override
  String get zakatBelowNisab => 'Your wealth is below nisab — no zakat is due';
  @override
  String get zakatDue => 'Zakat due (2.5%)';
  @override
  String get zakatFootnote => 'Note: this calculator gives a general estimate at the standard rate (2.5%) on wealth that has been held for a full lunar year and reached nisab. Zakat on crops, livestock, and minerals follows different rules not covered here. For specific situations, it\'s best to ask a qualified scholar.';
  @override
  String get settingsTitle => 'Paramètres';
  @override
  String get settingsAppearance => 'Apparence';
  @override
  String get settingsMode => 'Mode';
  @override
  String get settingsModeLight => 'Clair';
  @override
  String get settingsModeDark => 'Sombre';
  @override
  String get settingsModeAuto => 'Automatique';
  @override
  String get settingsFontSize => 'Taille de police';
  @override
  String get settingsFontPreview => 'Exemple de texte';
  @override
  String get settingsShowTransliteration => 'Show Latin transliteration';
  @override
  String get settingsShowTransliterationSubtitle => 'Helpful for those learning to read — appears under every verse';
  @override
  String get settingsPrayerReminder => 'Prayer Reminder';
  @override
  String get settingsPrayerReminderEnable => 'Enable upcoming prayer reminder';
  @override
  String get settingsPrayerReminderSubtitle => 'The reminder only works while the app is open';
  @override
  String get settingsPrayerReminderMinutesBefore => 'Remind before prayer by (minutes)';
  @override
  String settingsPrayerReminderMinutesLabel(Object minutes) => '{minutes} min'.replaceAll('{minutes}', minutes.toString());
  @override
  String get settingsPrayerReminderMethod => 'Reminder method';
  @override
  String get settingsReminderBanner => 'Notification only';
  @override
  String get settingsReminderBeep => 'Alert tone';
  @override
  String get settingsReminderAdhan => 'Full adhan';
  @override
  String get settingsTestTone => 'Test tone';
  @override
  String get settingsAdhanSound => 'Adhan sound';
  @override
  String get settingsStopPreview => 'Stop preview';
  @override
  String get settingsListen => 'Listen';
  @override
  String get settingsReminderNote => 'Note: the app sends a real notification even when it\'s closed, but you\'ll need to grant notification permission (and exact-alarm permission on Android 12+) when you turn this on. Today\'s and tomorrow\'s reminders are rescheduled every time you open the Home or Prayer Times screen.';
  @override
  String get settingsDailyWird => 'Wird quotidien';
  @override
  String get settingsDailyWirdTarget => 'Objectif quotidien (pages/sourates)';
  @override
  String settingsDailyWirdPerDay(Object count) => '{count} par jour'.replaceAll('{count}', count.toString());
  @override
  String get settingsAboutSupport => 'About & Support';
  @override
  String get settingsAbout => 'À propos';
  @override
  String get settingsSourcesLicenses => 'Sources & Licences';
  @override
  String get settingsPrivacyPolicy => 'Politique de confidentialité';
  @override
  String get settingsDataManagement => 'Data Management';
  @override
  String get settingsQuranLastUpdate => 'Quran last updated';
  @override
  String get settingsAzkarLastUpdate => 'Azkar last updated';
  @override
  String get settingsNotDownloadedYet => 'Not downloaded yet';
  @override
  String get settingsUpdateNow => 'Update data now';
  @override
  String get settingsRequiresInternet => 'Requires an internet connection';
  @override
  String get settingsDataUpdated => 'Quran and azkar data updated';
  @override
  String get settingsDownloadedAudio => 'Downloaded recitations for offline listening';
  @override
  String get settingsNoDownloadedAudio => 'No downloaded recitations';
  @override
  String settingsMbDownloaded(Object size) => '{size} MB downloaded'.replaceAll('{size}', size.toString());
  @override
  String get settingsDeleteAll => 'Delete all';
  @override
  String get settingsDeleteAllDownloadsTitle => 'Delete all downloaded recitations';
  @override
  String get settingsDeleteAllDownloadsBody => 'All downloaded audio files for every surah will be deleted. Listening will fall back to online streaming.';
  @override
  String get settingsResetKhatma => 'Reset Khatma progress';
  @override
  String get settingsResetKhatmaSubtitle => 'Start a fresh Khatma from scratch';
  @override
  String get settingsResetKhatmaBody => 'Every surah will be marked unread again to start a new Khatma. Your daily wird and favorites won\'t be affected.';
  @override
  String get settingsResetKhatmaConfirm => 'Reset';
  @override
  String get settingsKhatmaResetDone => 'A new Khatma has started, good luck! 🌿';
  @override
  String get settingsDeleteLocalData => 'Supprimer toutes les données locales';
  @override
  String get settingsDeleteLocalDataBody => 'Favoris, statistiques de tasbih, progress du wird et tous les paramètres seront supprimés.';
  @override
  String get settingsLocalDataDeleted => 'Toutes les données locales ont été supprimées';
  @override
  String get settingsPreviewFailed => 'Couldn\'t play the preview — check your connection';
  @override
  String get quranTranslationUnavailable => 'Translation unavailable for this verse';
  @override
  String get quranTranslationLoadFailed => 'Couldn\'t load the translation';
  @override
  String get quranTranslationRetry => 'Retry';
  @override
  String get quranTranslationSourceNote => 'Translation from QuranEnc.com';
  @override
  String get homeGreetingNight => 'Blessed night 🌙';
  @override
  String get homeGreetingMorning => 'Good morning 👋';
  @override
  String get homeGreetingAfternoon => 'Have a great day ☀️';
  @override
  String get homeGreetingEvening => 'Good evening 👋';
  @override
  String homeStreakDays(Object days) => 'Wird streak: {days} days 🔥'.replaceAll('{days}', days.toString());
  @override
  String get homeContinueToday => 'Keep up what you started today';
  @override
  String homeKhatmaProgress(Object percent) => 'Khatma progress: {percent}%'.replaceAll('{percent}', percent.toString());
  @override
  String get homeIslamicTools => 'Outils islamiques';
  @override
  String get homeNextPrayer => 'Prochaine prière';
  @override
  String homeInLabel(Object countdown) => 'in {countdown}'.replaceAll('{countdown}', countdown.toString());
  @override
  String get homeCachedPrayerTimes => 'Last saved times (offline)';
  @override
  String get homeEnableLocationForPrayer => 'Enable location to see the next prayer';
  @override
  String get homeDailyWird => 'Wird quotidien';
  @override
  String get homeWirdCompleted => 'You\'ve completed today\'s wird, may Allah bless you 🎉';
  @override
  String homeWirdProgress(Object pages, Object target) => '{pages} of {target} pages/surahs'.replaceAll('{pages}', pages.toString()).replaceAll('{target}', target.toString());
  @override
  String get homeContinueReading => 'Continue Reading';
  @override
  String get homeNoLastReading => 'No last reading position yet';
  @override
  String homeLastReadingSubtitle(Object surahName, Object ayahNumber) => 'Surah {surahName} — Ayah {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get homeFavorites => 'Favoris';
  @override
  String get homeNoFavoritesYet => 'No favorite items yet';
  @override
  String homeFavoritesSavedCount(Object count) => '{count} items saved'.replaceAll('{count}', count.toString());
  @override
  String get homeQuoteOfTheDay => 'Citation du jour';
  @override
  String get homeThisWeek => 'Cette semaine';
  @override
  String homeActiveDaysOf(Object active, Object total) => '{active} of {total} active days'.replaceAll('{active}', active.toString()).replaceAll('{total}', total.toString());
  @override
  String homeWirdTargetMetSummary(Object met, Object total) => 'You met the daily wird target on {met} of {total} days this week'.replaceAll('{met}', met.toString()).replaceAll('{total}', total.toString());
  @override
  String get homeQuickActions => 'Quick Actions';
  @override
  String get homeQuickAzkar => 'Azkar';
  @override
  String get homeQuickTasbeeh => 'Tasbeeh';
  @override
  String get homeQuickPrayer => 'Prayer';
  @override
  String homeCompletionPercent(Object percent) => 'Completion {percent} percent'.replaceAll('{percent}', percent.toString());
  @override
  String homeDayNotYet(Object day) => '{day}: hasn\'t come yet'.replaceAll('{day}', day.toString());
  @override
  String homeDaySummary(Object day, Object pages, Object azkar, Object tasbeeh, Object prayers) => '{day}: {pages} pages, {azkar} azkar, {tasbeeh} tasbeeh, {prayers} prayers'.replaceAll('{day}', day.toString()).replaceAll('{pages}', pages.toString()).replaceAll('{azkar}', azkar.toString()).replaceAll('{tasbeeh}', tasbeeh.toString()).replaceAll('{prayers}', prayers.toString());
  @override
  String get dayNameSat => 'Sam';
  @override
  String get dayNameSun => 'Dim';
  @override
  String get dayNameMon => 'Lun';
  @override
  String get dayNameTue => 'Mar';
  @override
  String get dayNameWed => 'Mer';
  @override
  String get dayNameThu => 'Jeu';
  @override
  String get dayNameFri => 'Ven';
  @override
  String get prayerFajr => 'Fajr';
  @override
  String get prayerDhuhr => 'Dhuhr';
  @override
  String get prayerAsr => 'Asr';
  @override
  String get prayerMaghrib => 'Maghrib';
  @override
  String get prayerIsha => 'Isha';
  @override
  String get prayerTimesTitle => 'Horaires de prière';
  @override
  String get prayerSetCityManually => 'Set city manually';
  @override
  String get prayerCityHint => 'Example: Cairo, Egypt';
  @override
  String get prayerSearch => 'Search';
  @override
  String prayerCityNotFound(Object city) => 'Couldn\'t find "{city}" — check the spelling and try again'.replaceAll('{city}', city.toString());
  @override
  String get prayerAvailabilityLocationDisabled => 'Location services are disabled on your device. Enable them, or set your city manually.';
  @override
  String get prayerAvailabilityPermissionDenied => 'The app needs location access to show accurate prayer times, or you can set your city manually.';
  @override
  String get prayerAvailabilityPermissionDeniedForever => 'Location permission was permanently denied. Enable it from system settings, or set your city manually.';
  @override
  String get prayerAvailabilityNetworkError => 'Couldn\'t connect to the internet and no saved prayer times were found.';
  @override
  String get prayerRetry => 'Réessayer';
  @override
  String get prayerUseGps => 'Use current location (GPS)';
  @override
  String get prayerRefresh => 'Refresh';
  @override
  String get prayerOfflineBanner => 'No connection — showing last saved times';
  @override
  String get prayerNextPrayerLabel => 'Prochaine prière';
  @override
  String get prayerTimeRemaining => 'Time remaining';
  @override
  String prayerNotYetDue(Object prayer) => '{prayer} prayer time hasn\'t come yet'.replaceAll('{prayer}', prayer.toString());
  @override
  String prayerMarkedDone(Object prayer) => '{prayer} prayer marked as done'.replaceAll('{prayer}', prayer.toString());
  @override
  String prayerNotDoneYet(Object prayer) => '{prayer} prayer not done yet'.replaceAll('{prayer}', prayer.toString());
  @override
  String get prayerFootnote => 'Note: times are based on your location or selected city, using the AlAdhan service with the Egyptian calculation method.';
  @override
  String prayerReminderApproaching(Object prayer, Object minutes) => '{prayer} prayer is coming up in {minutes} minutes'.replaceAll('{prayer}', prayer.toString()).replaceAll('{minutes}', minutes.toString());
  @override
  String get tasbeehTitle => 'Tasbih';
  @override
  String get tasbeehResetToday => 'Reset today\'s count';
  @override
  String get tasbeehCustom => 'Custom phrase';
  @override
  String get tasbeehToday => 'Today';
  @override
  String get tasbeehTarget => 'Target';
  @override
  String get tasbeehPhraseTotal => 'Phrase total';
  @override
  String get tasbeehGrandTotal => 'Grand total';
  @override
  String tasbeehCounterLabel(Object phrase, Object count, Object target) => '{phrase} tasbeeh counter, currently {count} of {target}'.replaceAll('{phrase}', phrase.toString()).replaceAll('{count}', count.toString()).replaceAll('{target}', target.toString());
  @override
  String get tasbeehTapHint => 'Tap to count — long-press a custom phrase to delete it';
  @override
  String get tasbeehAddCustomTitle => 'Custom phrase';
  @override
  String get tasbeehPhraseTextLabel => 'Phrase text';
  @override
  String get tasbeehPhraseTextHint => 'Example: La hawla wa la quwwata illa billah';
  @override
  String get tasbeehTargetLabel => 'Target';
  @override
  String get tasbeehAdd => 'Add';
  @override
  String get tasbeehGlossSubhanallah => 'SubhanAllah — Glory be to Allah';
  @override
  String get tasbeehGlossAlhamdulillah => 'Alhamdulillah — Praise be to Allah';
  @override
  String get tasbeehGlossAllahuakbar => 'Allahu Akbar — Allah is the Greatest';
  @override
  String get tasbeehGlossLaIlaha => 'La ilaha illallah — There is no god but Allah';
  @override
  String get tasbeehGlossAstaghfirullah => 'Astaghfirullah — I seek Allah\'s forgiveness';
  @override
  String get tasbeehGlossSalawat => 'Allahumma salli ala Muhammad — O Allah, send blessings upon Muhammad';
  @override
  String get azkarDuasTitle => 'Azkar & Duas';
  @override
  String get azkarTabAzkar => 'Azkar';
  @override
  String get azkarTabDuas => 'Duas';
  @override
  String get azkarFavoritesTooltip => 'Favorites';
  @override
  String get azkarLoadError => 'Couldn\'t load azkar. Check your internet connection.';
  @override
  String get azkarSearchHint => 'Search azkar';
  @override
  String get azkarNoResults => 'No results';
  @override
  String azkarCategorySubtitle(Object count, Object completed) => '{count} azkar — {completed} completed today'.replaceAll('{count}', count.toString()).replaceAll('{completed}', completed.toString());
  @override
  String get azkarAllDoneInSection => 'You\'ve completed all azkar in this section 🌿';
  @override
  String get azkarShowCompleted => 'Show completed';
  @override
  String get azkarHideCompleted => 'Hide completed';
  @override
  String get azkarCompletedSnackbar => 'Well done 🌿 this dhikr is complete';
  @override
  String get azkarCopiedSnackbar => 'Dhikr copied — you can paste it to share';
  @override
  String get azkarPlusOne => '+1';
  @override
  String get azkarFavoritesTitle => 'Favorite Azkar';
  @override
  String get azkarNoFavoritesYet => 'No favorite azkar yet';
  @override
  String get azkarRetry => 'Retry';
  @override
  String get quranTitle => 'Le Saint Coran';
  @override
  String get quranViewMushaf => 'View Mushaf';
  @override
  String get quranTabSurahs => 'Sourates';
  @override
  String get quranTabJuz => 'Juz';
  @override
  String get quranTabSearch => 'Recherche';
  @override
  String get quranTabFavorites => 'Favoris';
  @override
  String get quranLoadError => 'Couldn\'t load the Quran. Check your internet connection.';
  @override
  String get quranViewMode => 'View mode';
  @override
  String get quranMushafPagesLoadError => 'Couldn\'t load Mushaf pages — check your connection';
  @override
  String get quranViewAsMushafPages => 'View as Mushaf pages';
  @override
  String quranCompletionPercent(Object percent) => 'Quran completion {percent} percent'.replaceAll('{percent}', percent.toString());
  @override
  String get quranKhatmaProgress => 'Khatma progress';
  @override
  String get quranSearchSurahHint => 'Search by surah name or number';
  @override
  String quranSurahSubtitle(Object englishName, Object count) => '{englishName} - {count} ayahs'.replaceAll('{englishName}', englishName.toString()).replaceAll('{count}', count.toString());
  @override
  String quranJuzNumber(Object number) => 'Juz {number}'.replaceAll('{number}', number.toString());
  @override
  String quranJuzStartsFrom(Object surahName, Object ayahNumber) => 'Starts from Surah {surahName} - Ayah {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get quranSearchAyahHint => 'Search verse text';
  @override
  String get quranSearchMinChars => 'Type at least 2 characters to search';
  @override
  String quranAyahLocation(Object surahName, Object ayahNumber) => 'Surah {surahName} - Ayah {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get quranNoFavoriteAyahsYet => 'No favorite verses yet';
  @override
  String get quranChooseReciter => 'Choose Reciter';
  @override
  String get quranTafsirTimeoutError => 'Loading the tafsir took too long — the file is large (2.7 MB), try on a faster connection';
  @override
  String get quranTafsirLoadError => 'Couldn\'t load the tafsir — check your connection';
  @override
  String quranLastReadingSaved(Object surahName, Object ayahNumber) => 'Last reading saved: Surah {surahName} - Ayah {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String quranAyahCopyFormat(Object text, Object surahName, Object ayahNumber) => '{text} (Surah {surahName}: {ayahNumber})'.replaceAll('{text}', text.toString()).replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get quranAyahCopiedSnackbar => 'Verse copied';
  @override
  String get quranAddedToWird => 'This reading was added to your daily wird 🌿';
  @override
  String quranSurahAppBarTitle(Object name) => 'Surah {name}'.replaceAll('{name}', name.toString());
  @override
  String get quranViewAsMushafPageTooltip => 'View this surah as a Mushaf page';
  @override
  String quranChooseReciterTooltip(Object reciterName) => 'Choose reciter ({reciterName})'.replaceAll('{reciterName}', reciterName.toString());
  @override
  String get quranDecreaseFontTooltip => 'Decrease font size';
  @override
  String get quranIncreaseFontTooltip => 'Increase font size';
  @override
  String get quranAddToWirdTooltip => 'Add to daily wird';
  @override
  String quranAyahCountLabel(Object count) => '{count} ayahs'.replaceAll('{count}', count.toString());
  @override
  String get quranStopSurahRecitationLabel => 'Stop surah recitation';
  @override
  String get quranPlaySurahRecitationLabel => 'Play the whole surah\'s recitation';
  @override
  String get quranStopLabel => 'Stop';
  @override
  String get quranPlayWholeSurahLabel => 'Play whole surah';
  @override
  String get quranNoTafsirAvailable => 'No tafsir available for this verse';
  @override
  String get quranStopPlayingAyahLabel => 'Stop playing this verse';
  @override
  String quranPlayAyahLabel(Object number) => 'Play Ayah {number}'.replaceAll('{number}', number.toString());
  @override
  String get quranPlayAyahTooltip => 'Play verse';
  @override
  String get quranRepeatAyahTooltip => 'Repeat this verse';
  @override
  String get quranHideTafsirTooltip => 'Hide tafsir';
  @override
  String get quranShowTafsirTooltip => 'Show simplified tafsir';
  @override
  String get quranSaveAsLastReadingTooltip => 'Save as last reading';
  @override
  String get quranCopyAyahTooltip => 'Copy verse';
  @override
  String get quranRemoveFromFavoritesLabel => 'Remove from favorites';
  @override
  String get quranAddToFavoritesLabel => 'Add to favorites';
  @override
  String get quranRetry => 'Retry';
  @override
  String get quranDownloadedForOfflineSnackbar => 'Surah downloaded for offline listening';
  @override
  String get quranDeleteDownloadTitle => 'Delete download';
  @override
  String get quranDeleteDownloadBody => 'The downloaded audio files for this surah will be deleted.';
  @override
  String quranStopDownloadTooltip(Object done, Object total) => 'Stop downloading ({done}/{total})'.replaceAll('{done}', done.toString()).replaceAll('{total}', total.toString());
  @override
  String get quranDeleteDownloadedTooltip => 'Downloaded for offline listening — tap to delete';
  @override
  String get quranDownloadForOfflineTooltip => 'Download surah for offline listening';
  @override
  String get qiblaTitle => 'Direction de la Qibla';
  @override
  String get qiblaRetry => 'Retry';
  @override
  String get qiblaLocationServiceDisabled => 'Location services are disabled on your device. Enable them to find the Qibla direction.';
  @override
  String get qiblaPermissionDenied => 'The app needs location access to find the Qibla direction accurately.';
  @override
  String get qiblaLocationError => 'Couldn\'t determine your location. Check your connection and try again.';
  @override
  String get qiblaNoCompassSensor => 'Your device doesn\'t have a compass sensor. Use the value below with another compass to orient yourself.';
  @override
  String get qiblaBearingFromNorth => 'Direction from true north';
  @override
  String get qiblaCompassNorth => 'N';
  @override
  String get qiblaCompassSouth => 'S';
  @override
  String get qiblaCompassEast => 'E';
  @override
  String get qiblaCompassWest => 'W';
  @override
  String get qiblaAligned => 'You\'re facing the Qibla ✓';
  @override
  String get qiblaNotAligned => 'Turn your device until the marker points up';
  @override
  String qiblaBearingValue(Object degrees) => 'Qibla bearing: {degrees}° from north'.replaceAll('{degrees}', degrees.toString());
  @override
  String get qiblaCalibrationHint => 'If the compass seems inaccurate, move your device in a figure-8 motion, away from magnetic objects, to calibrate it';
  @override
  String get toolQiblaTitle => 'Qibla Direction';
  @override
  String get toolQiblaSubtitle => 'A compass to find the Qibla direction wherever you are';
  @override
  String get toolsTitle => 'Outils islamiques';
  @override
  String get toolZakatTitle => 'Calculateur de Zakat';
  @override
  String get toolZakatSubtitle => 'Calculate your Zakat with ease';
  @override
  String get toolAsmaTitle => 'Les 99 Noms d\'Allah';
  @override
  String get toolAsmaSubtitle => 'The 99 Names and their meanings';
  @override
  String get toolRamadanTitle => 'Compagnon du Ramadan';
  @override
  String get toolRamadanSubtitle => 'Countdown to suhoor and iftar, and fasting tracker';
  @override
  String get toolDuasTitle => 'Mes Duas';
  @override
  String get toolDuasSubtitle => 'Save your own personal duas';
  @override
  String get toolMosqueTitle => 'Mosquées & Restaurants halal';
  @override
  String get toolMosqueSubtitle => 'Free search powered by OpenStreetMap data';
  @override
  String get hadithTitle => 'Quarante Hadiths d\'an-Nawawi';
  @override
  String get hadithSubtitle => 'A concise collection of hadiths covering the fundamentals of the religion';
  @override
  String get hadithLoadError => 'Couldn\'t load the hadiths. Check your internet connection.';
  @override
  String get hadithRetry => 'Retry';
  @override
  String hadithNumberLabel(Object number) => 'Hadith {number}'.replaceAll('{number}', number.toString());
  @override
  String get hadithSearchHint => 'Search hadiths';
  @override
  String get hadithNoResults => 'No results';
  @override
  String get hadithCopiedSnackbar => 'Hadith copied';
  @override
  String get hadithAddToFavoritesLabel => 'Add to favorites';
  @override
  String get hadithRemoveFromFavoritesLabel => 'Remove from favorites';
  @override
  String get hadithCopyTooltip => 'Copy hadith';
  @override
  String get hadithTranslationNote => 'Shown in Arabic and English — a German translation isn\'t available for this collection yet';
  @override
  String get toolHadithTitle => 'Quarante Hadiths d\'an-Nawawi';
  @override
  String get toolHadithSubtitle => 'The 40 (42) hadiths compiled by Imam an-Nawawi';
  @override
  String get homeHadithOfTheDay => 'Hadith du jour';
  @override
  String get homeShareHadith => 'Share Hadith';
  @override
  String get homeHadithSource => 'Source: 40 Hadith an-Nawawi';
  @override
  String get toolKhatmaTitle => 'Suivi de Khatma';
  @override
  String get toolKhatmaSubtitle => 'Plan and track finishing the Quran';
  @override
  String get khatmaTrackerTitle => 'Suivi de Khatma';
  @override
  String get khatmaNoPlanTitle => 'Start Your Khatma Journey';
  @override
  String get khatmaNoPlanBody => 'Set a target date to finish reading the entire Quran, and we\'ll help you stay on track.';
  @override
  String get khatmaChooseDuration => 'Choose a duration';
  @override
  String get khatmaDuration7Days => '7 days';
  @override
  String get khatmaDuration30Days => '30 days';
  @override
  String get khatmaDuration60Days => '60 days';
  @override
  String get khatmaDuration90Days => '90 days';
  @override
  String get khatmaCustomDate => 'Pick a custom date';
  @override
  String khatmaProgressLabel(Object completed, Object total) => '{completed} of {total} surahs'.replaceAll('{completed}', completed.toString()).replaceAll('{total}', total.toString());
  @override
  String get khatmaDaysElapsed => 'Days elapsed';
  @override
  String get khatmaDaysRemaining => 'Days remaining';
  @override
  String get khatmaTargetDate => 'Target date';
  @override
  String get khatmaOnTrack => 'You\'re on track — keep it up!';
  @override
  String get khatmaBehindSchedule => 'You\'re a bit behind schedule';
  @override
  String khatmaPaceNeeded(Object count) => 'Read about {count} surahs/day to finish on time'.replaceAll('{count}', count.toString());
  @override
  String get khatmaCompletedCelebration => 'Alhamdulillah! You completed your Khatma 🎉';
  @override
  String get khatmaContinueReading => 'Continue Reading';
  @override
  String get khatmaEditPlan => 'Change Target Date';
  @override
  String get khatmaResetPlanTitle => 'Reset Khatma Plan';
  @override
  String get khatmaResetPlanBody => 'This will clear your plan and reading progress so you can start a new Khatma. This cannot be undone.';
  @override
  String get khatmaResetPlanConfirm => 'Reset';
  @override
  String get khatmaPlanReset => 'Started a new Khatma, good luck! 🌿';
  @override
  String get settingsRemindMeFor => 'Remind me for';
  @override
  String get settingsNotifyAtPrayerTime => 'Notify at prayer time';
  @override
  String get settingsNotifyAtPrayerTimeSubtitle => 'Get an alert exactly when the prayer time begins';
  @override
  String get settingsPostPrayerReminder => 'Remind me to pray';
  @override
  String get settingsPostPrayerReminderSubtitle => 'A gentle follow-up if you haven\'t marked the prayer as done';
  @override
  String settingsPostPrayerReminderMinutesLabel(Object minutes) => '{minutes} min after'.replaceAll('{minutes}', minutes.toString());
  @override
  String get settingsReminderOff => 'Off';
  @override
  String prayerTimeNowBody(Object prayer) => 'It\'s time for {prayer} prayer'.replaceAll('{prayer}', prayer.toString());
  @override
  String postPrayerReminderBody(Object prayer) => 'Have you prayed {prayer} yet?'.replaceAll('{prayer}', prayer.toString());
  @override
  String get settingsMoreReminders => 'More Reminders';
  @override
  String get settingsFridayReminder => 'Friday Reminder';
  @override
  String get settingsFridayReminderSubtitle => 'A weekly reminder for Jumu\'ah and reading Surah Al-Kahf';
  @override
  String get settingsMorningAzkarReminder => 'Morning Azkar';
  @override
  String get settingsMorningAzkarReminderSubtitle => 'A daily reminder to recite your morning remembrance';
  @override
  String get settingsEveningAzkarReminder => 'Evening Azkar';
  @override
  String get settingsEveningAzkarReminderSubtitle => 'A daily reminder to recite your evening remembrance';
  @override
  String get settingsDailyWirdReminder => 'Daily Wird';
  @override
  String get settingsDailyWirdReminderSubtitle => 'A daily reminder to complete today\'s Quran reading';
  @override
  String get settingsSleepAzkarReminder => 'Sleep Azkar';
  @override
  String get settingsSleepAzkarReminderSubtitle => 'A nightly reminder to recite your bedtime remembrance';
  @override
  String get reminderFridayBody => 'Jumu\'ah Mubarak! Don\'t forget to read Surah Al-Kahf today 🕌';
  @override
  String get reminderMorningAzkarBody => 'Time for your morning Azkar 🌞';
  @override
  String get reminderEveningAzkarBody => 'Time for your evening Azkar 🌇';
  @override
  String get reminderDailyWirdBody => 'Have you completed today\'s Quran wird yet? 📖';
  @override
  String get reminderSleepAzkarBody => 'Before you sleep, recite your bedtime Azkar 🌙';
  @override
  String get khatmaMyPlans => 'My Khatma Plans';
  @override
  String get khatmaStartNewPlan => 'Start New Khatma';
  @override
  String get khatmaPlanLabelHint => 'Name this Khatma (optional)';
  @override
  String khatmaBehindByCount(Object count) => '{count} surahs behind schedule'.replaceAll('{count}', count.toString());
  @override
  String khatmaNewPaceLabel(Object count) => 'New daily target: {count} surahs/day'.replaceAll('{count}', count.toString());
  @override
  String get khatmaDeletePlanTitle => 'Delete this Khatma?';
  @override
  String get khatmaDeletePlanBody => 'This will remove the plan and its tracking. This cannot be undone.';
  @override
  String get khatmaDeletePlanConfirm => 'Delete';
  @override
  String khatmaDefaultPlanLabel(Object number) => 'Khatma #{number}'.replaceAll('{number}', number.toString());
  @override
  String get khatmaAddAnother => 'Add Another Khatma';
  @override
  String get toolInsightsTitle => 'Insights Wirdi';
  @override
  String get toolInsightsSubtitle => 'See your weekly worship stats and trends';
  @override
  String get insightsTitle => 'Insights Wirdi';
  @override
  String get insightsThisWeek => 'This Week';
  @override
  String get insightsQuranPages => 'Quran Pages';
  @override
  String get insightsAzkarCompleted => 'Azkar Completed';
  @override
  String get insightsPrayers => 'Prayers';
  @override
  String get insightsTasbeeh => 'Tasbeeh';
  @override
  String get insightsCurrentStreak => 'Current Streak';
  @override
  String insightsDaysCount(Object count) => '{count} days'.replaceAll('{count}', count.toString());
  @override
  String get insightsWeeklyActivity => 'Weekly Activity';
  @override
  String get insightsBestDay => 'Best Day';
  @override
  String get insightsMostConsistent => 'Most Consistent';
  @override
  String get insightsWeekComparisonTitle => 'This Week vs Last Week';
  @override
  String insightsImproved(Object percent) => '{percent}% more active than last week'.replaceAll('{percent}', percent.toString());
  @override
  String insightsDeclined(Object percent) => '{percent}% less active than last week'.replaceAll('{percent}', percent.toString());
  @override
  String get insightsFirstActiveWeek => 'Your first active week -- keep it up!';
  @override
  String get insightsNoActivityYet => 'No activity recorded yet this week';
  @override
  String get insightsSameAsLastWeek => 'Same activity level as last week';
  @override
  String get insightsNoBestDayYet => 'Not enough activity yet';
  @override
  String get toolMyWirdiTitle => 'Mon Wirdi';
  @override
  String get toolMyWirdiSubtitle => 'See how you\'re doing today across all your worship';
  @override
  String get myWirdiTitle => 'Mon Wirdi';
  @override
  String get myWirdiToday => 'Today';
  @override
  String get myWirdiCompleted => 'Alhamdulillah! You completed today\'s Wird 🎉';
  @override
  String myWirdiRemaining(Object percent) => '{percent}% left to complete today\'s Wird'.replaceAll('{percent}', percent.toString());
  @override
  String get myWirdiPersonalDua => 'Personal Dua';
  @override
  String get myWirdiDuaDone => 'Recited today';
  @override
  String get myWirdiDuaNotYet => 'Not yet today';
  @override
  String get homeMyWirdiCardTitle => 'Mon Wirdi aujourd\'hui';
  @override
  String get homeQuickQibla => 'Qibla';
  @override
  String get qiblaDistanceLabel => 'Distance to Makkah';
  @override
  String qiblaDistanceValue(Object km) => '{km} km'.replaceAll('{km}', km.toString());
  @override
  String get achievementStreak3Title => 'Getting Started';
  @override
  String get achievementStreak3Desc => 'Reached a 3-day Wird streak';
  @override
  String get achievementStreak7Title => 'One Week Strong';
  @override
  String get achievementStreak7Desc => 'Reached a 7-day Wird streak';
  @override
  String get achievementStreak30Title => 'Habit Formed';
  @override
  String get achievementStreak30Desc => 'Reached a 30-day Wird streak';
  @override
  String get achievementStreak100Title => 'Unstoppable';
  @override
  String get achievementStreak100Desc => 'Reached a 100-day Wird streak';
  @override
  String get achievementQuran10Title => 'First Steps';
  @override
  String get achievementQuran10Desc => 'Completed 10% of the Quran';
  @override
  String get achievementQuran25Title => 'Quarter Way';
  @override
  String get achievementQuran25Desc => 'Completed 25% of the Quran';
  @override
  String get achievementQuran50Title => 'Halfway There';
  @override
  String get achievementQuran50Desc => 'Completed 50% of the Quran';
  @override
  String get achievementQuran100Title => 'Khatm al-Quran';
  @override
  String get achievementQuran100Desc => 'Completed the entire Quran';
  @override
  String get achievementKhatma1Title => 'First Khatma';
  @override
  String get achievementKhatma1Desc => 'Completed your first Khatma plan';
  @override
  String get achievementKhatma3Title => 'Khatma Devotee';
  @override
  String get achievementKhatma3Desc => 'Completed 3 Khatma plans';
  @override
  String get achievementPages50Title => 'Bookworm';
  @override
  String get achievementPages50Desc => 'Read 50 pages total';
  @override
  String get achievementPages200Title => 'Dedicated Reader';
  @override
  String get achievementPages200Desc => 'Read 200 pages total';
  @override
  String get achievementPages604Title => 'Full Mushaf';
  @override
  String get achievementPages604Desc => 'Read 604 pages total -- a full Mushaf';
  @override
  String get achievementAzkar50Title => 'Remembrance Beginner';
  @override
  String get achievementAzkar50Desc => 'Completed 50 Azkar';
  @override
  String get achievementAzkar500Title => 'Remembrance Master';
  @override
  String get achievementAzkar500Desc => 'Completed 500 Azkar';
  @override
  String get achievementTasbeeh100Title => 'First Tasbeeh';
  @override
  String get achievementTasbeeh100Desc => 'Counted 100 Tasbeeh';
  @override
  String get achievementTasbeeh1000Title => 'Tasbeeh Devotee';
  @override
  String get achievementTasbeeh1000Desc => 'Counted 1,000 Tasbeeh';
  @override
  String get achievementPrayers50Title => 'Consistent Worshipper';
  @override
  String get achievementPrayers50Desc => 'Marked 50 prayers as done';
  @override
  String get achievementPrayers350Title => 'Prayer Champion';
  @override
  String get achievementPrayers350Desc => 'Marked 350 prayers as done';
  @override
  String get achievementFavorites10Title => 'Collector';
  @override
  String get achievementFavorites10Desc => 'Saved 10 favorites';
  @override
  String get achievementsTitle => 'Réalisations';
  @override
  String achievementsUnlockedCount(Object unlocked, Object total) => '{unlocked} of {total} unlocked'.replaceAll('{unlocked}', unlocked.toString()).replaceAll('{total}', total.toString());
  @override
  String get toolAchievementsTitle => 'Réalisations';
  @override
  String get toolAchievementsSubtitle => 'Track your milestones and badges';
  @override
  String get quranShareAsImageTooltip => 'Share as image';
  @override
  String get ayahShareTitle => 'Share Ayah';
  @override
  String get ayahShareIncludeTranslation => 'Include translation';
  @override
  String get ayahShareButton => 'Share';
  @override
  String get myDuasDialogTitleNew => 'New Dua';
  @override
  String get myDuasDialogTitleEdit => 'Edit Dua';
  @override
  String get myDuasTitleFieldLabel => 'Title (optional)';
  @override
  String get myDuasTextFieldLabel => 'Dua text';
  @override
  String get myDuasEmptyTitle => 'No duas added yet';
  @override
  String get myDuasEmptySubtitle => 'Tap + to add your own dua';
  @override
  String get ramadanCountdownToSuhoor => 'Time remaining until Suhoor (Fajr Adhan)';
  @override
  String get ramadanCountdownToIftar => 'Time remaining until Iftar (Maghrib Adhan)';
  @override
  String get ramadanCountdownToSuhoorTomorrow => 'Time remaining until tomorrow\'s Suhoor';
  @override
  String get ramadanLoadError => 'Couldn\'t load the prayer times needed for Suhoor and Iftar.';
  @override
  String ramadanDayOfRamadan(Object day) => 'Day {day} of Ramadan'.replaceAll('{day}', day.toString());
  @override
  String get ramadanFastingToday => 'Fasting today';
  @override
  String get ramadanFastingSubtitle => 'Log your fast today to track your progress';
  @override
  String get ramadanDaysLoggedTitle => 'Fasting days logged this month';
  @override
  String get ramadanHijriFootnote => 'Note: the Hijri date here is a computed estimate and may differ by a day from your country\'s official start-of-month announcement.';
  @override
  String get mushafTitle => 'Le Mushaf';
  @override
  String get mushafStopAudioTooltip => 'Stop audio';
  @override
  String get mushafLoadError => 'Couldn\'t load Mushaf pages. Check your internet connection.';
  @override
  String get mushafTapAyahHint => 'Tap any ayah to play its recitation';
  @override
  String mushafPageNumber(Object number) => 'Page {number}'.replaceAll('{number}', number.toString());
  @override
  String get mosqueLocationServiceDisabled => 'Location service is disabled on your device.';
  @override
  String get mosqueLocationPermissionNeeded => 'The app needs location access to search for nearby places.';
  @override
  String get mosqueSearchError => 'Couldn\'t search for nearby places -- check your internet connection.';
  @override
  String get mosqueTabMosques => 'Mosquées';
  @override
  String get mosqueTabHalalRestaurants => 'Restaurants halal';
  @override
  String get mosqueNoMosquesFound => 'No nearby mosques found in OpenStreetMap data';
  @override
  String get mosqueNoHalalFound => 'No nearby restaurants tagged \'halal\' found -- halal restaurant data on OpenStreetMap is incomplete in many areas';
  @override
  String get onboardingGoalTitle => 'Combien de Coran voulez-vous lire chaque jour ?';
  @override
  String get onboardingGoalLight => 'Léger';
  @override
  String get onboardingGoalLightDesc => '2 pages par jour';
  @override
  String get onboardingGoalRegular => 'Régulier';
  @override
  String get onboardingGoalRegularDesc => '5 pages par jour';
  @override
  String get onboardingGoalAdvanced => 'Avancé';
  @override
  String get onboardingGoalAdvancedDesc => '10 pages par jour';
  @override
  String get onboardingEnableReminders => 'Activer les rappels quotidiens';
  @override
  String get onboardingEnableRemindersDesc => 'Soyez rappelé pour votre wird et vos azkar quotidiens';
  @override
  String get toolBookmarksTitle => 'Signets';
  @override
  String get toolBookmarksSubtitle => 'Save ayahs with notes and categories';
  @override
  String get bookmarksTitle => 'Signets';
  @override
  String get bookmarksEmptyTitle => 'No bookmarks yet';
  @override
  String get bookmarksEmptySubtitle => 'Tap the bookmark icon on any ayah while reading to save it here';
  @override
  String get bookmarkAddTooltip => 'Add bookmark';
  @override
  String get bookmarkDialogTitle => 'Add Bookmark';
  @override
  String get bookmarkNoteLabel => 'Note (optional)';
  @override
  String get bookmarkCategoryLabel => 'Category';
  @override
  String get bookmarkCategoryRamadan => 'Ramadan';
  @override
  String get bookmarkCategoryDua => 'Dua';
  @override
  String get bookmarkCategoryFamily => 'Famille';
  @override
  String get bookmarkCategoryStudy => 'Étude';
  @override
  String get bookmarkCategoryPersonal => 'Personnel';
  @override
  String get bookmarkCategoryOther => 'Tous';
  @override
  String get bookmarkSavedSnackbar => 'Bookmark saved';
  @override
  String get bookmarkDeleteConfirmTitle => 'Delete this bookmark?';
  @override
  String get bookmarkDeleteConfirmBody => 'This cannot be undone.';
  @override
  String get bookmarkDeleteConfirm => 'Delete';
  @override
  String get settingsPrivacyCenter => 'Centre de confidentialité';
  @override
  String get settingsPrivacyCenterSubtitle => 'Voir ce qui est stocké, exporter ou supprimer vos données';
  @override
  String get privacyCenterTitle => 'Centre de confidentialité';
  @override
  String get privacyCenterIntro => 'Your worship data belongs to you.';
  @override
  String get privacyCenterLocalDataTitle => 'What\'s stored locally';
  @override
  String get privacyCenterLocalDataBody => 'Reading progress, Azkar/Tasbeeh counts, favorites, bookmarks, personal duas, Khatma plans, achievements, and settings -- stored only on this device using SharedPreferences. Nothing is uploaded to a server.';
  @override
  String get privacyCenterLocationTitle => 'Location usage';
  @override
  String get privacyCenterLocationBody => 'Your device\'s location is used only to calculate prayer times, find the Qibla direction, and search for nearby mosques/halal restaurants. It is never stored or shared with any other service.';
  @override
  String get privacyCenterNoAccountsTitle => 'No accounts, ads, or tracking';
  @override
  String get privacyCenterNoAccountsBody => 'This app does not require an account, does not show ads, and does not use any analytics or tracking SDKs.';
  @override
  String get privacyCenterExportButton => 'Export My Data';
  @override
  String get privacyCenterExportSuccessSnackbar => 'Your data has been prepared for export';
  @override
  String get privacyCenterDeleteButton => 'Delete My Data';
  @override
  String get privacyCenterDeleteConfirmTitle => 'Delete all local data?';
  @override
  String get privacyCenterDeleteConfirmBody => 'This permanently erases all your progress, favorites, bookmarks, duas, achievements, and settings from this device. This cannot be undone.';
  @override
  String get privacyCenterDeleteConfirmButton => 'Delete Everything';
  @override
  String get privacyCenterDeleteDoneSnackbar => 'All local data has been deleted';
  @override
  String get privacyCenterViewPolicy => 'View Full Privacy Policy';
  @override
  String homeRamadanBannerTitle(Object day) => 'Jour {day} du Ramadan'.replaceAll('{day}', day.toString());
  @override
  String get homeRamadanBannerSubtitle => 'Appuyez pour votre compagnon du Ramadan';
  @override
  String get ramadanLast10NightsTitle => 'Les 10 dernières nuits';
  @override
  String get ramadanLast10NightsBody => 'These final nights of Ramadan are the most blessed -- increase your worship, Quran, and dua.';
  @override
  String get ramadanPossibleLaylatAlQadr => 'Tonight may be Laylat al-Qadr';
  @override
  String get commonEditTooltip => 'Modifier';
  @override
  String get commonDeleteTooltip => 'Supprimer';
  @override
  String get commonSettingsTooltip => 'Paramètres';
  @override
  String get commonDecreaseTooltip => 'Decrease';
  @override
  String get commonIncreaseTooltip => 'Increase';
  @override
  String get commonShareTooltip => 'Partager';
  @override
  String get commonRefreshTooltip => 'Actualiser';
  @override
  String get homeNextPrayerCardLabel => 'Next prayer time';
  @override
  String get homeWeeklyInsightsCardLabel => 'Weekly insights';
  @override
  String get settingsTajweedColoring => 'Coloration Tajweed';
  @override
  String get settingsTajweedColoringSubtitle => 'Colorer le texte coranique selon les règles du Tajweed';
  @override
  String get settingsBackupRestore => 'Sauvegarde & Restauration';
  @override
  String get settingsExportBackup => 'Exporter la sauvegarde';
  @override
  String get settingsExportBackupSubtitle => 'Save your progress and settings to a file';
  @override
  String get settingsImportBackup => 'Importer la sauvegarde';
  @override
  String get settingsImportBackupSubtitle => 'Restore data from a previously saved file';
  @override
  String get settingsImportSuccess => 'Sauvegarde importée avec succès ! Veuillez redémarrer l\'app.';
  @override
  String get settingsImportError => 'Échec de l\'importation.';
  @override
  String get tajweedLegendTitle => 'Règles du Tajweed';
  @override
  String get tajweedLegendIntro => 'Color coding for Quranic recitation rules:';
  @override
  String get tajweedQalqalahLabel => 'Qalqalah (Echoing)';
  @override
  String get tajweedGhunnahLabel => 'Ghunnah (Nasalization)';
  @override
  String get tajweedIkhfaLabel => 'Ikhfa (Hiding)';
  @override
  String get tajweedIdghamGhunnahLabel => 'Idgham with Ghunnah';
  @override
  String get tajweedIdghamNoGhunnahLabel => 'Idgham without Ghunnah';
  @override
  String get tajweedIqlabLabel => 'Iqlab (Conversion)';
  @override
  String get tajweedLegendClose => 'Fermer';
  @override
  String get radioTitle => 'Radio islamique';
  @override
  String get radioSubtitle => 'Écoutez le Coran et des conférences en direct';
  @override
  String get radioAll => 'Tous';
  @override
  String get radioNowPlaying => 'En cours de lecture';
  @override
  String get radioFavorites => 'Favoris';
  @override
  String get radioNoFavorites => 'Pas encore de stations favorites';
  @override
  String get radioNoStations => 'Aucune station dans cette catégorie';
  @override
  String get radioAddFavorite => 'Ajouter aux favoris';
  @override
  String get radioRemoveFavorite => 'Retirer des favoris';
  @override
  String get radioSleepTimer => 'Minuterie de sommeil';
  @override
  String get radioSleepTimerSubtitle => 'Arrête automatiquement la radio après le temps défini';
  @override
  String get radioSleepTimerCancel => 'Annuler le minuteur';
  @override
  String get radioMinutes => 'min';
  @override
  String radioSleepTimerActive(Object minutes) => 'S\'arrête dans {minutes} min'.replaceAll('{minutes}', minutes.toString());
  @override
  String get radioOfficial => 'Officiel';
  @override
  String get radioStreamError => 'Impossible de se connecter à la station. Vérifiez votre connexion.';
}
class _AppLocalizations_es extends AppLocalizations {
  _AppLocalizations_es() : super('es');
  @override
  String get appTitle => 'Wirdi';
  @override
  String get navHome => 'Inicio';
  @override
  String get navQuran => 'Corán';
  @override
  String get navAzkar => 'Azkar';
  @override
  String get navPrayer => 'Oración';
  @override
  String get navTasbeeh => 'Tasbih';
  @override
  String get navMore => 'Más';
  @override
  String get commonCancel => 'Cancelar';
  @override
  String get commonSave => 'Guardar';
  @override
  String get commonDelete => 'Eliminar';
  @override
  String get commonClose => 'Cerrar';
  @override
  String get commonOk => 'OK';
  @override
  String get commonBack => 'Volver';
  @override
  String get commonNext => 'Siguiente';
  @override
  String get commonSkip => 'Omitir';
  @override
  String get commonDone => 'Listo';
  @override
  String get commonRetry => 'Reintentar';
  @override
  String get commonShare => 'Compartir';
  @override
  String get commonSearch => 'Buscar';
  @override
  String get commonEdit => 'Editar';
  @override
  String get commonConfirm => 'Confirmar';
  @override
  String get commonLoading => 'Cargando…';
  @override
  String get commonError => 'Ocurrió un error';
  @override
  String get commonYes => 'Sí';
  @override
  String get commonNo => 'No';
  @override
  String get languageName_ar => 'Árabe';
  @override
  String get languageName_en => 'Inglés';
  @override
  String get languageName_de => 'Alemán';
  @override
  String get languageName_tr => 'Turco';
  @override
  String get settingsLanguage => 'Idioma';
  @override
  String get settingsLanguageSystem => 'Idioma del sistema';
  @override
  String get settingsLanguageSubtitle => 'Elige el idioma de la app';
  @override
  String get asmaUlHusnaTitle => 'Los 99 Nombres de Alá';
  @override
  String get sourcesLicensesTitle => 'Fuentes y licencias';
  @override
  String get sourcesOssLicensesButton => 'Open-source package licenses';
  @override
  String get aboutTitle => 'Acerca de';
  @override
  String get aboutTagline => 'Tu compañero diario para el dhikr y el Corán';
  @override
  String get aboutVersion => 'Versión 1.0.0';
  @override
  String get aboutBody => 'Wirdi es una aplicación islámica diaria.';
  @override
  String get onboardingSkip => 'Omitir';
  @override
  String get onboardingSlide1 => 'Haz del Corán parte de tu día';
  @override
  String get onboardingSlide2 => 'Sigue tu wird diario y crea un hábito';
  @override
  String get onboardingSlide3 => 'Recuerda a tu corazón antes de que el tiempo te recuerde';
  @override
  String get onboardingStart => 'Comienza tu viaje';
  @override
  String get onboardingNext => 'Siguiente';
  @override
  String get privacyPolicyTitle => 'Política de privacidad';
  @override
  String get favoritesTitle => 'Favoritos';
  @override
  String get favoritesTabAyahs => 'Versículos del Corán';
  @override
  String get favoritesTabAzkar => 'Azkar';
  @override
  String get favoritesLoadError => 'No se pudieron cargar los favoritos';
  @override
  String get favoritesEmptyAyahs => 'Sin versos favoritos aún';
  @override
  String get favoritesEmptyAzkar => 'Sin azkar favoritos aún';
  @override
  String favoritesAyahSubtitle(Object surahName, Object ayahNumber) => 'Sura {surahName} - Ayah {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get zakatTitle => 'Calculadora de Zakat';
  @override
  String get zakatNisabHint => 'Enter today\'s nisab value (at the current market price of gold or silver) before calculating, since the nisab price changes daily and can\'t be hardcoded in the app. You can check with your local fatwa authority or look up the current gold price (85 grams of gold, or its equivalent in silver).';
  @override
  String get zakatCurrentNisab => 'Current nisab value';
  @override
  String get zakatableAssets => 'Zakatable assets';
  @override
  String get zakatCash => 'Cash and equivalents (bank, wallet)';
  @override
  String get zakatGoldSilver => 'Gold and silver (market value)';
  @override
  String get zakatInvestments => 'Investments and stocks';
  @override
  String get zakatBusiness => 'Trade goods (merchandise for sale)';
  @override
  String get zakatReceivables => 'Debts owed to you (expected to be recovered)';
  @override
  String get zakatOwedDebts => 'Debts you owe';
  @override
  String get zakatCurrentDebts => 'Debts and bills currently owed by you';
  @override
  String get zakatNetWealth => 'Net zakatable wealth';
  @override
  String get zakatEnterNisabFirst => 'Enter the nisab value first';
  @override
  String get zakatBelowNisab => 'Your wealth is below nisab — no zakat is due';
  @override
  String get zakatDue => 'Zakat due (2.5%)';
  @override
  String get zakatFootnote => 'Note: this calculator gives a general estimate at the standard rate (2.5%) on wealth that has been held for a full lunar year and reached nisab. Zakat on crops, livestock, and minerals follows different rules not covered here. For specific situations, it\'s best to ask a qualified scholar.';
  @override
  String get settingsTitle => 'Configuración';
  @override
  String get settingsAppearance => 'Apariencia';
  @override
  String get settingsMode => 'Modo';
  @override
  String get settingsModeLight => 'Claro';
  @override
  String get settingsModeDark => 'Oscuro';
  @override
  String get settingsModeAuto => 'Automático';
  @override
  String get settingsFontSize => 'Tamaño de fuente';
  @override
  String get settingsFontPreview => 'Texto de muestra';
  @override
  String get settingsShowTransliteration => 'Show Latin transliteration';
  @override
  String get settingsShowTransliterationSubtitle => 'Helpful for those learning to read — appears under every verse';
  @override
  String get settingsPrayerReminder => 'Prayer Reminder';
  @override
  String get settingsPrayerReminderEnable => 'Enable upcoming prayer reminder';
  @override
  String get settingsPrayerReminderSubtitle => 'The reminder only works while the app is open';
  @override
  String get settingsPrayerReminderMinutesBefore => 'Remind before prayer by (minutes)';
  @override
  String settingsPrayerReminderMinutesLabel(Object minutes) => '{minutes} min'.replaceAll('{minutes}', minutes.toString());
  @override
  String get settingsPrayerReminderMethod => 'Reminder method';
  @override
  String get settingsReminderBanner => 'Notification only';
  @override
  String get settingsReminderBeep => 'Alert tone';
  @override
  String get settingsReminderAdhan => 'Full adhan';
  @override
  String get settingsTestTone => 'Test tone';
  @override
  String get settingsAdhanSound => 'Adhan sound';
  @override
  String get settingsStopPreview => 'Stop preview';
  @override
  String get settingsListen => 'Listen';
  @override
  String get settingsReminderNote => 'Note: the app sends a real notification even when it\'s closed, but you\'ll need to grant notification permission (and exact-alarm permission on Android 12+) when you turn this on. Today\'s and tomorrow\'s reminders are rescheduled every time you open the Home or Prayer Times screen.';
  @override
  String get settingsDailyWird => 'Wird diario';
  @override
  String get settingsDailyWirdTarget => 'Meta diaria (páginas/suras)';
  @override
  String settingsDailyWirdPerDay(Object count) => '{count} por día'.replaceAll('{count}', count.toString());
  @override
  String get settingsAboutSupport => 'About & Support';
  @override
  String get settingsAbout => 'Acerca de';
  @override
  String get settingsSourcesLicenses => 'Fuentes y licencias';
  @override
  String get settingsPrivacyPolicy => 'Política de privacidad';
  @override
  String get settingsDataManagement => 'Data Management';
  @override
  String get settingsQuranLastUpdate => 'Quran last updated';
  @override
  String get settingsAzkarLastUpdate => 'Azkar last updated';
  @override
  String get settingsNotDownloadedYet => 'Not downloaded yet';
  @override
  String get settingsUpdateNow => 'Update data now';
  @override
  String get settingsRequiresInternet => 'Requires an internet connection';
  @override
  String get settingsDataUpdated => 'Quran and azkar data updated';
  @override
  String get settingsDownloadedAudio => 'Downloaded recitations for offline listening';
  @override
  String get settingsNoDownloadedAudio => 'No downloaded recitations';
  @override
  String settingsMbDownloaded(Object size) => '{size} MB downloaded'.replaceAll('{size}', size.toString());
  @override
  String get settingsDeleteAll => 'Delete all';
  @override
  String get settingsDeleteAllDownloadsTitle => 'Delete all downloaded recitations';
  @override
  String get settingsDeleteAllDownloadsBody => 'All downloaded audio files for every surah will be deleted. Listening will fall back to online streaming.';
  @override
  String get settingsResetKhatma => 'Reset Khatma progress';
  @override
  String get settingsResetKhatmaSubtitle => 'Start a fresh Khatma from scratch';
  @override
  String get settingsResetKhatmaBody => 'Every surah will be marked unread again to start a new Khatma. Your daily wird and favorites won\'t be affected.';
  @override
  String get settingsResetKhatmaConfirm => 'Reset';
  @override
  String get settingsKhatmaResetDone => 'A new Khatma has started, good luck! 🌿';
  @override
  String get settingsDeleteLocalData => 'Eliminar todos los datos locales';
  @override
  String get settingsDeleteLocalDataBody => 'Favoritos, estadísticas de tasbih, progreso del wird y todos los ajustes serán eliminados.';
  @override
  String get settingsLocalDataDeleted => 'Todos los datos locales han sido eliminados';
  @override
  String get settingsPreviewFailed => 'Couldn\'t play the preview — check your connection';
  @override
  String get quranTranslationUnavailable => 'Translation unavailable for this verse';
  @override
  String get quranTranslationLoadFailed => 'Couldn\'t load the translation';
  @override
  String get quranTranslationRetry => 'Retry';
  @override
  String get quranTranslationSourceNote => 'Translation from QuranEnc.com';
  @override
  String get homeGreetingNight => 'Blessed night 🌙';
  @override
  String get homeGreetingMorning => 'Good morning 👋';
  @override
  String get homeGreetingAfternoon => 'Have a great day ☀️';
  @override
  String get homeGreetingEvening => 'Good evening 👋';
  @override
  String homeStreakDays(Object days) => 'Wird streak: {days} days 🔥'.replaceAll('{days}', days.toString());
  @override
  String get homeContinueToday => 'Keep up what you started today';
  @override
  String homeKhatmaProgress(Object percent) => 'Khatma progress: {percent}%'.replaceAll('{percent}', percent.toString());
  @override
  String get homeIslamicTools => 'Herramientas islámicas';
  @override
  String get homeNextPrayer => 'Próxima oración';
  @override
  String homeInLabel(Object countdown) => 'in {countdown}'.replaceAll('{countdown}', countdown.toString());
  @override
  String get homeCachedPrayerTimes => 'Last saved times (offline)';
  @override
  String get homeEnableLocationForPrayer => 'Enable location to see the next prayer';
  @override
  String get homeDailyWird => 'Wird diario';
  @override
  String get homeWirdCompleted => 'You\'ve completed today\'s wird, may Allah bless you 🎉';
  @override
  String homeWirdProgress(Object pages, Object target) => '{pages} of {target} pages/surahs'.replaceAll('{pages}', pages.toString()).replaceAll('{target}', target.toString());
  @override
  String get homeContinueReading => 'Continue Reading';
  @override
  String get homeNoLastReading => 'No last reading position yet';
  @override
  String homeLastReadingSubtitle(Object surahName, Object ayahNumber) => 'Surah {surahName} — Ayah {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get homeFavorites => 'Favoritos';
  @override
  String get homeNoFavoritesYet => 'No favorite items yet';
  @override
  String homeFavoritesSavedCount(Object count) => '{count} items saved'.replaceAll('{count}', count.toString());
  @override
  String get homeQuoteOfTheDay => 'Cita del día';
  @override
  String get homeThisWeek => 'Esta semana';
  @override
  String homeActiveDaysOf(Object active, Object total) => '{active} of {total} active days'.replaceAll('{active}', active.toString()).replaceAll('{total}', total.toString());
  @override
  String homeWirdTargetMetSummary(Object met, Object total) => 'You met the daily wird target on {met} of {total} days this week'.replaceAll('{met}', met.toString()).replaceAll('{total}', total.toString());
  @override
  String get homeQuickActions => 'Quick Actions';
  @override
  String get homeQuickAzkar => 'Azkar';
  @override
  String get homeQuickTasbeeh => 'Tasbeeh';
  @override
  String get homeQuickPrayer => 'Prayer';
  @override
  String homeCompletionPercent(Object percent) => 'Completion {percent} percent'.replaceAll('{percent}', percent.toString());
  @override
  String homeDayNotYet(Object day) => '{day}: hasn\'t come yet'.replaceAll('{day}', day.toString());
  @override
  String homeDaySummary(Object day, Object pages, Object azkar, Object tasbeeh, Object prayers) => '{day}: {pages} pages, {azkar} azkar, {tasbeeh} tasbeeh, {prayers} prayers'.replaceAll('{day}', day.toString()).replaceAll('{pages}', pages.toString()).replaceAll('{azkar}', azkar.toString()).replaceAll('{tasbeeh}', tasbeeh.toString()).replaceAll('{prayers}', prayers.toString());
  @override
  String get dayNameSat => 'Sáb';
  @override
  String get dayNameSun => 'Dom';
  @override
  String get dayNameMon => 'Lun';
  @override
  String get dayNameTue => 'Mar';
  @override
  String get dayNameWed => 'Mié';
  @override
  String get dayNameThu => 'Jue';
  @override
  String get dayNameFri => 'Vie';
  @override
  String get prayerFajr => 'Fajr';
  @override
  String get prayerDhuhr => 'Dhuhr';
  @override
  String get prayerAsr => 'Asr';
  @override
  String get prayerMaghrib => 'Maghrib';
  @override
  String get prayerIsha => 'Isha';
  @override
  String get prayerTimesTitle => 'Horarios de oración';
  @override
  String get prayerSetCityManually => 'Set city manually';
  @override
  String get prayerCityHint => 'Example: Cairo, Egypt';
  @override
  String get prayerSearch => 'Search';
  @override
  String prayerCityNotFound(Object city) => 'Couldn\'t find "{city}" — check the spelling and try again'.replaceAll('{city}', city.toString());
  @override
  String get prayerAvailabilityLocationDisabled => 'Location services are disabled on your device. Enable them, or set your city manually.';
  @override
  String get prayerAvailabilityPermissionDenied => 'The app needs location access to show accurate prayer times, or you can set your city manually.';
  @override
  String get prayerAvailabilityPermissionDeniedForever => 'Location permission was permanently denied. Enable it from system settings, or set your city manually.';
  @override
  String get prayerAvailabilityNetworkError => 'Couldn\'t connect to the internet and no saved prayer times were found.';
  @override
  String get prayerRetry => 'Reintentar';
  @override
  String get prayerUseGps => 'Use current location (GPS)';
  @override
  String get prayerRefresh => 'Refresh';
  @override
  String get prayerOfflineBanner => 'No connection — showing last saved times';
  @override
  String get prayerNextPrayerLabel => 'Próxima oración';
  @override
  String get prayerTimeRemaining => 'Time remaining';
  @override
  String prayerNotYetDue(Object prayer) => '{prayer} prayer time hasn\'t come yet'.replaceAll('{prayer}', prayer.toString());
  @override
  String prayerMarkedDone(Object prayer) => '{prayer} prayer marked as done'.replaceAll('{prayer}', prayer.toString());
  @override
  String prayerNotDoneYet(Object prayer) => '{prayer} prayer not done yet'.replaceAll('{prayer}', prayer.toString());
  @override
  String get prayerFootnote => 'Note: times are based on your location or selected city, using the AlAdhan service with the Egyptian calculation method.';
  @override
  String prayerReminderApproaching(Object prayer, Object minutes) => '{prayer} prayer is coming up in {minutes} minutes'.replaceAll('{prayer}', prayer.toString()).replaceAll('{minutes}', minutes.toString());
  @override
  String get tasbeehTitle => 'Tasbih';
  @override
  String get tasbeehResetToday => 'Reset today\'s count';
  @override
  String get tasbeehCustom => 'Custom phrase';
  @override
  String get tasbeehToday => 'Today';
  @override
  String get tasbeehTarget => 'Target';
  @override
  String get tasbeehPhraseTotal => 'Phrase total';
  @override
  String get tasbeehGrandTotal => 'Grand total';
  @override
  String tasbeehCounterLabel(Object phrase, Object count, Object target) => '{phrase} tasbeeh counter, currently {count} of {target}'.replaceAll('{phrase}', phrase.toString()).replaceAll('{count}', count.toString()).replaceAll('{target}', target.toString());
  @override
  String get tasbeehTapHint => 'Tap to count — long-press a custom phrase to delete it';
  @override
  String get tasbeehAddCustomTitle => 'Custom phrase';
  @override
  String get tasbeehPhraseTextLabel => 'Phrase text';
  @override
  String get tasbeehPhraseTextHint => 'Example: La hawla wa la quwwata illa billah';
  @override
  String get tasbeehTargetLabel => 'Target';
  @override
  String get tasbeehAdd => 'Add';
  @override
  String get tasbeehGlossSubhanallah => 'SubhanAllah — Glory be to Allah';
  @override
  String get tasbeehGlossAlhamdulillah => 'Alhamdulillah — Praise be to Allah';
  @override
  String get tasbeehGlossAllahuakbar => 'Allahu Akbar — Allah is the Greatest';
  @override
  String get tasbeehGlossLaIlaha => 'La ilaha illallah — There is no god but Allah';
  @override
  String get tasbeehGlossAstaghfirullah => 'Astaghfirullah — I seek Allah\'s forgiveness';
  @override
  String get tasbeehGlossSalawat => 'Allahumma salli ala Muhammad — O Allah, send blessings upon Muhammad';
  @override
  String get azkarDuasTitle => 'Azkar & Duas';
  @override
  String get azkarTabAzkar => 'Azkar';
  @override
  String get azkarTabDuas => 'Duas';
  @override
  String get azkarFavoritesTooltip => 'Favorites';
  @override
  String get azkarLoadError => 'Couldn\'t load azkar. Check your internet connection.';
  @override
  String get azkarSearchHint => 'Search azkar';
  @override
  String get azkarNoResults => 'No results';
  @override
  String azkarCategorySubtitle(Object count, Object completed) => '{count} azkar — {completed} completed today'.replaceAll('{count}', count.toString()).replaceAll('{completed}', completed.toString());
  @override
  String get azkarAllDoneInSection => 'You\'ve completed all azkar in this section 🌿';
  @override
  String get azkarShowCompleted => 'Show completed';
  @override
  String get azkarHideCompleted => 'Hide completed';
  @override
  String get azkarCompletedSnackbar => 'Well done 🌿 this dhikr is complete';
  @override
  String get azkarCopiedSnackbar => 'Dhikr copied — you can paste it to share';
  @override
  String get azkarPlusOne => '+1';
  @override
  String get azkarFavoritesTitle => 'Favorite Azkar';
  @override
  String get azkarNoFavoritesYet => 'No favorite azkar yet';
  @override
  String get azkarRetry => 'Retry';
  @override
  String get quranTitle => 'El Sagrado Corán';
  @override
  String get quranViewMushaf => 'View Mushaf';
  @override
  String get quranTabSurahs => 'Suras';
  @override
  String get quranTabJuz => 'Juz';
  @override
  String get quranTabSearch => 'Búsqueda';
  @override
  String get quranTabFavorites => 'Favoritos';
  @override
  String get quranLoadError => 'Couldn\'t load the Quran. Check your internet connection.';
  @override
  String get quranViewMode => 'View mode';
  @override
  String get quranMushafPagesLoadError => 'Couldn\'t load Mushaf pages — check your connection';
  @override
  String get quranViewAsMushafPages => 'View as Mushaf pages';
  @override
  String quranCompletionPercent(Object percent) => 'Quran completion {percent} percent'.replaceAll('{percent}', percent.toString());
  @override
  String get quranKhatmaProgress => 'Khatma progress';
  @override
  String get quranSearchSurahHint => 'Search by surah name or number';
  @override
  String quranSurahSubtitle(Object englishName, Object count) => '{englishName} - {count} ayahs'.replaceAll('{englishName}', englishName.toString()).replaceAll('{count}', count.toString());
  @override
  String quranJuzNumber(Object number) => 'Juz {number}'.replaceAll('{number}', number.toString());
  @override
  String quranJuzStartsFrom(Object surahName, Object ayahNumber) => 'Starts from Surah {surahName} - Ayah {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get quranSearchAyahHint => 'Search verse text';
  @override
  String get quranSearchMinChars => 'Type at least 2 characters to search';
  @override
  String quranAyahLocation(Object surahName, Object ayahNumber) => 'Surah {surahName} - Ayah {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get quranNoFavoriteAyahsYet => 'No favorite verses yet';
  @override
  String get quranChooseReciter => 'Choose Reciter';
  @override
  String get quranTafsirTimeoutError => 'Loading the tafsir took too long — the file is large (2.7 MB), try on a faster connection';
  @override
  String get quranTafsirLoadError => 'Couldn\'t load the tafsir — check your connection';
  @override
  String quranLastReadingSaved(Object surahName, Object ayahNumber) => 'Last reading saved: Surah {surahName} - Ayah {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String quranAyahCopyFormat(Object text, Object surahName, Object ayahNumber) => '{text} (Surah {surahName}: {ayahNumber})'.replaceAll('{text}', text.toString()).replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get quranAyahCopiedSnackbar => 'Verse copied';
  @override
  String get quranAddedToWird => 'This reading was added to your daily wird 🌿';
  @override
  String quranSurahAppBarTitle(Object name) => 'Surah {name}'.replaceAll('{name}', name.toString());
  @override
  String get quranViewAsMushafPageTooltip => 'View this surah as a Mushaf page';
  @override
  String quranChooseReciterTooltip(Object reciterName) => 'Choose reciter ({reciterName})'.replaceAll('{reciterName}', reciterName.toString());
  @override
  String get quranDecreaseFontTooltip => 'Decrease font size';
  @override
  String get quranIncreaseFontTooltip => 'Increase font size';
  @override
  String get quranAddToWirdTooltip => 'Add to daily wird';
  @override
  String quranAyahCountLabel(Object count) => '{count} ayahs'.replaceAll('{count}', count.toString());
  @override
  String get quranStopSurahRecitationLabel => 'Stop surah recitation';
  @override
  String get quranPlaySurahRecitationLabel => 'Play the whole surah\'s recitation';
  @override
  String get quranStopLabel => 'Stop';
  @override
  String get quranPlayWholeSurahLabel => 'Play whole surah';
  @override
  String get quranNoTafsirAvailable => 'No tafsir available for this verse';
  @override
  String get quranStopPlayingAyahLabel => 'Stop playing this verse';
  @override
  String quranPlayAyahLabel(Object number) => 'Play Ayah {number}'.replaceAll('{number}', number.toString());
  @override
  String get quranPlayAyahTooltip => 'Play verse';
  @override
  String get quranRepeatAyahTooltip => 'Repeat this verse';
  @override
  String get quranHideTafsirTooltip => 'Hide tafsir';
  @override
  String get quranShowTafsirTooltip => 'Show simplified tafsir';
  @override
  String get quranSaveAsLastReadingTooltip => 'Save as last reading';
  @override
  String get quranCopyAyahTooltip => 'Copy verse';
  @override
  String get quranRemoveFromFavoritesLabel => 'Remove from favorites';
  @override
  String get quranAddToFavoritesLabel => 'Add to favorites';
  @override
  String get quranRetry => 'Retry';
  @override
  String get quranDownloadedForOfflineSnackbar => 'Surah downloaded for offline listening';
  @override
  String get quranDeleteDownloadTitle => 'Delete download';
  @override
  String get quranDeleteDownloadBody => 'The downloaded audio files for this surah will be deleted.';
  @override
  String quranStopDownloadTooltip(Object done, Object total) => 'Stop downloading ({done}/{total})'.replaceAll('{done}', done.toString()).replaceAll('{total}', total.toString());
  @override
  String get quranDeleteDownloadedTooltip => 'Downloaded for offline listening — tap to delete';
  @override
  String get quranDownloadForOfflineTooltip => 'Download surah for offline listening';
  @override
  String get qiblaTitle => 'Dirección de la Qibla';
  @override
  String get qiblaRetry => 'Retry';
  @override
  String get qiblaLocationServiceDisabled => 'Location services are disabled on your device. Enable them to find the Qibla direction.';
  @override
  String get qiblaPermissionDenied => 'The app needs location access to find the Qibla direction accurately.';
  @override
  String get qiblaLocationError => 'Couldn\'t determine your location. Check your connection and try again.';
  @override
  String get qiblaNoCompassSensor => 'Your device doesn\'t have a compass sensor. Use the value below with another compass to orient yourself.';
  @override
  String get qiblaBearingFromNorth => 'Direction from true north';
  @override
  String get qiblaCompassNorth => 'N';
  @override
  String get qiblaCompassSouth => 'S';
  @override
  String get qiblaCompassEast => 'E';
  @override
  String get qiblaCompassWest => 'W';
  @override
  String get qiblaAligned => 'You\'re facing the Qibla ✓';
  @override
  String get qiblaNotAligned => 'Turn your device until the marker points up';
  @override
  String qiblaBearingValue(Object degrees) => 'Qibla bearing: {degrees}° from north'.replaceAll('{degrees}', degrees.toString());
  @override
  String get qiblaCalibrationHint => 'If the compass seems inaccurate, move your device in a figure-8 motion, away from magnetic objects, to calibrate it';
  @override
  String get toolQiblaTitle => 'Qibla Direction';
  @override
  String get toolQiblaSubtitle => 'A compass to find the Qibla direction wherever you are';
  @override
  String get toolsTitle => 'Herramientas islámicas';
  @override
  String get toolZakatTitle => 'Calculadora de Zakat';
  @override
  String get toolZakatSubtitle => 'Calculate your Zakat with ease';
  @override
  String get toolAsmaTitle => 'Los 99 Nombres de Alá';
  @override
  String get toolAsmaSubtitle => 'The 99 Names and their meanings';
  @override
  String get toolRamadanTitle => 'Compañero del Ramadán';
  @override
  String get toolRamadanSubtitle => 'Countdown to suhoor and iftar, and fasting tracker';
  @override
  String get toolDuasTitle => 'Mis Duas';
  @override
  String get toolDuasSubtitle => 'Save your own personal duas';
  @override
  String get toolMosqueTitle => 'Mezquitas & Restaurantes halal';
  @override
  String get toolMosqueSubtitle => 'Free search powered by OpenStreetMap data';
  @override
  String get hadithTitle => 'Cuarenta Hadiths de an-Nawawi';
  @override
  String get hadithSubtitle => 'A concise collection of hadiths covering the fundamentals of the religion';
  @override
  String get hadithLoadError => 'Couldn\'t load the hadiths. Check your internet connection.';
  @override
  String get hadithRetry => 'Retry';
  @override
  String hadithNumberLabel(Object number) => 'Hadith {number}'.replaceAll('{number}', number.toString());
  @override
  String get hadithSearchHint => 'Search hadiths';
  @override
  String get hadithNoResults => 'No results';
  @override
  String get hadithCopiedSnackbar => 'Hadith copied';
  @override
  String get hadithAddToFavoritesLabel => 'Add to favorites';
  @override
  String get hadithRemoveFromFavoritesLabel => 'Remove from favorites';
  @override
  String get hadithCopyTooltip => 'Copy hadith';
  @override
  String get hadithTranslationNote => 'Shown in Arabic and English — a German translation isn\'t available for this collection yet';
  @override
  String get toolHadithTitle => 'Cuarenta Hadiths de an-Nawawi';
  @override
  String get toolHadithSubtitle => 'The 40 (42) hadiths compiled by Imam an-Nawawi';
  @override
  String get homeHadithOfTheDay => 'Hadith del día';
  @override
  String get homeShareHadith => 'Share Hadith';
  @override
  String get homeHadithSource => 'Source: 40 Hadith an-Nawawi';
  @override
  String get toolKhatmaTitle => 'Seguimiento de Khatma';
  @override
  String get toolKhatmaSubtitle => 'Plan and track finishing the Quran';
  @override
  String get khatmaTrackerTitle => 'Seguimiento de Khatma';
  @override
  String get khatmaNoPlanTitle => 'Start Your Khatma Journey';
  @override
  String get khatmaNoPlanBody => 'Set a target date to finish reading the entire Quran, and we\'ll help you stay on track.';
  @override
  String get khatmaChooseDuration => 'Choose a duration';
  @override
  String get khatmaDuration7Days => '7 days';
  @override
  String get khatmaDuration30Days => '30 days';
  @override
  String get khatmaDuration60Days => '60 days';
  @override
  String get khatmaDuration90Days => '90 days';
  @override
  String get khatmaCustomDate => 'Pick a custom date';
  @override
  String khatmaProgressLabel(Object completed, Object total) => '{completed} of {total} surahs'.replaceAll('{completed}', completed.toString()).replaceAll('{total}', total.toString());
  @override
  String get khatmaDaysElapsed => 'Days elapsed';
  @override
  String get khatmaDaysRemaining => 'Days remaining';
  @override
  String get khatmaTargetDate => 'Target date';
  @override
  String get khatmaOnTrack => 'You\'re on track — keep it up!';
  @override
  String get khatmaBehindSchedule => 'You\'re a bit behind schedule';
  @override
  String khatmaPaceNeeded(Object count) => 'Read about {count} surahs/day to finish on time'.replaceAll('{count}', count.toString());
  @override
  String get khatmaCompletedCelebration => 'Alhamdulillah! You completed your Khatma 🎉';
  @override
  String get khatmaContinueReading => 'Continue Reading';
  @override
  String get khatmaEditPlan => 'Change Target Date';
  @override
  String get khatmaResetPlanTitle => 'Reset Khatma Plan';
  @override
  String get khatmaResetPlanBody => 'This will clear your plan and reading progress so you can start a new Khatma. This cannot be undone.';
  @override
  String get khatmaResetPlanConfirm => 'Reset';
  @override
  String get khatmaPlanReset => 'Started a new Khatma, good luck! 🌿';
  @override
  String get settingsRemindMeFor => 'Remind me for';
  @override
  String get settingsNotifyAtPrayerTime => 'Notify at prayer time';
  @override
  String get settingsNotifyAtPrayerTimeSubtitle => 'Get an alert exactly when the prayer time begins';
  @override
  String get settingsPostPrayerReminder => 'Remind me to pray';
  @override
  String get settingsPostPrayerReminderSubtitle => 'A gentle follow-up if you haven\'t marked the prayer as done';
  @override
  String settingsPostPrayerReminderMinutesLabel(Object minutes) => '{minutes} min after'.replaceAll('{minutes}', minutes.toString());
  @override
  String get settingsReminderOff => 'Off';
  @override
  String prayerTimeNowBody(Object prayer) => 'It\'s time for {prayer} prayer'.replaceAll('{prayer}', prayer.toString());
  @override
  String postPrayerReminderBody(Object prayer) => 'Have you prayed {prayer} yet?'.replaceAll('{prayer}', prayer.toString());
  @override
  String get settingsMoreReminders => 'More Reminders';
  @override
  String get settingsFridayReminder => 'Friday Reminder';
  @override
  String get settingsFridayReminderSubtitle => 'A weekly reminder for Jumu\'ah and reading Surah Al-Kahf';
  @override
  String get settingsMorningAzkarReminder => 'Morning Azkar';
  @override
  String get settingsMorningAzkarReminderSubtitle => 'A daily reminder to recite your morning remembrance';
  @override
  String get settingsEveningAzkarReminder => 'Evening Azkar';
  @override
  String get settingsEveningAzkarReminderSubtitle => 'A daily reminder to recite your evening remembrance';
  @override
  String get settingsDailyWirdReminder => 'Daily Wird';
  @override
  String get settingsDailyWirdReminderSubtitle => 'A daily reminder to complete today\'s Quran reading';
  @override
  String get settingsSleepAzkarReminder => 'Sleep Azkar';
  @override
  String get settingsSleepAzkarReminderSubtitle => 'A nightly reminder to recite your bedtime remembrance';
  @override
  String get reminderFridayBody => 'Jumu\'ah Mubarak! Don\'t forget to read Surah Al-Kahf today 🕌';
  @override
  String get reminderMorningAzkarBody => 'Time for your morning Azkar 🌞';
  @override
  String get reminderEveningAzkarBody => 'Time for your evening Azkar 🌇';
  @override
  String get reminderDailyWirdBody => 'Have you completed today\'s Quran wird yet? 📖';
  @override
  String get reminderSleepAzkarBody => 'Before you sleep, recite your bedtime Azkar 🌙';
  @override
  String get khatmaMyPlans => 'My Khatma Plans';
  @override
  String get khatmaStartNewPlan => 'Start New Khatma';
  @override
  String get khatmaPlanLabelHint => 'Name this Khatma (optional)';
  @override
  String khatmaBehindByCount(Object count) => '{count} surahs behind schedule'.replaceAll('{count}', count.toString());
  @override
  String khatmaNewPaceLabel(Object count) => 'New daily target: {count} surahs/day'.replaceAll('{count}', count.toString());
  @override
  String get khatmaDeletePlanTitle => 'Delete this Khatma?';
  @override
  String get khatmaDeletePlanBody => 'This will remove the plan and its tracking. This cannot be undone.';
  @override
  String get khatmaDeletePlanConfirm => 'Delete';
  @override
  String khatmaDefaultPlanLabel(Object number) => 'Khatma #{number}'.replaceAll('{number}', number.toString());
  @override
  String get khatmaAddAnother => 'Add Another Khatma';
  @override
  String get toolInsightsTitle => 'Insights de Wirdi';
  @override
  String get toolInsightsSubtitle => 'See your weekly worship stats and trends';
  @override
  String get insightsTitle => 'Insights de Wirdi';
  @override
  String get insightsThisWeek => 'This Week';
  @override
  String get insightsQuranPages => 'Quran Pages';
  @override
  String get insightsAzkarCompleted => 'Azkar Completed';
  @override
  String get insightsPrayers => 'Prayers';
  @override
  String get insightsTasbeeh => 'Tasbeeh';
  @override
  String get insightsCurrentStreak => 'Current Streak';
  @override
  String insightsDaysCount(Object count) => '{count} days'.replaceAll('{count}', count.toString());
  @override
  String get insightsWeeklyActivity => 'Weekly Activity';
  @override
  String get insightsBestDay => 'Best Day';
  @override
  String get insightsMostConsistent => 'Most Consistent';
  @override
  String get insightsWeekComparisonTitle => 'This Week vs Last Week';
  @override
  String insightsImproved(Object percent) => '{percent}% more active than last week'.replaceAll('{percent}', percent.toString());
  @override
  String insightsDeclined(Object percent) => '{percent}% less active than last week'.replaceAll('{percent}', percent.toString());
  @override
  String get insightsFirstActiveWeek => 'Your first active week -- keep it up!';
  @override
  String get insightsNoActivityYet => 'No activity recorded yet this week';
  @override
  String get insightsSameAsLastWeek => 'Same activity level as last week';
  @override
  String get insightsNoBestDayYet => 'Not enough activity yet';
  @override
  String get toolMyWirdiTitle => 'Mi Wirdi';
  @override
  String get toolMyWirdiSubtitle => 'See how you\'re doing today across all your worship';
  @override
  String get myWirdiTitle => 'Mi Wirdi';
  @override
  String get myWirdiToday => 'Today';
  @override
  String get myWirdiCompleted => 'Alhamdulillah! You completed today\'s Wird 🎉';
  @override
  String myWirdiRemaining(Object percent) => '{percent}% left to complete today\'s Wird'.replaceAll('{percent}', percent.toString());
  @override
  String get myWirdiPersonalDua => 'Personal Dua';
  @override
  String get myWirdiDuaDone => 'Recited today';
  @override
  String get myWirdiDuaNotYet => 'Not yet today';
  @override
  String get homeMyWirdiCardTitle => 'Mi Wirdi hoy';
  @override
  String get homeQuickQibla => 'Qibla';
  @override
  String get qiblaDistanceLabel => 'Distance to Makkah';
  @override
  String qiblaDistanceValue(Object km) => '{km} km'.replaceAll('{km}', km.toString());
  @override
  String get achievementStreak3Title => 'Getting Started';
  @override
  String get achievementStreak3Desc => 'Reached a 3-day Wird streak';
  @override
  String get achievementStreak7Title => 'One Week Strong';
  @override
  String get achievementStreak7Desc => 'Reached a 7-day Wird streak';
  @override
  String get achievementStreak30Title => 'Habit Formed';
  @override
  String get achievementStreak30Desc => 'Reached a 30-day Wird streak';
  @override
  String get achievementStreak100Title => 'Unstoppable';
  @override
  String get achievementStreak100Desc => 'Reached a 100-day Wird streak';
  @override
  String get achievementQuran10Title => 'First Steps';
  @override
  String get achievementQuran10Desc => 'Completed 10% of the Quran';
  @override
  String get achievementQuran25Title => 'Quarter Way';
  @override
  String get achievementQuran25Desc => 'Completed 25% of the Quran';
  @override
  String get achievementQuran50Title => 'Halfway There';
  @override
  String get achievementQuran50Desc => 'Completed 50% of the Quran';
  @override
  String get achievementQuran100Title => 'Khatm al-Quran';
  @override
  String get achievementQuran100Desc => 'Completed the entire Quran';
  @override
  String get achievementKhatma1Title => 'First Khatma';
  @override
  String get achievementKhatma1Desc => 'Completed your first Khatma plan';
  @override
  String get achievementKhatma3Title => 'Khatma Devotee';
  @override
  String get achievementKhatma3Desc => 'Completed 3 Khatma plans';
  @override
  String get achievementPages50Title => 'Bookworm';
  @override
  String get achievementPages50Desc => 'Read 50 pages total';
  @override
  String get achievementPages200Title => 'Dedicated Reader';
  @override
  String get achievementPages200Desc => 'Read 200 pages total';
  @override
  String get achievementPages604Title => 'Full Mushaf';
  @override
  String get achievementPages604Desc => 'Read 604 pages total -- a full Mushaf';
  @override
  String get achievementAzkar50Title => 'Remembrance Beginner';
  @override
  String get achievementAzkar50Desc => 'Completed 50 Azkar';
  @override
  String get achievementAzkar500Title => 'Remembrance Master';
  @override
  String get achievementAzkar500Desc => 'Completed 500 Azkar';
  @override
  String get achievementTasbeeh100Title => 'First Tasbeeh';
  @override
  String get achievementTasbeeh100Desc => 'Counted 100 Tasbeeh';
  @override
  String get achievementTasbeeh1000Title => 'Tasbeeh Devotee';
  @override
  String get achievementTasbeeh1000Desc => 'Counted 1,000 Tasbeeh';
  @override
  String get achievementPrayers50Title => 'Consistent Worshipper';
  @override
  String get achievementPrayers50Desc => 'Marked 50 prayers as done';
  @override
  String get achievementPrayers350Title => 'Prayer Champion';
  @override
  String get achievementPrayers350Desc => 'Marked 350 prayers as done';
  @override
  String get achievementFavorites10Title => 'Collector';
  @override
  String get achievementFavorites10Desc => 'Saved 10 favorites';
  @override
  String get achievementsTitle => 'Logros';
  @override
  String achievementsUnlockedCount(Object unlocked, Object total) => '{unlocked} of {total} unlocked'.replaceAll('{unlocked}', unlocked.toString()).replaceAll('{total}', total.toString());
  @override
  String get toolAchievementsTitle => 'Logros';
  @override
  String get toolAchievementsSubtitle => 'Track your milestones and badges';
  @override
  String get quranShareAsImageTooltip => 'Share as image';
  @override
  String get ayahShareTitle => 'Share Ayah';
  @override
  String get ayahShareIncludeTranslation => 'Include translation';
  @override
  String get ayahShareButton => 'Share';
  @override
  String get myDuasDialogTitleNew => 'New Dua';
  @override
  String get myDuasDialogTitleEdit => 'Edit Dua';
  @override
  String get myDuasTitleFieldLabel => 'Title (optional)';
  @override
  String get myDuasTextFieldLabel => 'Dua text';
  @override
  String get myDuasEmptyTitle => 'No duas added yet';
  @override
  String get myDuasEmptySubtitle => 'Tap + to add your own dua';
  @override
  String get ramadanCountdownToSuhoor => 'Time remaining until Suhoor (Fajr Adhan)';
  @override
  String get ramadanCountdownToIftar => 'Time remaining until Iftar (Maghrib Adhan)';
  @override
  String get ramadanCountdownToSuhoorTomorrow => 'Time remaining until tomorrow\'s Suhoor';
  @override
  String get ramadanLoadError => 'Couldn\'t load the prayer times needed for Suhoor and Iftar.';
  @override
  String ramadanDayOfRamadan(Object day) => 'Day {day} of Ramadan'.replaceAll('{day}', day.toString());
  @override
  String get ramadanFastingToday => 'Fasting today';
  @override
  String get ramadanFastingSubtitle => 'Log your fast today to track your progress';
  @override
  String get ramadanDaysLoggedTitle => 'Fasting days logged this month';
  @override
  String get ramadanHijriFootnote => 'Note: the Hijri date here is a computed estimate and may differ by a day from your country\'s official start-of-month announcement.';
  @override
  String get mushafTitle => 'El Mushaf';
  @override
  String get mushafStopAudioTooltip => 'Stop audio';
  @override
  String get mushafLoadError => 'Couldn\'t load Mushaf pages. Check your internet connection.';
  @override
  String get mushafTapAyahHint => 'Tap any ayah to play its recitation';
  @override
  String mushafPageNumber(Object number) => 'Page {number}'.replaceAll('{number}', number.toString());
  @override
  String get mosqueLocationServiceDisabled => 'Location service is disabled on your device.';
  @override
  String get mosqueLocationPermissionNeeded => 'The app needs location access to search for nearby places.';
  @override
  String get mosqueSearchError => 'Couldn\'t search for nearby places -- check your internet connection.';
  @override
  String get mosqueTabMosques => 'Mezquitas';
  @override
  String get mosqueTabHalalRestaurants => 'Restaurantes halal';
  @override
  String get mosqueNoMosquesFound => 'No nearby mosques found in OpenStreetMap data';
  @override
  String get mosqueNoHalalFound => 'No nearby restaurants tagged \'halal\' found -- halal restaurant data on OpenStreetMap is incomplete in many areas';
  @override
  String get onboardingGoalTitle => '¿Cuánto Corán quieres leer diariamente?';
  @override
  String get onboardingGoalLight => 'Ligero';
  @override
  String get onboardingGoalLightDesc => '2 páginas al día';
  @override
  String get onboardingGoalRegular => 'Regular';
  @override
  String get onboardingGoalRegularDesc => '5 páginas al día';
  @override
  String get onboardingGoalAdvanced => 'Avanzado';
  @override
  String get onboardingGoalAdvancedDesc => '10 páginas al día';
  @override
  String get onboardingEnableReminders => 'Activar recordatorios diarios';
  @override
  String get onboardingEnableRemindersDesc => 'Recibe recordatorios para tu wird y azkar diarios';
  @override
  String get toolBookmarksTitle => 'Marcadores';
  @override
  String get toolBookmarksSubtitle => 'Save ayahs with notes and categories';
  @override
  String get bookmarksTitle => 'Marcadores';
  @override
  String get bookmarksEmptyTitle => 'No bookmarks yet';
  @override
  String get bookmarksEmptySubtitle => 'Tap the bookmark icon on any ayah while reading to save it here';
  @override
  String get bookmarkAddTooltip => 'Add bookmark';
  @override
  String get bookmarkDialogTitle => 'Add Bookmark';
  @override
  String get bookmarkNoteLabel => 'Note (optional)';
  @override
  String get bookmarkCategoryLabel => 'Category';
  @override
  String get bookmarkCategoryRamadan => 'Ramadán';
  @override
  String get bookmarkCategoryDua => 'Dua';
  @override
  String get bookmarkCategoryFamily => 'Familia';
  @override
  String get bookmarkCategoryStudy => 'Estudio';
  @override
  String get bookmarkCategoryPersonal => 'Personal';
  @override
  String get bookmarkCategoryOther => 'Todos';
  @override
  String get bookmarkSavedSnackbar => 'Bookmark saved';
  @override
  String get bookmarkDeleteConfirmTitle => 'Delete this bookmark?';
  @override
  String get bookmarkDeleteConfirmBody => 'This cannot be undone.';
  @override
  String get bookmarkDeleteConfirm => 'Delete';
  @override
  String get settingsPrivacyCenter => 'Centro de privacidad';
  @override
  String get settingsPrivacyCenterSubtitle => 'Ver qué se almacena, exportar o eliminar sus datos';
  @override
  String get privacyCenterTitle => 'Centro de privacidad';
  @override
  String get privacyCenterIntro => 'Your worship data belongs to you.';
  @override
  String get privacyCenterLocalDataTitle => 'What\'s stored locally';
  @override
  String get privacyCenterLocalDataBody => 'Reading progress, Azkar/Tasbeeh counts, favorites, bookmarks, personal duas, Khatma plans, achievements, and settings -- stored only on this device using SharedPreferences. Nothing is uploaded to a server.';
  @override
  String get privacyCenterLocationTitle => 'Location usage';
  @override
  String get privacyCenterLocationBody => 'Your device\'s location is used only to calculate prayer times, find the Qibla direction, and search for nearby mosques/halal restaurants. It is never stored or shared with any other service.';
  @override
  String get privacyCenterNoAccountsTitle => 'No accounts, ads, or tracking';
  @override
  String get privacyCenterNoAccountsBody => 'This app does not require an account, does not show ads, and does not use any analytics or tracking SDKs.';
  @override
  String get privacyCenterExportButton => 'Export My Data';
  @override
  String get privacyCenterExportSuccessSnackbar => 'Your data has been prepared for export';
  @override
  String get privacyCenterDeleteButton => 'Delete My Data';
  @override
  String get privacyCenterDeleteConfirmTitle => 'Delete all local data?';
  @override
  String get privacyCenterDeleteConfirmBody => 'This permanently erases all your progress, favorites, bookmarks, duas, achievements, and settings from this device. This cannot be undone.';
  @override
  String get privacyCenterDeleteConfirmButton => 'Delete Everything';
  @override
  String get privacyCenterDeleteDoneSnackbar => 'All local data has been deleted';
  @override
  String get privacyCenterViewPolicy => 'View Full Privacy Policy';
  @override
  String homeRamadanBannerTitle(Object day) => 'Día {day} del Ramadán'.replaceAll('{day}', day.toString());
  @override
  String get homeRamadanBannerSubtitle => 'Toca para tu compañero de Ramadán';
  @override
  String get ramadanLast10NightsTitle => 'Las últimas 10 noches';
  @override
  String get ramadanLast10NightsBody => 'These final nights of Ramadan are the most blessed -- increase your worship, Quran, and dua.';
  @override
  String get ramadanPossibleLaylatAlQadr => 'Tonight may be Laylat al-Qadr';
  @override
  String get commonEditTooltip => 'Editar';
  @override
  String get commonDeleteTooltip => 'Eliminar';
  @override
  String get commonSettingsTooltip => 'Configuración';
  @override
  String get commonDecreaseTooltip => 'Decrease';
  @override
  String get commonIncreaseTooltip => 'Increase';
  @override
  String get commonShareTooltip => 'Compartir';
  @override
  String get commonRefreshTooltip => 'Actualizar';
  @override
  String get homeNextPrayerCardLabel => 'Next prayer time';
  @override
  String get homeWeeklyInsightsCardLabel => 'Weekly insights';
  @override
  String get settingsTajweedColoring => 'Coloreado de Tajweed';
  @override
  String get settingsTajweedColoringSubtitle => 'Colorear el texto coránico según las reglas del Tajweed';
  @override
  String get settingsBackupRestore => 'Copia de seguridad & Restauración';
  @override
  String get settingsExportBackup => 'Exportar copia de seguridad';
  @override
  String get settingsExportBackupSubtitle => 'Save your progress and settings to a file';
  @override
  String get settingsImportBackup => 'Importar copia de seguridad';
  @override
  String get settingsImportBackupSubtitle => 'Restore data from a previously saved file';
  @override
  String get settingsImportSuccess => '¡Copia importada! Por favor reinicia la app.';
  @override
  String get settingsImportError => 'Error al importar.';
  @override
  String get tajweedLegendTitle => 'Reglas del Tajweed';
  @override
  String get tajweedLegendIntro => 'Color coding for Quranic recitation rules:';
  @override
  String get tajweedQalqalahLabel => 'Qalqalah (Echoing)';
  @override
  String get tajweedGhunnahLabel => 'Ghunnah (Nasalization)';
  @override
  String get tajweedIkhfaLabel => 'Ikhfa (Hiding)';
  @override
  String get tajweedIdghamGhunnahLabel => 'Idgham with Ghunnah';
  @override
  String get tajweedIdghamNoGhunnahLabel => 'Idgham without Ghunnah';
  @override
  String get tajweedIqlabLabel => 'Iqlab (Conversion)';
  @override
  String get tajweedLegendClose => 'Cerrar';
  @override
  String get radioTitle => 'Radio islámica';
  @override
  String get radioSubtitle => 'Escucha el Corán y conferencias en vivo';
  @override
  String get radioAll => 'Todos';
  @override
  String get radioNowPlaying => 'Reproduciendo ahora';
  @override
  String get radioFavorites => 'Favoritos';
  @override
  String get radioNoFavorites => 'Aún no hay estaciones favoritas';
  @override
  String get radioNoStations => 'No hay estaciones en esta categoría';
  @override
  String get radioAddFavorite => 'Agregar a favoritos';
  @override
  String get radioRemoveFavorite => 'Quitar de favoritos';
  @override
  String get radioSleepTimer => 'Temporizador de sueño';
  @override
  String get radioSleepTimerSubtitle => 'Detiene automáticamente la radio después del tiempo establecido';
  @override
  String get radioSleepTimerCancel => 'Cancelar temporizador';
  @override
  String get radioMinutes => 'min';
  @override
  String radioSleepTimerActive(Object minutes) => 'Se detiene en {minutes} min'.replaceAll('{minutes}', minutes.toString());
  @override
  String get radioOfficial => 'Oficial';
  @override
  String get radioStreamError => 'No se pudo conectar a la estación. Verifica tu conexión.';
}
class _AppLocalizations_id extends AppLocalizations {
  _AppLocalizations_id() : super('id');
  @override
  String get appTitle => 'Wirdi';
  @override
  String get navHome => 'Beranda';
  @override
  String get navQuran => 'Al-Quran';
  @override
  String get navAzkar => 'Dzikir';
  @override
  String get navPrayer => 'Shalat';
  @override
  String get navTasbeeh => 'Tasbih';
  @override
  String get navMore => 'Lainnya';
  @override
  String get commonCancel => 'Batal';
  @override
  String get commonSave => 'Simpan';
  @override
  String get commonDelete => 'Hapus';
  @override
  String get commonClose => 'Tutup';
  @override
  String get commonOk => 'OK';
  @override
  String get commonBack => 'Kembali';
  @override
  String get commonNext => 'Berikutnya';
  @override
  String get commonSkip => 'Lewati';
  @override
  String get commonDone => 'Selesai';
  @override
  String get commonRetry => 'Coba Lagi';
  @override
  String get commonShare => 'Bagikan';
  @override
  String get commonSearch => 'Cari';
  @override
  String get commonEdit => 'Edit';
  @override
  String get commonConfirm => 'Konfirmasi';
  @override
  String get commonLoading => 'Memuat…';
  @override
  String get commonError => 'Terjadi kesalahan';
  @override
  String get commonYes => 'Ya';
  @override
  String get commonNo => 'Tidak';
  @override
  String get languageName_ar => 'Arab';
  @override
  String get languageName_en => 'Inggris';
  @override
  String get languageName_de => 'Jerman';
  @override
  String get languageName_tr => 'Turki';
  @override
  String get settingsLanguage => 'Bahasa';
  @override
  String get settingsLanguageSystem => 'Bahasa sistem';
  @override
  String get settingsLanguageSubtitle => 'Pilih bahasa tampilan';
  @override
  String get asmaUlHusnaTitle => '99 Nama Allah';
  @override
  String get sourcesLicensesTitle => 'Sumber & Lisensi';
  @override
  String get sourcesOssLicensesButton => 'Open-source package licenses';
  @override
  String get aboutTitle => 'Tentang';
  @override
  String get aboutTagline => 'Teman harian Anda untuk dzikir dan Al-Quran';
  @override
  String get aboutVersion => 'Versi 1.0.0';
  @override
  String get aboutBody => 'Wirdi adalah aplikasi harian Islam.';
  @override
  String get onboardingSkip => 'Lewati';
  @override
  String get onboardingSlide1 => 'Jadikan Al-Quran bagian dari harimu';
  @override
  String get onboardingSlide2 => 'Pantau wird harianmu dan bangun kebiasaan';
  @override
  String get onboardingSlide3 => 'Ingatkan hatimu sebelum waktu mengingatkanmu';
  @override
  String get onboardingStart => 'Mulai perjalananmu';
  @override
  String get onboardingNext => 'Berikutnya';
  @override
  String get privacyPolicyTitle => 'Kebijakan Privasi';
  @override
  String get favoritesTitle => 'Favorit';
  @override
  String get favoritesTabAyahs => 'Ayat Quran';
  @override
  String get favoritesTabAzkar => 'Dzikir';
  @override
  String get favoritesLoadError => 'Tidak dapat memuat favorit';
  @override
  String get favoritesEmptyAyahs => 'Belum ada ayat favorit';
  @override
  String get favoritesEmptyAzkar => 'Belum ada azkar favorit';
  @override
  String favoritesAyahSubtitle(Object surahName, Object ayahNumber) => 'Surah {surahName} - Ayah {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get zakatTitle => 'Kalkulator Zakat';
  @override
  String get zakatNisabHint => 'Enter today\'s nisab value (at the current market price of gold or silver) before calculating, since the nisab price changes daily and can\'t be hardcoded in the app. You can check with your local fatwa authority or look up the current gold price (85 grams of gold, or its equivalent in silver).';
  @override
  String get zakatCurrentNisab => 'Current nisab value';
  @override
  String get zakatableAssets => 'Zakatable assets';
  @override
  String get zakatCash => 'Cash and equivalents (bank, wallet)';
  @override
  String get zakatGoldSilver => 'Gold and silver (market value)';
  @override
  String get zakatInvestments => 'Investments and stocks';
  @override
  String get zakatBusiness => 'Trade goods (merchandise for sale)';
  @override
  String get zakatReceivables => 'Debts owed to you (expected to be recovered)';
  @override
  String get zakatOwedDebts => 'Debts you owe';
  @override
  String get zakatCurrentDebts => 'Debts and bills currently owed by you';
  @override
  String get zakatNetWealth => 'Net zakatable wealth';
  @override
  String get zakatEnterNisabFirst => 'Enter the nisab value first';
  @override
  String get zakatBelowNisab => 'Your wealth is below nisab — no zakat is due';
  @override
  String get zakatDue => 'Zakat due (2.5%)';
  @override
  String get zakatFootnote => 'Note: this calculator gives a general estimate at the standard rate (2.5%) on wealth that has been held for a full lunar year and reached nisab. Zakat on crops, livestock, and minerals follows different rules not covered here. For specific situations, it\'s best to ask a qualified scholar.';
  @override
  String get settingsTitle => 'Pengaturan';
  @override
  String get settingsAppearance => 'Tampilan';
  @override
  String get settingsMode => 'Mode';
  @override
  String get settingsModeLight => 'Terang';
  @override
  String get settingsModeDark => 'Gelap';
  @override
  String get settingsModeAuto => 'Otomatis';
  @override
  String get settingsFontSize => 'Ukuran font';
  @override
  String get settingsFontPreview => 'Contoh teks';
  @override
  String get settingsShowTransliteration => 'Show Latin transliteration';
  @override
  String get settingsShowTransliterationSubtitle => 'Helpful for those learning to read — appears under every verse';
  @override
  String get settingsPrayerReminder => 'Prayer Reminder';
  @override
  String get settingsPrayerReminderEnable => 'Enable upcoming prayer reminder';
  @override
  String get settingsPrayerReminderSubtitle => 'The reminder only works while the app is open';
  @override
  String get settingsPrayerReminderMinutesBefore => 'Remind before prayer by (minutes)';
  @override
  String settingsPrayerReminderMinutesLabel(Object minutes) => '{minutes} min'.replaceAll('{minutes}', minutes.toString());
  @override
  String get settingsPrayerReminderMethod => 'Reminder method';
  @override
  String get settingsReminderBanner => 'Notification only';
  @override
  String get settingsReminderBeep => 'Alert tone';
  @override
  String get settingsReminderAdhan => 'Full adhan';
  @override
  String get settingsTestTone => 'Test tone';
  @override
  String get settingsAdhanSound => 'Adhan sound';
  @override
  String get settingsStopPreview => 'Stop preview';
  @override
  String get settingsListen => 'Listen';
  @override
  String get settingsReminderNote => 'Note: the app sends a real notification even when it\'s closed, but you\'ll need to grant notification permission (and exact-alarm permission on Android 12+) when you turn this on. Today\'s and tomorrow\'s reminders are rescheduled every time you open the Home or Prayer Times screen.';
  @override
  String get settingsDailyWird => 'Wird harian';
  @override
  String get settingsDailyWirdTarget => 'Target harian (halaman/surah)';
  @override
  String settingsDailyWirdPerDay(Object count) => '{count} per hari'.replaceAll('{count}', count.toString());
  @override
  String get settingsAboutSupport => 'About & Support';
  @override
  String get settingsAbout => 'Tentang';
  @override
  String get settingsSourcesLicenses => 'Sumber & Lisensi';
  @override
  String get settingsPrivacyPolicy => 'Kebijakan Privasi';
  @override
  String get settingsDataManagement => 'Data Management';
  @override
  String get settingsQuranLastUpdate => 'Quran last updated';
  @override
  String get settingsAzkarLastUpdate => 'Azkar last updated';
  @override
  String get settingsNotDownloadedYet => 'Not downloaded yet';
  @override
  String get settingsUpdateNow => 'Update data now';
  @override
  String get settingsRequiresInternet => 'Requires an internet connection';
  @override
  String get settingsDataUpdated => 'Quran and azkar data updated';
  @override
  String get settingsDownloadedAudio => 'Downloaded recitations for offline listening';
  @override
  String get settingsNoDownloadedAudio => 'No downloaded recitations';
  @override
  String settingsMbDownloaded(Object size) => '{size} MB downloaded'.replaceAll('{size}', size.toString());
  @override
  String get settingsDeleteAll => 'Delete all';
  @override
  String get settingsDeleteAllDownloadsTitle => 'Delete all downloaded recitations';
  @override
  String get settingsDeleteAllDownloadsBody => 'All downloaded audio files for every surah will be deleted. Listening will fall back to online streaming.';
  @override
  String get settingsResetKhatma => 'Reset Khatma progress';
  @override
  String get settingsResetKhatmaSubtitle => 'Start a fresh Khatma from scratch';
  @override
  String get settingsResetKhatmaBody => 'Every surah will be marked unread again to start a new Khatma. Your daily wird and favorites won\'t be affected.';
  @override
  String get settingsResetKhatmaConfirm => 'Reset';
  @override
  String get settingsKhatmaResetDone => 'A new Khatma has started, good luck! 🌿';
  @override
  String get settingsDeleteLocalData => 'Hapus semua data lokal';
  @override
  String get settingsDeleteLocalDataBody => 'Favorit, statistik tasbih, progres wird, dan semua pengaturan akan dihapus.';
  @override
  String get settingsLocalDataDeleted => 'Semua data lokal telah dihapus';
  @override
  String get settingsPreviewFailed => 'Couldn\'t play the preview — check your connection';
  @override
  String get quranTranslationUnavailable => 'Translation unavailable for this verse';
  @override
  String get quranTranslationLoadFailed => 'Couldn\'t load the translation';
  @override
  String get quranTranslationRetry => 'Retry';
  @override
  String get quranTranslationSourceNote => 'Translation from QuranEnc.com';
  @override
  String get homeGreetingNight => 'Blessed night 🌙';
  @override
  String get homeGreetingMorning => 'Good morning 👋';
  @override
  String get homeGreetingAfternoon => 'Have a great day ☀️';
  @override
  String get homeGreetingEvening => 'Good evening 👋';
  @override
  String homeStreakDays(Object days) => 'Wird streak: {days} days 🔥'.replaceAll('{days}', days.toString());
  @override
  String get homeContinueToday => 'Keep up what you started today';
  @override
  String homeKhatmaProgress(Object percent) => 'Khatma progress: {percent}%'.replaceAll('{percent}', percent.toString());
  @override
  String get homeIslamicTools => 'Alat Islami';
  @override
  String get homeNextPrayer => 'Shalat berikutnya';
  @override
  String homeInLabel(Object countdown) => 'in {countdown}'.replaceAll('{countdown}', countdown.toString());
  @override
  String get homeCachedPrayerTimes => 'Last saved times (offline)';
  @override
  String get homeEnableLocationForPrayer => 'Enable location to see the next prayer';
  @override
  String get homeDailyWird => 'Wird harian';
  @override
  String get homeWirdCompleted => 'You\'ve completed today\'s wird, may Allah bless you 🎉';
  @override
  String homeWirdProgress(Object pages, Object target) => '{pages} of {target} pages/surahs'.replaceAll('{pages}', pages.toString()).replaceAll('{target}', target.toString());
  @override
  String get homeContinueReading => 'Continue Reading';
  @override
  String get homeNoLastReading => 'No last reading position yet';
  @override
  String homeLastReadingSubtitle(Object surahName, Object ayahNumber) => 'Surah {surahName} — Ayah {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get homeFavorites => 'Favorit';
  @override
  String get homeNoFavoritesYet => 'No favorite items yet';
  @override
  String homeFavoritesSavedCount(Object count) => '{count} items saved'.replaceAll('{count}', count.toString());
  @override
  String get homeQuoteOfTheDay => 'Kutipan Hari Ini';
  @override
  String get homeThisWeek => 'Minggu ini';
  @override
  String homeActiveDaysOf(Object active, Object total) => '{active} of {total} active days'.replaceAll('{active}', active.toString()).replaceAll('{total}', total.toString());
  @override
  String homeWirdTargetMetSummary(Object met, Object total) => 'You met the daily wird target on {met} of {total} days this week'.replaceAll('{met}', met.toString()).replaceAll('{total}', total.toString());
  @override
  String get homeQuickActions => 'Quick Actions';
  @override
  String get homeQuickAzkar => 'Azkar';
  @override
  String get homeQuickTasbeeh => 'Tasbeeh';
  @override
  String get homeQuickPrayer => 'Prayer';
  @override
  String homeCompletionPercent(Object percent) => 'Completion {percent} percent'.replaceAll('{percent}', percent.toString());
  @override
  String homeDayNotYet(Object day) => '{day}: hasn\'t come yet'.replaceAll('{day}', day.toString());
  @override
  String homeDaySummary(Object day, Object pages, Object azkar, Object tasbeeh, Object prayers) => '{day}: {pages} pages, {azkar} azkar, {tasbeeh} tasbeeh, {prayers} prayers'.replaceAll('{day}', day.toString()).replaceAll('{pages}', pages.toString()).replaceAll('{azkar}', azkar.toString()).replaceAll('{tasbeeh}', tasbeeh.toString()).replaceAll('{prayers}', prayers.toString());
  @override
  String get dayNameSat => 'Sab';
  @override
  String get dayNameSun => 'Min';
  @override
  String get dayNameMon => 'Sen';
  @override
  String get dayNameTue => 'Sel';
  @override
  String get dayNameWed => 'Rab';
  @override
  String get dayNameThu => 'Kam';
  @override
  String get dayNameFri => 'Jum';
  @override
  String get prayerFajr => 'Subuh';
  @override
  String get prayerDhuhr => 'Dzuhur';
  @override
  String get prayerAsr => 'Ashar';
  @override
  String get prayerMaghrib => 'Maghrib';
  @override
  String get prayerIsha => 'Isya';
  @override
  String get prayerTimesTitle => 'Waktu Shalat';
  @override
  String get prayerSetCityManually => 'Set city manually';
  @override
  String get prayerCityHint => 'Example: Cairo, Egypt';
  @override
  String get prayerSearch => 'Search';
  @override
  String prayerCityNotFound(Object city) => 'Couldn\'t find "{city}" — check the spelling and try again'.replaceAll('{city}', city.toString());
  @override
  String get prayerAvailabilityLocationDisabled => 'Location services are disabled on your device. Enable them, or set your city manually.';
  @override
  String get prayerAvailabilityPermissionDenied => 'The app needs location access to show accurate prayer times, or you can set your city manually.';
  @override
  String get prayerAvailabilityPermissionDeniedForever => 'Location permission was permanently denied. Enable it from system settings, or set your city manually.';
  @override
  String get prayerAvailabilityNetworkError => 'Couldn\'t connect to the internet and no saved prayer times were found.';
  @override
  String get prayerRetry => 'Coba Lagi';
  @override
  String get prayerUseGps => 'Use current location (GPS)';
  @override
  String get prayerRefresh => 'Refresh';
  @override
  String get prayerOfflineBanner => 'No connection — showing last saved times';
  @override
  String get prayerNextPrayerLabel => 'Shalat berikutnya';
  @override
  String get prayerTimeRemaining => 'Time remaining';
  @override
  String prayerNotYetDue(Object prayer) => '{prayer} prayer time hasn\'t come yet'.replaceAll('{prayer}', prayer.toString());
  @override
  String prayerMarkedDone(Object prayer) => '{prayer} prayer marked as done'.replaceAll('{prayer}', prayer.toString());
  @override
  String prayerNotDoneYet(Object prayer) => '{prayer} prayer not done yet'.replaceAll('{prayer}', prayer.toString());
  @override
  String get prayerFootnote => 'Note: times are based on your location or selected city, using the AlAdhan service with the Egyptian calculation method.';
  @override
  String prayerReminderApproaching(Object prayer, Object minutes) => '{prayer} prayer is coming up in {minutes} minutes'.replaceAll('{prayer}', prayer.toString()).replaceAll('{minutes}', minutes.toString());
  @override
  String get tasbeehTitle => 'Tasbih';
  @override
  String get tasbeehResetToday => 'Reset today\'s count';
  @override
  String get tasbeehCustom => 'Custom phrase';
  @override
  String get tasbeehToday => 'Today';
  @override
  String get tasbeehTarget => 'Target';
  @override
  String get tasbeehPhraseTotal => 'Phrase total';
  @override
  String get tasbeehGrandTotal => 'Grand total';
  @override
  String tasbeehCounterLabel(Object phrase, Object count, Object target) => '{phrase} tasbeeh counter, currently {count} of {target}'.replaceAll('{phrase}', phrase.toString()).replaceAll('{count}', count.toString()).replaceAll('{target}', target.toString());
  @override
  String get tasbeehTapHint => 'Tap to count — long-press a custom phrase to delete it';
  @override
  String get tasbeehAddCustomTitle => 'Custom phrase';
  @override
  String get tasbeehPhraseTextLabel => 'Phrase text';
  @override
  String get tasbeehPhraseTextHint => 'Example: La hawla wa la quwwata illa billah';
  @override
  String get tasbeehTargetLabel => 'Target';
  @override
  String get tasbeehAdd => 'Add';
  @override
  String get tasbeehGlossSubhanallah => 'SubhanAllah — Glory be to Allah';
  @override
  String get tasbeehGlossAlhamdulillah => 'Alhamdulillah — Praise be to Allah';
  @override
  String get tasbeehGlossAllahuakbar => 'Allahu Akbar — Allah is the Greatest';
  @override
  String get tasbeehGlossLaIlaha => 'La ilaha illallah — There is no god but Allah';
  @override
  String get tasbeehGlossAstaghfirullah => 'Astaghfirullah — I seek Allah\'s forgiveness';
  @override
  String get tasbeehGlossSalawat => 'Allahumma salli ala Muhammad — O Allah, send blessings upon Muhammad';
  @override
  String get azkarDuasTitle => 'Dzikir & Doa';
  @override
  String get azkarTabAzkar => 'Dzikir';
  @override
  String get azkarTabDuas => 'Doa';
  @override
  String get azkarFavoritesTooltip => 'Favorites';
  @override
  String get azkarLoadError => 'Couldn\'t load azkar. Check your internet connection.';
  @override
  String get azkarSearchHint => 'Search azkar';
  @override
  String get azkarNoResults => 'No results';
  @override
  String azkarCategorySubtitle(Object count, Object completed) => '{count} azkar — {completed} completed today'.replaceAll('{count}', count.toString()).replaceAll('{completed}', completed.toString());
  @override
  String get azkarAllDoneInSection => 'You\'ve completed all azkar in this section 🌿';
  @override
  String get azkarShowCompleted => 'Show completed';
  @override
  String get azkarHideCompleted => 'Hide completed';
  @override
  String get azkarCompletedSnackbar => 'Well done 🌿 this dhikr is complete';
  @override
  String get azkarCopiedSnackbar => 'Dhikr copied — you can paste it to share';
  @override
  String get azkarPlusOne => '+1';
  @override
  String get azkarFavoritesTitle => 'Favorite Azkar';
  @override
  String get azkarNoFavoritesYet => 'No favorite azkar yet';
  @override
  String get azkarRetry => 'Retry';
  @override
  String get quranTitle => 'Al-Quran Al-Karim';
  @override
  String get quranViewMushaf => 'View Mushaf';
  @override
  String get quranTabSurahs => 'Surah';
  @override
  String get quranTabJuz => 'Juz';
  @override
  String get quranTabSearch => 'Pencarian';
  @override
  String get quranTabFavorites => 'Favorit';
  @override
  String get quranLoadError => 'Couldn\'t load the Quran. Check your internet connection.';
  @override
  String get quranViewMode => 'View mode';
  @override
  String get quranMushafPagesLoadError => 'Couldn\'t load Mushaf pages — check your connection';
  @override
  String get quranViewAsMushafPages => 'View as Mushaf pages';
  @override
  String quranCompletionPercent(Object percent) => 'Quran completion {percent} percent'.replaceAll('{percent}', percent.toString());
  @override
  String get quranKhatmaProgress => 'Khatma progress';
  @override
  String get quranSearchSurahHint => 'Search by surah name or number';
  @override
  String quranSurahSubtitle(Object englishName, Object count) => '{englishName} - {count} ayahs'.replaceAll('{englishName}', englishName.toString()).replaceAll('{count}', count.toString());
  @override
  String quranJuzNumber(Object number) => 'Juz {number}'.replaceAll('{number}', number.toString());
  @override
  String quranJuzStartsFrom(Object surahName, Object ayahNumber) => 'Starts from Surah {surahName} - Ayah {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get quranSearchAyahHint => 'Search verse text';
  @override
  String get quranSearchMinChars => 'Type at least 2 characters to search';
  @override
  String quranAyahLocation(Object surahName, Object ayahNumber) => 'Surah {surahName} - Ayah {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get quranNoFavoriteAyahsYet => 'No favorite verses yet';
  @override
  String get quranChooseReciter => 'Choose Reciter';
  @override
  String get quranTafsirTimeoutError => 'Loading the tafsir took too long — the file is large (2.7 MB), try on a faster connection';
  @override
  String get quranTafsirLoadError => 'Couldn\'t load the tafsir — check your connection';
  @override
  String quranLastReadingSaved(Object surahName, Object ayahNumber) => 'Last reading saved: Surah {surahName} - Ayah {ayahNumber}'.replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String quranAyahCopyFormat(Object text, Object surahName, Object ayahNumber) => '{text} (Surah {surahName}: {ayahNumber})'.replaceAll('{text}', text.toString()).replaceAll('{surahName}', surahName.toString()).replaceAll('{ayahNumber}', ayahNumber.toString());
  @override
  String get quranAyahCopiedSnackbar => 'Verse copied';
  @override
  String get quranAddedToWird => 'This reading was added to your daily wird 🌿';
  @override
  String quranSurahAppBarTitle(Object name) => 'Surah {name}'.replaceAll('{name}', name.toString());
  @override
  String get quranViewAsMushafPageTooltip => 'View this surah as a Mushaf page';
  @override
  String quranChooseReciterTooltip(Object reciterName) => 'Choose reciter ({reciterName})'.replaceAll('{reciterName}', reciterName.toString());
  @override
  String get quranDecreaseFontTooltip => 'Decrease font size';
  @override
  String get quranIncreaseFontTooltip => 'Increase font size';
  @override
  String get quranAddToWirdTooltip => 'Add to daily wird';
  @override
  String quranAyahCountLabel(Object count) => '{count} ayahs'.replaceAll('{count}', count.toString());
  @override
  String get quranStopSurahRecitationLabel => 'Stop surah recitation';
  @override
  String get quranPlaySurahRecitationLabel => 'Play the whole surah\'s recitation';
  @override
  String get quranStopLabel => 'Stop';
  @override
  String get quranPlayWholeSurahLabel => 'Play whole surah';
  @override
  String get quranNoTafsirAvailable => 'No tafsir available for this verse';
  @override
  String get quranStopPlayingAyahLabel => 'Stop playing this verse';
  @override
  String quranPlayAyahLabel(Object number) => 'Play Ayah {number}'.replaceAll('{number}', number.toString());
  @override
  String get quranPlayAyahTooltip => 'Play verse';
  @override
  String get quranRepeatAyahTooltip => 'Repeat this verse';
  @override
  String get quranHideTafsirTooltip => 'Hide tafsir';
  @override
  String get quranShowTafsirTooltip => 'Show simplified tafsir';
  @override
  String get quranSaveAsLastReadingTooltip => 'Save as last reading';
  @override
  String get quranCopyAyahTooltip => 'Copy verse';
  @override
  String get quranRemoveFromFavoritesLabel => 'Remove from favorites';
  @override
  String get quranAddToFavoritesLabel => 'Add to favorites';
  @override
  String get quranRetry => 'Retry';
  @override
  String get quranDownloadedForOfflineSnackbar => 'Surah downloaded for offline listening';
  @override
  String get quranDeleteDownloadTitle => 'Delete download';
  @override
  String get quranDeleteDownloadBody => 'The downloaded audio files for this surah will be deleted.';
  @override
  String quranStopDownloadTooltip(Object done, Object total) => 'Stop downloading ({done}/{total})'.replaceAll('{done}', done.toString()).replaceAll('{total}', total.toString());
  @override
  String get quranDeleteDownloadedTooltip => 'Downloaded for offline listening — tap to delete';
  @override
  String get quranDownloadForOfflineTooltip => 'Download surah for offline listening';
  @override
  String get qiblaTitle => 'Arah Kiblat';
  @override
  String get qiblaRetry => 'Retry';
  @override
  String get qiblaLocationServiceDisabled => 'Location services are disabled on your device. Enable them to find the Qibla direction.';
  @override
  String get qiblaPermissionDenied => 'The app needs location access to find the Qibla direction accurately.';
  @override
  String get qiblaLocationError => 'Couldn\'t determine your location. Check your connection and try again.';
  @override
  String get qiblaNoCompassSensor => 'Your device doesn\'t have a compass sensor. Use the value below with another compass to orient yourself.';
  @override
  String get qiblaBearingFromNorth => 'Direction from true north';
  @override
  String get qiblaCompassNorth => 'N';
  @override
  String get qiblaCompassSouth => 'S';
  @override
  String get qiblaCompassEast => 'E';
  @override
  String get qiblaCompassWest => 'W';
  @override
  String get qiblaAligned => 'You\'re facing the Qibla ✓';
  @override
  String get qiblaNotAligned => 'Turn your device until the marker points up';
  @override
  String qiblaBearingValue(Object degrees) => 'Qibla bearing: {degrees}° from north'.replaceAll('{degrees}', degrees.toString());
  @override
  String get qiblaCalibrationHint => 'If the compass seems inaccurate, move your device in a figure-8 motion, away from magnetic objects, to calibrate it';
  @override
  String get toolQiblaTitle => 'Qibla Direction';
  @override
  String get toolQiblaSubtitle => 'A compass to find the Qibla direction wherever you are';
  @override
  String get toolsTitle => 'Alat Islami';
  @override
  String get toolZakatTitle => 'Kalkulator Zakat';
  @override
  String get toolZakatSubtitle => 'Calculate your Zakat with ease';
  @override
  String get toolAsmaTitle => '99 Nama Allah';
  @override
  String get toolAsmaSubtitle => 'The 99 Names and their meanings';
  @override
  String get toolRamadanTitle => 'Kompanion Ramadan';
  @override
  String get toolRamadanSubtitle => 'Countdown to suhoor and iftar, and fasting tracker';
  @override
  String get toolDuasTitle => 'Doa Saya';
  @override
  String get toolDuasSubtitle => 'Save your own personal duas';
  @override
  String get toolMosqueTitle => 'Masjid & Restoran Halal';
  @override
  String get toolMosqueSubtitle => 'Free search powered by OpenStreetMap data';
  @override
  String get hadithTitle => 'Empat Puluh Hadis an-Nawawi';
  @override
  String get hadithSubtitle => 'A concise collection of hadiths covering the fundamentals of the religion';
  @override
  String get hadithLoadError => 'Couldn\'t load the hadiths. Check your internet connection.';
  @override
  String get hadithRetry => 'Retry';
  @override
  String hadithNumberLabel(Object number) => 'Hadith {number}'.replaceAll('{number}', number.toString());
  @override
  String get hadithSearchHint => 'Search hadiths';
  @override
  String get hadithNoResults => 'No results';
  @override
  String get hadithCopiedSnackbar => 'Hadith copied';
  @override
  String get hadithAddToFavoritesLabel => 'Add to favorites';
  @override
  String get hadithRemoveFromFavoritesLabel => 'Remove from favorites';
  @override
  String get hadithCopyTooltip => 'Copy hadith';
  @override
  String get hadithTranslationNote => 'Shown in Arabic and English — a German translation isn\'t available for this collection yet';
  @override
  String get toolHadithTitle => 'Empat Puluh Hadis an-Nawawi';
  @override
  String get toolHadithSubtitle => 'The 40 (42) hadiths compiled by Imam an-Nawawi';
  @override
  String get homeHadithOfTheDay => 'Hadis Hari Ini';
  @override
  String get homeShareHadith => 'Share Hadith';
  @override
  String get homeHadithSource => 'Source: 40 Hadith an-Nawawi';
  @override
  String get toolKhatmaTitle => 'Pelacak Khatma';
  @override
  String get toolKhatmaSubtitle => 'Plan and track finishing the Quran';
  @override
  String get khatmaTrackerTitle => 'Pelacak Khatma';
  @override
  String get khatmaNoPlanTitle => 'Start Your Khatma Journey';
  @override
  String get khatmaNoPlanBody => 'Set a target date to finish reading the entire Quran, and we\'ll help you stay on track.';
  @override
  String get khatmaChooseDuration => 'Choose a duration';
  @override
  String get khatmaDuration7Days => '7 days';
  @override
  String get khatmaDuration30Days => '30 days';
  @override
  String get khatmaDuration60Days => '60 days';
  @override
  String get khatmaDuration90Days => '90 days';
  @override
  String get khatmaCustomDate => 'Pick a custom date';
  @override
  String khatmaProgressLabel(Object completed, Object total) => '{completed} of {total} surahs'.replaceAll('{completed}', completed.toString()).replaceAll('{total}', total.toString());
  @override
  String get khatmaDaysElapsed => 'Days elapsed';
  @override
  String get khatmaDaysRemaining => 'Days remaining';
  @override
  String get khatmaTargetDate => 'Target date';
  @override
  String get khatmaOnTrack => 'You\'re on track — keep it up!';
  @override
  String get khatmaBehindSchedule => 'You\'re a bit behind schedule';
  @override
  String khatmaPaceNeeded(Object count) => 'Read about {count} surahs/day to finish on time'.replaceAll('{count}', count.toString());
  @override
  String get khatmaCompletedCelebration => 'Alhamdulillah! You completed your Khatma 🎉';
  @override
  String get khatmaContinueReading => 'Continue Reading';
  @override
  String get khatmaEditPlan => 'Change Target Date';
  @override
  String get khatmaResetPlanTitle => 'Reset Khatma Plan';
  @override
  String get khatmaResetPlanBody => 'This will clear your plan and reading progress so you can start a new Khatma. This cannot be undone.';
  @override
  String get khatmaResetPlanConfirm => 'Reset';
  @override
  String get khatmaPlanReset => 'Started a new Khatma, good luck! 🌿';
  @override
  String get settingsRemindMeFor => 'Remind me for';
  @override
  String get settingsNotifyAtPrayerTime => 'Notify at prayer time';
  @override
  String get settingsNotifyAtPrayerTimeSubtitle => 'Get an alert exactly when the prayer time begins';
  @override
  String get settingsPostPrayerReminder => 'Remind me to pray';
  @override
  String get settingsPostPrayerReminderSubtitle => 'A gentle follow-up if you haven\'t marked the prayer as done';
  @override
  String settingsPostPrayerReminderMinutesLabel(Object minutes) => '{minutes} min after'.replaceAll('{minutes}', minutes.toString());
  @override
  String get settingsReminderOff => 'Off';
  @override
  String prayerTimeNowBody(Object prayer) => 'It\'s time for {prayer} prayer'.replaceAll('{prayer}', prayer.toString());
  @override
  String postPrayerReminderBody(Object prayer) => 'Have you prayed {prayer} yet?'.replaceAll('{prayer}', prayer.toString());
  @override
  String get settingsMoreReminders => 'More Reminders';
  @override
  String get settingsFridayReminder => 'Friday Reminder';
  @override
  String get settingsFridayReminderSubtitle => 'A weekly reminder for Jumu\'ah and reading Surah Al-Kahf';
  @override
  String get settingsMorningAzkarReminder => 'Morning Azkar';
  @override
  String get settingsMorningAzkarReminderSubtitle => 'A daily reminder to recite your morning remembrance';
  @override
  String get settingsEveningAzkarReminder => 'Evening Azkar';
  @override
  String get settingsEveningAzkarReminderSubtitle => 'A daily reminder to recite your evening remembrance';
  @override
  String get settingsDailyWirdReminder => 'Daily Wird';
  @override
  String get settingsDailyWirdReminderSubtitle => 'A daily reminder to complete today\'s Quran reading';
  @override
  String get settingsSleepAzkarReminder => 'Sleep Azkar';
  @override
  String get settingsSleepAzkarReminderSubtitle => 'A nightly reminder to recite your bedtime remembrance';
  @override
  String get reminderFridayBody => 'Jumu\'ah Mubarak! Don\'t forget to read Surah Al-Kahf today 🕌';
  @override
  String get reminderMorningAzkarBody => 'Time for your morning Azkar 🌞';
  @override
  String get reminderEveningAzkarBody => 'Time for your evening Azkar 🌇';
  @override
  String get reminderDailyWirdBody => 'Have you completed today\'s Quran wird yet? 📖';
  @override
  String get reminderSleepAzkarBody => 'Before you sleep, recite your bedtime Azkar 🌙';
  @override
  String get khatmaMyPlans => 'My Khatma Plans';
  @override
  String get khatmaStartNewPlan => 'Start New Khatma';
  @override
  String get khatmaPlanLabelHint => 'Name this Khatma (optional)';
  @override
  String khatmaBehindByCount(Object count) => '{count} surahs behind schedule'.replaceAll('{count}', count.toString());
  @override
  String khatmaNewPaceLabel(Object count) => 'New daily target: {count} surahs/day'.replaceAll('{count}', count.toString());
  @override
  String get khatmaDeletePlanTitle => 'Delete this Khatma?';
  @override
  String get khatmaDeletePlanBody => 'This will remove the plan and its tracking. This cannot be undone.';
  @override
  String get khatmaDeletePlanConfirm => 'Delete';
  @override
  String khatmaDefaultPlanLabel(Object number) => 'Khatma #{number}'.replaceAll('{number}', number.toString());
  @override
  String get khatmaAddAnother => 'Add Another Khatma';
  @override
  String get toolInsightsTitle => 'Wawasan Wirdi';
  @override
  String get toolInsightsSubtitle => 'See your weekly worship stats and trends';
  @override
  String get insightsTitle => 'Wawasan Wirdi';
  @override
  String get insightsThisWeek => 'This Week';
  @override
  String get insightsQuranPages => 'Quran Pages';
  @override
  String get insightsAzkarCompleted => 'Azkar Completed';
  @override
  String get insightsPrayers => 'Prayers';
  @override
  String get insightsTasbeeh => 'Tasbeeh';
  @override
  String get insightsCurrentStreak => 'Current Streak';
  @override
  String insightsDaysCount(Object count) => '{count} days'.replaceAll('{count}', count.toString());
  @override
  String get insightsWeeklyActivity => 'Weekly Activity';
  @override
  String get insightsBestDay => 'Best Day';
  @override
  String get insightsMostConsistent => 'Most Consistent';
  @override
  String get insightsWeekComparisonTitle => 'This Week vs Last Week';
  @override
  String insightsImproved(Object percent) => '{percent}% more active than last week'.replaceAll('{percent}', percent.toString());
  @override
  String insightsDeclined(Object percent) => '{percent}% less active than last week'.replaceAll('{percent}', percent.toString());
  @override
  String get insightsFirstActiveWeek => 'Your first active week -- keep it up!';
  @override
  String get insightsNoActivityYet => 'No activity recorded yet this week';
  @override
  String get insightsSameAsLastWeek => 'Same activity level as last week';
  @override
  String get insightsNoBestDayYet => 'Not enough activity yet';
  @override
  String get toolMyWirdiTitle => 'Wirdi Saya';
  @override
  String get toolMyWirdiSubtitle => 'See how you\'re doing today across all your worship';
  @override
  String get myWirdiTitle => 'Wirdi Saya';
  @override
  String get myWirdiToday => 'Today';
  @override
  String get myWirdiCompleted => 'Alhamdulillah! You completed today\'s Wird 🎉';
  @override
  String myWirdiRemaining(Object percent) => '{percent}% left to complete today\'s Wird'.replaceAll('{percent}', percent.toString());
  @override
  String get myWirdiPersonalDua => 'Personal Dua';
  @override
  String get myWirdiDuaDone => 'Recited today';
  @override
  String get myWirdiDuaNotYet => 'Not yet today';
  @override
  String get homeMyWirdiCardTitle => 'Wirdi Saya Hari Ini';
  @override
  String get homeQuickQibla => 'Kiblat';
  @override
  String get qiblaDistanceLabel => 'Distance to Makkah';
  @override
  String qiblaDistanceValue(Object km) => '{km} km'.replaceAll('{km}', km.toString());
  @override
  String get achievementStreak3Title => 'Getting Started';
  @override
  String get achievementStreak3Desc => 'Reached a 3-day Wird streak';
  @override
  String get achievementStreak7Title => 'One Week Strong';
  @override
  String get achievementStreak7Desc => 'Reached a 7-day Wird streak';
  @override
  String get achievementStreak30Title => 'Habit Formed';
  @override
  String get achievementStreak30Desc => 'Reached a 30-day Wird streak';
  @override
  String get achievementStreak100Title => 'Unstoppable';
  @override
  String get achievementStreak100Desc => 'Reached a 100-day Wird streak';
  @override
  String get achievementQuran10Title => 'First Steps';
  @override
  String get achievementQuran10Desc => 'Completed 10% of the Quran';
  @override
  String get achievementQuran25Title => 'Quarter Way';
  @override
  String get achievementQuran25Desc => 'Completed 25% of the Quran';
  @override
  String get achievementQuran50Title => 'Halfway There';
  @override
  String get achievementQuran50Desc => 'Completed 50% of the Quran';
  @override
  String get achievementQuran100Title => 'Khatm al-Quran';
  @override
  String get achievementQuran100Desc => 'Completed the entire Quran';
  @override
  String get achievementKhatma1Title => 'First Khatma';
  @override
  String get achievementKhatma1Desc => 'Completed your first Khatma plan';
  @override
  String get achievementKhatma3Title => 'Khatma Devotee';
  @override
  String get achievementKhatma3Desc => 'Completed 3 Khatma plans';
  @override
  String get achievementPages50Title => 'Bookworm';
  @override
  String get achievementPages50Desc => 'Read 50 pages total';
  @override
  String get achievementPages200Title => 'Dedicated Reader';
  @override
  String get achievementPages200Desc => 'Read 200 pages total';
  @override
  String get achievementPages604Title => 'Full Mushaf';
  @override
  String get achievementPages604Desc => 'Read 604 pages total -- a full Mushaf';
  @override
  String get achievementAzkar50Title => 'Remembrance Beginner';
  @override
  String get achievementAzkar50Desc => 'Completed 50 Azkar';
  @override
  String get achievementAzkar500Title => 'Remembrance Master';
  @override
  String get achievementAzkar500Desc => 'Completed 500 Azkar';
  @override
  String get achievementTasbeeh100Title => 'First Tasbeeh';
  @override
  String get achievementTasbeeh100Desc => 'Counted 100 Tasbeeh';
  @override
  String get achievementTasbeeh1000Title => 'Tasbeeh Devotee';
  @override
  String get achievementTasbeeh1000Desc => 'Counted 1,000 Tasbeeh';
  @override
  String get achievementPrayers50Title => 'Consistent Worshipper';
  @override
  String get achievementPrayers50Desc => 'Marked 50 prayers as done';
  @override
  String get achievementPrayers350Title => 'Prayer Champion';
  @override
  String get achievementPrayers350Desc => 'Marked 350 prayers as done';
  @override
  String get achievementFavorites10Title => 'Collector';
  @override
  String get achievementFavorites10Desc => 'Saved 10 favorites';
  @override
  String get achievementsTitle => 'Pencapaian';
  @override
  String achievementsUnlockedCount(Object unlocked, Object total) => '{unlocked} of {total} unlocked'.replaceAll('{unlocked}', unlocked.toString()).replaceAll('{total}', total.toString());
  @override
  String get toolAchievementsTitle => 'Pencapaian';
  @override
  String get toolAchievementsSubtitle => 'Track your milestones and badges';
  @override
  String get quranShareAsImageTooltip => 'Share as image';
  @override
  String get ayahShareTitle => 'Share Ayah';
  @override
  String get ayahShareIncludeTranslation => 'Include translation';
  @override
  String get ayahShareButton => 'Share';
  @override
  String get myDuasDialogTitleNew => 'New Dua';
  @override
  String get myDuasDialogTitleEdit => 'Edit Dua';
  @override
  String get myDuasTitleFieldLabel => 'Title (optional)';
  @override
  String get myDuasTextFieldLabel => 'Dua text';
  @override
  String get myDuasEmptyTitle => 'No duas added yet';
  @override
  String get myDuasEmptySubtitle => 'Tap + to add your own dua';
  @override
  String get ramadanCountdownToSuhoor => 'Time remaining until Suhoor (Fajr Adhan)';
  @override
  String get ramadanCountdownToIftar => 'Time remaining until Iftar (Maghrib Adhan)';
  @override
  String get ramadanCountdownToSuhoorTomorrow => 'Time remaining until tomorrow\'s Suhoor';
  @override
  String get ramadanLoadError => 'Couldn\'t load the prayer times needed for Suhoor and Iftar.';
  @override
  String ramadanDayOfRamadan(Object day) => 'Day {day} of Ramadan'.replaceAll('{day}', day.toString());
  @override
  String get ramadanFastingToday => 'Fasting today';
  @override
  String get ramadanFastingSubtitle => 'Log your fast today to track your progress';
  @override
  String get ramadanDaysLoggedTitle => 'Fasting days logged this month';
  @override
  String get ramadanHijriFootnote => 'Note: the Hijri date here is a computed estimate and may differ by a day from your country\'s official start-of-month announcement.';
  @override
  String get mushafTitle => 'Mushaf';
  @override
  String get mushafStopAudioTooltip => 'Stop audio';
  @override
  String get mushafLoadError => 'Couldn\'t load Mushaf pages. Check your internet connection.';
  @override
  String get mushafTapAyahHint => 'Tap any ayah to play its recitation';
  @override
  String mushafPageNumber(Object number) => 'Page {number}'.replaceAll('{number}', number.toString());
  @override
  String get mosqueLocationServiceDisabled => 'Location service is disabled on your device.';
  @override
  String get mosqueLocationPermissionNeeded => 'The app needs location access to search for nearby places.';
  @override
  String get mosqueSearchError => 'Couldn\'t search for nearby places -- check your internet connection.';
  @override
  String get mosqueTabMosques => 'Masjid';
  @override
  String get mosqueTabHalalRestaurants => 'Restoran halal';
  @override
  String get mosqueNoMosquesFound => 'No nearby mosques found in OpenStreetMap data';
  @override
  String get mosqueNoHalalFound => 'No nearby restaurants tagged \'halal\' found -- halal restaurant data on OpenStreetMap is incomplete in many areas';
  @override
  String get onboardingGoalTitle => 'Berapa banyak Al-Quran yang ingin Anda baca setiap hari?';
  @override
  String get onboardingGoalLight => 'Ringan';
  @override
  String get onboardingGoalLightDesc => '2 halaman sehari';
  @override
  String get onboardingGoalRegular => 'Reguler';
  @override
  String get onboardingGoalRegularDesc => '5 halaman sehari';
  @override
  String get onboardingGoalAdvanced => 'Lanjutan';
  @override
  String get onboardingGoalAdvancedDesc => '10 halaman sehari';
  @override
  String get onboardingEnableReminders => 'Aktifkan pengingat harian';
  @override
  String get onboardingEnableRemindersDesc => 'Dapatkan pengingat untuk wird dan azkar harian Anda';
  @override
  String get toolBookmarksTitle => 'Bookmark';
  @override
  String get toolBookmarksSubtitle => 'Save ayahs with notes and categories';
  @override
  String get bookmarksTitle => 'Bookmark';
  @override
  String get bookmarksEmptyTitle => 'No bookmarks yet';
  @override
  String get bookmarksEmptySubtitle => 'Tap the bookmark icon on any ayah while reading to save it here';
  @override
  String get bookmarkAddTooltip => 'Add bookmark';
  @override
  String get bookmarkDialogTitle => 'Add Bookmark';
  @override
  String get bookmarkNoteLabel => 'Note (optional)';
  @override
  String get bookmarkCategoryLabel => 'Category';
  @override
  String get bookmarkCategoryRamadan => 'Ramadan';
  @override
  String get bookmarkCategoryDua => 'Doa';
  @override
  String get bookmarkCategoryFamily => 'Keluarga';
  @override
  String get bookmarkCategoryStudy => 'Belajar';
  @override
  String get bookmarkCategoryPersonal => 'Pribadi';
  @override
  String get bookmarkCategoryOther => 'Semua';
  @override
  String get bookmarkSavedSnackbar => 'Bookmark saved';
  @override
  String get bookmarkDeleteConfirmTitle => 'Delete this bookmark?';
  @override
  String get bookmarkDeleteConfirmBody => 'This cannot be undone.';
  @override
  String get bookmarkDeleteConfirm => 'Delete';
  @override
  String get settingsPrivacyCenter => 'Pusat Privasi';
  @override
  String get settingsPrivacyCenterSubtitle => 'Lihat apa yang tersimpan, ekspor atau hapus data Anda';
  @override
  String get privacyCenterTitle => 'Pusat Privasi';
  @override
  String get privacyCenterIntro => 'Your worship data belongs to you.';
  @override
  String get privacyCenterLocalDataTitle => 'What\'s stored locally';
  @override
  String get privacyCenterLocalDataBody => 'Reading progress, Azkar/Tasbeeh counts, favorites, bookmarks, personal duas, Khatma plans, achievements, and settings -- stored only on this device using SharedPreferences. Nothing is uploaded to a server.';
  @override
  String get privacyCenterLocationTitle => 'Location usage';
  @override
  String get privacyCenterLocationBody => 'Your device\'s location is used only to calculate prayer times, find the Qibla direction, and search for nearby mosques/halal restaurants. It is never stored or shared with any other service.';
  @override
  String get privacyCenterNoAccountsTitle => 'No accounts, ads, or tracking';
  @override
  String get privacyCenterNoAccountsBody => 'This app does not require an account, does not show ads, and does not use any analytics or tracking SDKs.';
  @override
  String get privacyCenterExportButton => 'Export My Data';
  @override
  String get privacyCenterExportSuccessSnackbar => 'Your data has been prepared for export';
  @override
  String get privacyCenterDeleteButton => 'Delete My Data';
  @override
  String get privacyCenterDeleteConfirmTitle => 'Delete all local data?';
  @override
  String get privacyCenterDeleteConfirmBody => 'This permanently erases all your progress, favorites, bookmarks, duas, achievements, and settings from this device. This cannot be undone.';
  @override
  String get privacyCenterDeleteConfirmButton => 'Delete Everything';
  @override
  String get privacyCenterDeleteDoneSnackbar => 'All local data has been deleted';
  @override
  String get privacyCenterViewPolicy => 'View Full Privacy Policy';
  @override
  String homeRamadanBannerTitle(Object day) => 'Hari {day} Ramadan'.replaceAll('{day}', day.toString());
  @override
  String get homeRamadanBannerSubtitle => 'Ketuk untuk kompanion Ramadan Anda';
  @override
  String get ramadanLast10NightsTitle => '10 Malam Terakhir';
  @override
  String get ramadanLast10NightsBody => 'These final nights of Ramadan are the most blessed -- increase your worship, Quran, and dua.';
  @override
  String get ramadanPossibleLaylatAlQadr => 'Tonight may be Laylat al-Qadr';
  @override
  String get commonEditTooltip => 'Edit';
  @override
  String get commonDeleteTooltip => 'Hapus';
  @override
  String get commonSettingsTooltip => 'Pengaturan';
  @override
  String get commonDecreaseTooltip => 'Decrease';
  @override
  String get commonIncreaseTooltip => 'Increase';
  @override
  String get commonShareTooltip => 'Bagikan';
  @override
  String get commonRefreshTooltip => 'Perbarui';
  @override
  String get homeNextPrayerCardLabel => 'Next prayer time';
  @override
  String get homeWeeklyInsightsCardLabel => 'Weekly insights';
  @override
  String get settingsTajweedColoring => 'Pewarnaan Tajweed';
  @override
  String get settingsTajweedColoringSubtitle => 'Warnai teks Quran berdasarkan aturan Tajweed';
  @override
  String get settingsBackupRestore => 'Cadangan & Pemulihan';
  @override
  String get settingsExportBackup => 'Ekspor cadangan';
  @override
  String get settingsExportBackupSubtitle => 'Save your progress and settings to a file';
  @override
  String get settingsImportBackup => 'Impor cadangan';
  @override
  String get settingsImportBackupSubtitle => 'Restore data from a previously saved file';
  @override
  String get settingsImportSuccess => 'Cadangan berhasil diimpor! Silakan restart app.';
  @override
  String get settingsImportError => 'Gagal mengimpor.';
  @override
  String get tajweedLegendTitle => 'Aturan Tajweed';
  @override
  String get tajweedLegendIntro => 'Color coding for Quranic recitation rules:';
  @override
  String get tajweedQalqalahLabel => 'Qalqalah (Echoing)';
  @override
  String get tajweedGhunnahLabel => 'Ghunnah (Nasalization)';
  @override
  String get tajweedIkhfaLabel => 'Ikhfa (Hiding)';
  @override
  String get tajweedIdghamGhunnahLabel => 'Idgham with Ghunnah';
  @override
  String get tajweedIdghamNoGhunnahLabel => 'Idgham without Ghunnah';
  @override
  String get tajweedIqlabLabel => 'Iqlab (Conversion)';
  @override
  String get tajweedLegendClose => 'Tutup';
  @override
  String get radioTitle => 'Radio Islam';
  @override
  String get radioSubtitle => 'Dengarkan Al-Quran & ceramah secara langsung';
  @override
  String get radioAll => 'Semua';
  @override
  String get radioNowPlaying => 'Sedang diputar';
  @override
  String get radioFavorites => 'Favorit';
  @override
  String get radioNoFavorites => 'Belum ada stasiun favorit';
  @override
  String get radioNoStations => 'Tidak ada stasiun di kategori ini';
  @override
  String get radioAddFavorite => 'Tambahkan ke favorit';
  @override
  String get radioRemoveFavorite => 'Hapus dari favorit';
  @override
  String get radioSleepTimer => 'Timer tidur';
  @override
  String get radioSleepTimerSubtitle => 'Secara otomatis menghentikan radio setelah waktu yang ditentukan';
  @override
  String get radioSleepTimerCancel => 'Batalkan timer';
  @override
  String get radioMinutes => 'mnt';
  @override
  String radioSleepTimerActive(Object minutes) => 'Berhenti dalam {minutes} mnt'.replaceAll('{minutes}', minutes.toString());
  @override
  String get radioOfficial => 'Resmi';
  @override
  String get radioStreamError => 'Tidak dapat terhubung ke stasiun. Periksa koneksi Anda.';
}
