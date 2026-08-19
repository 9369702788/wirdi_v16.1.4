# Wirdi v1.1.0 — Production Upgrade Notes

This documents the audit/upgrade pass performed on top of the working
v1.0.0 codebase (Quran, Azkar, Tasbeeh, Prayer Times, Home, GitHub Actions
build — all already functional and building on a real device).

## What changed and why

### Architecture / code quality
- **Removed duplicated code**: `quran_screen.dart` had its own copy of the
  Quran-fetching/parsing logic (`QuranApi`, `SurahData`, `AyahData`)
  duplicating `QuranRepository`/`quran_models.dart`. Now there is exactly
  one Quran data path.
- **New `core/services/` layer**: `local_cache_service.dart`,
  `azkar_repository.dart`, `prayer_service.dart`, `settings_service.dart`,
  `user_progress_service.dart`. Screens no longer talk to `http`/
  `SharedPreferences` directly for anything that's shared state — they go
  through a repository/service, so Home Dashboard, Quran, Azkar, and
  Prayer Times all read the *same* persisted state instead of drifting.
- **New `core/models/`**: `azkar_models.dart`, `prayer_models.dart`.

### Offline-first
- `QuranRepository` and `AzkarRepository` now cache the last successful
  fetch (`SharedPreferences`) and serve it instantly on next launch while
  refreshing in the background. No cache + no network still surfaces a
  real, user-facing error with a retry button (never fake data).
- `PrayerService` caches the last successful AlAdhan response and falls
  back to it if location/network fails, with the UI clearly labeling the
  times as "آخر مواقيت محفوظة (بدون اتصال)" — never presented as live.

### Azkar — was hardcoded sample data, now real
- Replaced the 4-category hardcoded `Map` with `AzkarRepository`, pulling
  the full ~132-category Hisn Al Muslim dataset your app was already
  configured to point at (`AppSources.azkarJsonUrl`), offline-cached.
