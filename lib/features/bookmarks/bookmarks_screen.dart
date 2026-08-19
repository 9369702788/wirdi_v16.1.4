import 'package:flutter/material.dart';

import '../../core/models/bookmark_models.dart';
import '../../core/services/bookmark_service.dart';
import '../../core/theme/app_theme.dart';
import '../../l10n/generated/app_localizations.dart';
import '../quran/quran_screen.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({super.key});

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  List<BookmarkEntry> _bookmarks = [];
  bool _loading = true;
  String? _filterCategory;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final bookmarks = await BookmarkService.allBookmarks();
    if (!mounted) return;
    setState(() {
      _bookmarks = bookmarks;
      _loading = false;
    });
  }

  String _categoryLabel(AppLocalizations l10n, String category) {
    switch (category) {
      case 'ramadan':
        return l10n.bookmarkCategoryRamadan;
      case 'dua':
        return l10n.bookmarkCategoryDua;
      case 'family':
        return l10n.bookmarkCategoryFamily;
      case 'study':
        return l10n.bookmarkCategoryStudy;
      case 'personal':
        return l10n.bookmarkCategoryPersonal;
      default:
        return l10n.bookmarkCategoryOther;
    }
  }

  Future<void> _confirmDelete(BookmarkEntry bookmark) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.bookmarkDeleteConfirmTitle),
        content: Text(l10n.bookmarkDeleteConfirmBody),
        actions: [
          TextButton(onPressed: () => Navigator.pop(dialogContext, false), child: Text(l10n.commonCancel)),
          TextButton(onPressed: () => Navigator.pop(dialogContext, true), child: Text(l10n.bookmarkDeleteConfirm)),
        ],
      ),
    );
    if (confirmed != true) return;
    await BookmarkService.deleteBookmark(bookmark.id);
    await _load();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final visible = _filterCategory == null ? _bookmarks : _bookmarks.where((b) => b.category == _filterCategory).toList();

    return Scaffold(
      appBar: AppBar(title: Text(l10n.bookmarksTitle), centerTitle: true),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                if (_bookmarks.isNotEmpty)
                  SizedBox(
                    height: 48,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(l10n.bookmarkCategoryOther),
                            selected: _filterCategory == null,
                            onSelected: (_) => setState(() => _filterCategory = null),
                          ),
                        ),
                        for (final category in BookmarkService.categories)
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ChoiceChip(
                              label: Text(_categoryLabel(l10n, category)),
                              selected: _filterCategory == category,
                              onSelected: (_) => setState(() => _filterCategory = category),
                            ),
                          ),
                      ],
                    ),
                  ),
                Expanded(
                  child: visible.isEmpty
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.bookmark_border, size: 48, color: AppColors.mutedText),
                                const SizedBox(height: 12),
                                Text(l10n.bookmarksEmptyTitle, style: const TextStyle(color: AppColors.mutedText)),
                                const SizedBox(height: 8),
                                Text(l10n.bookmarksEmptySubtitle, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.mutedText, fontSize: 12)),
                              ],
                            ),
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                          itemCount: visible.length,
                          itemBuilder: (context, index) {
                            final bookmark = visible[index];
                            return Card(
                              margin: const EdgeInsets.only(bottom: 12),
                              child: ListTile(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => QuranScreen(initialSurahNumber: bookmark.surahNumber, initialAyah: bookmark.ayahNumber),
                                  ),
                                ),
                                title: Text(
                                  '${bookmark.surahName} • ${bookmark.ayahNumber}',
                                  style: const TextStyle(fontWeight: FontWeight.w700),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (bookmark.note.trim().isNotEmpty) ...[
                                      const SizedBox(height: 4),
                                      Text(bookmark.note, maxLines: 2, overflow: TextOverflow.ellipsis),
                                    ],
                                    const SizedBox(height: 4),
                                    Chip(
                                      label: Text(_categoryLabel(l10n, bookmark.category), style: const TextStyle(fontSize: 11)),
                                      visualDensity: VisualDensity.compact,
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                  ],
                                ),
                                trailing: IconButton(
                                  tooltip: l10n.commonDeleteTooltip,
                                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                                  onPressed: () => _confirmDelete(bookmark),
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
