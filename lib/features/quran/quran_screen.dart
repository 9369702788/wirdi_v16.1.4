import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/data/bismillah.dart';
import '../../core/data/juz_data.dart';
import '../../core/data/reciters.dart';
import '../../core/data/app_sources.dart';
import '../../core/models/quran_models.dart';
import '../../core/services/app_logger.dart';
import '../../core/services/arabic_text_utils.dart';
import '../../core/services/audio_download_service.dart';
import '../../core/services/mushaf_repository.dart';
import '../../core/services/quran_audio_service.dart';
import '../../core/services/quran_repository.dart';
import '../../core/services/quran_translation_repository.dart';
import '../../core/services/settings_service.dart';
import '../../core/services/tafsir_repository.dart';
import '../../core/services/transliteration_repository.dart';
import '../../core/services/user_progress_service.dart';
import '../../core/theme/app_theme.dart';
import '../../l10n/generated/app_localizations.dart';
import '../mushaf/mushaf_view_screen.dart';
import '../../core/services/bookmark_service.dart';
import 'ayah_share_screen.dart';

class QuranScreen extends StatefulWidget {
  /// If set, the screen opens directly into the reader for this surah,
  /// scrolled to [initialAyah] — used by "continue reading".
  final int? initialSurahNumber;
  final int? initialAyah;

  const QuranScreen({super.key, this.initialSurahNumber, this.initialAyah});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> with SingleTickerProviderStateMixin {
  late Future<List<SurahModel>> _future;
  late TabController _tabController;
  final TextEditingController _surahSearchController = TextEditingController();
  final TextEditingController _ayahSearchController = TextEditingController();
  bool _openedDeepLink = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _future = QuranRepository.load();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _surahSearchController.dispose();
    _ayahSearchController.dispose();
    super.dispose();
  }

  void _maybeOpenDeepLink(List<SurahModel> surahs) {
    if (_openedDeepLink || widget.initialSurahNumber == null) return;
    _openedDeepLink = true;

    final surah = surahs.firstWhere(
      (s) => s.number == widget.initialSurahNumber,
      orElse: () => surahs.first,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => SurahReaderScreen(
            surah: surah,
            allSurahs: surahs,
            scrollToAyah: widget.initialAyah,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.quranTitle),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: l10n.quranViewMushaf,
            icon: const Icon(Icons.import_contacts_outlined),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MushafViewScreen()),
            ),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: [
            Tab(text: l10n.quranTabSurahs),
            Tab(text: l10n.quranTabJuz),
            Tab(text: l10n.quranTabSearch),
            Tab(text: l10n.quranTabFavorites),
          ],
        ),
      ),
      body: FutureBuilder<List<SurahModel>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || snapshot.data == null) {
            return _ErrorView(
              message: l10n.quranLoadError,
              retryLabel: l10n.quranRetry,
              onRetry: () => setState(() => _future = QuranRepository.load(forceRefresh: true)),
            );
          }

          final allSurahs = snapshot.data!;
          _maybeOpenDeepLink(allSurahs);

          return TabBarView(
            controller: _tabController,
            children: [
              _SurahListTab(allSurahs: allSurahs, controller: _surahSearchController),
              _JuzListTab(allSurahs: allSurahs),
              _AyahSearchTab(allSurahs: allSurahs, controller: _ayahSearchController),
              _FavoritesTab(allSurahs: allSurahs),
            ],
          );
        },
      ),
    );
  }
}

class _SurahListTab extends StatefulWidget {
  final List<SurahModel> allSurahs;
  final TextEditingController controller;
  const _SurahListTab({required this.allSurahs, required this.controller});

  @override
  State<_SurahListTab> createState() => _SurahListTabState();
}

