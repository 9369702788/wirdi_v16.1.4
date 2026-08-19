import 'package:flutter/material.dart';

import '../../core/data/app_sources.dart';
import '../../l10n/generated/app_localizations.dart';

class SourcesLicensesScreen extends StatelessWidget {
  const SourcesLicensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final languageCode = Localizations.localeOf(context).languageCode;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.sourcesLicensesTitle), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            AppSources.sourcesAndLicensesFor(languageCode).trim(),
            style: const TextStyle(height: 1.8, fontSize: 15),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () => showLicensePage(
              context: context,
              applicationName: l10n.appTitle,
            ),
            icon: const Icon(Icons.description_outlined),
            label: Text(l10n.sourcesOssLicensesButton),
          ),
        ],
      ),
    );
  }
}
