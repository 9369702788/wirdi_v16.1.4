# وردي | Wirdi — v0.1.0 Scaffold

Flutter scaffold implementing a first testable slice of the
[Wirdi Premium UI/UX Design Implementation Brief](./Wirdi_Premium_UI_UX_Design_Implementation_Brief.md):

- **Splash** → **Onboarding (3 slides)** → **Home Dashboard**
- Bottom navigation: Home · Quran (stub) · Azkar (stub) · Prayer Times · Tasbeeh
- Emerald/Gold design system (`lib/core/theme/app_theme.dart`), light + dark themes
- RTL-first Arabic UI

Quran Library/Reading, Audio Player, Azkar, and Khatma are **not implemented
yet** — those tabs are stubbed placeholders so the navigation structure from
the brief is visible end-to-end. This is a UI scaffold, not a functional app
(no real Quran data, no prayer-time API, no persistence).

## Why there's no `/android` folder here

This repo was generated in a sandboxed environment that couldn't reach
Google's SDK servers, so the Android platform folder couldn't be created or
verified locally. Instead, **GitHub Actions generates it automatically on
every push** (see `.github/workflows/build_apk.yml`) and builds a debug APK
you can download from the workflow run's Artifacts section.

## Get a test APK (no local setup required)

1. Push this repo to GitHub (create a new repo, then `git push`).
2. Go to the **Actions** tab → the "Build Wirdi Test APK" workflow runs
   automatically. You can also trigger it manually via "Run workflow".
3. When it finishes (~3–5 minutes), open the run → **Artifacts** →
   download `wirdi-debug-apk`. Unzip it to get `app-debug.apk`.
4. Install on an Android device/emulator (enable "Install unknown apps" if
   prompted — it's an unsigned debug build, expected for testing).

## Build locally instead (if you have Flutter installed)

```bash
flutter create --platforms=android --org com.wirdi --project-name wirdi .
flutter pub get
flutter build apk --debug
# APK at: build/app/outputs/flutter-apk/app-debug.apk
```

## Adding the Cairo font

Font files aren't bundled (see note in `pubspec.yaml`). Download
`Cairo-Regular.ttf` / `Cairo-Bold.ttf`, place them in `assets/fonts/`, and
uncomment the `fonts:`/`assets:` sections of `pubspec.yaml`.

## Next steps toward the full v1.0 scope

See section 9 (Implementation Backlog) of the design brief — Quran data
integration (Tanzil), Quran.com audio, Azkar counters, and Khatma tracking
are the priority items after this scaffold.
