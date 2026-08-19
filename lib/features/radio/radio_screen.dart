
import 'package:flutter/material.dart';
import '../../core/data/radio_stations.dart';
import '../../core/models/radio_station.dart';
import '../../core/services/radio_service.dart';
import '../../core/services/settings_service.dart';
import '../../core/theme/app_theme.dart';
import '../../l10n/generated/app_localizations.dart';
import 'widgets/radio_station_tile.dart';
import 'widgets/sleep_timer_sheet.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({super.key});
  @override State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabs;
  final _cats = ['all', 'quran', 'prayers', 'lectures', 'nasheed'];

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: _cats.length, vsync: this);
    RadioService.instance.init();
  }

  @override void dispose() { _tabs.dispose(); super.dispose(); }

  List<RadioStation> _stationsFor(String cat, List<RadioStation> all) {
    if (cat == 'all') return all;
    return all.where((s) => s.category == cat).toList();
  }

  String _catLabel(String cat, AppLocalizations l) {
    if (cat == 'all') return l.radioAll;
    final lang = appSettings.locale.languageCode;
    return kRadioCategories[cat]?[lang] ?? kRadioCategories[cat]?['en'] ?? cat;
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l.radioTitle),
        actions: [
          // Refresh button
          ListenableBuilder(
            listenable: RadioService.instance,
            builder: (_, __) {
              final svc = RadioService.instance;
              return svc.loadingLive
                  ? const Padding(
                      padding: EdgeInsets.all(14),
                      child: SizedBox(width: 20, height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2)))
                  : IconButton(
                      tooltip: l.commonRefreshTooltip,
                      icon: const Icon(Icons.refresh),
                      onPressed: () => svc.refreshStations(),
                    );
            },
          ),
          // Sleep timer
          ListenableBuilder(
            listenable: RadioService.instance,
            builder: (_, __) => IconButton(
              tooltip: l.radioSleepTimer,
              icon: Stack(children: [
                const Icon(Icons.bedtime_outlined),
                if (RadioService.instance.hasSleepTimer)
                  Positioned(right: 0, top: 0,
                      child: Container(width: 8, height: 8,
                          decoration: const BoxDecoration(
                              color: AppColors.goldAccent,
                              shape: BoxShape.circle))),
              ]),
              onPressed: () => showModalBottomSheet(
                  context: context, builder: (_) => const SleepTimerSheet()),
            ),
          ),
          // Favorites
          IconButton(
            tooltip: l.radioFavorites,
            icon: const Icon(Icons.favorite_border),
            onPressed: () => _showFavs(context, l),
          ),
        ],
        bottom: TabBar(
          controller: _tabs,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          tabs: _cats.map((c) => Tab(text: _catLabel(c, l))).toList(),
        ),
      ),
      body: ListenableBuilder(
        listenable: RadioService.instance,
        builder: (_, __) {
          final svc = RadioService.instance;
          final stations = svc.allStations;

          return Column(children: [
            // Error banner
            if (svc.state == RadioState.error && svc.errorMessage != null)
              Container(
                width: double.infinity,
                color: Colors.red.shade50,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 18),
                  const SizedBox(width: 8),
                  Expanded(child: Text(svc.errorMessage!,
                      style: const TextStyle(color: Colors.red, fontSize: 12))),
                  TextButton(
                    onPressed: () {
                      if (svc.currentStation != null) svc.play(svc.currentStation!);
                    },
                    child: Text(l.commonRetry,
                        style: const TextStyle(color: Colors.red)),
                  ),
                ]),
              ),

            // Now playing banner
            if (svc.currentStation != null) _NowPlayingBanner(svc: svc, l: l),

            // Station list
            Expanded(
              child: stations.isEmpty && svc.loadingLive
                  ? const Center(child: CircularProgressIndicator())
                  : TabBarView(
                      controller: _tabs,
                      children: _cats.map((cat) {
                        final list = _stationsFor(cat, stations);
                        if (list.isEmpty) {
                          return Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.radio_outlined,
                                    size: 48, color: Colors.grey),
                                const SizedBox(height: 8),
                                Text(l.radioNoStations,
                                    style: const TextStyle(color: Colors.grey)),
                                const SizedBox(height: 16),
                                TextButton.icon(
                                  icon: const Icon(Icons.refresh),
                                  label: Text(l.commonRetry),
                                  onPressed: () => svc.refreshStations(),
                                ),
                              ],
                            ),
                          );
                        }
                        return RefreshIndicator(
                          onRefresh: () => svc.refreshStations(),
                          child: ListView.builder(
                            padding: const EdgeInsets.only(bottom: 100),
                            itemCount: list.length,
                            itemBuilder: (_, i) =>
                                RadioStationTile(station: list[i]),
                          ),
                        );
                      }).toList(),
                    ),
            ),
          ]);
        },
      ),
    );
  }

  void _showFavs(BuildContext context, AppLocalizations l) {
    showModalBottomSheet(
      context: context, isScrollControlled: true,
      builder: (_) => DraggableScrollableSheet(
        expand: false, initialChildSize: 0.6,
        builder: (_, ctrl) => ListenableBuilder(
          listenable: RadioService.instance,
          builder: (_, __) {
            final favs = RadioService.instance.favoriteStations;
            return Column(children: [
              const SizedBox(height: 8),
              Container(width: 40, height: 4,
                  decoration: BoxDecoration(color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2))),
              const SizedBox(height: 12),
              Text(l.radioFavorites,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              if (favs.isEmpty)
                Expanded(child: Center(child: Text(l.radioNoFavorites)))
              else
                Expanded(child: ListView.builder(
                  controller: ctrl, itemCount: favs.length,
                  itemBuilder: (_, i) => RadioStationTile(station: favs[i]),
                )),
            ]);
          },
        ),
      ),
    );
  }
}

class _NowPlayingBanner extends StatelessWidget {
  final RadioService svc;
  final AppLocalizations l;
  const _NowPlayingBanner({required this.svc, required this.l});

  @override
  Widget build(BuildContext context) {
    final lang = appSettings.locale.languageCode;
    final name = lang == 'ar'
        ? svc.currentStation!.nameAr : svc.currentStation!.nameEn;
    return Container(
      color: AppColors.primaryEmerald.withOpacity(0.08),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(children: [
        Icon(Icons.graphic_eq_rounded,
            color: AppColors.primaryEmerald, size: svc.isPlaying ? 28 : 24),
        const SizedBox(width: 12),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l.radioNowPlaying,
                style: const TextStyle(fontSize: 11,
                    color: AppColors.primaryEmerald, fontWeight: FontWeight.w600)),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold),
                maxLines: 1, overflow: TextOverflow.ellipsis),
          ],
        )),
        if (svc.hasSleepTimer && svc.sleepMinutesRemaining != null)
          Padding(padding: const EdgeInsets.only(right: 8),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              const Icon(Icons.bedtime, size: 14, color: AppColors.goldAccent),
              const SizedBox(width: 2),
              Text('${svc.sleepMinutesRemaining}m',
                  style: const TextStyle(fontSize: 12,
                      color: AppColors.goldAccent, fontWeight: FontWeight.bold)),
            ])),
        svc.isLoading
            ? const SizedBox(width: 32, height: 32,
                child: CircularProgressIndicator(strokeWidth: 2))
            : IconButton(
                icon: Icon(svc.isPlaying
                    ? Icons.stop_rounded : Icons.play_arrow_rounded,
                    color: AppColors.primaryEmerald),
                onPressed: () {
                  if (svc.isPlaying) svc.stop();
                  else if (svc.currentStation != null) svc.play(svc.currentStation!);
                }),
      ]),
    );
  }
}
