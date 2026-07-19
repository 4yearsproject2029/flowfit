import 'package:flutter/material.dart';

import '../../../data/models/workout_log.dart';
import '../models/current_workout_rest_state.dart';
import 'current_workout_palette.dart';

class RestStateCard extends StatelessWidget {
  const RestStateCard({
    super.key,
    required this.restState,
    required this.onOpenTimer,
  });

  final CurrentWorkoutRestState restState;
  final VoidCallback onOpenTimer;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: CurrentWorkoutPalette.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: CurrentWorkoutPalette.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.airline_seat_recline_normal,
                color: CurrentWorkoutPalette.accent,
                size: 30,
              ),
              const SizedBox(width: 10),
              Text(
                'REST STATE',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: CurrentWorkoutPalette.secondaryText,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            'Rest after ${restState.activeWorkoutName}',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: CurrentWorkoutPalette.primaryText,
              fontWeight: FontWeight.w900,
              height: 1.12,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Completed set ${restState.completedSetNumber} of ${restState.completedSetTotal}.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: CurrentWorkoutPalette.secondaryText,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          _HandoffRow(
            icon: Icons.fitness_center,
            label: 'Next',
            value: restState.nextWorkoutName,
          ),
          const SizedBox(height: 10),
          _HandoffRow(
            icon: Icons.hourglass_empty,
            label: 'Suggested rest',
            value: restState.suggestedRestDuration,
          ),
          const SizedBox(height: 10),
          _HandoffRow(
            icon: Icons.keyboard_return,
            label: 'Return target',
            value: restState.returnTarget,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: onOpenTimer,
              style: FilledButton.styleFrom(
                backgroundColor: CurrentWorkoutPalette.accent,
                foregroundColor: Colors.black,
                minimumSize: const Size.fromHeight(54),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                textStyle: const TextStyle(fontWeight: FontWeight.w900),
              ),
              icon: const Icon(Icons.hourglass_empty),
              label: const Text('Open Rest Timer'),
            ),
          ),
        ],
      ),
    );
  }
}

class PausedWorkoutCard extends StatelessWidget {
  const PausedWorkoutCard({super.key, required this.workoutLog});

  final WorkoutLog? workoutLog;

  @override
  Widget build(BuildContext context) {
    final workoutName = workoutLog?.workoutName ?? 'Current workout';
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: CurrentWorkoutPalette.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: CurrentWorkoutPalette.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.pause_circle_outline,
            color: CurrentWorkoutPalette.accent,
            size: 36,
          ),
          const SizedBox(height: 12),
          Text(
            'Workout paused',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: CurrentWorkoutPalette.primaryText,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '$workoutName is waiting here. Resume when you are ready.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: CurrentWorkoutPalette.secondaryText,
              fontWeight: FontWeight.w600,
              height: 1.32,
            ),
          ),
        ],
      ),
    );
  }
}

class CompletionReadyCard extends StatelessWidget {
  const CompletionReadyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: CurrentWorkoutPalette.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: CurrentWorkoutPalette.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.emoji_events_outlined,
            color: CurrentWorkoutPalette.accent,
            size: 36,
          ),
          const SizedBox(height: 12),
          Text(
            'Workout ready for summary',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: CurrentWorkoutPalette.primaryText,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'All planned sets are complete. Workout Summary can take over next.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: CurrentWorkoutPalette.secondaryText,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class NoActiveWorkoutCard extends StatelessWidget {
  const NoActiveWorkoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: CurrentWorkoutPalette.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: CurrentWorkoutPalette.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.event_busy_outlined,
            color: CurrentWorkoutPalette.accent,
            size: 34,
          ),
          const SizedBox(height: 12),
          Text(
            'No workout is ready yet.',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: CurrentWorkoutPalette.primaryText,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Plan a workout from the Dashboard to start the flow.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: CurrentWorkoutPalette.secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}

class _HandoffRow extends StatelessWidget {
  const _HandoffRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: CurrentWorkoutPalette.accent, size: 20),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            '$label: $value',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: CurrentWorkoutPalette.primaryText,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}
