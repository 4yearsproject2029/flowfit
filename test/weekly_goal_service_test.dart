import 'package:flutter_test/flutter_test.dart';

import 'package:flowfit/data/models/workout_log.dart';
import 'package:flowfit/data/services/weekly_goal_service.dart';

void main() {
  late WeeklyGoalService weeklyGoalService;

  setUp(() {
    weeklyGoalService = WeeklyGoalService();
  });

  test('counts completed workouts in the current Monday to Sunday week', () {
    final progress = weeklyGoalService.calculateProgress(
      weeklyGoal: 3,
      today: DateTime(2026, 6, 30),
      workoutLogs: [
        _workoutLog(id: 'mon', date: '2026-06-29', isCompleted: true),
        _workoutLog(id: 'tue', date: '2026-06-30', isCompleted: true),
        _workoutLog(id: 'sun', date: '2026-07-05', isCompleted: true),
        _workoutLog(id: 'incomplete', date: '2026-07-01'),
        _workoutLog(id: 'previous-week', date: '2026-06-28', isCompleted: true),
        _workoutLog(id: 'next-week', date: '2026-07-06', isCompleted: true),
      ],
    );

    expect(progress.completedWorkouts, 3);
    expect(progress.weeklyGoal, 3);
    expect(progress.isComplete, isTrue);
    expect(progress.progressValue, 1);
    expect(progress.progressLabel, '3 / 3 workouts complete');
    expect(progress.statusMessage, 'You reached your weekly goal.');
  });

  test('shows remaining workouts and caps progress value when over goal', () {
    final partialProgress = weeklyGoalService.calculateProgress(
      weeklyGoal: 3,
      today: DateTime(2026, 6, 30),
      workoutLogs: [
        _workoutLog(id: 'mon', date: '2026-06-29', isCompleted: true),
      ],
    );

    expect(partialProgress.isComplete, isFalse);
    expect(partialProgress.progressValue, closeTo(1 / 3, 0.001));
    expect(partialProgress.statusMessage, '2 workouts to go this week.');

    final overGoalProgress = weeklyGoalService.calculateProgress(
      weeklyGoal: 3,
      today: DateTime(2026, 6, 30),
      workoutLogs: [
        _workoutLog(id: 'mon-a', date: '2026-06-29', isCompleted: true),
        _workoutLog(id: 'mon-b', date: '2026-06-29', isCompleted: true),
        _workoutLog(id: 'tue', date: '2026-06-30', isCompleted: true),
        _workoutLog(id: 'wed', date: '2026-07-01', isCompleted: true),
      ],
    );

    expect(overGoalProgress.completedWorkouts, 4);
    expect(overGoalProgress.isComplete, isTrue);
    expect(overGoalProgress.progressValue, 1);
    expect(overGoalProgress.progressLabel, '4 / 3 workouts complete');
  });

  test('uses Monday as the start of the week', () {
    expect(
      weeklyGoalService.startOfWeek(DateTime(2026, 7, 5)),
      DateTime(2026, 6, 29),
    );
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
    createdAt: DateTime(2026, 6, 30, 9),
  );
}
