# Wirdi (وردي) – Premium UI/UX Specification & Implementation Brief
**Vision:** Wirdi = Islamic Apple Health. تطبيق يبني حياة يومية مرتبطة بالقرآن والذكر والصلاة.
## Design System
- Primary Emerald: `#0F766E`
- Gold Accent: `#D4AF37`
- Light Background: `#F8FAF6`
- Dark Background: `#071A17`
- Dark Card: `#102925`
- Arabic UI Font: Cairo / IBM Plex Arabic
- Quran Font: Amiri Quran or verified Uthmani font
## v1.0 scope
Splash, Onboarding, Home Dashboard, Quran Library, Quran Reading, Audio Player, Daily Wird, Azkar, Tasbeeh, Prayer Times, Khatma, Settings, Privacy, Licenses.
## Screens
### 1. Splash Screen
**Goal:** إعطاء إحساس روحاني فاخر عند بداية التطبيق
- Gradient Emerald/Gold
- شعار وردي في المنتصف
- Fade + Light Sweep
- مدة العرض 2 ثانية
**Sample:**
```
وردي
رفيقك اليومي للذكر والقرآن
```
### 2. Onboarding 3 Slides
**Goal:** تعريف المستخدم بالفكرة قبل الدخول
- Slide 1: اجعل القرآن جزءًا من يومك
- Slide 2: تابع وردك اليومي وابنِ عادة
- Slide 3: ذكّر قلبك قبل أن يذكرك الوقت
- Buttons: ابدأ رحلتك / تخطي
### 3. Login / User Setup
**Goal:** اختيار طريقة الاستخدام والهدف الشخصي
- استخدام بدون حساب
- Google / Apple لاحقًا
- اختيار الهدف: ختم القرآن، الأذكار، الصلاة، عادة يومية
### 4. Home Dashboard
**Goal:** أهم شاشة في التطبيق وتلخص اليوم الإيماني
- Greeting
- Daily progress card
- Next prayer countdown
- Continue reading
- Dhikr of the day
### 5. Quran Library
**Goal:** فهرس القرآن والبحث والمفضلة والتحميل
- Tabs: السور / الأجزاء / المفضلة
- Search
- Bookmark
- Download
### 6. Quran Reading
**Goal:** قراءة القرآن بأسلوب قريب من المصحف مع أدوات حديثة
- Uthmani font
- Dark mode
- Audio controls
- Favorite / Share / Bookmark
- Font settings
### 7. Audio Player
**Goal:** تجربة تشغيل صوتية شبيهة بتطبيقات الموسيقى
- Progress bar
- Previous / Play / Next
- Playback speed
- Reciter name
- Surah metadata
### 8. Reciters
**Goal:** اختيار القارئ وحفظه
- Search
- Favorite reciter
- Preview play
- Persist selection
### 9. Daily Wird
**Goal:** تتبع الورد اليومي وبناء العادة
- Pages target
- Progress
- Streak
- Start reading
### 10. Khatma Tracker
**Goal:** متابعة الختمة وخطة الإنجاز
- Progress percent
- Daily goal
- Estimated finish date
- Completed khatmas
### 11. Azkar Home
**Goal:** تصنيفات الأذكار
- Morning
- Evening
- Sleep
- After prayer
- Travel
### 12. Azkar Reading
**Goal:** قراءة الذكر مع عداد تكرار
- Target count
- Progress counter
- +1 interaction
- Completion animation
### 13. Tasbeeh
**Goal:** سبحة رقمية Minimal
- Large counter
- Haptic feedback
- Daily/total stats
- Optional sound
### 14. Prayer Times
**Goal:** مواقيت الصلاة بتصميم Clock حديث
- Next prayer
- Countdown
- Five prayers grid
- Calculation method settings
### 15. Qibla
**Goal:** ميزة مؤجلة للنسخة 1.1
- Full compass
- Kaaba icon
- Degrees
- Real-device compass testing
### 16. Islamic Calendar
**Goal:** تقويم هجري وأيام فاضلة
- Hijri date
- Important days
- Ramadan/Ashura/Friday prompts
### 17. Progress & Achievements
**Goal:** Gamification للالتزام اليومي
- Streak
- Khatmas
- Dhikr count
- Badges
### 18. Community / Family
**Goal:** مشاركة الإنجاز بدون شبكة اجتماعية مفتوحة
- Share achievement card
- Family-only sharing
- No public feed
### 19. Settings
**Goal:** إدارة التطبيق والصوت والتنبيهات
- Dark mode
- Language
- Font size
- Reciter
- Prayer calculation
- Notifications
### 20. Premium
**Goal:** رؤية مستقبلية للإيرادات لا تضغط على v1.0
- No ads
- Advanced stats
- Multiple khatmas
- Offline recitations
## Architecture
```text
lib/
  core/ theme/ services/ storage/ notifications/
  features/ home/ quran/ audio/ azkar/ prayer/ tasbeeh/ khatma/ settings/ profile/
```
## Release checklist
- flutter analyze
- flutter test
- flutter build appbundle --release
- Test audio, downloads, prayer times, notifications, dark mode, and labels on real devices.
