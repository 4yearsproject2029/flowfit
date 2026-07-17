import 'package:flutter/material.dart';

import '../../../data/models/workout_log.dart';

class CurrentWorkoutScreen extends StatelessWidget {
  const CurrentWorkoutScreen({
    super.key,
    required this.workoutLogs,
    required this.selectedDateLabel,
  });

  final List<WorkoutLog> workoutLogs;
  final String selectedDateLabel;

  static const _background = Color(0xFF050606);
  static const _surface = Color(0xFF101214);
  static const _elevated = Color(0xFF181B1F);
  static const _border = Color(0xFF252A2E);
  static const _accent = Color(0xFF18F7D3);
  static const _accentDark = Color(0xFF073F39);
  static const _primaryText = Color(0xFFF5F6F7);
  static const _secondaryText = Color(0xFFA8AFB7);
  static const _mutedText = Color(0xFF6F767E);

  @override
  Widget build(BuildContext context) {
    final activeWorkout = _activeWorkoutLog();
    final completedCount = workoutLogs.where((log) => log.isCompleted).length;
    final totalCount = workoutLogs.length;
    final progress = totalCount == 0 ? 0.0 : completedCount / totalCount;
    final progressPercent = (progress * 100).round();

    return Scaffold(
      backgroundColor: _background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _CurrentWorkoutHeader(dateLabel: selectedDateLabel),
                    const SizedBox(height: 30),
                    Text(
                      'CURRENT WORKOUT',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: _secondaryText,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            _progressTitle(completedCount, totalCount),
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(
                                  color: _primaryText,
                                  fontWeight: FontWeight.w900,
                                  height: 1.04,
                                ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        _ProgressPill(label: '$progressPercent%'),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _AccentProgressBar(value: progress),
                    const SizedBox(height: 24),
                    if (activeWorkout == null)
                      const _NoActiveWorkoutCard()
                    else
                      _ActiveExerciseCard(workoutLog: activeWorkout),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: activeWorkout == null
                            ? null
                            : () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Set progression arrives in a later story.',
                                    ),
                                  ),
                                );
                              },
                        style: FilledButton.styleFrom(
                          backgroundColor: _accent,
                          foregroundColor: Colors.black,
                          disabledBackgroundColor: _border,
                          disabledForegroundColor: _mutedText,
                          minimumSize: const Size.fromHeight(58),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 17,
                          ),
                        ),
                        icon: const Icon(Icons.check),
                        label: const Text('Complete Set'),
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

  WorkoutLog? _activeWorkoutLog() {
    if (workoutLogs.isEmpty) {
      return null;
    }

    final incompleteWorkouts = workoutLogs.where((log) => !log.isCompleted);
    if (incompleteWorkouts.isNotEmpty) {
      return incompleteWorkouts.first;
    }

    return workoutLogs.last;
  }

  String _progressTitle(int completedCount, int totalCount) {
    if (totalCount == 0) {
      return 'No workout ready';
    }

    final currentExercise = completedCount == totalCount
        ? totalCount
        : completedCount + 1;

    return 'Exercise $currentExercise of $totalCount';
  }
}

class _CurrentWorkoutHeader extends StatelessWidget {
  const _CurrentWorkoutHeader({required this.dateLabel});

  final String dateLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: 'Back to dashboard',
          icon: const Icon(
            Icons.arrow_back,
            color: CurrentWorkoutScreen._primaryText,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: CurrentWorkoutScreen._surface,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: CurrentWorkoutScreen._border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                color: CurrentWorkoutScreen._accent,
                size: 16,
              ),
              const SizedBox(width: 6),
              Text(
                dateLabel,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: CurrentWorkoutScreen._secondaryText,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProgressPill extends StatelessWidget {
  const _ProgressPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: CurrentWorkoutScreen._accentDark,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: CurrentWorkoutScreen._accent,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class _ActiveExerciseCard extends StatelessWidget {
  const _ActiveExerciseCard({required this.workoutLog});

  final WorkoutLog workoutLog;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            CurrentWorkoutScreen._elevated,
            CurrentWorkoutScreen._surface,
          ],
        ),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: CurrentWorkoutScreen._border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.28),
            blurRadius: 22,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 176,
            width: double.infinity,
            decoration: BoxDecoration(
              color: CurrentWorkoutScreen._accentDark.withValues(alpha: 0.52),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.fitness_center,
              color: CurrentWorkoutScreen._accent,
              size: 72,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            workoutLog.workoutName,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: CurrentWorkoutScreen._primaryText,
              fontWeight: FontWeight.w900,
              height: 1.04,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _instructionText(workoutLog),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: CurrentWorkoutScreen._secondaryText,
              fontWeight: FontWeight.w600,
              height: 1.32,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: _TargetTile(
                  label: 'Sets',
                  value: workoutLog.sets?.toString() ?? 'Not set',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _TargetTile(
                  label: 'Reps',
                  value: workoutLog.reps?.toString() ?? 'Not set',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _instructionText(WorkoutLog workoutLog) {
    final memo = workoutLog.memo?.trim();
    if (memo != null && memo.isNotEmpty) {
      return memo;
    }

    return 'Focus on your next ${workoutLog.category.toLowerCase()} movement. Complete the set when you are ready.';
  }
}

class _TargetTile extends StatelessWidget {
  const _TargetTile({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: CurrentWorkoutScreen._border),
      ),
      child: Column(
        children: [
          Text(
            label.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: CurrentWorkoutScreen._mutedText,
              fontWeight: FontWeight.w900,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: CurrentWorkoutScreen._primaryText,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

class _NoActiveWorkoutCard extends StatelessWidget {
  const _NoActiveWorkoutCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: CurrentWorkoutScreen._surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: CurrentWorkoutScreen._border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.event_busy_outlined,
            color: CurrentWorkoutScreen._accent,
            size: 34,
          ),
          const SizedBox(height: 12),
          Text(
            'No workout is ready yet.',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: CurrentWorkoutScreen._primaryText,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Plan a workout from the Dashboard to start the flow.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: CurrentWorkoutScreen._secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}

class _AccentProgressBar extends StatelessWidget {
  const _AccentProgressBar({required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: SizedBox(
        height: 7,
        child: LinearProgressIndicator(
          value: value,
          backgroundColor: Colors.white.withValues(alpha: 0.08),
          color: CurrentWorkoutScreen._accent,
        ),
      ),
    );
  }
}
