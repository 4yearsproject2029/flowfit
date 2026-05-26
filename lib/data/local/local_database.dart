import 'package:hive_flutter/hive_flutter.dart';

import '../models/workout.dart';
import '../models/workout_log.dart';

class LocalDatabase {
  static const String workoutBoxName = 'workoutBox';
  static const String workoutLogBoxName = 'workoutLogBox';

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
  }
}
