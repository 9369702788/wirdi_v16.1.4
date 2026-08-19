import 'package:flutter/material.dart';
import '../radio/radio_screen.dart';

import '../../core/theme/app_theme.dart';
import '../../l10n/generated/app_localizations.dart';
import '../achievements/achievements_screen.dart';
import '../asma_ul_husna/asma_ul_husna_screen.dart';
import '../bookmarks/bookmarks_screen.dart';
import '../duas/my_duas_screen.dart';
import '../hadith/hadith_collection_screen.dart';
import '../insights/wirdi_insights_screen.dart';
import '../khatma/khatma_tracker_screen.dart';
import '../mosque_finder/mosque_finder_screen.dart';
import '../qibla/qibla_screen.dart';
import '../ramadan/ramadan_companion_screen.dart';
import '../wird/my_wirdi_screen.dart';
import '../zakat/zakat_calculator_screen.dart';

class _ToolEntry {
  final IconData icon;
  final String Function(AppLocalizations) titleFor;
  final String Function(AppLocalizations) subtitleFor;
  final WidgetBuilder builder;
  const _ToolEntry({
    required this.icon,
    required this.titleFor,
    required this.subtitleFor,
    required this.builder,
  });
}

class IslamicToolsScreen extends StatelessWidget {
  const IslamicToolsScreen({super.key});

  static final List<_ToolEntry> _tools = [
    _ToolEntry(
      icon: Icons.radio_rounded,
      titleFor: (l10n) => l10n.radioTitle,
      subtitleFor: (l10n) => l10n.radioSubtitle,
      builder: (_) => const RadioScreen(),
    ),
        _ToolEntry(
      icon: Icons.checklist_rtl_outlined,
      titleFor: (l10n) => l10n.toolMyWirdiTitle,
      subtitleFor: (l10n) => l10n.toolMyWirdiSubtitle,
      builder: (_) => const MyWirdiScreen(),
    ),
    _ToolEntry(
      icon: Icons.bookmark_add_outlined,
      titleFor: (l10n) => l10n.toolBookmarksTitle,
      subtitleFor: (l10n) => l10n.toolBookmarksSubtitle,
      builder: (_) => const BookmarksScreen(),
    ),
    _ToolEntry(
      icon: Icons.military_tech_outlined,
      titleFor: (l10n) => l10n.toolAchievementsTitle,
      subtitleFor: (l10n) => l10n.toolAchievementsSubtitle,
      builder: (_) => const AchievementsScreen(),
    ),
    _ToolEntry(
      icon: Icons.timeline_outlined,
      titleFor: (l10n) => l10n.toolKhatmaTitle,
      subtitleFor: (l10n) => l10n.toolKhatmaSubtitle,
      builder: (_) => const KhatmaTrackerScreen(),
    ),
    _ToolEntry(
      icon: Icons.insights_outlined,
      titleFor: (l10n) => l10n.toolInsightsTitle,
      subtitleFor: (l10n) => l10n.toolInsightsSubtitle,
      builder: (_) => const WirdiInsightsScreen(),
    ),
    _ToolEntry(
      icon: Icons.explore_outlined,
      titleFor: (l10n) => l10n.toolQiblaTitle,
      subtitleFor: (l10n) => l10n.toolQiblaSubtitle,
      builder: (_) => const QiblaScreen(),
    ),
    _ToolEntry(
      icon: Icons.calculate_outlined,
      titleFor: (l10n) => l10n.toolZakatTitle,
      subtitleFor: (l10n) => l10n.toolZakatSubtitle,
      builder: (_) => const ZakatCalculatorScreen(),
    ),
    _ToolEntry(
      icon: Icons.auto_awesome_outlined,
      titleFor: (l10n) => l10n.toolAsmaTitle,
      subtitleFor: (l10n) => l10n.toolAsmaSubtitle,
      builder: (_) => const AsmaUlHusnaScreen(),
    ),
    _ToolEntry(
      icon: Icons.menu_book_outlined,
      titleFor: (l10n) => l10n.toolHadithTitle,
      subtitleFor: (l10n) => l10n.toolHadithSubtitle,
      builder: (_) => const HadithCollectionScreen(),
    ),
    _ToolEntry(
      icon: Icons.nightlight_outlined,
      titleFor: (l10n) => l10n.toolRamadanTitle,
      subtitleFor: (l10n) => l10n.toolRamadanSubtitle,
      builder: (_) => const RamadanCompanionScreen(),
    ),
    _ToolEntry(
      icon: Icons.auto_stories_outlined,
      titleFor: (l10n) => l10n.toolDuasTitle,
      subtitleFor: (l10n) => l10n.toolDuasSubtitle,
      builder: (_) => const MyDuasScreen(),
    ),
    _ToolEntry(
      icon: Icons.mosque_outlined,
      titleFor: (l10n) => l10n.toolMosqueTitle,
      subtitleFor: (l10n) => l10n.toolMosqueSubtitle,
      builder: (_) => const MosqueFinderScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.toolsTitle), centerTitle: true),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _tools.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final tool = _tools[index];
          return Card(
            child: ListTile(
              leading: Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: AppColors.primaryEmerald.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(tool.icon, color: AppColors.primaryEmerald),
              ),
              title: Text(tool.titleFor(l10n), style: const TextStyle(fontWeight: FontWeight.w700)),
              subtitle: Text(tool.subtitleFor(l10n), style: const TextStyle(fontSize: 12)),
              trailing: const Icon(Icons.chevron_left),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: tool.builder)),
            ),
          );
        },
      ),
    );
  }
}
