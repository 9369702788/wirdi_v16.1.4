import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/models/hadith_models.dart';
import '../../core/services/app_logger.dart';
import '../../core/services/arabic_text_utils.dart';
import '../../core/services/hadith_repository.dart';
import '../../core/services/user_progress_service.dart';
import '../../core/theme/app_theme.dart';
import '../../l10n/generated/app_localizations.dart';

class HadithCollectionScreen extends StatefulWidget {
  const HadithCollectionScreen({super.key});

  @override
  State<HadithCollectionScreen> createState() => _HadithCollectionScreenState();
}

class _HadithCollectionScreenState extends State<HadithCollectionScreen> {
  Future<List<HadithModel>>? _future;
  final TextEditingController _searchController = TextEditingController();
  Set<String> _favorites = {};
  String? _loadedForLanguageCode;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Reload if the active language changes so the translation edition
    // switches too — Localizations.localeOf(context) isn't safe to read
    // in initState (see quran_screen.dart's SurahReaderScreen for the
    // same pattern and why).
    final languageCode = Localizations.localeOf(context).languageCode;
    if (_loadedForLanguageCode != languageCode) {
      _loadedForLanguageCode = languageCode;
      _future = HadithRepository.load(languageCode: languageCode);
      _loadFavorites();
    }
  }

  Future<void> _loadFavorites() async {
    final favs = await UserProgressService.favoriteHadiths();
    if (mounted) setState(() => _favorites = favs);
  }

  Future<void> _toggleFavorite(HadithModel hadith) async {
    await UserProgressService.toggleFavoriteHadith(hadith.uid);
    await _loadFavorites();
  }

  void _copyHadith(HadithModel hadith) {
    final l10n = AppLocalizations.of(context);
    Clipboard.setData(ClipboardData(text: '${hadith.arabicText}\n\n${hadith.translatedText}'));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.hadithCopiedSnackbar)));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final languageCode = Localizations.localeOf(context).languageCode;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.hadithTitle), centerTitle: true),
      body: FutureBuilder<List<HadithModel>>(
        future: _future,
        builder: (context, snapshot) {
          if (_future == null || snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || snapshot.data == null || snapshot.data!.isEmpty) {
            AppLogger.error('Hadith collection failed to load', error: snapshot.error);
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.wifi_off_rounded, size: 48, color: AppColors.mutedText),
                    const SizedBox(height: 12),
                    Text(l10n.hadithLoadError, textAlign: TextAlign.center),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => setState(() {
                        _future = HadithRepository.load(languageCode: languageCode, forceRefresh: true);
                      }),
                      child: Text(l10n.hadithRetry),
                    ),
                  ],
                ),
              ),
            );
          }

          final all = snapshot.data!;
          final query = _searchController.text.trim();
          final filtered = query.isEmpty
              ? all
              : all
                  .where((h) =>
                      ArabicTextUtils.contains(h.arabicText, query) ||
                      h.translatedText.toLowerCase().contains(query.toLowerCase()) ||
                      h.number.toString() == query)
                  .toList();

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                child: Column(
                  children: [
                    Text(
                      l10n.hadithSubtitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: AppColors.mutedText, fontSize: 13),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: l10n.hadithSearchHint,
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none),
                      ),
                      onChanged: (_) => setState(() {}),
                    ),
                    if (languageCode == 'de') ...[
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.goldAccent.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          l10n.hadithTranslationNote,
                          style: const TextStyle(fontSize: 12, color: AppColors.mutedText),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Expanded(
                child: filtered.isEmpty
                    ? Center(child: Text(l10n.hadithNoResults))
                    : ListView.builder(
                        padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
                        itemCount: filtered.length,
                        itemBuilder: (context, index) {
                          final hadith = filtered[index];
                          final isFavorite = _favorites.contains(hadith.uid);

                          return Card(
                            margin: const EdgeInsets.only(bottom: 12),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    l10n.hadithNumberLabel(hadith.number),
                                    style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.primaryEmerald),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    hadith.arabicText,
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(fontFamily: 'AmiriQuran', fontSize: 18, height: 1.9),
                                  ),
                                  const Divider(height: 24),
                                  Text(
                                    hadith.translatedText,
                                    style: const TextStyle(fontSize: 14, height: 1.6),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                        tooltip: l10n.hadithCopyTooltip,
                                        onPressed: () => _copyHadith(hadith),
                                        icon: const Icon(Icons.copy_outlined, color: AppColors.mutedText),
                                      ),
                                      Semantics(
                                        button: true,
                                        label: isFavorite ? l10n.hadithRemoveFromFavoritesLabel : l10n.hadithAddToFavoritesLabel,
                                        child: IconButton(
                                          tooltip: l10n.hadithAddToFavoritesLabel,
                                          onPressed: () => _toggleFavorite(hadith),
                                          icon: Icon(
                                            isFavorite ? Icons.favorite : Icons.favorite_border,
                                            color: isFavorite ? AppColors.goldAccent : AppColors.mutedText,
                                          ),
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
              ),
            ],
          );
        },
      ),
    );
  }
}
