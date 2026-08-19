import '../../core/services/tajweed_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../core/data/bismillah.dart';
import '../../core/models/mushaf_models.dart';
import '../../core/models/quran_models.dart';
import '../../core/services/mushaf_repository.dart';
import '../../core/services/quran_audio_service.dart';
import '../../core/services/quran_repository.dart';
import '../../core/services/settings_service.dart';
import '../../core/services/user_progress_service.dart';
import '../../core/theme/app_theme.dart';
import '../../l10n/generated/app_localizations.dart';

class MushafViewScreen extends StatefulWidget {
  final int? initialPage;
  const MushafViewScreen({super.key, this.initialPage});

  @override
  State<MushafViewScreen> createState() => _MushafViewScreenState();
}

class _MushafViewScreenState extends State<MushafViewScreen> {
  late Future<(List<MushafPage>, List<SurahModel>)> _future;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _future = _loadAll();
    _pageController = PageController(initialPage: (widget.initialPage ?? 1) - 1);
  }

  Future<(List<MushafPage>, List<SurahModel>)> _loadAll() async {
    final results = await Future.wait([MushafRepository.load(), QuranRepository.load()]);
    return (results[0] as List<MushafPage>, results[1] as List<SurahModel>);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.mushafTitle),
        centerTitle: true,
        actions: [
          ListenableBuilder(
            listenable: quranAudio,
            builder: (context, _) {
              if (quranAudio.playingAyah == null) return const SizedBox.shrink();
              return IconButton(
                tooltip: l10n.mushafStopAudioTooltip,
                icon: const Icon(Icons.stop_circle_outlined),
                onPressed: () => quranAudio.stop(),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<(List<MushafPage>, List<SurahModel>)>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || snapshot.data == null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.wifi_off_rounded, size: 48, color: AppColors.mutedText),
                    const SizedBox(height: 12),
                    Text(l10n.mushafLoadError, textAlign: TextAlign.center),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => setState(() => _future = _loadAll()),
                      child: Text(l10n.commonRetry),
                    ),
                  ],
                ),
              ),
            );
          }

          final (pages, allSurahs) = snapshot.data!;

          return PageView.builder(
            controller: _pageController,
            reverse: true,
            itemCount: pages.length,
            onPageChanged: (index) {
              UserProgressService.saveLastReading(
                surahNumber: pages[index].ayahs.isNotEmpty ? pages[index].ayahs.first.surahNumber : 1,
                surahName: '',
                ayahNumber: pages[index].ayahs.isNotEmpty ? pages[index].ayahs.first.ayahNumber : 1,
              );
            },
            itemBuilder: (context, index) {
              final page = pages[index];
              return _MushafPageView(page: page, allSurahs: allSurahs);
            },
          );
        },
      ),
    );
  }
}

class _MushafPageView extends StatefulWidget {
  final MushafPage page;
  final List<SurahModel> allSurahs;
  const _MushafPageView({required this.page, required this.allSurahs});

  @override
  State<_MushafPageView> createState() => _MushafPageViewState();
}

class _MushafPageViewState extends State<_MushafPageView> {
  final List<TapGestureRecognizer> _recognizers = [];

  @override
  void initState() {
    super.initState();
    quranAudio.addListener(_onAudioChanged);
  }

  void _onAudioChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    quranAudio.removeListener(_onAudioChanged);
    _disposeRecognizers();
    super.dispose();
  }

  void _disposeRecognizers() {
    for (final r in _recognizers) {
      r.dispose();
    }
    _recognizers.clear();
  }

  SurahModel? _surahFor(int number) {
    for (final s in widget.allSurahs) {
      if (s.number == number) return s;
    }
    return null;
  }

  void _playAyah(MushafAyahRef ayah) {
    final surah = _surahFor(ayah.surahNumber);
    if (surah == null) return;
    if (quranAudio.isPlayingFor(ayah.surahNumber, ayah.ayahNumber)) {
      quranAudio.stop();
    } else {
      quranAudio.playAyah(surah, widget.allSurahs, ayah.ayahNumber);
    }
  }

  TapGestureRecognizer _makeRecognizer(VoidCallback onTap) {
    final recognizer = TapGestureRecognizer()..onTap = onTap;
    _recognizers.add(recognizer);
    return recognizer;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    _disposeRecognizers();

    final groups = <int, List<MushafAyahRef>>{};
    for (final ayah in widget.page.ayahs) {
      groups.putIfAbsent(ayah.surahNumber, () => []).add(ayah);
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(14, 12, 14, 20),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.goldAccent.withValues(alpha: 0.5), width: 2),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.10), blurRadius: 10, offset: const Offset(0, 3)),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (final entry in groups.entries) ...[
              if (entry.value.isNotEmpty && entry.value.first.ayahNumber == 1) ...[
                _SurahHeaderBanner(surah: _surahFor(entry.key)),
                if (Bismillah.shouldShowFor(entry.key)) ...[
                  const SizedBox(height: 14),
                  Text(
                    Bismillah.text,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(fontFamily: 'AmiriQuran', fontSize: 24, fontWeight: FontWeight.normal),
                  ),
                ],
                const SizedBox(height: 16),
              ],
              Text.rich(
                TextSpan(
                  children: [
                    for (final ayah in entry.value)
                      TextSpan(
                        style: quranAudio.isPlayingFor(ayah.surahNumber, ayah.ayahNumber)
                            ? TextStyle(backgroundColor: AppColors.goldAccent.withValues(alpha: 0.35))
                            : null,
                        recognizer: _makeRecognizer(() => _playAyah(ayah)),
                        children: [
                          if (appSettings.showTajweedColoring)
                            ...TajweedService.analyze(ayah.text).map((segment) {
                              final color = TajweedService.colorFor(segment.rule);
                              return TextSpan(
                                text: segment.text,
                                style: color != null ? TextStyle(color: color) : null,
                              );
                            })
                          else
                            TextSpan(text: ayah.text),
                          TextSpan(text: ' \uFD3F${ayah.ayahNumber}\uFD3E '),
                        ],
                      ),
                  ],
                ),
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontFamily: 'AmiriQuran', fontSize: 22, height: 2.4, fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 16),
            ],
            const Divider(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n.quranJuzNumber(widget.page.juzNumber), style: const TextStyle(color: AppColors.mutedText, fontSize: 12)),
                Text(l10n.mushafTapAyahHint, style: const TextStyle(color: AppColors.mutedText, fontSize: 11)),
                Text(l10n.mushafPageNumber(widget.page.pageNumber), style: const TextStyle(color: AppColors.mutedText, fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SurahHeaderBanner extends StatelessWidget {
  final SurahModel? surah;
  const _SurahHeaderBanner({required this.surah});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final currentSurah = surah;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.goldAccent, width: 1.5),
        borderRadius: BorderRadius.circular(10),
        color: AppColors.primaryEmerald.withValues(alpha: 0.07),
      ),
      alignment: Alignment.center,
      child: Text(
        currentSurah != null ? l10n.quranSurahAppBarTitle(currentSurah.name) : '',
        style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: AppColors.primaryEmerald),
      ),
    );
  }
}