class _SurahListTabState extends State<_SurahListTab> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final query = widget.controller.text.trim();
    final filtered = widget.allSurahs.where((surah) {
      if (query.isEmpty) return true;
      return ArabicTextUtils.contains(surah.name, query) ||
          surah.number.toString() == query ||
          surah.englishName.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Row(
            children: [
              Expanded(
                child: Text(l10n.quranViewMode, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
              ),
              OutlinedButton.icon(
                onPressed: () async {
                  try {
                    await MushafRepository.load();
                    if (!context.mounted) return;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const MushafViewScreen(initialPage: 1)),
                    );
                  } catch (_) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(l10n.quranMushafPagesLoadError)),
                      );
                    }
                  }
                },
                icon: const Icon(Icons.import_contacts_outlined, size: 18),
                label: Text(l10n.quranViewAsMushafPages),
              ),
            ],
          ),
        ),
        FutureBuilder<double>(
          future: UserProgressService.quranCompletionRatio(),
          builder: (context, snapshot) {
            final ratio = snapshot.data ?? 0.0;
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Semantics(
                label: l10n.quranCompletionPercent((ratio * 100).round()),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(l10n.quranKhatmaProgress, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                            const SizedBox(height: 6),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: LinearProgressIndicator(
                                value: ratio,
                                minHeight: 6,
                                backgroundColor: AppColors.primaryEmerald.withValues(alpha: 0.1),
                                valueColor: const AlwaysStoppedAnimation(AppColors.primaryEmerald),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text('${(ratio * 100).round()}%', style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.primaryEmerald)),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: l10n.quranSearchSurahHint,
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Theme.of(context).cardColor,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none),
            ),
            onChanged: (_) => setState(() {}),
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
            itemCount: filtered.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final surah = filtered[index];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppColors.primaryEmerald.withValues(alpha: 0.12),
                    child: Text('${surah.number}', style: const TextStyle(color: Color(0xFF0F766E), fontWeight: FontWeight.bold)),
                  ),
                  title: Text(surah.name, textAlign: TextAlign.right, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                  subtitle: Text(l10n.quranSurahSubtitle(surah.englishName, surah.ayahs.length), textAlign: TextAlign.right),
                  trailing: const Icon(Icons.menu_book),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SurahReaderScreen(surah: surah, allSurahs: widget.allSurahs)),
                  ),
                ),

              );
            },
          ),
        ),
      ],
    );
  }
}

class _JuzListTab extends StatelessWidget {
  final List<SurahModel> allSurahs;
  const _JuzListTab({required this.allSurahs});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: JuzData.all.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final juz = JuzData.all[index];
        final surah = allSurahs.firstWhere(
          (s) => s.number == juz.surahNumber,
          orElse: () => allSurahs.first,
        );

        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.goldAccent.withValues(alpha: 0.15),
              child: Text('${juz.juzNumber}', style: const TextStyle(color: AppColors.goldAccent, fontWeight: FontWeight.bold)),
            ),
            title: Text(l10n.quranJuzNumber(juz.juzNumber), style: const TextStyle(fontWeight: FontWeight.w700)),
            subtitle: Text(l10n.quranJuzStartsFrom(surah.name, juz.ayahNumber)),
            trailing: const Icon(Icons.chevron_left),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SurahReaderScreen(surah: surah, allSurahs: allSurahs, scrollToAyah: juz.ayahNumber),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _AyahSearchTab extends StatefulWidget {
  final List<SurahModel> allSurahs;
  final TextEditingController controller;
  const _AyahSearchTab({required this.allSurahs, required this.controller});

  @override
  State<_AyahSearchTab> createState() => _AyahSearchTabState();
}

