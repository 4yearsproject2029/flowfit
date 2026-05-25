import 'package:hive_flutter/hive_flutter.dart';

import '../models/workout.dart';

class LocalDatabase {
  static const String workoutsBoxName = 'workouts';

  static Future<void> init() async {
    await Hive.initFlutter();

    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(WorkoutAdapter());
    }

    await Hive.openBox<Workout>(workoutsBoxName);
  }
}
