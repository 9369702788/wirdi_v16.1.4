import 'package:flutter/material.dart';
import 'package:intl/intl.dart' hide TextDirection;

import '../../core/models/khatma_models.dart';
import '../../core/services/khatma_service.dart';
import '../../core/services/user_progress_service.dart';
import '../../core/theme/app_theme.dart';
import '../../l10n/generated/app_localizations.dart';
import '../quran/quran_screen.dart';

class KhatmaTrackerScreen extends StatefulWidget {
  const KhatmaTrackerScreen({super.key});

  @override
  State<KhatmaTrackerScreen> createState() => _KhatmaTrackerScreenState();
}

class _KhatmaTrackerScreenState extends State<KhatmaTrackerScreen> {
  static const int _totalSurahs = UserProgressService.totalSurahsInQuran;

  List<KhatmaPlan> _plans = [];
  Set<int> _globalCompleted = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final plans = await KhatmaService.allPlans();
    final completed = await UserProgressService.completedSurahs();
    for (final plan in plans) {
      if (plan.newlyCompletedCount(completed) >= _totalSurahs) {
        await UserProgressService.recordKhatmaCompletionIfNeeded(plan.id);
      }
    }
    if (!mounted) return;
    setState(() {
      _plans = plans;
      _globalCompleted = completed;
      _loading = false;
    });
  }

  Future<void> _createPlan(int days, String label) async {
    final target = DateTime.now().add(Duration(days: days));
    await KhatmaService.createPlan(label: label, targetDate: target);
    await _load();
  }

  Future<void> _createPlanCustomDate(DateTime target, String label) async {
    await KhatmaService.createPlan(label: label, targetDate: target);
    await _load();
  }

  Future<void> _showNewPlanSheet() async {
    final l10n = AppLocalizations.of(context);
    final labelController = TextEditingController();

    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (sheetContext) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(sheetContext).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.khatmaStartNewPlan, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              const SizedBox(height: 12),
              TextField(
                controller: labelController,
                decoration: InputDecoration(
                  hintText: l10n.khatmaPlanLabelHint,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Text(l10n.khatmaChooseDuration, style: const TextStyle(fontWeight: FontWeight.w700)),
              const SizedBox(height: 12),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _DurationChip(
                    label: l10n.khatmaDuration7Days,
                    onTap: () {
                      Navigator.pop(sheetContext);
                      _createPlan(7, labelController.text.trim());
                    },
                  ),
                  _DurationChip(
                    label: l10n.khatmaDuration30Days,
                    onTap: () {
                      Navigator.pop(sheetContext);
                      _createPlan(30, labelController.text.trim());
                    },
                  ),
                  _DurationChip(
                    label: l10n.khatmaDuration60Days,
                    onTap: () {
                      Navigator.pop(sheetContext);
                      _createPlan(60, labelController.text.trim());
                    },
                  ),
                  _DurationChip(
                    label: l10n.khatmaDuration90Days,
                    onTap: () {
                      Navigator.pop(sheetContext);
                      _createPlan(90, labelController.text.trim());
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                onPressed: () async {
                  final now = DateTime.now();
                  final picked = await showDatePicker(
                    context: sheetContext,
                    initialDate: now.add(const Duration(days: 30)),
                    firstDate: now.add(const Duration(days: 1)),
                    lastDate: now.add(const Duration(days: 3650)),
                    helpText: l10n.khatmaChooseDuration,
                  );
                  if (picked == null) return;
                  if (!sheetContext.mounted) return;
                  Navigator.pop(sheetContext);
                  await _createPlanCustomDate(picked, labelController.text.trim());
                },
                icon: const Icon(Icons.calendar_month_outlined),
                label: Text(l10n.khatmaCustomDate),
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }

  Future<void> _confirmDelete(KhatmaPlan plan) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.khatmaDeletePlanTitle),
        content: Text(l10n.khatmaDeletePlanBody),
        actions: [
          TextButton(onPressed: () => Navigator.pop(dialogContext, false), child: Text(l10n.commonCancel)),
          TextButton(onPressed: () => Navigator.pop(dialogContext, true), child: Text(l10n.khatmaDeletePlanConfirm)),
        ],
      ),
    );
    if (confirmed != true) return;
    await KhatmaService.deletePlan(plan.id);
    await _load();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.khatmaMyPlans), centerTitle: true),
      floatingActionButton: (_loading || _plans.isEmpty)
          ? null
          : FloatingActionButton.extended(
              onPressed: _showNewPlanSheet,
              icon: const Icon(Icons.add),
              label: Text(l10n.khatmaAddAnother),
            ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _plans.isEmpty
              ? _buildEmptyState(context, l10n)
              : _buildPlansList(context, l10n),
    );
  }

  Widget _buildEmptyState(BuildContext context, AppLocalizations l10n) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const SizedBox(height: 12),
        const Icon(Icons.menu_book_outlined, size: 64, color: AppColors.primaryEmerald),
        const SizedBox(height: 16),
        Text(
          l10n.khatmaNoPlanTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        Text(
          l10n.khatmaNoPlanBody,
          textAlign: TextAlign.center,
          style: const TextStyle(color: AppColors.mutedText),
        ),
        const SizedBox(height: 24),
        Center(
          child: FilledButton.icon(
            onPressed: _showNewPlanSheet,
            icon: const Icon(Icons.add),
            label: Text(l10n.khatmaStartNewPlan),
          ),
        ),
      ],
    );
  }

  Widget _buildPlansList(BuildContext context, AppLocalizations l10n) {
    return RefreshIndicator(
      onRefresh: _load,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
        itemCount: _plans.length,
        separatorBuilder: (_, __) => const SizedBox(height: 14),
        itemBuilder: (context, index) {
          final plan = _plans[index];
          return _KhatmaPlanCard(
            plan: plan,
            index: index,
            globalCompleted: _globalCompleted,
            totalSurahs: _totalSurahs,
            onDelete: () => _confirmDelete(plan),
          );
        },
      ),
    );
  }
}

