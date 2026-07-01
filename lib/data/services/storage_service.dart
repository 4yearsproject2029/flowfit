import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../local/local_database.dart';
import '../models/workout.dart';
import '../models/workout_log.dart';
import 'consistency_recovery_service.dart';
import 'mvp_validation_metrics_service.dart';

class StorageService {
  static const int workoutCompletionXp = 10;
  static const String _currentWeeklyGoalKey = 'currentWeeklyGoal';
  static const String _onboardingCompletedKey = 'onboardingCompleted';
  static const String _currentXpTotalKey = 'currentXpTotal';
  static const String _lastXpMessageKey = 'lastXpMessage';
  static const String _lastMissedWeekStartKey = 'lastMissedWeekStart';
  static const String _lastReturnWeekStartKey = 'lastReturnWeekStart';
  static const String _showShareCardWorkoutMetricsKey =
      'showShareCardWorkoutMetrics';

  Box<Workout> get _workoutBox {
    return Hive.box<Workout>(LocalDatabase.workoutBoxName);
  }

  Box<WorkoutLog> get _workoutLogBox {
    return Hive.box<WorkoutLog>(LocalDatabase.workoutLogBoxName);
  }

  Box<int> get _weeklyGoalBox {
    return Hive.box<int>(LocalDatabase.weeklyGoalBoxName);
  }

  Box<bool> get _appSettingsBox {
    return Hive.box<bool>(LocalDatabase.appSettingsBoxName);
  }

  Box<int> get _xpTotalBox {
    return Hive.box<int>(LocalDatabase.xpTotalBoxName);
  }

  Box<bool> get _xpAwardBox {
    return Hive.box<bool>(LocalDatabase.xpAwardBoxName);
  }

  Box<String> get _xpMessageBox {
    return Hive.box<String>(LocalDatabase.xpMessageBoxName);
  }

  Box<bool> get _plannedRestBox {
    return Hive.box<bool>(LocalDatabase.plannedRestBoxName);
  }

  Box<String> get _recoveryMetricBox {
    return Hive.box<String>(LocalDatabase.recoveryMetricBoxName);
  }

  Box<int> get _shareCardGenerationBox {
    return Hive.box<int>(LocalDatabase.shareCardGenerationBoxName);
  }

  ValueListenable<Box<WorkoutLog>> get workoutLogsListenable {
    return _workoutLogBox.listenable();
  }

  ValueListenable<Box<int>> get xpTotalListenable {
    return _xpTotalBox.listenable(keys: [_currentXpTotalKey]);
  }

  ValueListenable<Box<bool>> get plannedRestListenable {
    return _plannedRestBox.listenable();
  }

  bool shouldShowShareCardWorkoutMetrics() {
    return _appSettingsBox.get(_showShareCardWorkoutMetricsKey) ?? false;
  }

  Future<void> recordShareCardGenerated({DateTime? generatedAt}) async {
    final dateKey = _dateKey(generatedAt ?? DateTime.now());
    final generationCount = _shareCardGenerationBox.get(dateKey) ?? 0;

    await _shareCardGenerationBox.put(dateKey, generationCount + 1);
  }

  Map<String, int> getShareCardGenerationCounts() {
    final generationCounts = <String, int>{};
    for (final key in _shareCardGenerationBox.keys.whereType<String>()) {
      generationCounts[key] = _shareCardGenerationBox.get(key) ?? 0;
    }
    return Map.unmodifiable(generationCounts);
  }

  MvpValidationMetrics getMvpValidationMetrics({DateTime? today}) {
    return MvpValidationMetricsService().calculateMetrics(
      weeklyGoal: getWeeklyGoal() ?? 0,
      workoutLogs: getWorkoutLogs(),
      shareCardGenerationCounts: getShareCardGenerationCounts(),
      today: today ?? DateTime.now(),
      plannedRestDates: getPlannedRestDates(),
    );
  }