class _AyahSearchTabState extends State<_AyahSearchTab> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final query = widget.controller.text.trim();

    final results = <(SurahModel, AyahModel)>[];
    if (query.length >= 2) {
      for (final surah in widget.allSurahs) {
        for (final ayah in surah.ayahs) {
          if (ArabicTextUtils.contains(ayah.text, query)) {
            results.add((surah, ayah));
            if (results.length >= 100) break;
          }
        }
        if (results.length >= 100) break;
      }
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: l10n.quranSearchAyahHint,
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Theme.of(context).cardColor,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none),
            ),
            onChanged: (_) => setState(() {}),
          ),
        ),
        if (query.isNotEmpty && query.length < 2)
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(l10n.quranSearchMinChars, style: const TextStyle(color: AppColors.mutedText)),
          ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
            itemCount: results.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final (surah, ayah) = results[index];
              return Card(
                child: ListTile(
                  title: Text(
                    ayah.text,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontFamily: 'AmiriQuran', fontSize: 17),
                  ),
                  subtitle: Text(l10n.quranAyahLocation(surah.name, ayah.number), textAlign: TextAlign.right),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SurahReaderScreen(surah: surah, allSurahs: widget.allSurahs, scrollToAyah: ayah.number),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _FavoritesTab extends StatelessWidget {
  final List<SurahModel> allSurahs;
  const _FavoritesTab({required this.allSurahs});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return FutureBuilder<Set<String>>(
      future: UserProgressService.favoriteAyahs(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

        final favUids = snapshot.data!;
        final results = <(SurahModel, AyahModel)>[];

        for (final surah in allSurahs) {
          for (final ayah in surah.ayahs) {
            if (favUids.contains('${surah.number}_${ayah.number}')) {
              results.add((surah, ayah));
            }
          }
        }

        if (results.isEmpty) {
          return Center(child: Text(l10n.quranNoFavoriteAyahsYet));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: results.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final (surah, ayah) = results[index];
            return Card(
              child: ListTile(
                title: Text(ayah.text, textDirection: TextDirection.rtl, textAlign: TextAlign.right, maxLines: 3, overflow: TextOverflow.ellipsis, style: const TextStyle(fontFamily: 'AmiriQuran', fontSize: 17)),
                subtitle: Text(l10n.quranAyahLocation(surah.name, ayah.number), textAlign: TextAlign.right),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SurahReaderScreen(surah: surah, allSurahs: allSurahs, scrollToAyah: ayah.number),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class SurahReaderScreen extends StatefulWidget {
  final SurahModel surah;
  final List<SurahModel> allSurahs;
  final int? scrollToAyah;

  const SurahReaderScreen({super.key, required this.surah, required this.allSurahs, this.scrollToAyah});

  @override
  State<SurahReaderScreen> createState() => _SurahReaderScreenState();
}

class _SurahReaderScreenState extends State<SurahReaderScreen> {
  Set<String> _favoriteAyahs = {};
  final Map<int, GlobalKey> _ayahKeys = {};
  final ScrollController _scrollController = ScrollController();

  double _fontScale = 1.0;
  Map<String, String>? _tafsirData;
  final Set<int> _expandedTafsirAyahs = {};
  bool _loadingTafsir = false;
  Map<String, String>? _transliterationData;
  bool _loadingTransliteration = false;

  // Verse-by-verse meaning translation (QuranEnc.com), in the app's
  // active UI language. Unlike transliteration (an optional pronunciation
  // aid, gated behind a settings toggle), the translation is shown
  // automatically whenever the UI language isn't Arabic — someone
  // reading the app in German or Turkish needs the meaning, not just a
  // toggle they might not know to flip.
  Map<int, String>? _translationData;
  bool _loadingTranslation = false;
  String? _translationLoadError;

  int? _lastKnownPlayingAyah;

  // Playback lives in the app-wide QuranAudioService (not owned by this
  // screen) so it survives navigation between screens. These getters
  // only report "playing" state when it's actually *this* surah playing
  // — audio for a different surah shouldn't appear active here.
  int? get _playingAyah => quranAudio.isSurahActive(widget.surah.number) ? quranAudio.playingAyah : null;
  bool get _playingWholeSurah => quranAudio.isSurahActive(widget.surah.number) && quranAudio.playingWholeSurah;
  bool get _repeatCurrent => quranAudio.repeatCurrent;
  bool get _isBuffering => quranAudio.isBuffering;

  // _surahAyahOffset removed // sum of ayah counts of all surahs before this one

  bool _translationKickedOff = false;

  String _uid(int ayahNumber) => '${widget.surah.number}_$ayahNumber';

  @override
  void initState() {
    super.initState();

    // _surahAyahOffset removed (dead code from a previous refactor)

    for (final ayah in widget.surah.ayahs) {
      _ayahKeys[ayah.number] = GlobalKey();
    }

    _loadFavorites();
    quranAudio.addListener(_onAudioChanged);

    if (appSettings.showTransliteration) {
      _loadTransliteration();
    }

    if (widget.scrollToAyah != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToAyah(widget.scrollToAyah!));
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Localizations.localeOf(context) depends on an InheritedWidget, which
    // isn't available yet during initState — it's only safe to read here
    // (called right after initState, and again if the locale changes).
    // Guarded to fire the initial load only once; a live locale switch
    // while this screen is already open is an edge case we don't handle,
    // same as the pre-existing transliteration load.
    if (!_translationKickedOff) {
      _translationKickedOff = true;
      final languageCode = Localizations.localeOf(context).languageCode;
      final translationKey = AppSources.quranEncTranslationKeyFor(languageCode);
      if (translationKey != null) {
        _loadTranslation(translationKey);
      }
    }
  }

  Future<void> _loadTranslation(String translationKey) async {
    setState(() {
      _loadingTranslation = true;
      _translationLoadError = null;
    });
    try {
      final data = await QuranTranslationRepository.loadSurah(
        translationKey: translationKey,
        surahNumber: widget.surah.number,
      );
      if (mounted) setState(() => _translationData = data);
    } catch (e, st) {
      AppLogger.error('Failed to load Quran translation', error: e, stackTrace: st);
      if (mounted) setState(() => _translationLoadError = translationKey);
    } finally {
      if (mounted) setState(() => _loadingTranslation = false);
    }
  }

  Future<void> _loadTransliteration() async {
    setState(() => _loadingTransliteration = true);
    try {
      final data = await TransliterationRepository.load();
      if (mounted) setState(() => _transliterationData = data);
    } catch (e, st) {
      AppLogger.error('Failed to load transliteration', error: e, stackTrace: st);
    } finally {
      if (mounted) setState(() => _loadingTransliteration = false);
    }
  }

  void _onAudioChanged() {
    if (!mounted) return;
    setState(() {});

    // Keep the currently-reciting ayah roughly in view as sequential
    // "play whole surah" playback advances (this used to be triggered
    // directly by the screen's own playback code; now it reacts to the
    // shared service's state instead).
    final playing = _playingAyah;
    if (_playingWholeSurah && playing != null && playing != _lastKnownPlayingAyah) {
      _lastKnownPlayingAyah = playing;
      _scrollToAyah(playing);
    } else if (playing == null) {
      _lastKnownPlayingAyah = null;
    }
  }

  @override
  void dispose() {
    quranAudio.removeListener(_onAudioChanged);
    _scrollController.dispose();
    super.dispose();
  }

  String? _translationKeyForLocale(BuildContext context) =>
      AppSources.quranEncTranslationKeyFor(Localizations.localeOf(context).languageCode);

  Widget _buildTranslationBlock(BuildContext context, int ayahNumber) {
    final l10n = AppLocalizations.of(context);

    if (_loadingTranslation && _translationData == null) {
      return const Padding(
        padding: EdgeInsets.only(top: 2),
        child: SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)),
      );
    }

    if (_translationLoadError != null && _translationData == null) {
      return Row(
        children: [
          Expanded(
            child: Text(
              l10n.quranTranslationLoadFailed,
              style: const TextStyle(fontSize: 13, color: AppColors.mutedText),
            ),
          ),
          TextButton(
            onPressed: () => _loadTranslation(_translationLoadError!),
            child: Text(l10n.quranTranslationRetry, style: const TextStyle(fontSize: 13)),
          ),
        ],
      );
    }

    final text = QuranTranslationRepository.translationFor(_translationData, ayahNumber);
    return Text(
      text ?? l10n.quranTranslationUnavailable,
      textAlign: TextAlign.start,
      style: const TextStyle(fontSize: 15, height: 1.5),
    );
  }

  Future<void> _loadFavorites() async {
    final favs = await UserProgressService.favoriteAyahs();
    if (mounted) setState(() => _favoriteAyahs = favs);
  }

  Future<void> _toggleFavorite(int ayahNumber) async {
    await UserProgressService.toggleFavoriteAyah(_uid(ayahNumber));
    final favs = await UserProgressService.favoriteAyahs();
    if (mounted) setState(() => _favoriteAyahs = favs);
  }

  /// [Scrollable.ensureVisible] silently does nothing if the target
  /// ayah's GlobalKey hasn't been built yet — and with a lazy
  /// [ListView.builder], any ayah outside the initially-visible range
  /// (e.g. jumping to ayah 200 of a 286-ayah surah from search) has no
  /// built context yet.
  ///
  /// A single estimated jump (assuming an average card height) isn't
  /// reliable — ayah cards vary a lot in height, so a rough guess can
  /// land far outside the built+cache range for a long surah, and no
  /// amount of waiting fixes that without scrolling further. Instead,
  /// this binary-searches the actual *scroll offset* (0..maxScrollExtent)
  /// using a real signal: after jumping to a candidate offset, check
  /// which ayahs actually got built nearby. If everything built there
  /// has a lower ayah number than the target, the target is further
  /// down (search the upper half); if everything built has a higher
  /// number, it's further up (search the lower half). This doesn't
  /// depend on guessing item height at all.
  Future<void> _scrollToAyah(int ayahNumber) async {
    if (_tryEnsureVisible(ayahNumber)) return;
    if (!_scrollController.hasClients) return;

    var low = 0.0;
    var high = _scrollController.position.maxScrollExtent;

    for (var attempt = 0; attempt < 18; attempt++) {
      if (!mounted) return;
      final mid = (low + high) / 2;
      _scrollController.jumpTo(mid);
      await Future.delayed(const Duration(milliseconds: 55));
      if (!mounted) return;

      if (_tryEnsureVisible(ayahNumber)) return;

      final builtNearby = _ayahKeys.entries
          .where((e) => e.value.currentContext != null)
          .map((e) => e.key)
          .toList();

      if (builtNearby.isEmpty) {
        // Nothing built yet at all (shouldn't normally happen this
        // early) — narrow slightly and try again.
        high = mid;
        continue;
      }

      final anyBelowTarget = builtNearby.any((n) => n < ayahNumber);
      final anyAboveTarget = builtNearby.any((n) => n > ayahNumber);

      if (anyBelowTarget && !anyAboveTarget) {
        low = mid; // target is further down the list
      } else if (anyAboveTarget && !anyBelowTarget) {
        high = mid; // target is further up the list
      } else {
        // Mixed (target's neighborhood is likely already built) or a
        // razor-thin remaining range — one more direct check and stop
        // narrowing further either way.
        if (_tryEnsureVisible(ayahNumber)) return;
        if ((high - low).abs() < 2) return;
      }
    }
  }

  bool _tryEnsureVisible(int ayahNumber) {
    final key = _ayahKeys[ayahNumber];
    final ctx = key?.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(ctx, duration: const Duration(milliseconds: 300), alignment: 0.1);
      return true;
    }
    return false;
  }

  Future<void> _openMushafView() async {
    try {
      await MushafRepository.load();
      final startPage = MushafRepository.firstPageForSurah(await MushafRepository.load(), widget.surah.number) ?? 1;
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => MushafViewScreen(initialPage: startPage)),
      );
    } catch (e, st) {
      AppLogger.error('Failed to open mushaf view', error: e, stackTrace: st);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context).quranMushafPagesLoadError)),
        );
      }
    }
  }

  Future<void> _pickReciter() async {
    final l10n = AppLocalizations.of(context);
    final languageCode = Localizations.localeOf(context).languageCode;
    final chosen = await showModalBottomSheet<String>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(l10n.quranChooseReciter, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
            ),
            for (final reciter in Reciters.all)
              ListTile(
                title: Text(reciter.displayNameFor(languageCode)),
                trailing: reciter.id == appSettings.reciterId
                    ? const Icon(Icons.check, color: AppColors.primaryEmerald)
                    : null,
                onTap: () => Navigator.pop(context, reciter.id),
              ),
          ],
        ),
      ),
    );

    if (chosen != null && chosen != appSettings.reciterId) {
      await quranAudio.stop();
      await appSettings.setReciterId(chosen);
      if (mounted) setState(() {});
    }
  }

  Future<void> _toggleTafsir(int ayahNumber) async {
    if (_expandedTafsirAyahs.contains(ayahNumber)) {
      setState(() => _expandedTafsirAyahs.remove(ayahNumber));
      return;
    }

    if (_tafsirData == null) {
      setState(() => _loadingTafsir = true);
      try {
        _tafsirData = await TafsirRepository.load();
      } catch (e, st) {
        AppLogger.error('Failed to load tafsir', error: e, stackTrace: st);
        if (mounted) {
          final l10n = AppLocalizations.of(context);
          final isTimeout = e is TimeoutException;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(isTimeout ? l10n.quranTafsirTimeoutError : l10n.quranTafsirLoadError),
              action: SnackBarAction(label: l10n.quranRetry, onPressed: () => _toggleTafsir(ayahNumber)),
              duration: const Duration(seconds: 5),
            ),
          );
        }
        setState(() => _loadingTafsir = false);
        return;
      }
      setState(() => _loadingTafsir = false);
    }

    setState(() => _expandedTafsirAyahs.add(ayahNumber));
  }

  Future<void> _bookmark(int ayahNumber) async {
    await UserProgressService.saveLastReading(
      surahNumber: widget.surah.number,
      surahName: widget.surah.name,
      ayahNumber: ayahNumber,
    );
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context).quranLastReadingSaved(widget.surah.name, ayahNumber))),
    );
  }

  void _copyAyah(AyahModel ayah) {
    final l10n = AppLocalizations.of(context);
    Clipboard.setData(ClipboardData(text: l10n.quranAyahCopyFormat(ayah.text, widget.surah.name, ayah.number)));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.quranAyahCopiedSnackbar)));
  }

  Future<void> _addAdvancedBookmark(AyahModel ayah) async {
    final l10n = AppLocalizations.of(context);
    final noteController = TextEditingController();
    String selectedCategory = 'personal';

    final saved = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (dialogContext, setDialogState) => AlertDialog(
          title: Text(l10n.bookmarkDialogTitle),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: noteController,
                  maxLines: 3,
                  decoration: InputDecoration(labelText: l10n.bookmarkNoteLabel),
                ),
                const SizedBox(height: 12),
                Text(l10n.bookmarkCategoryLabel, style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: BookmarkService.categories.map((category) {
                    final labels = {
                      'ramadan': l10n.bookmarkCategoryRamadan,
                      'dua': l10n.bookmarkCategoryDua,
                      'family': l10n.bookmarkCategoryFamily,
                      'study': l10n.bookmarkCategoryStudy,
                      'personal': l10n.bookmarkCategoryPersonal,
                      'other': l10n.bookmarkCategoryOther,
                    };
                    return ChoiceChip(
                      label: Text(labels[category] ?? category),
                      selected: selectedCategory == category,
                      onSelected: (_) => setDialogState(() => selectedCategory = category),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(dialogContext, false), child: Text(l10n.commonCancel)),
            TextButton(onPressed: () => Navigator.pop(dialogContext, true), child: Text(l10n.commonSave)),
          ],
        ),
      ),
    );

    if (saved != true) return;
    await BookmarkService.addBookmark(
      surahNumber: widget.surah.number,
      surahName: widget.surah.name,
      ayahNumber: ayah.number,
      ayahText: ayah.text,
      note: noteController.text.trim(),
      category: selectedCategory,
    );
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.bookmarkSavedSnackbar)));
  }

  void _shareAyahAsImage(AyahModel ayah) {
    final translation = QuranTranslationRepository.translationFor(_translationData, ayah.number);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AyahShareScreen(
          arabicText: ayah.text,
          translationText: translation,
          surahNameArabic: widget.surah.name,
          surahNameLocalized: widget.surah.englishName,
          surahNumber: widget.surah.number,
          ayahNumber: ayah.number,
        ),
      ),
    );
  }

  Future<void> _markSurahReadToday() async {
    await UserProgressService.markPageRead();
    await UserProgressService.registerStreakCheckpoint();
    await UserProgressService.markSurahCompleted(widget.surah.number);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context).quranAddedToWird)));
  }

  Future<void> _playAyah(int ayahNumber, {bool keepRepeat = false}) async {
    await quranAudio.playAyah(widget.surah, widget.allSurahs, ayahNumber, keepRepeat: keepRepeat);
  }

  /// "Play whole surah" — rather than depending on a separate
  /// full-chapter CDN endpoint (which isn't guaranteed to exist for
  /// every reciter/bitrate combination, unlike per-ayah audio, and
  /// wasn't playing reliably), this auto-advances through each ayah
  /// using the same per-ayah playback that's confirmed to work. The
  /// currently-reciting ayah is highlighted as a bonus. Lives in
  /// [QuranAudioService] now so it keeps playing across navigation.
  Future<void> _playWholeSurah() async {
    await quranAudio.playWholeSurah(widget.surah, widget.allSurahs);
  }

  Future<void> _stopAudio() async {
    await quranAudio.stop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final languageCode = Localizations.localeOf(context).languageCode;
    final surah = widget.surah;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.quranSurahAppBarTitle(surah.name)),
        centerTitle: true,
        actions: [
          _DownloadButton(surah: surah, allSurahs: widget.allSurahs),
          IconButton(
            tooltip: l10n.quranViewAsMushafPageTooltip,
            onPressed: _openMushafView,
            icon: const Icon(Icons.import_contacts_outlined),
          ),
          IconButton(
            tooltip: l10n.quranChooseReciterTooltip(Reciters.byId(appSettings.reciterId).displayNameFor(languageCode)),
            onPressed: _pickReciter,
            icon: const Icon(Icons.record_voice_over_outlined),
          ),
          IconButton(
            tooltip: l10n.quranDecreaseFontTooltip,
            onPressed: () => setState(() => _fontScale = (_fontScale - 0.1).clamp(0.7, 1.6)),
            icon: const Icon(Icons.text_decrease),
          ),
          IconButton(
            tooltip: l10n.quranIncreaseFontTooltip,
            onPressed: () => setState(() => _fontScale = (_fontScale + 0.1).clamp(0.7, 1.6)),
            icon: const Icon(Icons.text_increase),
          ),
          IconButton(
            tooltip: l10n.quranAddToWirdTooltip,
            onPressed: _markSurahReadToday,
            icon: const Icon(Icons.playlist_add_check),
          ),
        ],
      ),
      body: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
        itemCount: surah.ayahs.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [AppColors.primaryEmerald, Color(0xFF115E56)]),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    Text(l10n.quranSurahAppBarTitle(surah.name), style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(l10n.quranAyahCountLabel(surah.ayahs.length), style: const TextStyle(color: AppColors.goldAccent, fontSize: 18)),
                    if (Bismillah.shouldShowFor(surah.number)) ...[
                      const SizedBox(height: 14),
                      Text(
                        Bismillah.text,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(fontFamily: 'AmiriQuran', color: Colors.white, fontSize: 24, fontWeight: FontWeight.normal),
                      ),
                    ],
                    const SizedBox(height: 14),
                    Semantics(
                      button: true,
                      label: _playingWholeSurah ? l10n.quranStopSurahRecitationLabel : l10n.quranPlaySurahRecitationLabel,
                      child: ElevatedButton.icon(
                        onPressed: _playingWholeSurah ? _stopAudio : _playWholeSurah,
                        icon: Icon(_playingWholeSurah ? Icons.stop : Icons.play_arrow),
                        label: Text(_playingWholeSurah ? l10n.quranStopLabel : l10n.quranPlayWholeSurahLabel),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: AppColors.primaryEmerald),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          final ayah = surah.ayahs[index - 1];
          final isFavorite = _favoriteAyahs.contains(_uid(ayah.number));
          final isPlayingThis = _playingAyah == ayah.number;
          final isTafsirExpanded = _expandedTafsirAyahs.contains(ayah.number);
          final tafsirText = _tafsirData != null
              ? TafsirRepository.tafsirFor(_tafsirData!, surah.number, ayah.number)
              : null;

          return Card(
            key: _ayahKeys[ayah.number],
            margin: const EdgeInsets.only(bottom: 12),
            color: isPlayingThis ? AppColors.primaryEmerald.withValues(alpha: 0.06) : null,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '${ayah.text}  ﴿${ayah.number}﴾',
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontFamily: 'AmiriQuran', fontSize: 24 * _fontScale, height: 2.2, fontWeight: FontWeight.normal),
                  ),
                  if (appSettings.showTransliteration) ...[
                    const SizedBox(height: 6),
                    if (_loadingTransliteration)
                      const Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2)),
                      )
                    else if (_transliterationData != null)
                      Text(
                        TransliterationRepository.transliterationFor(_transliterationData!, surah.number, ayah.number) ?? '',
                        textAlign: TextAlign.left,
                        style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: AppColors.mutedText),
                      ),
                  ],
                  if (_translationKeyForLocale(context) != null) ...[
                    const SizedBox(height: 8),
                    _buildTranslationBlock(context, ayah.number),
                  ],
                  if (isTafsirExpanded) ...[
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.goldAccent.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        tafsirText ?? l10n.quranNoTafsirAvailable,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                        style: const TextStyle(fontSize: 14, height: 1.7, color: AppColors.mutedText),
                      ),
                    ),
                  ],
                  const SizedBox(height: 8),
                  Wrap(
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Semantics(
                        button: true,
                        label: isPlayingThis ? l10n.quranStopPlayingAyahLabel : l10n.quranPlayAyahLabel(ayah.number),
                        child: IconButton(
                          tooltip: isPlayingThis ? l10n.quranStopLabel : l10n.quranPlayAyahTooltip,
                          onPressed: () => isPlayingThis ? _stopAudio() : _playAyah(ayah.number),
                          icon: isPlayingThis && _isBuffering
                              ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                              : Icon(isPlayingThis ? Icons.stop_circle_outlined : Icons.play_circle_outline,
                                  color: AppColors.primaryEmerald),
                        ),
                      ),
                      IconButton(
                        tooltip: l10n.quranRepeatAyahTooltip,
                        onPressed: isPlayingThis ? () => quranAudio.toggleRepeat() : null,
                        icon: Icon(
                          Icons.repeat,
                          color: isPlayingThis && _repeatCurrent ? AppColors.goldAccent : AppColors.mutedText,
                        ),
                      ),
                      IconButton(
                        tooltip: isTafsirExpanded ? l10n.quranHideTafsirTooltip : l10n.quranShowTafsirTooltip,
                        onPressed: (_loadingTafsir && !isTafsirExpanded) ? null : () => _toggleTafsir(ayah.number),
                        icon: (_loadingTafsir && !isTafsirExpanded)
                            ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                            : Icon(Icons.menu_book_outlined, color: isTafsirExpanded ? AppColors.goldAccent : AppColors.mutedText),
                      ),
                      IconButton(
                        tooltip: l10n.quranSaveAsLastReadingTooltip,
                        onPressed: () => _bookmark(ayah.number),
                        icon: const Icon(Icons.bookmark_border, color: AppColors.mutedText),
                      ),
                      IconButton(
                        tooltip: l10n.bookmarkAddTooltip,
                        onPressed: () => _addAdvancedBookmark(ayah),
                        icon: const Icon(Icons.bookmark_add_outlined, color: AppColors.mutedText),
                      ),
                      IconButton(
                        tooltip: l10n.quranCopyAyahTooltip,
                        onPressed: () => _copyAyah(ayah),
                        icon: const Icon(Icons.copy_outlined, color: AppColors.mutedText),
                      ),
                      IconButton(
                        tooltip: l10n.quranShareAsImageTooltip,
                        onPressed: () => _shareAyahAsImage(ayah),
                        icon: const Icon(Icons.image_outlined, color: AppColors.mutedText),
                      ),
                      Semantics(
                        button: true,
                        label: isFavorite ? l10n.quranRemoveFromFavoritesLabel : l10n.quranAddToFavoritesLabel,
                        child: IconButton(
                          tooltip: l10n.quranAddToFavoritesLabel,
                          onPressed: () => _toggleFavorite(ayah.number),
                          icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border,
                              color: isFavorite ? AppColors.goldAccent : AppColors.mutedText),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;
  final String retryLabel;
  final VoidCallback onRetry;
  const _ErrorView({required this.message, required this.retryLabel, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.wifi_off_rounded, size: 48, color: AppColors.mutedText),
            const SizedBox(height: 12),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: onRetry, child: Text(retryLabel)),
          ],
        ),
      ),
    );
  }
}

