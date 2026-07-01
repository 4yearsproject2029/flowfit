import 'package:flutter_test/flutter_test.dart';

import 'package:flowfit/data/models/workout_log.dart';
import 'package:flowfit/data/services/weekly_goal_service.dart';
import 'package:flowfit/features/share_cards/services/share_card_service.dart';

void main() {
  late ShareCardService shareCardService;

  setUp(() {
    shareCardService = ShareCardService();
  });

  test('creates workout card without performance metrics', () {
    final card = shareCardService.workoutCompletionCard(
      dateLabel: 'Jul 1, 2026',
      workoutLogs: [
        WorkoutLog(
          id: 'log-1',
          date: '2026-07-01',
          workoutId: 'workout-1',
          workoutName: 'Bench Press',
          category: 'Strength',
          isCompleted: true,
          sets: 5,
          reps: 5,
          weight: 225,
          memo: 'PR attempt',
          createdAt: DateTime(2026, 7, 1, 9),
        ),
      ],
    );

    expect(card, isNotNull);
    expect(card!.title, 'Workout Complete');
    expect(card.message, 'Showed up today.');
    expect(card.detail, 'Bench Press - Jul 1, 2026');
    expect(card.detail.contains('225'), isFalse);
    expect(card.detail.contains('5'), isFalse);
    expect(card.detail.contains('PR'), isFalse);
    expect(card.extraDetails, isEmpty);
  });

  test('adds supported workout metrics only after explicit opt-in', () {
    final card = shareCardService.workoutCompletionCard(
      dateLabel: 'Jul 1, 2026',
      includePerformanceMetrics: true,
      workoutLogs: [
        WorkoutLog(
          id: 'log-1',
          date: '2026-07-01',
          workoutId: 'workout-1',
          workoutName: 'Bench Press',
          category: 'Strength',
          isCompleted: true,
          sets: 5,
          reps: 5,
          weight: 225,
          memo: 'PR attempt',
          createdAt: DateTime(2026, 7, 1, 9),
        ),
      ],
    );

    expect(card, isNotNull);
    expect(card!.extraDetails, ['5 sets', '5 reps', '225 kg']);
    expect(card.detail.contains('PR'), isFalse);
  });

  test('does not create workout card without completed workout', () {
    final card = shareCardService.workoutCompletionCard(
      dateLabel: 'Jul 1, 2026',
      workoutLogs: [
        WorkoutLog(
          id: 'log-1',
          date: '2026-07-01',
          workoutId: 'workout-1',
          workoutName: 'Bench Press',
          category: 'Strength',
          isCompleted: false,
          createdAt: DateTime(2026, 7, 1, 9),
        ),
      ],
    );

    expect(card, isNull);
  });

  test('creates level card from XP total', () {
    final card = shareCardService.levelCard(xpTotal: 130);

    expect(card.title, 'Level 2');
    expect(card.message, 'Building the habit.');
    expect(card.detail, '30 / 100 XP to Level 3');
  });

  test('creates weekly goal card only when goal is complete', () {
    final incompleteCard = shareCardService.weeklyGoalCard(
      progress: const WeeklyGoalProgress(weeklyGoal: 3, completedWorkouts: 2),
    );
    final completeCard = shareCardService.weeklyGoalCard(
      progress: const WeeklyGoalProgress(weeklyGoal: 3, completedWorkouts: 3),
    );

    expect(incompleteCard, isNull);
    expect(completeCard, isNotNull);
    expect(completeCard!.title, 'Weekly Goal Complete');
    expect(completeCard.detail, '3 / 3 workouts this week');
  });
}
