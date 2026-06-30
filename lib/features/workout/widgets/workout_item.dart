import 'package:flutter/material.dart';

import '../../../data/models/workout_log.dart';

class WorkoutItem extends StatelessWidget {
  const WorkoutItem({
    super.key,
    required this.workoutLog,
    required this.onToggle,
    required this.onDelete,
  });

  final WorkoutLog workoutLog;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final isCompleted = workoutLog.isCompleted;
    final textColor = isCompleted ? Colors.grey.shade600 : Colors.black87;
    final memo = workoutLog.memo?.trim();
    final details = <String>[
      workoutLog.category,
      if (workoutLog.sets != null) '${workoutLog.sets} sets',
      if (workoutLog.reps != null) '${workoutLog.reps} reps',
      if (workoutLog.weight != null) '${workoutLog.weight} kg',
    ].join(' · ');

    return Container(
      decoration: BoxDecoration(
        color: isCompleted ? Colors.grey.shade50 : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ListTile(
        leading: Checkbox(
          value: isCompleted,
          onChanged: (value) {
            onToggle();
          },
        ),
        title: Text(
          workoutLog.workoutName,
          style: TextStyle(
            color: textColor,
            decoration: isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(details, style: TextStyle(color: textColor)),
            if (memo != null && memo.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(memo, style: TextStyle(color: textColor)),
            ],
          ],
        ),
        trailing: IconButton(
          onPressed: onDelete,
          icon: const Icon(Icons.delete_outline),
        ),
      ),
    );
  }
}
