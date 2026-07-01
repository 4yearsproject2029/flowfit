import 'package:flutter_test/flutter_test.dart';

import 'package:flowfit/data/models/workout_log.dart';
import 'package:flowfit/data/services/mvp_validation_metrics_service.dart';

void main() {
  late MvpValidationMetricsService metricsService;

  setUp(() {
    metricsService = MvpValidationMetricsService();
  });

  test('calculates local weekly goal and workout averages', () {
    final metrics = metricsService.calculateMetrics(
      weeklyGoal: 2,
      today: DateTime(2026, 7, 15),
      plannedRestDates: const [],
      shareCardGenerationCounts: const {'2026-07-01': 2, '2026-07-15': 1},
      workoutLogs: [
        _workoutLog(id: 'one', date: '2026-06-30', isCompleted: true),
        _workoutLog(id: 'two', date: '2026-07-01', isCompleted: true),
        _workoutLog(id: 'three', date: '2026-07-08', isCompleted: true),
        _workoutLog(id: 'four', date: '2026-07-15', isCompleted: true),
        _workoutLog(id: 'draft', date: '2026-07-15'),
      ],
    );

    expect(metrics.measuredWeeks, 3);
    expect(metrics.eligibleGoalWeeks, 3);
    expect(metrics.weeklyGoalCompletionRate, closeTo(1 / 3, 0.001));
    expect(metrics.averageWorkoutsPerWeek, closeTo(4 / 3, 0.001));
    expect(metrics.averageShareCardsGeneratedPerWeek, 1);
    expect(metrics.hasReturnedAfterMissedWorkoutWeek, isTrue);
  });

  test('excludes planned rest weeks from weekly goal completion rate', () {
    final metrics = metricsService.calculateMetrics(
      weeklyGoal: 2,
      today: DateTime(2026, 7, 15),
      plannedRestDates: const ['2026-07-09'],
      shareCardGenerationCounts: const {},
      workoutLogs: [
        _workoutLog(id: 'one', date: '2026-06-30', isCompleted: true),
        _workoutLog(id: 'two', date: '2026-07-01', isCompleted: true),
        _workoutLog(id: 'three', date: '2026-07-08', isCompleted: true),
        _workoutLog(id: 'four', date: '2026-07-15', isCompleted: true),
      ],
    );

    expect(metrics.measuredWeeks, 3);
    expect(metrics.eligibleGoalWeeks, 2);
    expect(metrics.weeklyGoalCompletionRate, 0.5);
    expect(metrics.averageWorkoutsPerWeek, closeTo(4 / 3, 0.001));
    expect(metrics.hasReturnedAfterMissedWorkoutWeek, isFalse);
  });

  test('ignores invalid dates and returns zero when no history exists', () {
    final metrics = metricsService.calculateMetrics(
      weeklyGoal: 2,
      today: DateTime(2026, 7, 15),
      plannedRestDates: const ['not-a-date'],
      shareCardGenerationCounts: const {'bad-date': 4},
      workoutLogs: [
        _workoutLog(id: 'invalid', date: 'not-a-date', isCompleted: true),
        _workoutLog(id: 'incomplete', date: '2026-07-15'),
      ],
    );

    expect(metrics.measuredWeeks, 0);
    expect(metrics.eligibleGoalWeeks, 0);
    expect(metrics.weeklyGoalCompletionRate, 0);
    expect(metrics.averageWorkoutsPerWeek, 0);
    expect(metrics.averageShareCardsGeneratedPerWeek, 0);
    expect(metrics.hasReturnedAfterMissedWorkoutWeek, isFalse);
  });
}

WorkoutLog _workoutLog({
  required String id,
  required String date,
  bool isCompleted = false,
}) {
  return WorkoutLog(
    id: id,
    date: date,
    workoutId: 'workout-$id',
    workoutName: 'Workout $id',
    category: 'Strength',
    isCompleted: isCompleted,
    createdAt: DateTime(2026, 7, 15, 9),
  );
}
