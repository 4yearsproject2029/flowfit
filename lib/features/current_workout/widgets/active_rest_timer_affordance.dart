import 'package:flutter/material.dart';

import '../services/rest_timer_continuity_service.dart';
import 'current_workout_palette.dart';

class ActiveRestTimerAffordance extends StatelessWidget {
  const ActiveRestTimerAffordance({super.key, required this.onReturnToWorkout});

  final ValueChanged<ActiveRestTimerState> onReturnToWorkout;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ActiveRestTimerState?>(
      valueListenable: RestTimerContinuityService().activeRest,
      builder: (context, activeRest, child) {
        if (activeRest == null) {
          return const SizedBox.shrink();
        }

        final remainingSeconds = activeRest.remainingSeconds();
        final isComplete = remainingSeconds == 0;

        return SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 86),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: CurrentWorkoutPalette.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: CurrentWorkoutPalette.border),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.35),
                        blurRadius: 22,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 44,
                        width: 44,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: CurrentWorkoutPalette.accent.withValues(
                            alpha: 0.14,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          isComplete
                              ? Icons.check_circle_outline
                              : Icons.hourglass_empty,
                          color: CurrentWorkoutPalette.accent,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isComplete ? 'Rest complete' : 'Rest timer',
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(
                                    color: CurrentWorkoutPalette.primaryText,
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              isComplete
                                  ? 'Return to ${activeRest.restState.nextWorkoutName}'
                                  : '${_formatTime(remainingSeconds)} remaining',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(
                                    color: CurrentWorkoutPalette.secondaryText,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      FilledButton(
                        onPressed: () {
                          onReturnToWorkout(activeRest);
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: CurrentWorkoutPalette.accent,
                          foregroundColor: Colors.black,
                          minimumSize: const Size(112, 46),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        child: const Text('Return'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String _formatTime(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }
}
