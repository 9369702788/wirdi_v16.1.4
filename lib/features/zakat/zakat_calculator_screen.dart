import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import '../../l10n/generated/app_localizations.dart';

/// Zakat calculator using the standard 2.5% rate on zakatable wealth
/// held above the nisab threshold for a full lunar year (hawl).
///
/// Deliberately does NOT claim a live gold/silver price — that would
/// need a paid market-data API and go stale immediately. Instead the
/// user enters the current nisab value themselves (with guidance on how
/// to find it), which is more honest than a hardcoded number that will
/// be wrong within days.
class ZakatCalculatorScreen extends StatefulWidget {
  const ZakatCalculatorScreen({super.key});

  @override
  State<ZakatCalculatorScreen> createState() => _ZakatCalculatorScreenState();
}

class _ZakatCalculatorScreenState extends State<ZakatCalculatorScreen> {
  final _cashController = TextEditingController();
  final _goldSilverController = TextEditingController();
  final _investmentsController = TextEditingController();
  final _businessController = TextEditingController();
  final _receivablesController = TextEditingController();
  final _debtsController = TextEditingController();
  final _nisabController = TextEditingController(text: '0');

  @override
  void dispose() {
    _cashController.dispose();
    _goldSilverController.dispose();
    _investmentsController.dispose();
    _businessController.dispose();
    _receivablesController.dispose();
    _debtsController.dispose();
    _nisabController.dispose();
    super.dispose();
  }

  double _num(TextEditingController c) => double.tryParse(c.text.trim()) ?? 0;

  void _recalculate() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final totalAssets = _num(_cashController) +
        _num(_goldSilverController) +
        _num(_investmentsController) +
        _num(_businessController) +
        _num(_receivablesController);
    final netWealth = (totalAssets - _num(_debtsController)).clamp(0, double.infinity);
    final nisab = _num(_nisabController);
    final meetsNisab = nisab > 0 && netWealth >= nisab;
    final zakatDue = meetsNisab ? netWealth * 0.025 : 0.0;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.zakatTitle), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.goldAccent.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              l10n.zakatNisabHint,
              style: const TextStyle(fontSize: 13, height: 1.6),
            ),
          ),
          const SizedBox(height: 16),
          _AmountField(label: l10n.zakatCurrentNisab, controller: _nisabController, highlight: true, onChanged: _recalculate),
          const SizedBox(height: 20),
          Text(l10n.zakatableAssets, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
          const SizedBox(height: 10),
          _AmountField(label: l10n.zakatCash, controller: _cashController, onChanged: _recalculate),
          _AmountField(label: l10n.zakatGoldSilver, controller: _goldSilverController, onChanged: _recalculate),
          _AmountField(label: l10n.zakatInvestments, controller: _investmentsController, onChanged: _recalculate),
          _AmountField(label: l10n.zakatBusiness, controller: _businessController, onChanged: _recalculate),
          _AmountField(label: l10n.zakatReceivables, controller: _receivablesController, onChanged: _recalculate),
          const SizedBox(height: 16),
          Text(l10n.zakatOwedDebts, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
          const SizedBox(height: 10),
          _AmountField(label: l10n.zakatCurrentDebts, controller: _debtsController, onChanged: _recalculate),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [AppColors.primaryEmerald, Color(0xFF115E56)]),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(l10n.zakatNetWealth, style: const TextStyle(color: Colors.white70)),
                const SizedBox(height: 6),
                Text(netWealth.toStringAsFixed(2), style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                const Divider(color: Colors.white24, height: 32),
                if (nisab <= 0)
                  Text(l10n.zakatEnterNisabFirst, style: const TextStyle(color: Colors.white70))
                else if (!meetsNisab)
                  Text(l10n.zakatBelowNisab, style: const TextStyle(color: Colors.white70))
                else ...[
                  Text(l10n.zakatDue, style: const TextStyle(color: Colors.white70)),
                  const SizedBox(height: 6),
                  Text(zakatDue.toStringAsFixed(2), style: const TextStyle(color: AppColors.goldAccent, fontSize: 32, fontWeight: FontWeight.bold)),
                ],
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.zakatFootnote,
            style: const TextStyle(fontSize: 12, color: AppColors.mutedText),
          ),
        ],
      ),
    );
  }
}

class _AmountField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final VoidCallback onChanged;
  final bool highlight;

  const _AmountField({
    required this.label,
    required this.controller,
    required this.onChanged,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: highlight ? AppColors.goldAccent.withValues(alpha: 0.08) : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
        ),
        onChanged: (_) => onChanged(),
      ),
    );
  }
}