class _KhatmaPlanCard extends StatelessWidget {
  final KhatmaPlan plan;
  final int index;
  final Set<int> globalCompleted;
  final int totalSurahs;
  final VoidCallback onDelete;

  const _KhatmaPlanCard({
    required this.plan,
    required this.index,
    required this.globalCompleted,
    required this.totalSurahs,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final rawCompleted = plan.newlyCompletedCount(globalCompleted);
    final completedCount = rawCompleted > totalSurahs ? totalSurahs : rawCompleted;
    final ratio = totalSurahs == 0 ? 0.0 : (completedCount / totalSurahs).clamp(0.0, 1.0);

    final expectedByNow = plan.totalDays == 0 ? 0 : ((totalSurahs * plan.daysElapsed) / plan.totalDays).round();
    final behindByRaw = expectedByNow - completedCount;
    final behindBy = behindByRaw > 0 ? behindByRaw : 0;

    final remainingRaw = totalSurahs - completedCount;
    final remaining = remainingRaw > 0 ? remainingRaw : 0;

    final isComplete = completedCount >= totalSurahs;
    final onTrack = behindBy == 0;
    final newPace = plan.daysRemaining == 0 ? remaining : (remaining / plan.daysRemaining).ceil();

    final dateFormat = DateFormat.yMMMd(Localizations.localeOf(context).languageCode);
    final label = plan.label.trim().isEmpty ? l10n.khatmaDefaultPlanLabel(index + 1) : plan.label.trim();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(child: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
                IconButton(
                  tooltip: l10n.commonDeleteTooltip,
                  icon: const Icon(Icons.delete_outline, color: AppColors.mutedText),
                  onPressed: onDelete,
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                SizedBox(
                  width: 60,
                  height: 60,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: ratio,
                        strokeWidth: 6,
                        backgroundColor: AppColors.primaryEmerald.withValues(alpha: 0.1),
                        valueColor: AlwaysStoppedAnimation(isComplete ? AppColors.goldAccent : AppColors.primaryEmerald),
                      ),
                      Text('${(ratio * 100).round()}%', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800)),
                    ],
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l10n.khatmaProgressLabel(completedCount, totalSurahs), style: const TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 2),
                      Text(
                        '${l10n.khatmaTargetDate}: ${dateFormat.format(plan.targetDate)}',
                        style: const TextStyle(fontSize: 12, color: AppColors.mutedText),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (isComplete)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primaryEmerald.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  l10n.khatmaCompletedCelebration,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              )
            else
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: onTrack ? AppColors.primaryEmerald.withValues(alpha: 0.08) : Colors.orange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      onTrack ? Icons.check_circle_outline : Icons.timer_outlined,
                      color: onTrack ? AppColors.primaryEmerald : Colors.orange,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            onTrack ? l10n.khatmaOnTrack : l10n.khatmaBehindByCount(behindBy),
                            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                          ),
                          Text(
                            onTrack ? l10n.khatmaPaceNeeded(newPace) : l10n.khatmaNewPaceLabel(newPace),
                            style: const TextStyle(fontSize: 12, color: AppColors.mutedText),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const QuranScreen())),
                icon: const Icon(Icons.menu_book, size: 18),
                label: Text(l10n.khatmaContinueReading),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DurationChip extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _DurationChip({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(label),
      onPressed: onTap,
      backgroundColor: AppColors.primaryEmerald.withValues(alpha: 0.08),
    );
  }
}
