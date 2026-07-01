import '../../../data/models/workout_log.dart';
import '../../../data/services/level_service.dart';
import '../../../data/services/weekly_goal_service.dart';
import '../models/share_card_data.dart';

class ShareCardService {
  ShareCardData? workoutCompletionCard({
    required List<WorkoutLog> workoutLogs,
    required String dateLabel,
    bool includePerformanceMetrics = false,
  }) {
    final completedWorkouts = workoutLogs
        .where((workoutLog) => workoutLog.isCompleted)
        .toList();

    if (completedWorkouts.isEmpty) {
      return null;
    }

    completedWorkouts.sort(
      (first, second) => first.createdAt.compareTo(second.createdAt),
    );
    final completedWorkout = completedWorkouts.first;
    final workoutName = completedWorkout.workoutName.trim();

    return ShareCardData(
      type: ShareCardType.workout,
      title: 'Workout Complete',
      message: 'Showed up today.',
      detail: '${workoutName.isEmpty ? 'Workout' : workoutName} - $dateLabel',
      extraDetails: includePerformanceMetrics
          ? _performanceMetricDetails(completedWorkout)
          : const [],
    );
  }

  ShareCardData levelCard({required int xpTotal}) {
    final levelProgress = LevelService().calculateProgress(xpTotal);

    return ShareCardData(
      type: ShareCardType.level,
      title: 'Level ${levelProgress.currentLevel}',
      message: 'Building the habit.',
      detail: levelProgress.progressLabel,
    );
  }

  ShareCardData? weeklyGoalCard({required WeeklyGoalProgress? progress}) {
    if (progress == null || !progress.isComplete) {
      return null;
    }

    return ShareCardData(
      type: ShareCardType.weeklyGoal,
      title: 'Weekly Goal Complete',
      message: 'Consistency unlocked.',
      detail:
          '${progress.completedWorkouts} / ${progress.weeklyGoal} workouts this week',
    );
  }

  List<String> _performanceMetricDetails(WorkoutLog workoutLog) {
    final details = <String>[];

    if (workoutLog.sets != null) {
      details.add('${workoutLog.sets} sets');
    }
    if (workoutLog.reps != null) {
      details.add('${workoutLog.reps} reps');
    }
    if (workoutLog.weight != null) {
      details.add('${_formatWeight(workoutLog.weight!)} kg');
    }

    return details;
  }

  String _formatWeight(double weight) {
    if (weight == weight.roundToDouble()) {
      return weight.toInt().toString();
    }

    return weight.toStringAsFixed(1);
  }
}
