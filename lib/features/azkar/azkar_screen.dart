import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/models/azkar_models.dart';
import '../../core/services/arabic_text_utils.dart';
import '../../core/services/azkar_repository.dart';
import '../../core/services/user_progress_service.dart';
import '../../core/theme/app_theme.dart';
import '../../l10n/generated/app_localizations.dart';

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({super.key});

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> with SingleTickerProviderStateMixin {
  late Future<List<AzkarCategoryModel>> _future;
  final TextEditingController _searchController = TextEditingController();
  Set<String> _completedToday = {};
  late final TabController _tabController;

  static bool _isDuaCategory(AzkarCategoryModel c) =>
      c.category.contains('دعاء') || c.category.contains('الدعاء') || c.category.contains('دعا');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _future = AzkarRepository.load();
    _loadCompleted();
  }

  Future<void> _loadCompleted() async {
    final completed = await UserProgressService.completedAzkarToday();
    if (mounted) setState(() => _completedToday = completed);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.azkarDuasTitle),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: l10n.azkarTabAzkar),
            Tab(text: l10n.azkarTabDuas),
          ],
        ),
        actions: [
          IconButton(
            tooltip: l10n.azkarFavoritesTooltip,
            icon: const Icon(Icons.favorite_outline),
            onPressed: () async {
              final categories = await _future.catchError((_) => <AzkarCategoryModel>[]);
              if (!mounted) return;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => _AzkarFavoritesScreen(allCategories: categories),
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<AzkarCategoryModel>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || snapshot.data == null || snapshot.data!.isEmpty) {
            return _ErrorView(
              message: l10n.azkarLoadError,
              retryLabel: l10n.azkarRetry,
              onRetry: () => setState(() => _future = AzkarRepository.load(forceRefresh: true)),
            );
          }

          final allCategories = snapshot.data!;
          final azkarCategories = allCategories.where((c) => !_isDuaCategory(c)).toList();
          final duaCategories = allCategories.where(_isDuaCategory).toList();

          return TabBarView(
            controller: _tabController,
            children: [
              _buildCategoryList(azkarCategories, l10n),
              _buildCategoryList(duaCategories, l10n),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCategoryList(List<AzkarCategoryModel> categories, AppLocalizations l10n) {
    final query = _searchController.text.trim();

    final filtered = query.isEmpty
        ? categories
        : categories
            .where((c) =>
                ArabicTextUtils.contains(c.category, query) ||
                c.items.any((i) => ArabicTextUtils.contains(i.text, query)))
            .toList();

    return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: l10n.azkarSearchHint,
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (_) => setState(() {}),
                  ),
                ),
                Expanded(
                  child: filtered.isEmpty
                      ? Center(child: Text(l10n.azkarNoResults))
                      : ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final category = filtered[index];
                    final completedCount = category.items.where((i) => _completedToday.contains(i.uid)).length;
                    final progress = category.items.isEmpty ? 0.0 : completedCount / category.items.length;

                    return Card(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        title: Text(category.category, style: const TextStyle(fontWeight: FontWeight.w700)),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(l10n.azkarCategorySubtitle(category.items.length, completedCount)),
                              const SizedBox(height: 6),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: LinearProgressIndicator(
                                  value: progress,
                                  minHeight: 5,
                                  backgroundColor: AppColors.primaryEmerald.withValues(alpha: 0.1),
                                  valueColor: const AlwaysStoppedAnimation(AppColors.primaryEmerald),
                                ),
                              ),
                            ],
                          ),
                        ),
                        trailing: const Icon(Icons.chevron_left),
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => AzkarDetailsScreen(category: category),
                            ),
                          );
                          _loadCompleted();
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
  }
}

class AzkarDetailsScreen extends StatefulWidget {
  final AzkarCategoryModel category;

  const AzkarDetailsScreen({super.key, required this.category});

  @override
  State<AzkarDetailsScreen> createState() => _AzkarDetailsScreenState();
}

