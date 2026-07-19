import 'package:flutter/material.dart';

import '../../../data/models/workout_log.dart';
import 'current_workout_palette.dart';

class ActiveExerciseCard extends StatelessWidget {
  const ActiveExerciseCard({
    super.key,
    required this.workoutLog,
    required this.completedSets,
    required this.targetSets,
    required this.sessionReps,
    required this.sessionWeight,
  });

  final WorkoutLog workoutLog;
  final int completedSets;
  final int targetSets;
  final int? sessionReps;
  final double? sessionWeight;

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
            CurrentWorkoutPalette.elevated,
            CurrentWorkoutPalette.surface,
          ],
        ),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: CurrentWorkoutPalette.border),
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
              color: CurrentWorkoutPalette.accentDark.withValues(alpha: 0.52),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.fitness_center,
              color: CurrentWorkoutPalette.accent,
              size: 72,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            workoutLog.workoutName,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: CurrentWorkoutPalette.primaryText,
              fontWeight: FontWeight.w900,
              height: 1.04,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _instructionText(workoutLog),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: CurrentWorkoutPalette.secondaryText,
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
                  value: workoutLog.sets?.toString() ?? '1',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _TargetTile(
                  label: 'Reps',
                  value: sessionReps?.toString() ?? 'Not set',
                ),
              ),
            ],
          ),
          if (sessionWeight != null) ...[
            const SizedBox(height: 12),
            _TargetTile(
              label: 'Session weight',
              value: _weightLabel(sessionWeight!),
            ),
          ],
          const SizedBox(height: 12),
          _TargetTile(
            label: 'Set progress',
            value: '$completedSets / $targetSets',
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

  String _weightLabel(double weight) {
    if (weight == weight.roundToDouble()) {
      return '${weight.round()} kg';
    }

    return '${weight.toStringAsFixed(1)} kg';
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
        border: Border.all(color: CurrentWorkoutPalette.border),
      ),
      child: Column(
        children: [
          Text(
            label.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: CurrentWorkoutPalette.mutedText,
              fontWeight: FontWeight.w900,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: CurrentWorkoutPalette.primaryText,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
