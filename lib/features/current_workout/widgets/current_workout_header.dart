import 'package:flutter/material.dart';

import 'current_workout_palette.dart';

class CurrentWorkoutHeader extends StatelessWidget {
  const CurrentWorkoutHeader({super.key, required this.dateLabel});

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
            color: CurrentWorkoutPalette.primaryText,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: CurrentWorkoutPalette.surface,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: CurrentWorkoutPalette.border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                color: CurrentWorkoutPalette.accent,
                size: 16,
              ),
              const SizedBox(width: 6),
              Text(
                dateLabel,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: CurrentWorkoutPalette.secondaryText,
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
