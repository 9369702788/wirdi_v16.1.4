import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/khatma_models.dart';
import 'user_progress_service.dart';

class KhatmaService {
  KhatmaService._();

  static const _plansKey = 'khatma_plans_v2_json';
  static const _legacyStartKey = 'khatma_plan_start_millis';
  static const _legacyTargetKey = 'khatma_plan_target_millis';

  static Future<List<KhatmaPlan>> allPlans() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString(_plansKey);
    if (stored != null) {
      try {
        final decoded = jsonDecode(stored) as List;
        return decoded.map((e) => KhatmaPlan.fromJson(e as Map<String, dynamic>)).toList();
      } catch (_) {
        // fall through
      }
    }

    final legacyStart = prefs.getInt(_legacyStartKey);
    final legacyTarget = prefs.getInt(_legacyTargetKey);
    if (legacyStart != null && legacyTarget != null) {
      final migrated = KhatmaPlan(
        id: 'migrated_$legacyStart',
        label: '',
        startDate: DateTime.fromMillisecondsSinceEpoch(legacyStart),
        targetDate: DateTime.fromMillisecondsSinceEpoch(legacyTarget),
        startingCompletedSurahs: const {},
      );
      await _savePlans([migrated]);
      await prefs.remove(_legacyStartKey);
      await prefs.remove(_legacyTargetKey);
      return [migrated];
    }

    return [];
  }

  static Future<KhatmaPlan> createPlan({required String label, required DateTime targetDate}) async {
    final currentCompleted = await UserProgressService.completedSurahs();
    final plan = KhatmaPlan(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      label: label,
      startDate: DateTime.now(),
      targetDate: targetDate,
      startingCompletedSurahs: currentCompleted,
    );
    final plans = await allPlans();
    plans.add(plan);
    await _savePlans(plans);
    return plan;
  }

  static Future<void> deletePlan(String id) async {
    final plans = await allPlans();
    plans.removeWhere((p) => p.id == id);
    await _savePlans(plans);
  }

  static Future<void> _savePlans(List<KhatmaPlan> plans) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(plans.map((p) => p.toJson()).toList());
    await prefs.setString(_plansKey, encoded);
  }
}
