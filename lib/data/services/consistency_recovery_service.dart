import '../models/workout_log.dart';
import 'weekly_goal_service.dart';

class ConsistencyRecoveryStatus {
  const ConsistencyRecoveryStatus({
    required this.hasReturnedAfterMissedWeek,
    this.missedWeekStartDate,
    this.returnWeekStartDate,
  });

  final bool hasReturnedAfterMissedWeek;
  final DateTime? missedWeekStartDate;
  final DateTime? returnWeekStartDate;

  String get title {
    return 'Welcome back';
  }

  String get message {
    return 'Your XP and level are still here. Pick up with one workout when you are ready.';
  }

  String get reassurance {
    return 'No XP lost. No level lost.';
  }
}

class ConsistencyRecoveryService {
  ConsistencyRecoveryStatus calculateStatus({
    required int weeklyGoal,
    required List<WorkoutLog> workoutLogs,
    required DateTime today,
    required Iterable<String> plannedRestDates,
  }) {
    final currentWeekStart = WeeklyGoalService().startOfWeek(today);
    final completedDates = _completedWorkoutDates(workoutLogs);

    if (weeklyGoal <= 0 || completedDates.isEmpty) {
      return const ConsistencyRecoveryStatus(hasReturnedAfterMissedWeek: false);
    }

    final completedThisWeek = completedDates.any((date) {
      final weekStart = WeeklyGoalService().startOfWeek(date);
      return weekStart == currentWeekStart;
    });

    if (!completedThisWeek) {
      return const ConsistencyRecoveryStatus(hasReturnedAfterMissedWeek: false);
    }

    final plannedRestWeekStarts = _plannedRestWeekStarts(plannedRestDates);
    final earliestCompletedWeekStart = completedDates
        .map(WeeklyGoalService().startOfWeek)
        .reduce((first, second) => first.isBefore(second) ? first : second);

    var weekStart = earliestCompletedWeekStart;
    DateTime? missedWeekStart;

    while (weekStart.isBefore(currentWeekStart)) {
      final completedCount = completedDates.where((date) {
        return WeeklyGoalService().startOfWeek(date) == weekStart;
      }).length;

      if (completedCount < weeklyGoal &&
          !plannedRestWeekStarts.contains(weekStart)) {
        missedWeekStart = weekStart;
      }

      weekStart = weekStart.add(const Duration(days: 7));
    }

    if (missedWeekStart == null) {
      return const ConsistencyRecoveryStatus(hasReturnedAfterMissedWeek: false);
    }

    return ConsistencyRecoveryStatus(
      hasReturnedAfterMissedWeek: true,
      missedWeekStartDate: missedWeekStart,
      returnWeekStartDate: currentWeekStart,
    );
  }

  List<DateTime> _completedWorkoutDates(List<WorkoutLog> workoutLogs) {
    return workoutLogs
        .where((log) => log.isCompleted)
        .map((log) {
          final parsedDate = DateTime.tryParse(log.date);
          if (parsedDate == null) {
            return null;
          }

          return DateTime(parsedDate.year, parsedDate.month, parsedDate.day);
        })
        .whereType<DateTime>()
        .toList();
  }

  Set<DateTime> _plannedRestWeekStarts(Iterable<String> plannedRestDates) {
    return plannedRestDates
        .map((date) {
          final parsedDate = DateTime.tryParse(date);
          if (parsedDate == null) {
            return null;
          }

          return WeeklyGoalService().startOfWeek(parsedDate);
        })
        .whereType<DateTime>()
        .toSet();
  }
}
