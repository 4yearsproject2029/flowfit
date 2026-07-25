import 'package:flutter/material.dart';

import '../../../data/models/workout_log.dart';

class CompletedWorkoutDetailScreen extends StatelessWidget {
  const CompletedWorkoutDetailScreen({
    super.key,
    required this.sessionTitle,
    required this.completedDateLabel,
    required this.workoutLogs,
  });

  final String sessionTitle;
  final String completedDateLabel;
  final List<WorkoutLog> workoutLogs;

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
    final completedLogs = workoutLogs
        .where((log) => log.isCompleted)
        .toList(growable: false);

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
                    const _CompletedDetailHeader(),
                    const SizedBox(height: 24),
                    _CompletedSummaryCard(
                      sessionTitle: sessionTitle,
                      completedDateLabel: completedDateLabel,
                      workoutLogs: completedLogs,
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
                        if (completedLogs.isNotEmpty)
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
                              '${completedLogs.length} exercises'.toUpperCase(),
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
                    if (completedLogs.isEmpty)
                      const _NoCompletedMovementsState()
                    else
                      for (var index = 0; index < completedLogs.length; index++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: _CompletedMovementRow(
                            workoutLog: completedLogs[index],
                            exerciseNumber: index + 1,
                          ),
                        ),
                    const SizedBox(height: 16),
                    const _ReadOnlyNotice(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CompletedDetailHeader extends StatelessWidget {
  const _CompletedDetailHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          tooltip: 'Back to History',
          icon: const Icon(
            Icons.arrow_back,
            color: CompletedWorkoutDetailScreen.primaryText,
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            'Workout Detail',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: CompletedWorkoutDetailScreen.primaryText,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        IconButton(
          onPressed: null,
          tooltip: 'Read-only completed workout',
          icon: const Icon(Icons.info_outline),
        ),
      ],
    );
  }
}

class _CompletedSummaryCard extends StatelessWidget {
  const _CompletedSummaryCard({
    required this.sessionTitle,
    required this.completedDateLabel,
    required this.workoutLogs,
  });

  final String sessionTitle;
  final String completedDateLabel;
  final List<WorkoutLog> workoutLogs;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: CompletedWorkoutDetailScreen.elevated,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: CompletedWorkoutDetailScreen.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: CompletedWorkoutDetailScreen.accentDark,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              'Completed Record',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: CompletedWorkoutDetailScreen.accent,
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
                            color: CompletedWorkoutDetailScreen.primaryText,
                            fontWeight: FontWeight.w900,
                            height: 1.08,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'A read-only workout record completed on $completedDateLabel.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: CompletedWorkoutDetailScreen.secondaryText,
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
                  color: CompletedWorkoutDetailScreen.accentDark,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.task_alt,
                  color: CompletedWorkoutDetailScreen.accent,
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
              _DetailMetricPill(
                label: 'Exercises',
                value: '${workoutLogs.length}',
                icon: Icons.fitness_center,
              ),
              _DetailMetricPill(
                label: 'Sets',
                value: '${_totalSets()}',
                icon: Icons.repeat,
              ),
              _DetailMetricPill(
                label: 'Volume',
                value: _volumeLabel(),
                icon: Icons.monitor_weight_outlined,
              ),
            ],
          ),
        ],
      ),
    );
  }

  int _totalSets() {
    return workoutLogs.fold<int>(0, (total, log) => total + (log.sets ?? 0));
  }

  String _volumeLabel() {
    final volume = workoutLogs.fold<double>(0, (total, log) {
      final sets = log.sets;
      final reps = log.reps;
      final weight = log.weight;
      if (sets == null || reps == null || weight == null) {
        return total;
      }
      return total + (sets * reps * weight);
    });

    if (volume <= 0) {
      return 'Not tracked';
    }

    return '${volume.round()} kg';
  }
}

class _DetailMetricPill extends StatelessWidget {
  const _DetailMetricPill({
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
        Icon(icon, color: CompletedWorkoutDetailScreen.mutedText, size: 16),
        const SizedBox(width: 6),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label.toUpperCase(),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: CompletedWorkoutDetailScreen.mutedText,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: CompletedWorkoutDetailScreen.primaryText,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CompletedMovementRow extends StatelessWidget {
  const _CompletedMovementRow({
    required this.workoutLog,
    required this.exerciseNumber,
  });

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
        color: CompletedWorkoutDetailScreen.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: CompletedWorkoutDetailScreen.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: CompletedWorkoutDetailScreen.accentDark,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '$exerciseNumber',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: CompletedWorkoutDetailScreen.accent,
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
                    color: CompletedWorkoutDetailScreen.primaryText,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  workoutLog.category,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: CompletedWorkoutDetailScreen.accent,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                if (targetParts.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    targetParts.join(' · '),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: CompletedWorkoutDetailScreen.secondaryText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
                if (workoutLog.memo?.trim().isNotEmpty ?? false) ...[
                  const SizedBox(height: 6),
                  Text(
                    workoutLog.memo!.trim(),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: CompletedWorkoutDetailScreen.mutedText,
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
            Icons.lock_outline,
            color: CompletedWorkoutDetailScreen.secondaryText,
            size: 20,
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

class _ReadOnlyNotice extends StatelessWidget {
  const _ReadOnlyNotice();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: CompletedWorkoutDetailScreen.accentDark,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.visibility_outlined,
            color: CompletedWorkoutDetailScreen.accent,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              'Read-only history record. Workout Summary and planning actions stay separate.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: CompletedWorkoutDetailScreen.primaryText,
                fontWeight: FontWeight.w700,
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NoCompletedMovementsState extends StatelessWidget {
  const _NoCompletedMovementsState();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: CompletedWorkoutDetailScreen.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: CompletedWorkoutDetailScreen.border),
      ),
      child: Text(
        'No completed movements found',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: CompletedWorkoutDetailScreen.secondaryText,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
