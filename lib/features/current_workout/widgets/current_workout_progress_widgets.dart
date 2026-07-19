import 'package:flutter/material.dart';

import 'current_workout_palette.dart';

class CurrentWorkoutProgressPill extends StatelessWidget {
  const CurrentWorkoutProgressPill({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: CurrentWorkoutPalette.accentDark,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: CurrentWorkoutPalette.accent,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class CurrentWorkoutProgressBar extends StatelessWidget {
  const CurrentWorkoutProgressBar({super.key, required this.value});

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
          color: CurrentWorkoutPalette.accent,
        ),
      ),
    );
  }
}
