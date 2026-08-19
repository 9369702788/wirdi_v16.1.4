
import 'package:flutter/material.dart';

import '../../l10n/generated/app_localizations.dart';
import '../../features/home/home_dashboard_screen.dart';
import '../../features/radio/widgets/radio_mini_player.dart';
import '../../features/prayer/prayer_times_screen.dart';
import '../../features/tasbeeh/tasbeeh_screen.dart';
import '../../features/quran/quran_screen.dart';
import '../../features/azkar/azkar_screen.dart';
import '../../features/settings/settings_screen.dart';
import '../../features/radio/radio_screen.dart';

class RootShell extends StatefulWidget {
  const RootShell({super.key});

  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> {
  int _index = 0;

  // ORDER MUST EXACTLY MATCH the BottomNavigationBar items below:
  // 0=Home  1=Quran  2=Azkar  3=Prayer  4=Tasbeeh  5=Radio  6=More(Settings)
  static final List<Widget> _screens = [
    const HomeDashboardScreen(),   // 0
    const QuranScreen(),           // 1
    const AzkarScreen(),           // 2
    const PrayerTimesScreen(),     // 3
    const TasbeehScreen(),         // 4
    const RadioScreen(),           // 5  ← Radio BEFORE Settings
    const SettingsScreen(),        // 6
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: IndexedStack(
              index: _index,
              children: _screens,
            ),
          ),
          // Mini player — visible whenever a radio station is active
          const RadioMiniPlayer(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: [
          BottomNavigationBarItem(                          // 0
            icon: const Icon(Icons.home_outlined),
            activeIcon: const Icon(Icons.home),
            label: l10n.navHome,
          ),
          BottomNavigationBarItem(                          // 1
            icon: const Icon(Icons.menu_book_outlined),
            activeIcon: const Icon(Icons.menu_book),
            label: l10n.navQuran,
          ),
          BottomNavigationBarItem(                          // 2
            icon: const Icon(Icons.favorite_outline),
            activeIcon: const Icon(Icons.favorite),
            label: l10n.navAzkar,
          ),
          BottomNavigationBarItem(                          // 3
            icon: const Icon(Icons.access_time),
            activeIcon: const Icon(Icons.access_time_filled),
            label: l10n.navPrayer,
          ),
          BottomNavigationBarItem(                          // 4
            icon: const Icon(Icons.fingerprint),
            activeIcon: const Icon(Icons.fingerprint),
            label: l10n.navTasbeeh,
          ),
          BottomNavigationBarItem(                          // 5  ← Radio
            icon: const Icon(Icons.radio_outlined),
            activeIcon: const Icon(Icons.radio),
            label: l10n.radioTitle,
          ),
          BottomNavigationBarItem(                          // 6  ← Settings/More
            icon: const Icon(Icons.settings_outlined),
            activeIcon: const Icon(Icons.settings),
            label: l10n.navMore,
          ),
        ],
      ),
    );
  }
}