class _AzkarDetailsScreenState extends State<AzkarDetailsScreen> {
  final Map<String, int> _counts = {};
  Set<String> _favorites = {};
  Set<String> _completedToday = {};
  bool _hideCompleted = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    for (final item in widget.category.items) {
      _counts[item.uid] = await UserProgressService.azkarCount(item.uid);
    }
    _favorites = await UserProgressService.favoriteAzkar();
    _completedToday = await UserProgressService.completedAzkarToday();
    if (mounted) setState(() {});
  }

  Future<void> _increment(AzkarItemModel item) async {
    HapticFeedback.lightImpact();

    // Update the counter on screen immediately — persistence happens in
    // the background so the UI never waits on disk I/O for a tap to
    // register. Previously this awaited the full save before updating
    // the number, which felt laggy on real devices.
    final next = (_counts[item.uid] ?? 0) + 1;
    setState(() => _counts[item.uid] = next);
    unawaited(UserProgressService.setAzkarCount(item.uid, next));

    if (next >= item.targetCount && !_completedToday.contains(item.uid)) {
      HapticFeedback.mediumImpact();
      _completedToday.add(item.uid);
      unawaited(UserProgressService.markAzkarCompleted(item.uid));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context).azkarCompletedSnackbar), duration: const Duration(seconds: 1)),
        );
      }
    }
  }

  Future<void> _toggleFavorite(AzkarItemModel item) async {
    await UserProgressService.toggleFavoriteAzkar(item.uid);
    final favs = await UserProgressService.favoriteAzkar();
    setState(() => _favorites = favs);
  }

  void _share(AzkarItemModel item) {
    Clipboard.setData(ClipboardData(text: item.text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context).azkarCopiedSnackbar)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final total = widget.category.items.length;
    final completedCount = widget.category.items.where((i) => _completedToday.contains(i.uid)).length;
    final progress = total == 0 ? 0.0 : completedCount / total;

    final visibleItems = _hideCompleted
        ? widget.category.items.where((i) => !_completedToday.contains(i.uid)).toList()
        : widget.category.items;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.category),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: _hideCompleted ? l10n.azkarShowCompleted : l10n.azkarHideCompleted,
            onPressed: () => setState(() => _hideCompleted = !_hideCompleted),
            icon: Icon(_hideCompleted ? Icons.visibility_off_outlined : Icons.visibility_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 8,
                      backgroundColor: AppColors.primaryEmerald.withValues(alpha: 0.1),
                      valueColor: const AlwaysStoppedAnimation(AppColors.primaryEmerald),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text('$completedCount/$total', style: const TextStyle(fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          Expanded(
            child: visibleItems.isEmpty
                ? Center(child: Text(l10n.azkarAllDoneInSection))
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: visibleItems.length,
                    itemBuilder: (context, index) {
                      final item = visibleItems[index];
                      final current = _counts[item.uid] ?? 0;
                      final isDone = current >= item.targetCount;
                      final isFavorite = _favorites.contains(item.uid);
                      
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            color: isDone ? AppColors.primaryEmerald.withValues(alpha: 0.06) : null,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    item.text,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 19, height: 1.9, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      IconButton(
                        tooltip: isFavorite ? l10n.quranRemoveFromFavoritesLabel : l10n.quranAddToFavoritesLabel,
                        onPressed: () => _toggleFavorite(item),
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? AppColors.goldAccent : AppColors.mutedText,
                        ),
                      ),
                      IconButton(
                        tooltip: l10n.commonShareTooltip,
                        onPressed: () => _share(item),
                        icon: const Icon(Icons.share_outlined, color: AppColors.mutedText),
                      ),
                      const Spacer(),
                      if (isDone)
                        const Icon(Icons.check_circle, color: AppColors.primaryEmerald)
                      else
                        Text('$current / ${item.targetCount}',
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () => _increment(item),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                        ),
                        child: Text(l10n.azkarPlusOne),
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
      ),
    );
  }
}

class _AzkarFavoritesScreen extends StatelessWidget {
  final List<AzkarCategoryModel> allCategories;
  const _AzkarFavoritesScreen({required this.allCategories});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.azkarFavoritesTitle), centerTitle: true),
      body: FutureBuilder<Set<String>>(
        future: UserProgressService.favoriteAzkar(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

          final favUids = snapshot.data!;
          final items = <AzkarItemModel>[];
          for (final cat in allCategories) {
            items.addAll(cat.items.where((i) => favUids.contains(i.uid)));
          }

          if (items.isEmpty) {
            return Center(child: Text(l10n.azkarNoFavoritesYet));
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
