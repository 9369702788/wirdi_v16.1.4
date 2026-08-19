import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

enum TajweedRule { none, qalqalah, ghunnah, ikhfa, idghamGhunnah, idghamNoGhunnah, iqlab }

class TajweedSegment {
  final String text;
  final TajweedRule rule;
  const TajweedSegment(this.text, this.rule);
}

class _LetterUnit {
  final String base;
  final List<int> diacritics;
  final int start;
  final int end;
  final bool isLetter;
  const _LetterUnit({
    required this.base,
    required this.diacritics,
    required this.start,
    required this.end,
    this.isLetter = true,
  });
}

class TajweedService {
  TajweedService._();

  static const Set<String> _qalqalahLetters = {'ق', 'ط', 'ب', 'ج', 'د'};
  static const Set<String> _idghamGhunnahLetters = {'ي', 'ن', 'م', 'و'};
  static const Set<String> _idghamNoGhunnahLetters = {'ل', 'ر'};
  static const String _iqlabLetter = 'ب';
  static const Set<String> _ikhfaLetters = {
    'ت', 'ث', 'ج', 'د', 'ذ', 'ز', 'س', 'ش', 'ص', 'ض', 'ط', 'ظ', 'ف', 'ق', 'ك',
  };

  static const int _sukun = 0x0652;
  static const int _shadda = 0x0651;
  static const int _fathatan = 0x064B;
  static const int _dammatan = 0x064C;
  static const int _kasratan = 0x064D;

  static bool _isDiacritic(int codeUnit) =>
      (codeUnit >= 0x064B && codeUnit <= 0x0652) || codeUnit == 0x0670;

  static bool _isArabicLetter(int codeUnit) => codeUnit >= 0x0621 && codeUnit <= 0x064A;

  static Color? colorFor(TajweedRule rule) {
    switch (rule) {
      case TajweedRule.qalqalah:
        return AppColors.tajweedQalqalah;
      case TajweedRule.ghunnah:
        return AppColors.tajweedGhunnah;
      case TajweedRule.ikhfa:
        return AppColors.tajweedIkhfa;
      case TajweedRule.idghamGhunnah:
        return AppColors.tajweedIdghamGhunnah;
      case TajweedRule.idghamNoGhunnah:
        return AppColors.tajweedIdghamNoGhunnah;
      case TajweedRule.iqlab:
        return AppColors.tajweedIqlab;
      case TajweedRule.none:
        return null;
    }
  }

  static List<TajweedSegment> analyze(String text) {
    final units = <_LetterUnit>[];
    int i = 0;
    while (i < text.length) {
      final codeUnit = text.codeUnitAt(i);
      if (_isArabicLetter(codeUnit)) {
        final base = text[i];
        final diacritics = <int>[];
        int j = i + 1;
        while (j < text.length && _isDiacritic(text.codeUnitAt(j))) {
          diacritics.add(text.codeUnitAt(j));
          j++;
        }
        units.add(_LetterUnit(base: base, diacritics: diacritics, start: i, end: j));
        i = j;
      } else {
        units.add(_LetterUnit(base: text[i], diacritics: const [], start: i, end: i + 1, isLetter: false));
        i++;
      }
    }

    final rules = List<TajweedRule>.filled(units.length, TajweedRule.none);
    for (int idx = 0; idx < units.length; idx++) {
      final unit = units[idx];
      if (!unit.isLetter) continue;

      if (_qalqalahLetters.contains(unit.base) && unit.diacritics.contains(_sukun)) {
        rules[idx] = TajweedRule.qalqalah;
        continue;
      }

      if ((unit.base == 'ن' || unit.base == 'م') && unit.diacritics.contains(_shadda)) {
        rules[idx] = TajweedRule.ghunnah;
        continue;
      }

      final isNoonSakinah = unit.base == 'ن' && unit.diacritics.contains(_sukun);
      final isTanween = unit.diacritics.contains(_fathatan) ||
          unit.diacritics.contains(_dammatan) ||
          unit.diacritics.contains(_kasratan);
      if (isNoonSakinah || isTanween) {
        int k = idx + 1;
        while (k < units.length && !units[k].isLetter) {
          k++;
        }
        if (k < units.length) {
          final nextBase = units[k].base;
          if (nextBase == _iqlabLetter) {
            rules[idx] = TajweedRule.iqlab;
          } else if (_idghamGhunnahLetters.contains(nextBase)) {
            rules[idx] = TajweedRule.idghamGhunnah;
          } else if (_idghamNoGhunnahLetters.contains(nextBase)) {
            rules[idx] = TajweedRule.idghamNoGhunnah;
          } else if (_ikhfaLetters.contains(nextBase)) {
            rules[idx] = TajweedRule.ikhfa;
          }
        }
      }
    }

    final segments = <TajweedSegment>[];
    final buffer = StringBuffer();
    TajweedRule? currentRule;
    for (int idx = 0; idx < units.length; idx++) {
      final unit = units[idx];
      final rule = rules[idx];
      if (currentRule != null && rule != currentRule) {
        segments.add(TajweedSegment(buffer.toString(), currentRule));
        buffer.clear();
      }
      buffer.write(text.substring(unit.start, unit.end));
      currentRule = rule;
    }
    if (buffer.isNotEmpty) {
      segments.add(TajweedSegment(buffer.toString(), currentRule ?? TajweedRule.none));
    }
    return segments;
  }
}
