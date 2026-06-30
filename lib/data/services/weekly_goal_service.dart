import '../models/workout_log.dart';

class WeeklyGoalProgress {
  const WeeklyGoalProgress({
    required this.weeklyGoal,
    required this.completedWorkouts,
  });

  final int weeklyGoal;
  final int completedWorkouts;

  bool get isComplete {
    return completedWorkouts >= weeklyGoal;
  }

  double get progressValue {
    if (weeklyGoal <= 0) {
      return 0;
    }

    final value = completedWorkouts / weeklyGoal;
    return value > 1 ? 1 : value;
  }

  String get title {
    return isComplete ? 'Weekly Goal Complete' : 'Weekly Goal';
  }

  String get progressLabel {
    return '$completedWorkouts / $weeklyGoal workouts complete';
  }

  String get goalLabel {
    return 'Goal: $weeklyGoal workouts this week';
  }

  String get statusMessage {
    if (isComplete) {
      return 'You reached your weekly goal.';
    }

    final remainingWorkouts = weeklyGoal - completedWorkouts;
    if (completedWorkouts == 0) {
      return 'Complete workouts this week to reach your goal.';
    }

    final workoutLabel = remainingWorkouts == 1 ? 'workout' : 'workouts';
    return '$remainingWorkouts $workoutLabel to go this week.';
  }
}

class WeeklyGoalService {
  WeeklyGoalProgress calculateProgress({
    required int weeklyGoal,
    required List<WorkoutLog> workoutLogs,
    required DateTime today,
  }) {
    final weekStart = startOfWeek(today);
    final weekEnd = weekStart.add(const Duration(days: 6));
    final completedWorkouts = workoutLogs.where((log) {
      if (!log.isCompleted) {
        return false;
      }

      final logDate = DateTime.tryParse(log.date);
      if (logDate == null) {
        return false;
      }

      final dateOnly = DateTime(logDate.year, logDate.month, logDate.day);
      return !dateOnly.isBefore(weekStart) && !dateOnly.isAfter(weekEnd);
    }).length;

    return WeeklyGoalProgress(
      weeklyGoal: weeklyGoal,
      completedWorkouts: completedWorkouts,
    );
  }

  DateTime startOfWeek(DateTime date) {
    final dateOnly = DateTime(date.year, date.month, date.day);
    return dateOnly.subtract(Duration(days: dateOnly.weekday - 1));
  }
}
