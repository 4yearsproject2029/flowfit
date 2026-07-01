import '../models/workout_log.dart';
import 'consistency_recovery_service.dart';
import 'weekly_goal_service.dart';

class MvpValidationMetrics {
  const MvpValidationMetrics({
    required this.weeklyGoalCompletionRate,
    required this.averageWorkoutsPerWeek,
    required this.averageShareCardsGeneratedPerWeek,
    required this.hasReturnedAfterMissedWorkoutWeek,
    required this.measuredWeeks,
    required this.eligibleGoalWeeks,
  });

  final double weeklyGoalCompletionRate;
  final double averageWorkoutsPerWeek;
  final double averageShareCardsGeneratedPerWeek;
  final bool hasReturnedAfterMissedWorkoutWeek;
  final int measuredWeeks;
  final int eligibleGoalWeeks;
}

class MvpValidationMetricsService {
  MvpValidationMetrics calculateMetrics({
    required int weeklyGoal,
    required List<WorkoutLog> workoutLogs,
    required Map<String, int> shareCardGenerationCounts,
    required DateTime today,
    required Iterable<String> plannedRestDates,
  }) {
    final completedWorkoutDates = _completedWorkoutDates(workoutLogs);
    final shareCardDates = _shareCardDates(shareCardGenerationCounts);
    final measuredWeeks = _measuredWeeks(
      completedWorkoutDates: completedWorkoutDates,
      shareCardDates: shareCardDates,
      today: today,
    );

    final recoveryStatus = ConsistencyRecoveryService().calculateStatus(
      weeklyGoal: weeklyGoal,
      workoutLogs: workoutLogs,
      today: today,
      plannedRestDates: plannedRestDates,
    );

    if (measuredWeeks.isEmpty || weeklyGoal <= 0) {
      return MvpValidationMetrics(
        weeklyGoalCompletionRate: 0,
        averageWorkoutsPerWeek: 0,
        averageShareCardsGeneratedPerWeek: 0,
        hasReturnedAfterMissedWorkoutWeek:
            recoveryStatus.hasReturnedAfterMissedWeek,
        measuredWeeks: 0,
        eligibleGoalWeeks: 0,
      );
    }

    final plannedRestWeeks = _plannedRestWeeks(plannedRestDates);
    final completedWorkoutsByWeek = _countByWeek(completedWorkoutDates);
    final totalCompletedWorkouts = completedWorkoutDates.length;
    final totalShareCardsGenerated = shareCardGenerationCounts.values
        .where((count) => count > 0)
        .fold<int>(0, (total, count) => total + count);

    final eligibleGoalWeeks = measuredWeeks
        .where((weekStart) => !plannedRestWeeks.contains(weekStart))
        .toList();
    final completedGoalWeeks = eligibleGoalWeeks.where((weekStart) {
      return (completedWorkoutsByWeek[weekStart] ?? 0) >= weeklyGoal;
    }).length;

    final measuredWeekCount = measuredWeeks.length;
    final eligibleGoalWeekCount = eligibleGoalWeeks.length;

    return MvpValidationMetrics(
      weeklyGoalCompletionRate: eligibleGoalWeekCount == 0
          ? 0
          : completedGoalWeeks / eligibleGoalWeekCount,
      averageWorkoutsPerWeek: totalCompletedWorkouts / measuredWeekCount,
      averageShareCardsGeneratedPerWeek:
          totalShareCardsGenerated / measuredWeekCount,
      hasReturnedAfterMissedWorkoutWeek:
          recoveryStatus.hasReturnedAfterMissedWeek,
      measuredWeeks: measuredWeekCount,
      eligibleGoalWeeks: eligibleGoalWeekCount,
    );
  }

  List<DateTime> _completedWorkoutDates(List<WorkoutLog> workoutLogs) {
    return workoutLogs
        .where((log) => log.isCompleted)
        .map((log) => DateTime.tryParse(log.date))
        .whereType<DateTime>()
        .map(_dateOnly)
        .toList();
  }

  List<DateTime> _shareCardDates(Map<String, int> shareCardGenerationCounts) {
    return shareCardGenerationCounts.entries
        .where((entry) => entry.value > 0)
        .map((entry) => DateTime.tryParse(entry.key))
        .whereType<DateTime>()
        .map(_dateOnly)
        .toList();
  }

  List<DateTime> _measuredWeeks({
    required List<DateTime> completedWorkoutDates,
    required List<DateTime> shareCardDates,
    required DateTime today,
  }) {
    final localHistoryDates = [...completedWorkoutDates, ...shareCardDates];
    if (localHistoryDates.isEmpty) {
      return const [];
    }

    localHistoryDates.sort();
    final weeklyGoalService = WeeklyGoalService();
    final firstWeek = weeklyGoalService.startOfWeek(localHistoryDates.first);
    final lastWeek = weeklyGoalService.startOfWeek(today);
    if (firstWeek.isAfter(lastWeek)) {
      return const [];
    }

    final weeks = <DateTime>[];
    var currentWeek = firstWeek;
    while (!currentWeek.isAfter(lastWeek)) {
      weeks.add(currentWeek);
      currentWeek = currentWeek.add(const Duration(days: 7));
    }
    return weeks;
  }

  Set<DateTime> _plannedRestWeeks(Iterable<String> plannedRestDates) {
    final weeklyGoalService = WeeklyGoalService();
    return plannedRestDates
        .map(DateTime.tryParse)
        .whereType<DateTime>()
        .map(_dateOnly)
        .map(weeklyGoalService.startOfWeek)
        .toSet();
  }

  Map<DateTime, int> _countByWeek(List<DateTime> dates) {
    final weeklyGoalService = WeeklyGoalService();
    final counts = <DateTime, int>{};
    for (final date in dates) {
      final weekStart = weeklyGoalService.startOfWeek(date);
      counts[weekStart] = (counts[weekStart] ?? 0) + 1;
    }
    return counts;
  }

  DateTime _dateOnly(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }
}
