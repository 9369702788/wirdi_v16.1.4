import 'package:flutter/material.dart';
import '../../core/services/daily_reminder_scheduler.dart';
import '../../core/services/settings_service.dart';
import '../../core/services/user_progress_service.dart';
import '../../core/theme/app_theme.dart';
import '../../l10n/generated/app_localizations.dart';

class _Slide {
  final IconData icon;
  final String Function(AppLocalizations) titleFor;
  const _Slide(this.icon, this.titleFor);
}

final _slides = [
  _Slide(Icons.menu_book_outlined, (l10n) => l10n.onboardingSlide1),
  _Slide(Icons.check_circle_outline, (l10n) => l10n.onboardingSlide2),
  _Slide(Icons.nightlight_outlined, (l10n) => l10n.onboardingSlide3),
];

class OnboardingScreen extends StatefulWidget {
  final VoidCallback onFinished;
  const OnboardingScreen({super.key, required this.onFinished});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _index = 0;
  int _selectedGoal = 5;
  bool _enableReminders = true;
  bool _finishing = false;

  int get _pageCount => _slides.length + 1;
  bool get _isGoalPage => _index == _slides.length;

  Future<void> _finish() async {
    if (_finishing) return;
    _finishing = true;
    final l10n = AppLocalizations.of(context);
    await UserProgressService.setDailyWirdTarget(_selectedGoal);
    if (_enableReminders) {
      for (final key in ['dailyWird', 'morningAzkar', 'eveningAzkar']) {
        final current = appSettings.dailyReminder(key);
        await appSettings.setDailyReminder(key, current.copyWith(enabled: true));
      }
      await DailyReminderScheduler.rescheduleAll(l10n);
    }
    widget.onFinished();
  }

  Widget _goalCard({required int pages, required String title, required String subtitle}) {
    final selected = _selectedGoal == pages;
    return Semantics(
      button: true,
      label: '$title. $subtitle',
      onTap: () => setState(() => _selectedGoal = pages),
      child: GestureDetector(
      onTap: () => setState(() => _selectedGoal = pages),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryEmerald.withValues(alpha: 0.1) : null,
          border: Border.all(color: selected ? AppColors.primaryEmerald : AppColors.mutedText.withValues(alpha: 0.3), width: selected ? 2 : 1),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Icon(selected ? Icons.radio_button_checked : Icons.radio_button_unchecked, color: selected ? AppColors.primaryEmerald : AppColors.mutedText),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
                  Text(subtitle, style: const TextStyle(fontSize: 12, color: AppColors.mutedText)),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: TextButton(
                onPressed: widget.onFinished,
                child: Text(l10n.onboardingSkip),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pageCount,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (context, i) {
                  if (i == _slides.length) {
                    return SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          Text(
                            l10n.onboardingGoalTitle,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 20),
                          _goalCard(pages: 2, title: l10n.onboardingGoalLight, subtitle: l10n.onboardingGoalLightDesc),
                          _goalCard(pages: 5, title: l10n.onboardingGoalRegular, subtitle: l10n.onboardingGoalRegularDesc),
                          _goalCard(pages: 10, title: l10n.onboardingGoalAdvanced, subtitle: l10n.onboardingGoalAdvancedDesc),
                          const SizedBox(height: 16),
                          SwitchListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(l10n.onboardingEnableReminders),
                            subtitle: Text(l10n.onboardingEnableRemindersDesc),
                            value: _enableReminders,
                            activeTrackColor: AppColors.primaryEmerald,
                            onChanged: (value) => setState(() => _enableReminders = value),
                          ),
                        ],
                      ),
                    );
                  }
                  final slide = _slides[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: AppColors.primaryEmerald.withValues(alpha: 0.08),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(slide.icon, size: 56, color: AppColors.primaryEmerald),
                        ),
                        const SizedBox(height: 32),
                        Text(
                          slide.titleFor(l10n),
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pageCount,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: i == _index ? 20 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: i == _index ? AppColors.primaryEmerald : AppColors.primaryEmerald.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_isGoalPage) {
                      _finish();
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeOut,
                      );
                    }
                  },
                  child: Text(_isGoalPage ? l10n.onboardingStart : l10n.onboardingNext),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
