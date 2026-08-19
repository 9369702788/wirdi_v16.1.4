
import 'package:flutter/material.dart';
import '../../../core/services/radio_service.dart';
import '../../../core/theme/app_theme.dart';
import '../../../l10n/generated/app_localizations.dart';

class SleepTimerSheet extends StatelessWidget {
  const SleepTimerSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final svc = RadioService.instance;
    const options = [15, 30, 45, 60, 90];

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(width: 40, height: 4,
              decoration: BoxDecoration(color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2))),
          const SizedBox(height: 16),
          Text(l.radioSleepTimer,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(l.radioSleepTimerSubtitle,
              style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
              textAlign: TextAlign.center),
          const SizedBox(height: 20),
          ListenableBuilder(
            listenable: svc,
            builder: (_, __) {
              if (!svc.hasSleepTimer) return const SizedBox.shrink();
              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.goldAccent.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.goldAccent.withOpacity(0.4)),
                ),
                child: Row(children: [
                  const Icon(Icons.bedtime, color: AppColors.goldAccent, size: 20),
                  const SizedBox(width: 8),
                  Text(l.radioSleepTimerActive(svc.sleepMinutesRemaining ?? 0),
                      style: const TextStyle(color: AppColors.goldAccent, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  TextButton(
                    onPressed: () { svc.cancelSleepTimer(); Navigator.pop(context); },
                    child: Text(l.radioSleepTimerCancel,
                        style: const TextStyle(color: Colors.red)),
                  ),
                ]),
              );
            },
          ),
          Wrap(
            spacing: 10, runSpacing: 10,
            children: options.map((min) => FilledButton.tonal(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primaryEmerald.withOpacity(0.1),
                foregroundColor: AppColors.primaryEmerald,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              onPressed: () { svc.setSleepTimer(min); Navigator.pop(context); },
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Text('$min', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Text(l.radioMinutes, style: const TextStyle(fontSize: 11)),
              ]),
            )).toList(),
          ),
        ],
      ),
    );
  }
}
