import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

import 'package:flowfit/data/local/local_database.dart';
import 'package:flowfit/data/models/workout_log.dart';
import 'package:flowfit/data/services/storage_service.dart';

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
}
