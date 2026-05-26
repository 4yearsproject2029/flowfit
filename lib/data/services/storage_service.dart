import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../local/local_database.dart';
import '../models/workout.dart';
import '../models/workout_log.dart';

class StorageService {
  Box<Workout> get _workoutBox {
    return Hive.box<Workout>(LocalDatabase.workoutBoxName);
  }

  Box<WorkoutLog> get _workoutLogBox {
    return Hive.box<WorkoutLog>(LocalDatabase.workoutLogBoxName);
  }

  ValueListenable<Box<WorkoutLog>> get workoutLogsListenable {
    return _workoutLogBox.listenable();
  }

  Future<void> addWorkout(Workout workout) async {
    await _workoutBox.put(workout.id, workout);
  }

  List<Workout> getWorkouts() {
    return _workoutBox.values.toList();
  }

  Future<void> addWorkoutLog(WorkoutLog workoutLog) async {
    await _workoutLogBox.put(workoutLog.id, workoutLog);
  }

  List<WorkoutLog> getWorkoutLogsByDate(String date) {
    final logs = _workoutLogBox.values
        .where((log) => log.date == date)
        .toList();

    logs.sort((first, second) => first.createdAt.compareTo(second.createdAt));
    return logs;
  }

  Future<void> toggleWorkoutCompletion(String workoutLogId) async {
    final workoutLog = _workoutLogBox.get(workoutLogId);

    if (workoutLog == null) {
      return;
    }

    final updatedWorkoutLog = workoutLog.copyWith(
      isCompleted: !workoutLog.isCompleted,
    );

    await _workoutLogBox.put(workoutLogId, updatedWorkoutLog);
  }

  Future<void> deleteWorkoutLog(String workoutLogId) async {
    await _workoutLogBox.delete(workoutLogId);
  }
}
