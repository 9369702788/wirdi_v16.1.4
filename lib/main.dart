import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/services/notification_service.dart';
import 'core/services/settings_service.dart';
import 'core/services/radio_service.dart';
import 'core/theme/app_theme.dart';
import 'features/splash/splash_screen.dart';
import 'features/onboarding/onboarding_screen.dart';
import 'shared/widgets/root_shell.dart';
import 'l10n/generated/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await appSettings.load();
  await RadioService.instance.init();
  // Date symbols (month/day names used by intl's DateFormat) for every
  // locale we ship, so switching languages doesn't need a re-fetch.
  for (final locale in AppSettings.supportedLocales) {
    await initializeDateFormatting(locale.languageCode, null);
  }
  // Cheap setup only — does not prompt the user. The actual permission
  // request happens when they turn on prayer reminders in Settings (or
  // immediately if reminders are already on from a previous session).
  await NotificationService.initialize();
  runApp(const WirdiApp());
}

class WirdiApp extends StatelessWidget {
  const WirdiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: appSettings,
      builder: (context, _) {
        return MaterialApp(
          onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
          debugShowCheckedModeBanner: false,

          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: appSettings.themeMode,

          // appSettings.locale resolves: explicit user choice > device
          // locale (if supported) > Arabic fallback. Rebuilds live via
          // the ListenableBuilder above whenever setLocale() is called.
          locale: appSettings.locale,

          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],

          supportedLocales: AppSettings.supportedLocales,

          builder: (context, child) {
            final mediaQuery = MediaQuery.of(context);
            // Direction follows the active locale (RTL for Arabic, LTR
            // for English/German/Turkish) instead of being hardcoded.
            return Directionality(
              textDirection: appSettings.textDirection,
              child: MediaQuery(
                data: mediaQuery.copyWith(textScaler: TextScaler.linear(appSettings.fontScale)),
                child: child ?? const SizedBox.shrink(),
              ),
            );
          },

          home: const AppStartup(),
        );
      },
    );
  }
}

class AppStartup extends StatefulWidget {
  const AppStartup({super.key});

  @override
  State<AppStartup> createState() => _AppStartupState();
}

class _AppStartupState extends State<AppStartup> {
  bool _splashDone = false;
  bool _onboardingDone = false;

  @override
  Widget build(BuildContext context) {
    if (!_splashDone) {
      return SplashScreen(
        onFinished: () {
          setState(() {
            _splashDone = true;
          });
        },
      );
    }

    if (!_onboardingDone) {
      return OnboardingScreen(
        onFinished: () {
          setState(() {
            _onboardingDone = true;
          });
        },
      );
    }

    return const RootShell();
  }
}
