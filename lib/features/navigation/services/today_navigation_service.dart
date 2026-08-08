import 'package:flutter/material.dart';

import '../../../data/models/workout_log.dart';
import '../../../data/services/storage_service.dart';
import '../../current_workout/screens/current_workout_screen.dart';
import '../../current_workout/services/rest_timer_continuity_service.dart';

class TodayNavigationService {
  const TodayNavigationService._();

  static Future<void> openToday({
    required BuildContext context,
    required StorageService storageService,
    bool replaceCurrentRoute = false,
  }) async {
    final navigator = Navigator.of(context);
    final activeRest = RestTimerContinuityService().activeRest.value;

    if (activeRest != null) {
      await _openCurrentWorkout(
        navigator: navigator,
        workoutLogs: activeRest.workoutLogs,
        selectedDateLabel: activeRest.selectedDateLabel,
        storageService: storageService,
        replaceCurrentRoute: replaceCurrentRoute,
      );
      return;
    }

    final today = DateTime.now();
    final todayLogs = storageService.getWorkoutLogsByDate(_dateKey(today));
    final hasRunnableWorkout = todayLogs.any((log) => !log.isCompleted);

    if (!hasRunnableWorkout) {
      navigator.popUntil((route) => route.isFirst);
      return;
    }

    await _openCurrentWorkout(
      navigator: navigator,
      workoutLogs: todayLogs,
      selectedDateLabel: _selectedDateLabel(today),
      storageService: storageService,
      replaceCurrentRoute: replaceCurrentRoute,
    );
  }

  static Future<void> _openCurrentWorkout({
    required NavigatorState navigator,
    required List<WorkoutLog> workoutLogs,
    required String selectedDateLabel,
    required StorageService storageService,
    required bool replaceCurrentRoute,
  }) {
    final route = MaterialPageRoute<void>(
      builder: (context) {
        return CurrentWorkoutScreen(
          workoutLogs: workoutLogs,
          selectedDateLabel: selectedDateLabel,
          storageService: storageService,
        );
      },
    );

    if (replaceCurrentRoute && navigator.canPop()) {
      return navigator.pushReplacement(route);
    }

    return navigator.push(route);
  }

  static String _dateKey(DateTime date) {
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');

    return '$year-$month-$day';
  }

  static String _selectedDateLabel(DateTime date) {
    const monthLabels = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    final month = monthLabels[date.month - 1];
    return '$month ${date.day}, ${date.year}';
  }
}
