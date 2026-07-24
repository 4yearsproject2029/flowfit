import 'package:flutter/material.dart';

import '../../../data/models/workout_log.dart';
import '../../../data/services/storage_service.dart';
import '../../current_workout/screens/current_workout_screen.dart';

class PlannedSessionDetailScreen extends StatelessWidget {
  PlannedSessionDetailScreen({
    super.key,
    required this.sessionTitle,
    required this.selectedDateLabel,
    required this.workoutLogs,
    StorageService? storageService,
  }) : storageService = storageService ?? StorageService();

  final String sessionTitle;
  final String selectedDateLabel;
  final List<WorkoutLog> workoutLogs;
  final StorageService storageService;

  static const background = Color(0xFF050606);
  static const surface = Color(0xFF101214);
  static const elevated = Color(0xFF181B1F);
  static const border = Color(0xFF252A2E);
  static const accent = Color(0xFF18F7D3);
  static const accentDark = Color(0xFF073F39);
  static const primaryText = Color(0xFFF5F6F7);
  static const secondaryText = Color(0xFFA8AFB7);
  static const mutedText = Color(0xFF6F767E);

  @override
  Widget build(BuildContext context) {
    final hasExercises = workoutLogs.isNotEmpty;

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _DetailHeader(),
                    const SizedBox(height: 24),
                    _SessionSummaryCard(
                      sessionTitle: sessionTitle,
                      selectedDateLabel: selectedDateLabel,
                      workoutLogs: workoutLogs,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Text(
                          'MOVEMENT LIST',
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(
                                color: secondaryText,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0,
                              ),
                        ),
                        const Spacer(),
                        if (hasExercises)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: accentDark,
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              '${workoutLogs.length} exercises'.toUpperCase(),
                              style: Theme.of(context).textTheme.labelSmall
                                  ?.copyWith(
                                    color: accent,
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    if (!hasExercises)
                      const _EmptyDetailState()
                    else
                      for (var index = 0; index < workoutLogs.length; index++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: _MovementRow(
                            workoutLog: workoutLogs[index],
                            exerciseNumber: index + 1,
                          ),
                        ),
                    const SizedBox(height: 18),
                    if (hasExercises)
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton.icon(
                          onPressed: () => _startWorkout(context),
                          style: FilledButton.styleFrom(
                            backgroundColor: accent,
                            foregroundColor: Colors.black,
                            minimumSize: const Size.fromHeight(56),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 17,
                            ),
                          ),
                          icon: const Icon(Icons.play_arrow),
                          label: Text(_startActionLabel()),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _startWorkout(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          return CurrentWorkoutScreen(
            workoutLogs: workoutLogs,
            selectedDateLabel: selectedDateLabel,
            storageService: storageService,
          );
        },
      ),
    );
  }

  String _startActionLabel() {
    final today = DateTime.now();
    final todayLabel = _selectedDateLabel(today);
    return selectedDateLabel == todayLabel ? 'Start Today' : 'Start Workout';
  }

  String _selectedDateLabel(DateTime date) {
    const monthLabels = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    return '${monthLabels[date.month - 1]} ${date.day}, ${date.year}';
  }
}

class _DetailHeader extends StatelessWidget {
  const _DetailHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          tooltip: 'Back to Week',
          icon: const Icon(
            Icons.arrow_back,
            color: PlannedSessionDetailScreen.primaryText,
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            'Session Detail',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: PlannedSessionDetailScreen.primaryText,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        IconButton(
          onPressed: null,
          tooltip: 'Planned session info',
          icon: const Icon(Icons.info_outline),
        ),
      ],
    );
  }
}

class _SessionSummaryCard extends StatelessWidget {
  const _SessionSummaryCard({
    required this.sessionTitle,
    required this.selectedDateLabel,
    required this.workoutLogs,
  });

  final String sessionTitle;
  final String selectedDateLabel;
  final List<WorkoutLog> workoutLogs;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: PlannedSessionDetailScreen.elevated,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: PlannedSessionDetailScreen.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: PlannedSessionDetailScreen.accentDark,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              'Planned Session',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: PlannedSessionDetailScreen.accent,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sessionTitle,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: PlannedSessionDetailScreen.primaryText,
                            fontWeight: FontWeight.w900,
                            height: 1.08,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'A focused plan saved locally for $selectedDateLabel.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: PlannedSessionDetailScreen.secondaryText,
                        fontWeight: FontWeight.w600,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: PlannedSessionDetailScreen.accentDark,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.fitness_center,
                  color: PlannedSessionDetailScreen.accent,
                  size: 28,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 16,
            runSpacing: 12,
            children: [
              _MetricPill(
                label: 'Duration',
                value: '${_estimatedMinutes()}m',
                icon: Icons.schedule,
              ),
              _MetricPill(
                label: 'Exercises',
                value: '${workoutLogs.length}',
                icon: Icons.local_fire_department_outlined,
              ),
              const _MetricPill(
                label: 'Focus',
                value: 'Standard',
                icon: Icons.bolt,
              ),
            ],
          ),
        ],
      ),
    );
  }

  int _estimatedMinutes() {
    final setCount = workoutLogs.fold<int>(
      0,
      (total, log) => total + (log.sets ?? 1),
    );
    return (setCount * 4).clamp(15, 90);
  }
}

class _MetricPill extends StatelessWidget {
  const _MetricPill({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: PlannedSessionDetailScreen.mutedText, size: 16),
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label.toUpperCase(),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: PlannedSessionDetailScreen.mutedText,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: PlannedSessionDetailScreen.primaryText,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MovementRow extends StatelessWidget {
  const _MovementRow({required this.workoutLog, required this.exerciseNumber});

  final WorkoutLog workoutLog;
  final int exerciseNumber;

  @override
  Widget build(BuildContext context) {
    final targetParts = [
      if (workoutLog.sets != null) '${workoutLog.sets} sets',
      if (workoutLog.reps != null) '${workoutLog.reps} reps',
      if (workoutLog.weight != null) '${_formatWeight(workoutLog.weight!)} kg',
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: PlannedSessionDetailScreen.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: PlannedSessionDetailScreen.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: PlannedSessionDetailScreen.accentDark,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '$exerciseNumber',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: PlannedSessionDetailScreen.accent,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  workoutLog.workoutName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: PlannedSessionDetailScreen.primaryText,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                if (targetParts.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    targetParts.join(' · '),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: PlannedSessionDetailScreen.secondaryText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
                if (workoutLog.memo?.trim().isNotEmpty ?? false) ...[
                  const SizedBox(height: 6),
                  Text(
                    workoutLog.memo!.trim(),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: PlannedSessionDetailScreen.mutedText,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),
          const Icon(
            Icons.keyboard_arrow_down,
            color: PlannedSessionDetailScreen.secondaryText,
          ),
        ],
      ),
    );
  }

  String _formatWeight(double weight) {
    if (weight == weight.roundToDouble()) {
      return weight.toStringAsFixed(0);
    }
    return weight.toStringAsFixed(1);
  }
}

class _EmptyDetailState extends StatelessWidget {
  const _EmptyDetailState();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: PlannedSessionDetailScreen.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: PlannedSessionDetailScreen.border),
      ),
      child: Text(
        'No exercises planned',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: PlannedSessionDetailScreen.secondaryText,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
