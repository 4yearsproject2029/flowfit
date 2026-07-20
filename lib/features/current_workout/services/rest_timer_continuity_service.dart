import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';

import '../../../data/models/workout_log.dart';
import '../models/current_workout_rest_state.dart';

class RestTimerContinuityService {
  factory RestTimerContinuityService() {
    return _instance;
  }

  RestTimerContinuityService._();

  static final RestTimerContinuityService _instance =
      RestTimerContinuityService._();

  static const int defaultRestSeconds = 90;

  final ValueNotifier<ActiveRestTimerState?> activeRest =
      ValueNotifier<ActiveRestTimerState?>(null);

  Timer? _timer;

  void startOrUpdate({
    required String snapshotKey,
    required String selectedDateLabel,
    required List<WorkoutLog> workoutLogs,
    required CurrentWorkoutRestState restState,
    int durationSeconds = defaultRestSeconds,
  }) {
    final existing = activeRest.value;
    final shouldKeepStart =
        existing != null &&
        existing.snapshotKey == snapshotKey &&
        existing.restState.nextExerciseIndex == restState.nextExerciseIndex &&
        existing.restState.completedSetNumber == restState.completedSetNumber;

    if (shouldKeepStart) {
      _startTicker();
      return;
    }

    activeRest.value = ActiveRestTimerState(
      snapshotKey: snapshotKey,
      selectedDateLabel: selectedDateLabel,
      workoutLogs: List.unmodifiable(workoutLogs),
      restState: restState,
      startedAt: DateTime.now(),
      durationSeconds: durationSeconds,
    );

    _startTicker();
  }

  void clear({String? snapshotKey}) {
    if (snapshotKey != null && activeRest.value?.snapshotKey != snapshotKey) {
      return;
    }

    activeRest.value = null;
    _timer?.cancel();
    _timer = null;
  }

  void _startTicker() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final state = activeRest.value;
      if (state == null) {
        _timer?.cancel();
        _timer = null;
        return;
      }

      activeRest.value = state.copyWith();
    });
  }
}

class ActiveRestTimerState {
  const ActiveRestTimerState({
    required this.snapshotKey,
    required this.selectedDateLabel,
    required this.workoutLogs,
    required this.restState,
    required this.startedAt,
    required this.durationSeconds,
  });

  final String snapshotKey;
  final String selectedDateLabel;
  final List<WorkoutLog> workoutLogs;
  final CurrentWorkoutRestState restState;
  final DateTime startedAt;
  final int durationSeconds;

  int remainingSeconds({DateTime? now}) {
    final elapsed = (now ?? DateTime.now()).difference(startedAt).inSeconds;
    return max(0, durationSeconds - elapsed);
  }

  bool get isComplete {
    return remainingSeconds() == 0;
  }

  ActiveRestTimerState copyWith() {
    return ActiveRestTimerState(
      snapshotKey: snapshotKey,
      selectedDateLabel: selectedDateLabel,
      workoutLogs: workoutLogs,
      restState: restState,
      startedAt: startedAt,
      durationSeconds: durationSeconds,
    );
  }
}
