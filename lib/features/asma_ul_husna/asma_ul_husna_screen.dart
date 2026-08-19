import 'package:flutter/material.dart';

import '../../core/data/asma_ul_husna.dart';
import '../../core/theme/app_theme.dart';
import '../../l10n/generated/app_localizations.dart';

class AsmaUlHusnaScreen extends StatelessWidget {
  const AsmaUlHusnaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.asmaUlHusnaTitle), centerTitle: true),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 0.95,
        ),
        itemCount: AsmaUlHusna.all.length,
        itemBuilder: (context, index) {
          final name = AsmaUlHusna.all[index];
          return InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: () => _showDetails(context, name),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppColors.goldAccent.withValues(alpha: 0.25)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${name.number}', style: const TextStyle(color: AppColors.goldAccent, fontSize: 11, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 6),
                  Text(
                    name.arabic,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.primaryEmerald),
                  ),
                  const SizedBox(height: 6),
                  Text(name.transliteration, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, color: AppColors.mutedText)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showDetails(BuildContext context, AsmaName name) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(name.arabic, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primaryEmerald), textDirection: TextDirection.rtl),
              const SizedBox(height: 8),
              Text(name.transliteration, style: const TextStyle(fontSize: 16, color: AppColors.mutedText)),
              const SizedBox(height: 16),
              Text(
                name.meaningFor(Localizations.localeOf(context).languageCode),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, height: 1.6),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
