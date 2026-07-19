import 'package:flutter/material.dart';

import 'current_workout_palette.dart';

class ControlActionsRow extends StatelessWidget {
  const ControlActionsRow({
    super.key,
    required this.isPaused,
    required this.onPause,
    required this.onAdjust,
    required this.onSkip,
    required this.onSkipExercise,
  });

  final bool isPaused;
  final VoidCallback onPause;
  final VoidCallback? onAdjust;
  final VoidCallback? onSkip;
  final VoidCallback? onSkipExercise;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        OutlinedButton.icon(
          onPressed: isPaused ? null : onPause,
          style: _controlButtonStyle(),
          icon: const Icon(Icons.pause),
          label: const Text('Pause'),
        ),
        OutlinedButton.icon(
          onPressed: isPaused ? null : onAdjust,
          style: _controlButtonStyle(),
          icon: const Icon(Icons.tune),
          label: const Text('Adjust'),
        ),
        OutlinedButton.icon(
          onPressed: isPaused ? null : onSkip,
          style: _controlButtonStyle(),
          icon: const Icon(Icons.skip_next),
          label: const Text('Skip Set'),
        ),
        OutlinedButton.icon(
          onPressed: isPaused ? null : onSkipExercise,
          style: _controlButtonStyle(),
          icon: const Icon(Icons.fast_forward),
          label: const Text('Skip Exercise'),
        ),
      ],
    );
  }

  ButtonStyle _controlButtonStyle() {
    return OutlinedButton.styleFrom(
      foregroundColor: CurrentWorkoutPalette.primaryText,
      disabledForegroundColor: CurrentWorkoutPalette.mutedText,
      side: const BorderSide(color: CurrentWorkoutPalette.border),
      minimumSize: const Size(108, 48),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: const TextStyle(fontWeight: FontWeight.w800),
    );
  }
}
