import 'package:flutter/material.dart';

import '../../../data/models/workout_log.dart';
import 'workout_item.dart';

class WorkoutList extends StatelessWidget {
  const WorkoutList({
    super.key,
    required this.workoutLogs,
    required this.onToggle,
    required this.onDelete,
  });

  final List<WorkoutLog> workoutLogs;
  final void Function(String workoutLogId) onToggle;
  final void Function(String workoutLogId) onDelete;

  @override
  Widget build(BuildContext context) {
    final sortedWorkoutLogs = [...workoutLogs];

    sortedWorkoutLogs.sort((first, second) {
      if (first.isCompleted == second.isCompleted) {
        return first.createdAt.compareTo(second.createdAt);
      }

      return first.isCompleted ? 1 : -1;
    });

    return Column(
      children: sortedWorkoutLogs.map((workoutLog) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: WorkoutItem(
            workoutLog: workoutLog,
            onToggle: () {
              onToggle(workoutLog.id);
            },
            onDelete: () {
              onDelete(workoutLog.id);
            },
          ),
        );
      }).toList(),
    );
  }
}