  Future<void> saveShareCardWorkoutMetricsPreference(bool isEnabled) async {
    await _appSettingsBox.put(_showShareCardWorkoutMetricsKey, isEnabled);
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

  List<WorkoutLog> getWorkoutLogs() {
    final logs = _workoutLogBox.values.toList();

    logs.sort((first, second) => first.createdAt.compareTo(second.createdAt));
    return logs;
  }

  Future<void> toggleWorkoutCompletion(String workoutLogId) async {
    final workoutLog = _workoutLogBox.get(workoutLogId);

    if (workoutLog == null) {
      return;
    }

    final shouldAwardXp = !workoutLog.isCompleted;
    final updatedWorkoutLog = workoutLog.copyWith(
      isCompleted: !workoutLog.isCompleted,
    );

    await _workoutLogBox.put(workoutLogId, updatedWorkoutLog);

    if (shouldAwardXp) {
      await _awardWorkoutCompletionXp(workoutLog);
    }

    await refreshConsistencyRecoveryMetrics();
  }

  Future<void> deleteWorkoutLog(String workoutLogId) async {
    await _workoutLogBox.delete(workoutLogId);
    await refreshConsistencyRecoveryMetrics();
  }

  int? getWeeklyGoal() {
    final weeklyGoal = _weeklyGoalBox.get(_currentWeeklyGoalKey);

    if (weeklyGoal == null || weeklyGoal < 1 || weeklyGoal > 5) {
      return null;
    }

    return weeklyGoal;
  }

  bool hasCompletedOnboarding() {
    final weeklyGoal = getWeeklyGoal();

    if (weeklyGoal == null) {
      return false;
    }

    final onboardingCompleted =
        _appSettingsBox.get(_onboardingCompletedKey) ?? false;

    return onboardingCompleted ||
        _weeklyGoalBox.containsKey(_currentWeeklyGoalKey);
  }

  int getXpTotal() {
    return _xpTotalBox.get(_currentXpTotalKey) ?? 0;
  }

  String getXpExplanation() {
    return _xpMessageBox.get(_lastXpMessageKey) ??
        'Complete a workout to earn $workoutCompletionXp XP. XP is awarded once per workout.';
  }

  bool isPlannedRestDate(String date) {
    return _plannedRestBox.get(date) ?? false;
  }

  List<String> getPlannedRestDates() {
    return _plannedRestBox.keys
        .whereType<String>()
        .where((date) => _plannedRestBox.get(date) ?? false)
        .toList();
  }

  Future<void> markPlannedRest(String date) async {
    await _plannedRestBox.put(date, true);
    await refreshConsistencyRecoveryMetrics();
  }

  ConsistencyRecoveryStatus getConsistencyRecoveryStatus({
    required DateTime today,
  }) {
    final weeklyGoal = getWeeklyGoal();
    if (weeklyGoal == null) {
      return const ConsistencyRecoveryStatus(hasReturnedAfterMissedWeek: false);
    }

    return ConsistencyRecoveryService().calculateStatus(
      weeklyGoal: weeklyGoal,
      workoutLogs: getWorkoutLogs(),
      today: today,
      plannedRestDates: getPlannedRestDates(),
    );
  }

  String? getLastDetectedMissedWeekStartDate() {
    return _recoveryMetricBox.get(_lastMissedWeekStartKey);
  }

  String? getLastReturnWeekStartDate() {
    return _recoveryMetricBox.get(_lastReturnWeekStartKey);
  }

  Future<void> refreshConsistencyRecoveryMetrics({DateTime? today}) async {
    final status = getConsistencyRecoveryStatus(today: today ?? DateTime.now());

    if (!status.hasReturnedAfterMissedWeek) {
      await _recoveryMetricBox.delete(_lastMissedWeekStartKey);
      await _recoveryMetricBox.delete(_lastReturnWeekStartKey);
      return;
    }

    final missedWeekStartDate = status.missedWeekStartDate;
    final returnWeekStartDate = status.returnWeekStartDate;

    if (missedWeekStartDate == null || returnWeekStartDate == null) {
      return;
    }

    await _recoveryMetricBox.put(
      _lastMissedWeekStartKey,
      _dateKey(missedWeekStartDate),
    );
    await _recoveryMetricBox.put(
      _lastReturnWeekStartKey,
      _dateKey(returnWeekStartDate),
    );
  }

  Future<void> saveWeeklyGoal(int workoutsPerWeek) async {
    if (workoutsPerWeek < 1 || workoutsPerWeek > 5) {
      throw ArgumentError.value(
        workoutsPerWeek,
        'workoutsPerWeek',
        'Weekly goal must be between 1 and 5.',
      );
    }
    await _weeklyGoalBox.put(_currentWeeklyGoalKey, workoutsPerWeek);
    await _appSettingsBox.put(_onboardingCompletedKey, true);
  }

  Future<void> _awardWorkoutCompletionXp(WorkoutLog workoutLog) async {
    final awardKey = _xpAwardKey(workoutLog);
    final hasAwardedXp = _xpAwardBox.get(awardKey) ?? false;

    if (hasAwardedXp) {
      return;
    }

    final updatedXpTotal = getXpTotal() + workoutCompletionXp;

    await _xpAwardBox.put(awardKey, true);
    await _xpMessageBox.put(
      _lastXpMessageKey,
      'Earned +$workoutCompletionXp XP for completing ${workoutLog.workoutName}.',
    );
    await _xpTotalBox.put(_currentXpTotalKey, updatedXpTotal);
  }

  String _xpAwardKey(WorkoutLog workoutLog) {
    final workoutName = workoutLog.workoutName.trim().toLowerCase();
    final category = workoutLog.category.trim().toLowerCase();

    return '${workoutLog.date}|$workoutName|$category';
  }

  String _dateKey(DateTime date) {
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');

    return '$year-$month-$day';
  }
}
