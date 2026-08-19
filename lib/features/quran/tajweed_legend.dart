import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import '../../l10n/generated/app_localizations.dart';

void showTajweedLegend(BuildContext context) {
  final l10n = AppLocalizations.of(context);
  showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(l10n.tajweedLegendTitle),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.tajweedLegendIntro, style: const TextStyle(fontSize: 13, color: AppColors.mutedText)),
            const SizedBox(height: 16),
            _legendRow(AppColors.tajweedQalqalah, l10n.tajweedQalqalahLabel),
            _legendRow(AppColors.tajweedGhunnah, l10n.tajweedGhunnahLabel),
            _legendRow(AppColors.tajweedIkhfa, l10n.tajweedIkhfaLabel),
            _legendRow(AppColors.tajweedIdghamGhunnah, l10n.tajweedIdghamGhunnahLabel),
            _legendRow(AppColors.tajweedIdghamNoGhunnah, l10n.tajweedIdghamNoGhunnahLabel),
            _legendRow(AppColors.tajweedIqlab, l10n.tajweedIqlabLabel),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text(l10n.tajweedLegendClose)),
      ],
    ),
  );
}

Widget _legendRow(Color color, String label) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 16,
          height: 16,
          margin: const EdgeInsets.only(top: 2, right: 10),
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
        ),
        Expanded(child: Text(label, style: const TextStyle(fontSize: 13))),
      ],
    ),
  );
}
