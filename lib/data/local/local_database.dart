import 'package:hive_flutter/hive_flutter.dart';

import '../models/workout.dart';
import '../models/workout_log.dart';

class LocalDatabase {
  static const String workoutBoxName = 'workoutBox';
  static const String workoutLogBoxName = 'workoutLogBox';
  static const String weeklyGoalBoxName = 'weeklyGoalBox';
  static const String appSettingsBoxName = 'appSettingsBox';
  static const String xpTotalBoxName = 'xpTotalBox';
  static const String xpAwardBoxName = 'xpAwardBox';
  static const String xpMessageBoxName = 'xpMessageBox';

  static Future<void> init({String? testPath}) async {
    if (testPath == null) {
      await Hive.initFlutter();
    } else {
      Hive.init(testPath);
    }

    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(WorkoutAdapter());
    }

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(WorkoutLogAdapter());
    }

    await Hive.openBox<Workout>(workoutBoxName);
    await Hive.openBox<WorkoutLog>(workoutLogBoxName);
    await Hive.openBox<int>(weeklyGoalBoxName);
    await Hive.openBox<bool>(appSettingsBoxName);
    await Hive.openBox<int>(xpTotalBoxName);
    await Hive.openBox<bool>(xpAwardBoxName);
    await Hive.openBox<String>(xpMessageBoxName);
  }
}
