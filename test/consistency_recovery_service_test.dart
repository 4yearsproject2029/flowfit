import 'package:flutter_test/flutter_test.dart';

import 'package:flowfit/data/models/workout_log.dart';
import 'package:flowfit/data/services/consistency_recovery_service.dart';

void main() {
  late ConsistencyRecoveryService recoveryService;

  setUp(() {
    recoveryService = ConsistencyRecoveryService();
  });

  test('detects a return after a missed completed week', () {
    final status = recoveryService.calculateStatus(
      weeklyGoal: 3,
      today: DateTime(2026, 7, 14),
      plannedRestDates: const [],
      workoutLogs: [
        _workoutLog(id: 'previous', date: '2026-07-07', isCompleted: true),
        _workoutLog(id: 'return', date: '2026-07-14', isCompleted: true),
      ],
    );

    expect(status.hasReturnedAfterMissedWeek, isTrue);
    expect(status.missedWeekStartDate, DateTime(2026, 7, 6));
    expect(status.returnWeekStartDate, DateTime(2026, 7, 13));
    expect(status.title, 'Welcome back');
    expect(status.reassurance, 'No XP lost. No level lost.');
  });

  test('does not detect a return before the user completes this week', () {
    final status = recoveryService.calculateStatus(
      weeklyGoal: 3,
      today: DateTime(2026, 7, 14),
      plannedRestDates: const [],
      workoutLogs: [
        _workoutLog(id: 'previous', date: '2026-07-07', isCompleted: true),
      ],
    );

    expect(status.hasReturnedAfterMissedWeek, isFalse);
  });

  test('planned rest week is neutral and does not count as missed', () {
    final status = recoveryService.calculateStatus(
      weeklyGoal: 3,
      today: DateTime(2026, 7, 14),
      plannedRestDates: const ['2026-07-09'],
      workoutLogs: [
        _workoutLog(id: 'previous', date: '2026-07-07', isCompleted: true),
        _workoutLog(id: 'return', date: '2026-07-14', isCompleted: true),
      ],
    );

    expect(status.hasReturnedAfterMissedWeek, isFalse);
  });

  test('ignores invalid dates and incomplete workouts', () {
    final status = recoveryService.calculateStatus(
      weeklyGoal: 3,
      today: DateTime(2026, 7, 14),
      plannedRestDates: const ['not-a-date'],
      workoutLogs: [
        _workoutLog(id: 'invalid', date: 'not-a-date', isCompleted: true),
        _workoutLog(id: 'incomplete', date: '2026-07-14'),
      ],
    );

    expect(status.hasReturnedAfterMissedWeek, isFalse);
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
    createdAt: DateTime(2026, 7, 14, 9),
  );
}
