import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

import 'package:flowfit/data/local/local_database.dart';
import 'package:flowfit/data/models/workout_log.dart';
import 'package:flowfit/data/services/level_service.dart';
import 'package:flowfit/data/services/storage_service.dart';
import 'package:flowfit/data/services/weekly_goal_service.dart';

void main() {
  late Directory testHiveDirectory;
  late StorageService storageService;

  setUp(() async {
    testHiveDirectory = await Directory.systemTemp.createTemp(
      'flowfit_storage_test_',
    );
    await LocalDatabase.init(testPath: testHiveDirectory.path);
    storageService = StorageService();
  });

  tearDown(() async {
    await Hive.close();
    if (await testHiveDirectory.exists()) {
      await testHiveDirectory.delete(recursive: true);
    }
  });

  test('toggles workout completion and persists the updated state', () async {
    final workoutLog = WorkoutLog(
      id: 'log-1',
      date: '2026-06-30',
      workoutId: 'workout-1',
      workoutName: 'Squat',
      category: 'Strength',
      isCompleted: false,
      createdAt: DateTime(2026, 6, 30, 9),
    );

    await storageService.addWorkoutLog(workoutLog);

    expect(
      storageService.getWorkoutLogsByDate('2026-06-30').single.isCompleted,
      isFalse,
    );

    await storageService.toggleWorkoutCompletion('log-1');
    expect(
      storageService.getWorkoutLogsByDate('2026-06-30').single.isCompleted,
      isTrue,
    );

    await Hive.close();
    await LocalDatabase.init(testPath: testHiveDirectory.path);
    storageService = StorageService();

    expect(
      storageService.getWorkoutLogsByDate('2026-06-30').single.isCompleted,
      isTrue,
    );

    await storageService.toggleWorkoutCompletion('log-1');
    expect(
      storageService.getWorkoutLogsByDate('2026-06-30').single.isCompleted,
      isFalse,
    );

    await storageService.deleteWorkoutLog('log-1');
    expect(storageService.getWorkoutLogsByDate('2026-06-30'), isEmpty);
  });

  test('persists weekly goal and onboarding state after restart', () async {
    await storageService.saveWeeklyGoal(4);

    expect(storageService.getWeeklyGoal(), 4);
    expect(storageService.hasCompletedOnboarding(), isTrue);

    await Hive.close();
    await LocalDatabase.init(testPath: testHiveDirectory.path);
    storageService = StorageService();

    expect(storageService.getWeeklyGoal(), 4);
    expect(storageService.hasCompletedOnboarding(), isTrue);
  });

  test('persists share card workout metric preference after restart', () async {
    expect(storageService.shouldShowShareCardWorkoutMetrics(), isFalse);

    await storageService.saveShareCardWorkoutMetricsPreference(true);

    expect(storageService.shouldShowShareCardWorkoutMetrics(), isTrue);

    await Hive.close();
    await LocalDatabase.init(testPath: testHiveDirectory.path);

    expect(StorageService().shouldShowShareCardWorkoutMetrics(), isTrue);

    await StorageService().saveShareCardWorkoutMetricsPreference(false);

    expect(StorageService().shouldShowShareCardWorkoutMetrics(), isFalse);
  });

  test('persists share card generation counts after restart', () async {
    await storageService.recordShareCardGenerated(
      generatedAt: DateTime(2026, 7, 1),
    );
    await storageService.recordShareCardGenerated(
      generatedAt: DateTime(2026, 7, 1),
    );
    await storageService.recordShareCardGenerated(
      generatedAt: DateTime(2026, 7, 2),
    );

    expect(storageService.getShareCardGenerationCounts(), {
      '2026-07-01': 2,
      '2026-07-02': 1,
    });

    await Hive.close();
    await LocalDatabase.init(testPath: testHiveDirectory.path);
    storageService = StorageService();

    expect(storageService.getShareCardGenerationCounts(), {
      '2026-07-01': 2,
      '2026-07-02': 1,
    });
  });

  test('awards completion XP once and persists the total', () async {
    final workoutLog = WorkoutLog(
      id: 'log-1',
      date: '2026-06-30',
      workoutId: 'workout-1',
      workoutName: 'Squat',
      category: 'Strength',
      isCompleted: false,
      createdAt: DateTime(2026, 6, 30, 9),
    );

    await storageService.addWorkoutLog(workoutLog);

    expect(storageService.getXpTotal(), 0);

    await storageService.toggleWorkoutCompletion('log-1');

    expect(storageService.getXpTotal(), 10);
    expect(
      storageService.getXpExplanation(),
      'Earned +10 XP for completing Squat.',
    );

    await storageService.toggleWorkoutCompletion('log-1');
    await storageService.toggleWorkoutCompletion('log-1');

    expect(storageService.getXpTotal(), 10);

    await storageService.deleteWorkoutLog('log-1');
    await storageService.addWorkoutLog(
      WorkoutLog(
        id: 'log-2',
        date: '2026-06-30',
        workoutId: 'workout-2',
        workoutName: 'Squat',
        category: 'Strength',
        isCompleted: false,
        createdAt: DateTime(2026, 6, 30, 10),
      ),
    );
    await storageService.toggleWorkoutCompletion('log-2');

    expect(storageService.getXpTotal(), 10);

    await Hive.close();
    await LocalDatabase.init(testPath: testHiveDirectory.path);
    storageService = StorageService();

    expect(storageService.getXpTotal(), 10);
    expect(
      storageService.getXpExplanation(),
      'Earned +10 XP for completing Squat.',
    );
  });

  test(
    'level progress persists and does not decrease after deleting logs',
    () async {
      final workoutLog = WorkoutLog(
        id: 'log-1',
        date: '2026-06-30',
        workoutId: 'workout-1',
        workoutName: 'Squat',
        category: 'Strength',
        isCompleted: false,
        createdAt: DateTime(2026, 6, 30, 9),
      );

      await storageService.addWorkoutLog(workoutLog);
      await storageService.toggleWorkoutCompletion('log-1');

      var levelProgress = LevelService().calculateProgress(
        storageService.getXpTotal(),
      );
      expect(levelProgress.currentLevel, 1);
      expect(levelProgress.progressLabel, '10 / 100 XP to Level 2');

      await storageService.deleteWorkoutLog('log-1');

      levelProgress = LevelService().calculateProgress(
        storageService.getXpTotal(),
      );
      expect(levelProgress.currentLevel, 1);
      expect(levelProgress.progressLabel, '10 / 100 XP to Level 2');

      await Hive.close();
      await LocalDatabase.init(testPath: testHiveDirectory.path);
      storageService = StorageService();

      levelProgress = LevelService().calculateProgress(
        storageService.getXpTotal(),
      );
      expect(levelProgress.currentLevel, 1);
      expect(levelProgress.progressLabel, '10 / 100 XP to Level 2');
    },
  );

  test('weekly goal progress persists after restart', () async {
    await storageService.saveWeeklyGoal(3);
    await storageService.addWorkoutLog(
      WorkoutLog(
        id: 'log-1',
        date: '2026-06-30',
        workoutId: 'workout-1',
        workoutName: 'Squat',
        category: 'Strength',
        isCompleted: false,
        createdAt: DateTime(2026, 6, 30, 9),
      ),
    );
    await storageService.toggleWorkoutCompletion('log-1');

    var progress = WeeklyGoalService().calculateProgress(
      weeklyGoal: storageService.getWeeklyGoal()!,
      workoutLogs: storageService.getWorkoutLogs(),
      today: DateTime(2026, 6, 30),
    );
    expect(progress.progressLabel, '1 / 3 workouts complete');

    await Hive.close();
    await LocalDatabase.init(testPath: testHiveDirectory.path);
    storageService = StorageService();

    progress = WeeklyGoalService().calculateProgress(
      weeklyGoal: storageService.getWeeklyGoal()!,
      workoutLogs: storageService.getWorkoutLogs(),
      today: DateTime(2026, 6, 30),
    );
    expect(progress.progressLabel, '1 / 3 workouts complete');
  });

  test(
    'detects return after missed week without removing XP or level',
    () async {
      final today = DateTime.now();
      final currentWeekStart = WeeklyGoalService().startOfWeek(today);
      final previousWeekStart = currentWeekStart.subtract(
        const Duration(days: 7),
      );

      await storageService.saveWeeklyGoal(3);
      await storageService.addWorkoutLog(
        WorkoutLog(
          id: 'previous-log',
          date: _dateKey(previousWeekStart),
          workoutId: 'previous-workout',
          workoutName: 'Walk',
          category: 'Cardio',
          isCompleted: true,
          createdAt: previousWeekStart,
        ),
      );
      await storageService.addWorkoutLog(
        WorkoutLog(
          id: 'return-log',
          date: _dateKey(today),
          workoutId: 'return-workout',
          workoutName: 'Squat',
          category: 'Strength',
          isCompleted: false,
          createdAt: today,
        ),
      );

      await storageService.toggleWorkoutCompletion('return-log');

      final status = storageService.getConsistencyRecoveryStatus(today: today);
      expect(status.hasReturnedAfterMissedWeek, isTrue);
      expect(storageService.getXpTotal(), StorageService.workoutCompletionXp);
      expect(
        LevelService()
            .calculateProgress(storageService.getXpTotal())
            .currentLevel,
        1,
      );
      expect(
        storageService.getLastDetectedMissedWeekStartDate(),
        _dateKey(previousWeekStart),
      );
      expect(
        storageService.getLastReturnWeekStartDate(),
        _dateKey(currentWeekStart),
      );

      await Hive.close();
      await LocalDatabase.init(testPath: testHiveDirectory.path);
      storageService = StorageService();

      expect(
        storageService.getLastDetectedMissedWeekStartDate(),
        _dateKey(previousWeekStart),
      );
      expect(
        storageService.getLastReturnWeekStartDate(),
        _dateKey(currentWeekStart),
      );
      expect(storageService.getXpTotal(), StorageService.workoutCompletionXp);
    },
  );

  test(
    'clears recovery metric dates when return workout is uncompleted',
    () async {
      final today = DateTime.now();
      final currentWeekStart = WeeklyGoalService().startOfWeek(today);
      final previousWeekStart = currentWeekStart.subtract(
        const Duration(days: 7),
      );

      await storageService.saveWeeklyGoal(3);
      await storageService.addWorkoutLog(
        WorkoutLog(
          id: 'previous-log',
          date: _dateKey(previousWeekStart),
          workoutId: 'previous-workout',
          workoutName: 'Walk',
          category: 'Cardio',
          isCompleted: true,
          createdAt: previousWeekStart,
        ),
      );
      await storageService.addWorkoutLog(
        WorkoutLog(
          id: 'return-log',
          date: _dateKey(today),
          workoutId: 'return-workout',
          workoutName: 'Squat',
          category: 'Strength',
          isCompleted: false,
          createdAt: today,
        ),
      );

      await storageService.toggleWorkoutCompletion('return-log');

      expect(
        storageService.getLastDetectedMissedWeekStartDate(),
        _dateKey(previousWeekStart),
      );
      expect(
        storageService.getLastReturnWeekStartDate(),
        _dateKey(currentWeekStart),
      );

      await storageService.toggleWorkoutCompletion('return-log');

      expect(storageService.getLastDetectedMissedWeekStartDate(), isNull);
      expect(storageService.getLastReturnWeekStartDate(), isNull);
    },
  );

  test('clears recovery metric dates when return workout is deleted', () async {
    final today = DateTime.now();
    final currentWeekStart = WeeklyGoalService().startOfWeek(today);
    final previousWeekStart = currentWeekStart.subtract(
      const Duration(days: 7),
    );

    await storageService.saveWeeklyGoal(3);
    await storageService.addWorkoutLog(
      WorkoutLog(
        id: 'previous-log',
        date: _dateKey(previousWeekStart),
        workoutId: 'previous-workout',
        workoutName: 'Walk',
        category: 'Cardio',
        isCompleted: true,
        createdAt: previousWeekStart,
      ),
    );
    await storageService.addWorkoutLog(
      WorkoutLog(
        id: 'return-log',
        date: _dateKey(today),
        workoutId: 'return-workout',
        workoutName: 'Squat',
        category: 'Strength',
        isCompleted: false,
        createdAt: today,
      ),
    );

    await storageService.toggleWorkoutCompletion('return-log');

    expect(
      storageService.getLastDetectedMissedWeekStartDate(),
      _dateKey(previousWeekStart),
    );
    expect(
      storageService.getLastReturnWeekStartDate(),
      _dateKey(currentWeekStart),
    );

    await storageService.deleteWorkoutLog('return-log');

    expect(storageService.getLastDetectedMissedWeekStartDate(), isNull);
    expect(storageService.getLastReturnWeekStartDate(), isNull);
  });

  test(
    'planned rest persists and prevents missed-week recovery detection',
    () async {
      final today = DateTime.now();
      final previousWeekStart = WeeklyGoalService()
          .startOfWeek(today)
          .subtract(const Duration(days: 7));

      await storageService.saveWeeklyGoal(3);
      await storageService.markPlannedRest(_dateKey(previousWeekStart));
      await storageService.addWorkoutLog(
        WorkoutLog(
          id: 'previous-log',
          date: _dateKey(previousWeekStart),
          workoutId: 'previous-workout',
          workoutName: 'Walk',
          category: 'Cardio',
          isCompleted: true,
          createdAt: previousWeekStart,
        ),
      );
      await storageService.addWorkoutLog(
        WorkoutLog(
          id: 'return-log',
          date: _dateKey(today),
          workoutId: 'return-workout',
          workoutName: 'Squat',
          category: 'Strength',
          isCompleted: true,
          createdAt: today,
        ),
      );

      final status = storageService.getConsistencyRecoveryStatus(today: today);
      expect(status.hasReturnedAfterMissedWeek, isFalse);
      expect(
        storageService.isPlannedRestDate(_dateKey(previousWeekStart)),
        isTrue,
      );

      await Hive.close();
      await LocalDatabase.init(testPath: testHiveDirectory.path);
      storageService = StorageService();

      expect(
        storageService.isPlannedRestDate(_dateKey(previousWeekStart)),
        isTrue,
      );
    },
  );

  test('calculates MVP validation metrics from local storage', () async {
    final today = DateTime(2026, 7, 15);

    await storageService.saveWeeklyGoal(2);
    await storageService.addWorkoutLog(
      WorkoutLog(
        id: 'week-one-a',
        date: '2026-06-30',
        workoutId: 'workout-one-a',
        workoutName: 'Walk',
        category: 'Cardio',
        isCompleted: true,
        createdAt: DateTime(2026, 6, 30),
      ),
    );
    await storageService.addWorkoutLog(
      WorkoutLog(
        id: 'week-one-b',
        date: '2026-07-01',
        workoutId: 'workout-one-b',
        workoutName: 'Squat',
        category: 'Strength',
        isCompleted: true,
        createdAt: DateTime(2026, 7, 1),
      ),
    );
    await storageService.addWorkoutLog(
      WorkoutLog(
        id: 'week-two-a',
        date: '2026-07-08',
        workoutId: 'workout-two-a',
        workoutName: 'Ride',
        category: 'Cardio',
        isCompleted: true,
        createdAt: DateTime(2026, 7, 8),
      ),
    );
    await storageService.addWorkoutLog(
      WorkoutLog(
        id: 'week-three-a',
        date: '2026-07-15',
        workoutId: 'workout-three-a',
        workoutName: 'Press',
        category: 'Strength',
        isCompleted: true,
        createdAt: today,
      ),
    );
    await storageService.recordShareCardGenerated(
      generatedAt: DateTime(2026, 7, 1),
    );
    await storageService.recordShareCardGenerated(
      generatedAt: DateTime(2026, 7, 15),
    );

    final metrics = storageService.getMvpValidationMetrics(today: today);

    expect(metrics.measuredWeeks, 3);
    expect(metrics.weeklyGoalCompletionRate, closeTo(1 / 3, 0.001));
    expect(metrics.averageWorkoutsPerWeek, closeTo(4 / 3, 0.001));
    expect(metrics.averageShareCardsGeneratedPerWeek, closeTo(2 / 3, 0.001));
    expect(metrics.hasReturnedAfterMissedWorkoutWeek, isTrue);
  });
}

String _dateKey(DateTime date) {
  final year = date.year.toString().padLeft(4, '0');
  final month = date.month.toString().padLeft(2, '0');
  final day = date.day.toString().padLeft(2, '0');

  return '$year-$month-$day';
}
