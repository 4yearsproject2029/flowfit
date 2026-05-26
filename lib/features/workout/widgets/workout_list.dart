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

    return ListView.separated(
      itemCount: sortedWorkoutLogs.length,
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8);
      },
      itemBuilder: (context, index) {
        final workoutLog = sortedWorkoutLogs[index];

        return WorkoutItem(
          workoutLog: workoutLog,
          onToggle: () {
            onToggle(workoutLog.id);
          },
          onDelete: () {
            onDelete(workoutLog.id);
          },
        );
      },
    );
  }
}
