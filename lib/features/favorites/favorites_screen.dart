import 'package:flutter/material.dart';

import '../../l10n/generated/app_localizations.dart';
import '../../core/models/azkar_models.dart';
import '../../core/models/quran_models.dart';
import '../../core/services/azkar_repository.dart';
import '../../core/services/quran_repository.dart';
import '../../core/services/user_progress_service.dart';
import '../quran/quran_screen.dart';

/// Unified favorites view: shows only what the user actually favorited
/// (Quran ayahs + Azkar items), not an entire category/section. Fixes
/// the Home Dashboard's "المفضلة" card, which previously opened the
/// full Azkar screen instead of a real filtered favorites list.
class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).favoritesTitle),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: AppLocalizations.of(context).favoritesTabAyahs),
            Tab(text: AppLocalizations.of(context).favoritesTabAzkar),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          _FavoriteAyahsTab(),
          _FavoriteAzkarTab(),
        ],
      ),
    );
  }
}

class _FavoriteAyahsTab extends StatelessWidget {
  const _FavoriteAyahsTab();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([QuranRepository.load(), UserProgressService.favoriteAyahs()]),
      builder: (context, AsyncSnapshot<List<Object>> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text(AppLocalizations.of(context).favoritesLoadError));
        }

        final allSurahs = snapshot.data![0] as List<SurahModel>;
        final favUids = snapshot.data![1] as Set<String>;

        final results = <(SurahModel, AyahModel)>[];
        for (final surah in allSurahs) {
          for (final ayah in surah.ayahs) {
            if (favUids.contains('${surah.number}_${ayah.number}')) {
              results.add((surah, ayah));
            }
          }
        }

        if (results.isEmpty) {
          return Center(child: Text(AppLocalizations.of(context).favoritesEmptyAyahs));
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
                subtitle: Text(
                  AppLocalizations.of(context).favoritesAyahSubtitle(surah.name, ayah.number),
                  textAlign: TextAlign.right,
                ),
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

class _FavoriteAzkarTab extends StatelessWidget {
  const _FavoriteAzkarTab();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([AzkarRepository.load(), UserProgressService.favoriteAzkar()]),
      builder: (context, AsyncSnapshot<List<Object>> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text(AppLocalizations.of(context).favoritesLoadError));
        }

        final allCategories = snapshot.data![0] as List<AzkarCategoryModel>;
        final favUids = snapshot.data![1] as Set<String>;

        final items = <AzkarItemModel>[];
        for (final cat in allCategories) {
          items.addAll(cat.items.where((i) => favUids.contains(i.uid)));
        }

        if (items.isEmpty) {
          return Center(child: Text(AppLocalizations.of(context).favoritesEmptyAzkar));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  item.text,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 17, height: 1.8),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