class _DownloadButton extends StatefulWidget {
  final SurahModel surah;
  final List<SurahModel> allSurahs;
  const _DownloadButton({required this.surah, required this.allSurahs});

  @override
  State<_DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<_DownloadButton> {
  bool _downloaded = false;
  bool _downloading = false;
  bool _cancelRequested = false;
  int _done = 0;
  int _total = 0;

  @override
  void initState() {
    super.initState();
    _checkStatus();
  }

  Future<void> _checkStatus() async {
    final count = await AudioDownloadService.downloadedAyahCount(
      appSettings.reciterId,
      widget.surah,
      widget.allSurahs,
    );
    if (mounted) {
      setState(() {
        _downloaded = count == widget.surah.ayahs.length;
        _total = widget.surah.ayahs.length;
      });
    }
  }

  Future<void> _startDownload() async {
    setState(() {
      _downloading = true;
      _cancelRequested = false;
      _done = 0;
    });

    await AudioDownloadService.downloadSurah(
      reciterId: appSettings.reciterId,
      surah: widget.surah,
      allSurahs: widget.allSurahs,
      onProgress: (done, total) {
        if (mounted) setState(() => _done = done);
      },
      isCancelled: () => _cancelRequested,
    );

    if (mounted) {
      setState(() => _downloading = false);
      _checkStatus();
      if (!_cancelRequested && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context).quranDownloadedForOfflineSnackbar)),
        );
      }
    }
  }

  Future<void> _deleteDownload() async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.quranDeleteDownloadTitle),
        content: Text(l10n.quranDeleteDownloadBody),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text(l10n.commonCancel)),
          TextButton(onPressed: () => Navigator.pop(context, true), child: Text(l10n.commonDelete)),
        ],
      ),
    );
    if (confirmed != true) return;

    await AudioDownloadService.deleteSurahDownload(appSettings.reciterId, widget.surah, widget.allSurahs);
    _checkStatus();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (_downloading) {
      return IconButton(
        tooltip: l10n.quranStopDownloadTooltip(_done, _total),
        onPressed: () => setState(() => _cancelRequested = true),
        icon: SizedBox(
          width: 24,
          height: 24,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: 2,
                value: _total == 0 ? null : _done / _total,
              ),
              const Icon(Icons.close, size: 12),
            ],
          ),
        ),
      );
    }

    return IconButton(
      tooltip: _downloaded ? l10n.quranDeleteDownloadedTooltip : l10n.quranDownloadForOfflineTooltip,
      onPressed: _downloaded ? _deleteDownload : _startDownload,
      icon: Icon(
        _downloaded ? Icons.download_done : Icons.download_outlined,
        color: _downloaded ? AppColors.primaryEmerald : null,
      ),
    );
  }
}