- Added: search (category + text), favorites (persisted), per-item
  counters that persist and **reset daily** (based on the actual date, not
  a fake timer), completion detection + haptic + snackbar, share-via-copy
  (no new dependency — uses Flutter's built-in `Clipboard`).

### Tasbeeh
- 6 selectable phrases instead of one fixed counter, each with its own
  persisted daily count + all-time total, progress ring toward a
  per-phrase target, daily reset that's actually date-based.

### Prayer Times
- Logic extracted into `PrayerService` so Home Dashboard's "next prayer"
  and the Prayer Times screen can never disagree.
- Real, distinct error states (`PrayerAvailability` enum): location
  service off, permission denied, denied forever, no network + no cache —
  each with its own message, instead of one generic string.

### Home Dashboard — was static placeholder text, now real
- Next prayer + live countdown: real, from `PrayerService`.
- Continue reading: real, from the last-saved reading position.
- Favorites count: real, summed across Quran ayahs + Azkar items.
- Daily wird progress: real. Added a "mark this surah as read today"
  action in the Quran reader that increments actual persisted progress
  against a target you set in Settings, plus a real streak counter.
- Quote of the day: a curated, deterministic-by-date rotation (not an
  external API call, not lorem-ipsum — real short ayat/hadith text).

### Settings (new module)
- Theme: light / dark / system, persisted, applies live (no restart).
- Font size slider, persisted, applies app-wide via `TextScaler`.
- Daily wird target stepper.
- About, Sources & Licenses (reuses your existing `AppSources` content,
  plus Flutter's built-in open-source license page), Privacy Policy
  (written to match exactly what this codebase does — see below), and a
  "delete all local data" action with a confirmation dialog.

### Play Store readiness
- In-app Privacy Policy page now exists and accurately describes: no
  accounts, location used only for prayer-time calculation and not
  stored/shared, all other data local-only, which three external data
  sources the app calls, no ads, no analytics.
- **You still need to**: host this policy text (or equivalent) at a public
  URL for the Play Console listing — I can't host a URL for you. Also
  still needed before submission: real app icon/screenshots, a completed
  Play Console Data Safety form (the privacy text above tells you exactly
  what to declare), and a human legal read-through if you're in a
  jurisdiction with extra requirements.

## Explicitly NOT done in this pass (and why)

- **Full offline audio recitation library**: this is gigabytes of
  licensed audio files. Bundling "the entire Quran, offline, all
  reciters" isn't something that fits in an app download either
  technically or in terms of what I can source/verify here. The
  architecture (repository pattern, offline cache) is ready for a
  streaming-with-download-for-offline audio feature as a follow-up.
- **Riverpod / clean-architecture DI / sqflite or Isar for local
  storage**: you asked me not to risk breaking the Android build with new
  dependencies, and I can't compile-test locally in this sandbox. Current
  code stays on `SharedPreferences` + a repository pattern, which is a
  real, working offline-first design — just not a full DB-backed one.
- **Formal accessibility audit / performance profiling**: needs a running
  device/DevTools session, which I don't have here.
- **Qibla compass**: still out of scope per your own v1.0 brief (deferred
  to v1.1 in your original spec, and needs real-device compass testing).

## Before you rely on this build

I could not run `flutter analyze` / `flutter build` locally (no Flutter
SDK reachable from this sandbox — see the GitHub Actions workflow notes
in the main README). I reviewed every changed file manually (imports,
brace/paren balance, consistent method signatures across the new service
layer), but the real verification is your CI run. If it fails, paste me
the exact log and I'll fix it — I'd rather see the real compiler error
than guess.

---

# v1.2.0 — Quran/Azkar/Tasbeeh depth pass

Responding to the follow-up feature review. Scoped realistically — see
"Deferred" below for what's intentionally not in this pass and why.

## Added

**Quran module**
- Real per-ayah and per-surah audio (Mishary Alafasy, verified CDN:
  `cdn.islamic.network` — pattern confirmed against the official
  AlQuran.Cloud CDN docs). Per-ayah global numbering is computed live
  from your already-loaded Quran data (no separate mapping file to get
  out of sync).
- Per-ayah repeat toggle.
- Juz' (30-part) index — tap any Juz to jump straight to its starting
  ayah. Standard canonical boundary table.
- Full-Quran ayah text search (separate tab from surah-name search).
- Quran favorites tab (was only reachable indirectly before).
- "Continue reading" on the Home Dashboard now deep-links into the exact
  saved surah and **scrolls to the exact ayah**, instead of just opening
  the surah list.
- In-reader font zoom (+/-) and copy-ayah-to-clipboard.

**Azkar**
- Per-category completion progress bar (shown in both the category list
  and inside each category).
- "Hide completed" toggle inside a category.

**Tasbeeh**
- Custom counters: add any phrase + target via a dialog, persisted,
  long-press to delete. Sits alongside the 6 built-in phrases.

## New dependency

Added exactly one: `audioplayers: ^6.1.0`. This is a mature, widely-used
Flutter audio package — a calculated exception to the "no new
dependencies" rule from the previous pass, because audio playback was
your #1-ranked missing feature and there's no way to add it without an
audio-playing package. I could not compile-test it here (no Flutter SDK
in this sandbox); if your CI build fails on this dependency specifically,
send me the log and I'll adjust.

## Deferred (with reasons)

- **Tafsir**: I looked for a real, reliable tafsir data source and
  couldn't verify one reachable from this sandbox in the time available.
  Rather than guess at a URL or fabricate text, I'm leaving this out
  until a real source is confirmed.
- **Share ayah as image**: needs an image-rendering package
  (e.g. `screenshot` + share sheet) — next pass.
- **Weekly/monthly Tasbeeh statistics, achievements/gamification,
  statistics screen**: each is a real feature needing its own data model
  (weekly/monthly aggregation isn't just "read more prefs keys" — it
  needs a proper history log, which the current daily-only counters
  don't keep yet). Next pass.
- **Khatma duration goals (30/20/15/10 day plans)**: needs a slightly
  different data model than the current "daily wird target" (a khatma
  plan recalculates the daily target from remaining days, and needs to
  survive across app restarts correctly) — planned for the next pass
  alongside the statistics screen, since they share underlying data.
- **Home screen widget, notifications, night reading mode as a distinct
  theme, Lottie animations, glass/blur design overhaul**: each is a
  separate platform integration or design system change or on their own,
  not incremental additions to today's screens.

---

# v1.3.0 — Audit pass: gaps closed, code quality, real Khatma progress

This pass re-checked the app against the full production checklist
(items 1-12) against what v1.1.0/v1.2.0 actually shipped, rather than
starting over. Found and fixed real gaps; no new project uploaded, so
this builds on the existing codebase directly.

## Gaps found and fixed

**Code quality (item 10)**
- 4 remaining uses of the deprecated `Color.withOpacity()` in
  `splash_screen.dart` and `onboarding_screen.dart` (missed in earlier
  passes — everything else had already moved to `withValues(alpha:)`).
  Fixed for consistency and to avoid the deprecation warning.
- Removed a genuinely dead asset: `assets/data/placeholder.json` (a
  literal 3-byte placeholder file left over from the original scaffold)
  and its `pubspec.yaml` reference. This is exactly the kind of leftover
  the "no placeholder" rule is about — it wasn't used by any code.
- 3 silently-swallowed `catch (_)` blocks in the offline-fallback paths
  (`QuranRepository`, `AzkarRepository`, `PrayerService`) now log the
  real error via a new `AppLogger` (wraps `dart:developer.log` — zero new
  dependencies) before falling back to cache. Behavior is unchanged; you
  can now actually see *why* a fallback happened in `adb logcat` /
  DevTools instead of it being invisible.
- Removed the unused `intl` dependency by actually using it (see Data
  Management below) instead of leaving it declared-but-dead.

**Item 1 (Quran) — "Reading progress" was declared but not real**
- Added genuine khatma/reading-progress tracking: marking a surah as
  read (via the existing "add to daily wird" button) now also records it
  in a persisted completed-surahs set. The Quran tab shows a real
  progress bar + percentage ("تقدّم الختمة"), and the Home Dashboard
  shows the same percentage under the streak line. This is surah-level
  (not mushaf-page-level, since the Quran text source doesn't carry
  official page numbers) — stated explicitly, not implied to be more
  precise than it is.
- Added a "reset khatma progress" action in Settings for starting a new
  reading cycle without touching favorites or the daily wird streak.

**Item 6 (Settings) — Data Management was thin**
- Added real cache-freshness display ("آخر تحديث للقرآن الكريم" /
  "للأذكار") using the `cachedAt()` timestamps the repositories already
  tracked internally but never surfaced to the user, plus a manual
  "تحديث البيانات الآن" action.

**Item 8/9 (UI/UX, Performance)**
- `SurahReaderScreen`'s ayah list was still built eagerly
  (`ListView(children: [...])`) — for long surahs (e.g. Al-Baqarah, 286
  ayat) this builds all 286 cards upfront. Converted to
  `ListView.builder` for lazy on-screen building.
- Added `Semantics` labels to the custom interactive widgets that had
  none: the Tasbeeh counter circle, the Home Dashboard progress rings,
  and the per-ayah audio/favorite icon buttons in the reader — these are
  the widgets a screen reader couldn't previously describe meaningfully
  (regular `IconButton`/`Card` widgets elsewhere already get reasonable
  default semantics from Flutter, and existing `tooltip` values also
  help).

## What I checked and found already done (from earlier passes)

Offline-first repository pattern, Quran/Azkar/Prayer caching, full
Hisn Al Muslim dataset, Quran search (name/number/verse text), Juz
index, favorites (Quran + Azkar), Azkar counters/completion/progress
bars/share, Tasbeeh multi-phrase + custom counters + daily/total stats,
GPS prayer times with offline fallback and real error states, live
countdown, Home Dashboard wired to real data (no hardcoded values
remain), theme (light/dark/system) + font size, About/Sources/Privacy
Policy/Data Management, GitHub Actions build. I did not re-do any of
these — re-verified they're real, not re-implemented from scratch.

## Still deferred (unchanged from v1.2.0, still true)

Tafsir (no verified source yet), share-ayah-as-image, weekly/monthly
Tasbeeh statistics + a dedicated achievements/gamification screen,
Khatma **duration-based plans** (30/20/15/10-day pace calculator — note
this is different from the progress tracking added in this pass, which
just tracks *what's* been completed, not a target pace), home-screen
widget, push notifications/daily reminders, full English translation
(the `Locale`/`flutter_localizations` infrastructure is in place from
v1.1.0, but translating every hardcoded Arabic string in every screen is
its own large, mechanical task better done as one clean pass), and the
Lottie/glass-blur visual redesign. Each remains out of scope here for
the same reasons as before: needs a new dependency I haven't vetted, a
data model that doesn't exist yet, or platform integration I can't test
in this sandbox.

## Verification

Same limitation as prior passes: no Flutter SDK reachable from this
sandbox, so I checked every changed file by hand — brace/paren balance
across the whole `lib/` tree, and that every relative import in touched
files resolves to a real file. The one thing I added real risk-awareness
for: `DateFormat(..., 'ar')` in Settings needs Arabic locale data loaded,
so `main()` now explicitly calls `initializeDateFormatting('ar', null)`
at startup rather than assuming `flutter_localizations` already did it.
Push and let CI confirm; send me the log if anything fails.

---

# v1.3.1 — Build fix

Your CI caught a real bug: `lib/features/settings/settings_screen.dart:129:54: Error: Member not found: 'rtl'`.

**Root cause**: `package:intl` exports its own `TextDirection` enum
(`LTR`/`RTL`/`UNKNOWN`) which collides with Flutter's `dart:ui.TextDirection`
(`rtl`/`ltr`) when both packages are imported unqualified in the same file.
I added `import 'package:intl/intl.dart';` to `settings_screen.dart` for the
new cache-freshness date formatting, and it shadowed Flutter's
`TextDirection.rtl` used elsewhere in that same file — a known gotcha
when mixing `intl` and Flutter in one file.

**Fix**: `import 'package:intl/intl.dart' hide TextDirection;` — keeps
`DateFormat` available, excludes the colliding enum, so Flutter's
`TextDirection.rtl` resolves correctly again.

Checked the rest of the project for the same pattern: `main.dart` also
uses `intl` (for `initializeDateFormatting`) but only imports
`package:intl/date_symbol_data_local.dart`, which doesn't re-export
`TextDirection` — so it wasn't affected. No other file imports `intl`.

---

# v1.4.0 — Real-usage bug fixes + feature requests

Based on actual device testing feedback. Prioritized real bugs first,
then feature requests, in the order reported.

## Bugs fixed

- **Audio playback failing on every attempt** ("تعذر تشغيل الصوت"):
  root cause was `audioplayers`' `.stop()` throwing when nothing was
  loaded yet — which is exactly the state on the very first tap. That
  exception was being caught and shown as a generic failure message
  every time. Fixed by isolating `.stop()` in its own try/catch and
  surfacing the *real* exception text if playback genuinely fails, so
  any future issue is diagnosable instead of a dead end.
- **Search failing on undiacritized input**: Quran text is fully
  vocalized (tashkeel) but users type plain letters. Added
  `ArabicTextUtils.normalize()` (strips diacritics/tatweel, folds
  أ/إ/آ→ا, ى→ي, ة→ه, ؤ→و, ئ→ي) and wired it into Quran surah-name search,
  Quran ayah-text search, and Azkar search.
- **Dark mode: Quran screens had light patches other screens didn't**:
  confirmed via project-wide grep that `quran_screen.dart` alone had
  hardcoded `Color(0xFFF8FAF6)` / `Colors.white` — replaced with
  theme-aware colors (`Theme.of(context).cardColor`, etc.) so it follows
  the same dark/light theme as every other screen.

## Features added

- **Multiple reciters**: 6 verified real reciters (Alafasy, Husary,
  Minshawi, Abdul Basit, Sudais, Maher Al-Muaiqly) from the same CDN
  already in use. Picker in the Surah reader, persisted app-wide.
- **Prayer location name**: resolved via OpenStreetMap Nominatim reverse
  geocoding (free, no key, uses the existing `http` dependency — no new
  package). Shown above the next-prayer card.
- **Manual city entry for prayer times**: uses AlAdhan's own
  `timingsByAddress` endpoint (geocodes server-side, same trusted
  provider already in use). Accessible via the prayer screen's menu or
  from the location-error screen.
- **Prayer mode persists across GPS being turned off**: last-used mode
  (GPS or manual city) and the last successful result are both cached,
  so closing location services doesn't lose your prayer times — this
  extends the offline-fallback behavior from v1.1.0 to also remember
  *which* location source you were using.
- **Mark prayer as done**: a checkbox per prayer, persisted per day.
- **Prayer reminder**: toggle, minutes-before slider, banner/sound/both
  mode, in Settings. **Explicitly labeled in the UI itself** as
  foreground-only (works while the app/screen is open) — true
  background push notifications need a notifications package and
  platform-level permission work I'm not adding sight-unseen; noted as
  a planned follow-up rather than silently limited.
- **Gregorian + Hijri date** on the Home Dashboard: pure-Dart tabular
  Hijri conversion (standard arithmetic algorithm, no new dependency).
  Like any calculated Hijri date without an official lookup table, it
  can differ by a day from a locally-announced moon-sighting-based
  calendar — this is a general limitation of arithmetic Hijri
  conversion, not specific to this implementation.
- **Real Duas ("الأدعية") tab**: discovered the already-integrated Hisn
  Al Muslim dataset contains 60+ genuine dua-specific categories.
  Added a second tab on the Azkar screen that filters to just those,
  reusing the same trusted data source rather than introducing a new,
  unverified "dua database".

## Still not done (unchanged reasoning, or new and explained below)

- **Full mushaf-style paginated Quran view** (Uthmani script laid out as
  actual mushaf pages, switchable with the current list view): the
  current Quran text source doesn't carry official mushaf page-break
  data, so a real page-accurate rendering needs a different/additional
  data source. Doing a fake approximation would look broken; deferred
  until a verified page-layout dataset is found.
- **7-day accomplishment summary**: needs a proper daily history log
  (current tracking only keeps "today"'s counts, overwriting daily) —
  real implementation, not just more prefs keys, planned for next pass.
- **Gharib al-Quran (rare word glossary)**: no verified dataset found
  yet, same reasoning as Tafsir.
- **Tafsir**: still no verified source found.
- **True background Adhan/push notifications**: needs
  `flutter_local_notifications` (or similar) + Android exact-alarm
  permission handling — a real new dependency + platform integration I
  can't verify compiles without your CI. Candidate for a dedicated pass.
- **Full English translation**: infrastructure (`flutter_localizations`,
  `supportedLocales`) has been in place since v1.1.0; translating every
  hardcoded Arabic string across every screen is a large, mechanical
  task better done as one clean, complete pass rather than partially.
- **Muslim Pro-inspired ideas**: noted for consideration, no code
  changes from this alone — happy to look at specific features you like
  from it and scope them the same way as everything else here.

## Verification

Full project-wide check this pass, beyond the usual brace/paren balance:
verified every relative import in every touched file resolves to a real
file, cross-checked every new service method's signature against every
call site (`PrayerService`, `AppSettings`), and specifically re-checked
for the `intl`/`TextDirection` collision pattern that broke v1.3.0's CI
build — confirmed `home_dashboard_screen.dart` (which also now imports
`intl` for date formatting) already uses the `hide TextDirection` fix
consistently. Still can't compile locally; push and send me the log if
anything surfaces.

---

# v1.5.0 — Tafsir, Mushaf view, real Adhan sounds, 7-day history

Tackling the items explicitly deferred from v1.4.0. Researched real data
sources for each before writing any code (see verification notes below)
rather than guessing at URLs.

## Added

**Tafsir**
- Real Tafsir Al-Muyassar dataset (6,236 entries, one per ayah), from a
  GitHub-hosted JSON source — verified structure and reachability before
  integrating (`TafsirRepository`, same offline-first cache pattern as
  Quran/Azkar).
- Toggle button (📖 icon) per ayah in the Surah reader expands/collapses
  its tafsir inline. Lazy-loaded on first use, not on screen open, so it
  doesn't cost a 2.7MB download for users who never open it.

**Mushaf-style paginated view**
- Real 604-page Madani Mushaf ayah-to-page mapping dataset — verified
  structure (juz number + per-page ayah lists, correctly handling pages
  that span two surahs) before integrating (`MushafRepository`).
- New swipeable page-by-page reading screen (`MushafViewScreen`),
  accessible via a book icon in the Quran tab's AppBar. This is a
  genuine page-accurate layout (not a cosmetic approximation) using the
  same real ayah text already in the app, justified and paginated
  according to the real mushaf page boundaries.

**Real Adhan sounds**
- 6 real Adhan recordings, officially hosted by AlAdhan
  (`cdn.aladhan.com`) — the exact same trusted provider already used for
  prayer times, listed at their own `/download-adhans` page.
- Prayer reminder mode now has 3 real options: banner only, short beep
  (system sound), or full Adhan (actually plays the selected recording).
  Previously "sound" mode was just a generic system alert beep; this
  replaces that with real Adhan audio.
- Adhan recording is user-selectable in Settings.

**7-day activity summary**
- Real daily history log, not a derived/quick-hack estimate: wird pages,
  Azkar completions, and prayers-done were already being written to
  date-keyed storage (from earlier passes); Tasbeeh's daily total is now
  also date-keyed the same way (see bug fix below).
- Home Dashboard shows a genuine 7-day view: one dot per day, filled by
  activity level, checkmarked if that day's wird target was met, plus a
  "target met X of 7 days" line. Not a static/example graphic — every
  number comes from what was actually logged that day.

## Bug caught and fixed during this pass

Tasbeeh's day-key format (`'${year}-${month}-${day}'`, unpadded) didn't
match the zero-padded format used everywhere else in the app
(`UserProgressService.dateKeyFor`, e.g. `'2026-07-05'` vs `'2026-7-5'`).
Left as-is, the 7-day summary would have silently shown 0 Tasbeeh
activity forever, even with real usage, because the read and write keys
would never match. Fixed by routing Tasbeeh's daily total through a new
`UserProgressService.incrementTasbeehDailyTotal()` that uses the
consistent format — caught before shipping, not after.

## Deferred, with reasons

- **Background/closed-app Adhan notifications**: needs
  `flutter_local_notifications` *and* changes to the CI workflow's
  Android-manifest-patching step, since `android/` is regenerated fresh
  on every build rather than committed. Attempting this blind, stacked
  on top of everything else in this pass, risked breaking the whole
  build with no way for me to verify it compiles. This is a real,
  scoped-out feature for a dedicated pass, not abandoned.
- **Gharib al-Quran**: searched again specifically for this pass — found
  only word-tokenization datasets (word counts/positions), not actual
  meanings/glossary data. Won't fabricate word definitions.
- **Full English translation**: `flutter_localizations` +
  `supportedLocales` infrastructure has been ready since v1.1.0;
  translating every hardcoded Arabic string across ~30 files is a large,
  mechanical task that deserves its own complete, careful pass rather
  than a partial one squeezed alongside 4 other major features.
- **Qibla compass**: would need a second new native-integration
  dependency (`flutter_compass`) in the same pass as the Adhan/audio
  work — stacking two unverifiable native changes at once is how builds
  break. Next pass.

## Verification

Before writing any integration code: cloned/fetched each candidate
dataset directly (Tafsir repo, Mushaf-pages repo, AlAdhan's Adhan
download page) and confirmed real structure + HTTP 200, rather than
guessing at a URL — this is the same discipline that caught the earlier
tafsir dead-end without cluttering the app with a broken feature.
Post-implementation: full project-wide brace/paren balance check, every
relative import in every touched file resolves to a real file, and a
specific re-check for the `intl`/`TextDirection` collision pattern
(confirmed `home_dashboard_screen.dart`, `settings_screen.dart` both use
the `hide TextDirection` fix; `main.dart` only imports the sub-package
that doesn't have the conflict). Same standing limitation: no Flutter
SDK in this sandbox, so your CI run is still the real test — send me the
log either way.

---

# v1.5.1 — Build fix

Your CI caught a real bug I introduced in v1.5.0:

```
lib/features/mushaf/mushaf_view_screen.dart:113:17: Error: No named parameter with the name 'textDirection'.
```

**Root cause**: I put `textDirection: TextDirection.rtl` on a `TextSpan`
inside the new Mushaf page view. `TextSpan` doesn't have that parameter —
only `Text`/`Text.rich`/`RichText` do. The outer `Text.rich(...)` already
had `textDirection: TextDirection.rtl` correctly set; the inner one on
`TextSpan` was simply wrong. This one's on me, not an environment quirk
— removed it.

Also cleaned up two things `flutter analyze` flagged in the same run
(both were "info"/"warning", not build-blocking, but worth fixing since
"fix deprecated APIs" was on your original list):
- Removed an unused import in `settings_screen.dart`
  (`prayer_service.dart`, no longer referenced there).
- Replaced Geolocator's deprecated `desiredAccuracy:` parameter with the
  current `locationSettings: LocationSettings(accuracy: ...)` API in
  `PrayerService`.

Full `flutter analyze` output from your log for reference — remaining
items are non-blocking style suggestions (`prefer_const_constructors`,
`use_build_context_synchronously` guarded by existing `mounted` checks)
that don't affect the build; can clean those up in a future pass if you
want a fully warning-free `flutter analyze`.

---

# v1.6.0 — Real-device bug reports, second round

Your build succeeded (v1.5.1) — this pass addresses new issues found
through actual usage.

## Bugs fixed

- **Full-surah audio silent (per-ayah worked fine)**: the CDN's own docs
  warn that surah-level audio isn't guaranteed at every bitrate for
  every reciter, unlike ayah-level audio. Added a fallback that tries
  128→64→192→32 in order instead of assuming one value. I could not
  verify this empirically — the CDN blocks this sandbox's requests
  (403) — so this is the most defensible fix available, not a confirmed
  one. If it's still silent, the exact reciter+bitrate that works can be
  found from a browser on a real device and hardcoded as the first try.
- **Search result didn't jump to the actual ayah, only the surah start**:
  root cause found — `ListView.builder` only builds visible list items,
  so a search result far down a long surah (e.g. ayah 200) had no built
  widget yet, and `Scrollable.ensureVisible` was silently failing on a
  null context. Fixed with a real jump-then-refine approach: estimate
  the scroll position, jump there so the target enters the built range,
  then retry `ensureVisible` across a few frames.
- **Home Dashboard's "المفضلة" (Favorites) card opened the entire Azkar
  screen**, not a filtered favorites view, and didn't include Quran
  favorites at all. Built a real unified `FavoritesScreen` (Quran ayahs
  + Azkar, tabbed) and fixed the card to open it.

## Features added

- **Mark-as-prayed now time-gated**: the checkbox is disabled until a
  prayer's actual time has passed — you can no longer mark Isha done at
  9am.
- **Tasbeeh grand total**: a combined count across every phrase (built-in
  + custom), shown alongside the existing per-phrase total.
- **Adhan/beep preview**: replaced the plain dropdown with a real list
  where each of the 6 Adhan recordings has its own play/stop preview
  button, so you can hear before choosing. Added a "تجربة النغمة" preview
  button for the beep mode too.
- **7-day summary now starts on Saturday** (regional week-start
  convention) instead of a rolling "last 7 days ending today" window —
  it's now a real Saturday–Friday calendar week. Days later than today
  show as dimmed/not-yet-happened rather than blank. Day names switched
  from clipped 3-letter abbreviations to full names
  (السبت/الأحد/الاثنين/...) laid out with `Expanded` columns so they
  don't get cut off, and today is highlighted with a gold ring.

## Deferred, with reasons

- **Stop Adhan/reminder audio on volume button press**: needs
  intercepting hardware key events, which means custom `MainActivity.kt`
  code (overriding `dispatchKeyEvent`, a `MethodChannel` to notify
  Flutter) *and* a CI workflow update to inject that file after
  `flutter create` regenerates `android/` fresh every build (it isn't
  committed). This is real, buildable work, but it's its own isolated
  native-integration feature — bundling it into an already-large fix
  pass, unverifiable by me either way, is how a build breaks. Next
  focused pass.

## Verification

Full project-wide brace/paren balance check, every relative import in
every touched file resolves to a real file, a specific re-check for the
`TextSpan`/`textDirection` mistake class from v1.5.0 (none found this
time), the `intl`/`TextDirection` collision pattern (still correctly
guarded everywhere `intl` is imported), and confirmed the three
independent `AudioPlayer` instances (Quran reader, Prayer reminder,
Settings preview) don't share state. Same standing limitation: no
Flutter SDK in this sandbox, so your CI run is still the real test.

---

# v1.7.0 — Audio, Tafsir, and Mushaf-view fixes

## Fixed

**Full-surah audio still silent after the v1.6.0 bitrate fallback**
Changed strategy entirely instead of guessing at more bitrates: rather
than depending on the CDN's separate full-chapter endpoint (which isn't
guaranteed to exist for every reciter — the docs explicitly warn about
this, and my bitrate fallback attempt apparently didn't cover the actual
gap), "play whole surah" now **auto-chains the per-ayah audio**, which
is confirmed working on your device. Tap "تشغيل السورة كاملة" and it
plays ayah 1, then automatically advances to ayah 2, 3, ... until the
surah ends, highlighting the currently-reciting ayah as it goes (a
bonus: you can now see exactly which ayah is playing during full-surah
playback, which the old single-file streaming couldn't offer). This is
real-by-construction — it reuses the exact same working mechanism as
individual ayah playback, not a new unverified path.

**Tafsir repeatedly failing to load**
Re-verified the data source is live and fast from this sandbox (200 OK,
under 1 second), so the file itself is fine. Two real improvements made
regardless, since I can't see your device's actual network conditions:
- Timeout increased from 25s to 45s (2.7MB can be slow on mobile data).
- JSON parsing (which blocks for a moment on a file this size) now runs
  in a background isolate via `compute()` instead of the UI thread.
- The error message now distinguishes an actual timeout from other
  failures, and includes a one-tap retry action, instead of one generic
  message every time.
- Applied the same fixes to the Mushaf-pages repository, since it's a
  comparable size and could hit the same class of issue even though it
  hadn't been reported yet.

**Mushaf-style view was there but not a real "choice"**
The icon button from v1.5.0 was too easy to miss. Added:
- A properly labeled button ("عرض كصفحات المصحف") at the top of the
  Quran tab's Surah list — an explicit, visible choice, not a hidden icon.
- A matching button directly in the Surah reader's AppBar, which jumps
  to the correct starting mushaf page for whichever surah you're
  currently reading (new `MushafRepository.firstPageForSurah` helper),
  rather than always opening at page 1.

## Verification

Re-confirmed both large data source URLs are live before making any
changes. Full project-wide brace/paren balance check, every relative
import resolves, re-checked for the `TextSpan`/`textDirection` mistake
class from v1.5.0 (none found), and confirmed `compute()` is only used
with the static, single-argument, side-effect-free `_parse` functions it
requires. Same standing limitation: no Flutter SDK in this sandbox, so
your CI run is still the real test — and for the audio fix specifically,
your device is the only way to confirm it actually plays correctly now,
since I can't stream from that CDN in this sandbox at all.

---

# v1.8.0 — Encoding, gapless audio, and instant counters

## Fixed

**Tafsir displayed as garbled symbols instead of Arabic**
Real root cause: Dart's `http` package decodes `response.body` as
Latin-1 by default when a server doesn't explicitly declare
`charset=utf-8` in its `Content-Type` header — this mangles multi-byte
UTF-8 Arabic text into unreadable symbols (classic "mojibake"). Fixed by
explicitly decoding as UTF-8 via `utf8.decode(response.bodyBytes)`
instead of `response.body`. Applied this fix everywhere the app fetches
text data — Quran, Azkar, Tafsir, Mushaf pages, and the prayer-times
reverse-geocoding response (which returns Arabic city/country names) —
since all of them were equally exposed to this bug even though only
Tafsir had been reported broken so far.

**Audible gap between ayahs during "play whole surah"**
The sequential-ayah approach from v1.7.0 fixed reliability but each
ayah needed a fresh network fetch before playing, causing a pause at
every transition. Implemented real double-buffering: two alternating
audio players. While the current ayah plays, the next one is silently
preloaded (`setSourceUrl` — the officially documented pattern for this
exact use case) in the background. When the current ayah ends, the
already-buffered next one starts near-instantly via `resume()` instead
of a fresh fetch+play, closing the gap. Falls back gracefully to a
normal fetch if a preload wasn't ready in time.

**Delay after each tap on the Azkar counter**
Real cause found: the on-screen number was waiting for the *entire*
save-to-disk sequence (multiple `SharedPreferences` writes, each a real
platform-channel round trip) to complete before updating — not a
device-performance issue. Fixed with an optimistic UI update: the
counter increments on screen immediately, and the save happens in the
background afterward. Applied the identical fix to the Tasbeeh counter
too, which had the exact same pattern (not yet reported, but the same
class of bug — worth fixing proactively rather than waiting to be
told).

## Verification

Full project-wide brace/paren balance check, every relative import
resolves, confirmed zero remaining `response.body` usages across all
network-fetching services, and verified `AudioPlayer.setSourceUrl()` is
a real, documented method in the pinned `audioplayers` version (not
assumed). Same standing limitation: no Flutter SDK in this sandbox. The
gapless-audio fix in particular can only be truly judged on your device
— send me a report either way once you've tried it.

---

# v1.9.0 — Audio architecture fix, Bismillah, robust search-scroll, Mushaf audio

## Fixed

**Audio stopped after the second ayah instead of continuing the surah**
Real bug found in the v1.8.0 double-buffering code: the two players'
`onPlayerComplete` listeners were registered as
`(_) => _handlePlaybackComplete(_player)` — but `_player` is a mutable
field that gets *reassigned* every time the active/standby players swap.
Dart closures read fields fresh each time they fire, so after the first
swap, both listeners started reporting the wrong player as the one that
completed, and playback silently stopped instead of advancing. Fixed by
capturing the actual player objects in local variables at
listener-registration time, so each listener always correctly reports
which physical player fired the event, regardless of later swaps.

**Search result still not landing on the exact ayah**
The v1.6.0 fix (estimate a scroll position, then retry) could still fail
for ayahs far into a long surah, because a single average-height guess
can land far outside what `ListView.builder`'s cache actually built, and
no amount of *waiting* fixes that without scrolling further. Replaced it
with a proper binary search over the actual scroll offset: jump to a
candidate position, check which ayahs actually got built nearby, and use
that as the search signal (if everything built there has a lower ayah
number, search further down; if higher, search further up) — narrowing
in on the target regardless of how uneven ayah card heights are. Doesn't
depend on guessing anything.

## Added

**Quran audio now survives navigating between screens**
This was the root cause behind two separate requests (continuous
playback across app screens, and audio controls in the Mushaf view).
The audio player used to live inside `SurahReaderScreen`'s own state,
so leaving that screen destroyed it and stopped playback. Extracted all
playback logic into a new app-wide `QuranAudioService` (not owned by
any screen), fixing the underlying architecture issue directly rather
than patching around it:
- Playback now continues if you switch bottom-nav tabs or navigate
  elsewhere in the app.
- The Mushaf page view can now control the *same* playback session —
  tap any ayah on a mushaf page to play it, with the currently-playing
  ayah highlighted inline (gold background) right in the flowing page
  text, not as a separate button breaking the mushaf-style layout.
- Both views now correctly show "not playing" for a surah that isn't
  the one currently active, instead of one screen's state leaking into
  another's.

**Bismillah at the start of surahs**
Added — every surah except Al-Fatihah (whose ayah 1 already *is* the
Bismillah in the underlying text, so showing it again would duplicate
it) and At-Tawbah (which traditionally omits it) now shows
"بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ" at its start, in both the Surah
reader header and the Mushaf page view.

**Mushaf page visual styling**
Added a bordered/framed card per page (gold border, subtle shadow) to
read more like an actual page rather than plain scrolling text, plus a
bordered surah-name banner where a surah begins on a page. Real
Uthmani-script calligraphy (the exact glyph style used in printed
mus'hafs) would need a dedicated font asset I don't have a verified
source for yet — this is a styling improvement within that constraint,
not a claim of pixel-perfect mushaf reproduction.

## Still true: residual gap between ayahs

The double-buffering preload (v1.8.0) closes the gap when the next
ayah's fetch finishes before the current one ends — but for very short
ayahs, network fetch time can still exceed playback time, so some gap
may remain in those cases. This is a real network-latency constraint of
per-ayah streaming, not a bug in the preload logic itself. With the
stop-after-ayah-2 bug now fixed, playback should at least reliably
continue through the whole surah even where a gap does occur.

## Verification

Full project-wide brace/paren balance check, every relative import
resolves, re-confirmed no `TextSpan`/`textDirection` mistakes, and
specifically verified the Settings and Prayer screens' own independent
`AudioPlayer` instances (used for Adhan preview/reminders) are untouched
and correctly separate from the new Quran audio service — they
shouldn't interfere with each other. Same standing limitation: no
Flutter SDK in this sandbox, so your CI run and your device are still
the real tests, especially for whether playback now truly continues
across screens and through the whole surah.

---

# v1.10.0 — Investigated a reported Quran text error

You flagged what looked like a wrong word in ayah 3:93 (a screenshot of
"إِسْرَـٰٓءِيلَ"). Took this seriously and actually verified it rather
than guessing from the image.

## What I checked

Pulled the exact JSON file the app fetches and diffed **all 6,236 ayat**
against a second, fully independent Tanzil-licensed source
(`q-ran/quran` on GitHub). First pass found 295 differences; tracing
every one down, all of them turned out to be Unicode encoding
convention differences between two valid digitizations of the same
authentic text (e.g. "hamza + combined madda" vs "hamza + separate
alef" for the same sound — a documented change from Tanzil's 2021 script
update — or a space present/absent between the same two words). After
properly normalizing for that, **zero genuine wrong-word differences**
turned up anywhere in the Quran text. Ayah 3:93 specifically matches
both sources word-for-word.

## What was actually going on

The specific word you pointed to — "إِسْرَٰٓءِيلَ" (Isra'il) — is
correctly spelled exactly as it appears in certified printed mus'hafs.
Uthmani Quranic orthography omits a full written alef for the long "aa"
sound in this word (and a handful of others: الرحمن, هذا, ذلك, لكن) and
instead uses a small floating "dagger alef" mark. This is authentic, not
a typo — but it's a genuinely unusual glyph combination that most
everyday Arabic fonts don't render properly, which can make correctly-
encoded text visually look broken even though nothing is wrong
underneath.

## Real fix: bundled a proper Quranic font

The app had no dedicated Quran font — it was relying entirely on
whatever font each Android device ships with. Found, verified (real
GitHub repo, real file, checked the license text directly), and bundled
**Amiri Quran** — a font specifically built for Quranic text with full
support for Uthmani combining marks, under the SIL Open Font License
(which explicitly permits bundling in apps). Applied everywhere Quran
text is displayed: the Surah reader, the Mushaf page view, Bismillah,
and ayah preview snippets in search/favorites. Added proper attribution
in Sources & Licenses per the license's requirements.

## Verification

Full diff script output reviewed line-by-line before drawing any
conclusion — not just a pass/fail count. Verified the font file (167KB,
not corrupted) and its license text directly from the real repository
before bundling anything. Full project-wide brace/paren balance check,
every relative import resolves, confirmed the font asset is correctly
declared in `pubspec.yaml`. This is a genuine, sourced font asset now
committed to the repo — first time this project has bundled a binary
asset rather than fetching data over the network, so it's worth
double-checking the CI build picks it up correctly.

---

# v1.11.0 — Muslim Pro feature comparison: what's real, what isn't

You asked for the full Muslim Pro feature set. Triaged honestly rather
than pretending everything is a coding task — see below for what's
categorically out of scope and why.

## Out of scope — not a code limitation, a real-world one

- **Qalbox (movies/TV/documentaries)**: needs licensed media content and
  video hosting. No code fix for "we don't own the content."
- **Hajj/Umrah booking**, **donation/Sadaqah platform**: need regulated
  payment processing and real business partnerships (travel agencies,
  charities). Can't fabricate either.
- **Live Islamic classes/webinars**: needs actual instructors and
  live-streaming infrastructure.
- **AI Islamic assistant (AiDeen-style)**: declined deliberately, not
  just for difficulty — a chatbot giving confident religious rulings
  can cause real harm if wrong, and that needs genuine scholarly
  oversight I can't provide.
- **Ummah community feed**: contradicts a decision already made for this
  app (the original brief explicitly said no public feed) and adds
  moderation obligations I shouldn't casually bolt on.
- **Mosque/halal finder**: deferred this round, not declined — feasible
  using free OpenStreetMap data (no paid API key needed, unlike Google
  Places), but is its own scoped feature with real UI work; next pass.
- **Home-screen widgets**: needs native Android widget code I can't
  verify compiles blind — same reasoning as prior native-code
  deferrals.

## Added — real, aligned with the app's design

- **Zakat calculator**: standard 2.5% rate on zakatable wealth (cash,
  gold/silver by market value, investments, business goods, receivables,
  minus debts) above the nisab threshold. Deliberately does **not**
  claim a live gold price — that needs a paid market-data feed and would
  be stale within days. Instead the user enters the current nisab value
  themselves, with guidance on where to find it. Caught and fixed a real
  bug while building this: the amount fields initially used a broken
  `context.markNeedsBuild()` trick that wouldn't have actually
  recalculated the total — fixed with proper callback wiring before
  shipping.
- **99 Names of Allah (Asma-ul-Husna)**: the standard 99-name list with
  transliteration and meaning, tap any name for detail.
- **Ramadan companion**: suhoor/iftar countdown built from the same real
  prayer-time data already used elsewhere (Fajr = suhoor cutoff, Maghrib
  = iftar) — not a separate feature needing its own data source. Daily
  fasting tracker, with a Ramadan-day-count display when the current
  Hijri month is Ramadan.
- **"أدعيتي" (My Duas)**: a personal space to write and save your own
  duas — distinct from the Azkar screen's existing "الأدعية" tab (which
  surfaces the ~60 pre-written categories from Hisn Al Muslim). This is
  for the user's own words, private to their device, never shared.
- All four grouped under a new "أدوات إسلامية" hub, linked from the Home
  Dashboard's app bar.

## Verification

Full project-wide brace/paren balance check, every relative import
resolves, verified the 99 Names list has exactly 99 entries (not 98 or
100 from a copy-paste slip). Same standing limitation: no Flutter SDK in
this sandbox, so your CI run is still the real test.

---

# v1.12.0 — Mosque & Halal Restaurant Finder

Picking up the item explicitly deferred from v1.11.0.

## Added

**Mosque & halal restaurant finder**
Real implementation using the free, public Overpass API over
OpenStreetMap data — no paid API key or Google billing account needed,
unlike the Google Places API most similar features rely on. Verified
the tagging scheme (`amenity=place_of_worship` + `religion=muslim` for
mosques) against OpenStreetMap's own official wiki before building on
it, since I couldn't directly test the live endpoint from this sandbox
(not on the network allowlist — same situation as the Quran audio CDN
earlier in this project).

- Two tabs: nearby mosques, and nearby halal-tagged restaurants.
- Real distance calculation (haversine formula — proper great-circle
  distance, not a flat approximation that would be measurably wrong at
  city scale) and sorted nearest-first.
- Tap any result to open it directly in Maps.
- Honest coverage caveat shown in the empty-state message: OpenStreetMap
  is community-mapped, so results depend entirely on what's been mapped
  in a given area — mosque tagging is fairly consistent, but halal
  restaurant tagging (`diet:halal`) is applied far less consistently, so
  that tab will under-report real options in most areas. Said plainly
  rather than presenting it as a complete directory.
- Added the required OpenStreetMap (ODbL) attribution to Sources &
  Licenses — this isn't optional decoration, it's a license requirement
  for using the data at all.

## New dependency: `url_launcher`

Needed to actually open a result in Maps — there's no way to do that
without it. Chose it deliberately: it's an official Flutter-team
package, about as low-risk as a Flutter dependency gets.

**Also updated the CI workflow**: `url_launcher` needs a `<queries>`
declaration in `AndroidManifest.xml` for Android 11+'s package
visibility rules, or `launchUrl()` can silently fail on newer devices.
Since `android/` is regenerated fresh every build (not committed),
patched the existing manifest-patching step to add this alongside the
permissions it already injects — same proven pattern, extended rather
than replaced.

## Verification

Full project-wide brace/paren balance check, every relative import
resolves, confirmed `url_launcher` is properly imported and used, and
specifically re-verified the CI workflow edit matches the exact
byte-for-byte pattern of the already-proven-working permissions patch
(including its `\\n` escaping quirk) rather than "fixing" something that
has been building successfully across many versions. Same standing
limitation: no Flutter SDK in this sandbox, and this feature specifically
needs your device to confirm both the Overpass query behavior and the
Maps hand-off actually work end-to-end.

---

# v1.13.0 — Transliteration & Offline Audio Downloads

The two items explicitly left open from v1.12.0.

## Added

**Transliteration**
Found and verified a real dataset before touching any code — it's from
the *same* project (`risan/quran-json`) already powering the app's
Quran text, same Tanzil.net sourcing, same surah/ayah numbering.
Verified completeness directly (114 surahs, exactly 6,236 verses) and
reachability before wiring it in. Toggle it on in Settings
("إظهار النطق بالحروف اللاتينية") and it shows under every ayah in the
reader — a persistent setting rather than a per-ayah button, since
someone learning to read wants it consistently, not toggled one ayah at
a time. Same offline-first caching and background-isolate JSON parsing
as Tafsir.

**Offline audio downloads**
Real local-file downloads, not just a bigger stream cache. Tap the
download icon in the Surah reader to fetch every ayah of that surah (for
the currently-selected reciter) to app-private storage — no Android
storage permission needed, since it's app-private, not public storage.
Once downloaded:
- Playback checks for the local file first and uses it instantly,
  falling back to streaming automatically for anything not downloaded.
- The gapless-playback preloader also checks for local files first,
  skipping the network preload entirely when a file's already there.
- Download is cancellable mid-way (checked between ayahs, not
  mid-file-write, so cancelling never leaves a corrupted partial file).
- Settings' Data Management now shows real total storage used by
  downloaded audio (calculated from actual file sizes, not an estimate)
  with a "delete all" option.

## New dependencies

- `path_provider`: needed for app-private storage access. Low risk —
  it was already present in the dependency tree transitively (via
  `audioplayers`), so this just makes it a direct, explicitly-declared
  dependency for the code that now calls its API directly, rather than
  introducing a new package into the resolution graph.
- Verified `DeviceFileSource` (used for local-file playback) is a real,
  documented class in `audioplayers`, specifically built for exactly
  this use case, before relying on it.

## Verification

Full project-wide brace/paren balance check, every relative import
resolves, re-confirmed no `TextSpan`/`textDirection` mistakes, and
specifically verified both new package APIs (`DeviceFileSource`,
`path_provider`'s directory access) against real documentation before
shipping — not assumed from memory. Same standing limitation: no
Flutter SDK in this sandbox, so your CI run and device are still the
real tests, especially for whether downloaded files play correctly
offline and whether storage cleanup works as expected.


---

## v1.48.0 — Full Internationalisation (i18n)

### 7 languages now fully supported
| Code | Language | Direction |
|------|----------|-----------|
| ar   | العربية  | RTL ←     |
| en   | English  | LTR →     |
| de   | Deutsch  | LTR →     |
| tr   | Türkçe   | LTR →     |
| fr   | Français | LTR →     |
| es   | Español  | LTR →     |
| id   | Bahasa Indonesia | LTR → |

### What changed
- `lib/l10n/app_fr.arb`, `app_es.arb`, `app_id.arb` — 3 new translation files (574 keys each)
- `lib/l10n/generated/app_localizations.dart` — pre-generated delegate (no `flutter gen-l10n` needed in CI)
- `lib/core/services/settings_service.dart` — added `locale`, `setLocale()`, `kSupportedLocales`, `kLanguageNames`
- `lib/main.dart` — wired `AppLocalizations.delegate`, `supportedLocales`, `Directionality`
- `lib/features/settings/settings_screen.dart` — language dropdown picker added
- `l10n.yaml` — updated config

### How to add a new language
1. Copy `lib/l10n/app_en.arb` → `lib/l10n/app_ur.arb` and translate all values.
2. Add `Locale('ur')` to `kSupportedLocales` in `settings_service.dart`.
3. Add `'ur': 'اردو'` to `kLanguageNames`.
4. Add `_AppLocalizations_ur` class in `app_localizations.dart` (or run `flutter gen-l10n`).
