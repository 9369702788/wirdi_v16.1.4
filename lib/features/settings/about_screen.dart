import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import '../../l10n/generated/app_localizations.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.aboutTitle), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                color: AppColors.primaryEmerald.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.spa_outlined, color: AppColors.primaryEmerald, size: 40),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(l10n.appTitle, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
          ),
          const SizedBox(height: 4),
          Center(
            child: Text(l10n.aboutTagline, style: const TextStyle(color: AppColors.mutedText)),
          ),
          const SizedBox(height: 4),
          Center(
            child: Text(l10n.aboutVersion, style: const TextStyle(color: AppColors.mutedText, fontSize: 12)),
          ),
          const SizedBox(height: 28),
          Text(
            l10n.aboutBody,
            style: const TextStyle(height: 1.8),
          ),
        ],
      ),
    );
  }
}
