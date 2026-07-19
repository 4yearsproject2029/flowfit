import 'dart:async';

import 'package:flutter/material.dart';

import '../../../data/models/workout_log.dart';
import '../../../data/services/storage_service.dart';
import '../../workout_summary/screens/workout_summary_screen.dart';
import '../models/current_workout_rest_state.dart';
import '../widgets/active_exercise_card.dart';
import '../widgets/adjust_session_sheet.dart';
import '../widgets/control_actions_row.dart';
import '../widgets/current_workout_header.dart';
import '../widgets/current_workout_palette.dart';
import '../widgets/current_workout_progress_widgets.dart';
import '../widgets/current_workout_state_cards.dart';
import '../widgets/rest_timer_overlay.dart';

class CurrentWorkoutScreen extends StatefulWidget {
  CurrentWorkoutScreen({
    super.key,
    required this.workoutLogs,
    required this.selectedDateLabel,
    StorageService? storageService,
  }) : storageService = storageService ?? StorageService();

  final List<WorkoutLog> workoutLogs;
  final String selectedDateLabel;
  final StorageService storageService;

  @override
  State<CurrentWorkoutScreen> createState() => _CurrentWorkoutScreenState();
}

class _CurrentWorkoutScreenState extends State<CurrentWorkoutScreen> {
  static final Map<String, _WorkoutControlSnapshot> _controlSnapshots = {};

  late int _currentExerciseIndex;
  late final Map<String, int> _completedSetsByWorkoutLogId;
  late final Set<String> _syncedCompletedWorkoutLogIds;
  late final Map<String, int?> _sessionRepsByWorkoutLogId;
  late final Map<String, double?> _sessionWeightByWorkoutLogId;
  CurrentWorkoutRestState? _restState;
  bool _isPaused = false;
  bool _isCompletionReady = false;
  bool _hasOpenedWorkoutSummary = false;

  List<WorkoutLog> get _workoutLogs => widget.workoutLogs;
  String get _snapshotKey {
    final workoutLogIds = _workoutLogs
        .map((workoutLog) => workoutLog.id)
        .join('|');
    return '${widget.selectedDateLabel}|$workoutLogIds';
  }

  @override
  void initState() {
    super.initState();
    final snapshot = _controlSnapshots[_snapshotKey];
    _currentExerciseIndex =
        snapshot?.currentExerciseIndex ?? _firstActiveExerciseIndex();
    _completedSetsByWorkoutLogId = {
      for (final workoutLog in _workoutLogs)
        if (workoutLog.isCompleted) workoutLog.id: _targetSets(workoutLog),
      ...?snapshot?.completedSetsByWorkoutLogId,
    };
    _syncedCompletedWorkoutLogIds = {
      for (final workoutLog in _workoutLogs)
        if (workoutLog.isCompleted) workoutLog.id,
    };
    _sessionRepsByWorkoutLogId = {
      for (final workoutLog in _workoutLogs) workoutLog.id: workoutLog.reps,
      ...?snapshot?.sessionRepsByWorkoutLogId,
    };
    _sessionWeightByWorkoutLogId = {
      for (final workoutLog in _workoutLogs) workoutLog.id: workoutLog.weight,
      ...?snapshot?.sessionWeightByWorkoutLogId,
    };
    _restState = snapshot?.restState;
    _isPaused = snapshot?.isPaused ?? false;
    _hasOpenedWorkoutSummary = snapshot?.hasOpenedWorkoutSummary ?? false;
    _isCompletionReady =
        snapshot?.isCompletionReady ??
        _workoutLogs.isNotEmpty &&
            _workoutLogs.every(
              (workoutLog) =>
                  _completedSetsFor(workoutLog) >= _targetSets(workoutLog),
            );
  }

  @override
  Widget build(BuildContext context) {
    final activeWorkout = _activeWorkoutLog();
    final completedSetCount = _completedSetCount();
    final totalSetCount = _totalSetCount();
    final progress = totalSetCount == 0
        ? 0.0
        : completedSetCount / totalSetCount;
    final progressPercent = (progress * 100).round();

    return Scaffold(
      backgroundColor: CurrentWorkoutPalette.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CurrentWorkoutHeader(dateLabel: widget.selectedDateLabel),
                    const SizedBox(height: 30),
                    Text(
                      'CURRENT WORKOUT',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: CurrentWorkoutPalette.secondaryText,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            _progressTitle(),
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(
                                  color: CurrentWorkoutPalette.primaryText,
                                  fontWeight: FontWeight.w900,
                                  height: 1.04,
                                ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        CurrentWorkoutProgressPill(label: '$progressPercent%'),
                      ],
                    ),
                    const SizedBox(height: 12),
                    CurrentWorkoutProgressBar(value: progress),
                    const SizedBox(height: 24),
                    if (_isCompletionReady)
                      const CompletionReadyCard()
                    else if (_isPaused)
                      PausedWorkoutCard(workoutLog: activeWorkout)
                    else if (activeWorkout == null)
                      const NoActiveWorkoutCard()
                    else if (_restState != null)
                      RestStateCard(
                        restState: _restState!,
                        onOpenTimer: () => _openRestTimerOverlay(_restState!),
                      )
                    else
                      ActiveExerciseCard(
                        workoutLog: activeWorkout,
                        completedSets: _completedSetsFor(activeWorkout),
                        targetSets: _targetSets(activeWorkout),
                        sessionReps: _sessionRepsFor(activeWorkout),
                        sessionWeight: _sessionWeightFor(activeWorkout),
                      ),
                    if (!_isCompletionReady && activeWorkout != null) ...[
                      const SizedBox(height: 14),
                      ControlActionsRow(
                        isPaused: _isPaused,
                        onPause: _pauseWorkout,
                        onAdjust: _restState == null
                            ? () => _openAdjustSheet(activeWorkout)
                            : null,
                        onSkip: _restState == null
                            ? () => _skipActiveSet(activeWorkout)
                            : null,
                        onSkipExercise: _restState == null
                            ? () => _skipActiveExercise(activeWorkout)
                            : null,
                      ),
                    ],
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: _primaryAction(activeWorkout),
                        style: FilledButton.styleFrom(
                          backgroundColor: CurrentWorkoutPalette.accent,
                          foregroundColor: Colors.black,
                          disabledBackgroundColor: CurrentWorkoutPalette.border,
                          disabledForegroundColor:
                              CurrentWorkoutPalette.mutedText,
                          minimumSize: const Size.fromHeight(58),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 17,
                          ),
                        ),
                        icon: Icon(_primaryActionIcon()),
                        label: Text(_primaryActionLabel()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  WorkoutLog? _activeWorkoutLog() {
    if (_workoutLogs.isEmpty || _isCompletionReady) {
      return null;
    }

    return _workoutLogs[_currentExerciseIndex];
  }

  int _firstActiveExerciseIndex() {
    if (_workoutLogs.isEmpty) {
      return 0;
    }

    final incompleteIndex = _workoutLogs.indexWhere(
      (workoutLog) => !workoutLog.isCompleted,
    );
    return incompleteIndex == -1 ? _workoutLogs.length - 1 : incompleteIndex;
  }

  String _progressTitle() {
    if (_workoutLogs.isEmpty) {
      return 'No workout ready';
    }

    if (_isCompletionReady) {
      return 'Workout complete';
    }

    if (_isPaused) {
      return 'Workout paused';
    }

    if (_restState != null) {
      return 'Rest after set ${_restState!.completedSetNumber}';
    }

    return 'Exercise ${_currentExerciseIndex + 1} of ${_workoutLogs.length}';
  }

  VoidCallback? _primaryAction(WorkoutLog? activeWorkout) {
    if (_isCompletionReady && _workoutLogs.isNotEmpty) {
      return () {
        _openWorkoutSummary(force: true);
      };
    }

    if (activeWorkout == null) {
      return null;
    }

    if (_isPaused) {
      return _resumeWorkout;
    }

    if (_restState != null) {
      return _continueFromRest;
    }

    return () async {
      await _completeActiveSet(activeWorkout);
    };
  }

  IconData _primaryActionIcon() {
    if (_isCompletionReady) {
      return Icons.flag_outlined;
    }
    if (_isPaused) {
      return Icons.play_arrow;
    }
    if (_restState != null) {
      return Icons.arrow_forward;
    }
    return Icons.check;
  }

  String _primaryActionLabel() {
    if (_isCompletionReady) {
      return 'View Summary';
    }
    if (_isPaused) {
      return 'Resume Workout';
    }
    if (_restState != null) {
      return 'Continue Workout';
    }
    return 'Complete Set';
  }

  Future<void> _completeActiveSet(WorkoutLog activeWorkout) async {
    final targetSets = _targetSets(activeWorkout);
    final completedSets = _completedSetsFor(activeWorkout);
    final nextCompletedSet = (completedSets + 1).clamp(0, targetSets);
    final exerciseComplete = nextCompletedSet >= targetSets;
    final nextExerciseIndex = exerciseComplete
        ? _nextExerciseIndexOrNull()
        : _currentExerciseIndex;

    setState(() {
      _completedSetsByWorkoutLogId[activeWorkout.id] = nextCompletedSet;
      if (nextExerciseIndex == null) {
        _isCompletionReady = true;
        _restState = null;
      } else {
        _restState = CurrentWorkoutRestState(
          activeWorkoutName: activeWorkout.workoutName,
          completedSetNumber: nextCompletedSet,
          completedSetTotal: targetSets,
          nextWorkoutName: _workoutLogs[nextExerciseIndex].workoutName,
          nextExerciseIndex: nextExerciseIndex,
          suggestedRestDuration: '90 sec',
          returnTarget: 'Current Workout',
        );
      }
      _saveControlSnapshot();
    });

    if (exerciseComplete) {
      if (nextExerciseIndex == null && mounted) {
        unawaited(_syncWorkoutCompletion(activeWorkout));
        _openWorkoutSummary();
        return;
      }

      await _syncWorkoutCompletion(activeWorkout);
    }
  }

  void _pauseWorkout() {
    setState(() {
      _isPaused = true;
      _saveControlSnapshot();
    });
  }

  void _resumeWorkout() {
    setState(() {
      _isPaused = false;
      _saveControlSnapshot();
    });
  }

  void _skipActiveSet(WorkoutLog activeWorkout) {
    final targetSets = _targetSets(activeWorkout);
    final completedSets = _completedSetsFor(activeWorkout);
    final nextCompletedSet = (completedSets + 1).clamp(0, targetSets);
    final exerciseComplete = nextCompletedSet >= targetSets;
    final nextExerciseIndex = exerciseComplete
        ? _nextExerciseIndexOrNull()
        : _currentExerciseIndex;

    setState(() {
      _completedSetsByWorkoutLogId[activeWorkout.id] = nextCompletedSet;
      if (nextExerciseIndex == null) {
        _isCompletionReady = true;
        _restState = null;
      } else {
        _restState = CurrentWorkoutRestState(
          activeWorkoutName: activeWorkout.workoutName,
          completedSetNumber: nextCompletedSet,
          completedSetTotal: targetSets,
          nextWorkoutName: _workoutLogs[nextExerciseIndex].workoutName,
          nextExerciseIndex: nextExerciseIndex,
          suggestedRestDuration: '90 sec',
          returnTarget: 'Current Workout',
        );
      }
      _saveControlSnapshot();
    });
  }

  void _skipActiveExercise(WorkoutLog activeWorkout) {
    final targetSets = _targetSets(activeWorkout);
    final nextExerciseIndex = _nextExerciseIndexOrNull();

    setState(() {
      _completedSetsByWorkoutLogId[activeWorkout.id] = targetSets;
      if (nextExerciseIndex == null) {
        _isCompletionReady = true;
        _restState = null;
      } else {
        _restState = CurrentWorkoutRestState(
          activeWorkoutName: activeWorkout.workoutName,
          completedSetNumber: targetSets,
          completedSetTotal: targetSets,
          nextWorkoutName: _workoutLogs[nextExerciseIndex].workoutName,
          nextExerciseIndex: nextExerciseIndex,
          suggestedRestDuration: '90 sec',
          returnTarget: 'Current Workout',
        );
      }
      _saveControlSnapshot();
    });
  }

  Future<void> _syncWorkoutCompletion(WorkoutLog workoutLog) async {
    if (_syncedCompletedWorkoutLogIds.contains(workoutLog.id)) {
      return;
    }

    _syncedCompletedWorkoutLogIds.add(workoutLog.id);
    await widget.storageService.toggleWorkoutCompletion(workoutLog.id);
  }

  void _continueFromRest() {
    final restState = _restState;
    if (restState == null) {
      return;
    }

    setState(() {
      _currentExerciseIndex = restState.nextExerciseIndex;
      _restState = null;
      _saveControlSnapshot();
    });
  }

  Future<void> _openAdjustSheet(WorkoutLog activeWorkout) async {
    final adjustment = await showModalBottomSheet<SessionAdjustment>(
      context: context,
      isScrollControlled: true,
      backgroundColor: CurrentWorkoutPalette.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
      ),
      builder: (context) {
        return AdjustSessionSheet(
          workoutLog: activeWorkout,
          sessionReps: _sessionRepsFor(activeWorkout),
          sessionWeight: _sessionWeightFor(activeWorkout),
        );
      },
    );

    if (adjustment == null || !mounted) {
      return;
    }

    setState(() {
      _sessionRepsByWorkoutLogId[activeWorkout.id] = adjustment.reps;
      _sessionWeightByWorkoutLogId[activeWorkout.id] = adjustment.weight;
      _saveControlSnapshot();
    });
  }

  Future<void> _openRestTimerOverlay(CurrentWorkoutRestState restState) async {
    final shouldSkipRest = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.72),
      builder: (context) {
        return RestTimerOverlay(restState: restState);
      },
    );

    if (shouldSkipRest == true && mounted) {
      _continueFromRest();
    }
  }

  int? _nextExerciseIndexOrNull() {
    final nextIndex = _currentExerciseIndex + 1;
    return nextIndex >= _workoutLogs.length ? null : nextIndex;
  }

  int _totalSetCount() {
    return _workoutLogs.fold<int>(
      0,
      (total, workoutLog) => total + _targetSets(workoutLog),
    );
  }

  int _completedSetCount() {
    return _workoutLogs.fold<int>(
      0,
      (total, workoutLog) => total + _completedSetsFor(workoutLog),
    );
  }

  int _completedSetsFor(WorkoutLog workoutLog) {
    final completedSets = _completedSetsByWorkoutLogId[workoutLog.id] ?? 0;
    final targetSets = _targetSets(workoutLog);
    if (completedSets < 0) {
      return 0;
    }
    if (completedSets > targetSets) {
      return targetSets;
    }
    return completedSets;
  }

  int _targetSets(WorkoutLog workoutLog) {
    final sets = workoutLog.sets;
    if (sets == null || sets < 1) {
      return 1;
    }

    return sets;
  }

  int? _sessionRepsFor(WorkoutLog workoutLog) {
    return _sessionRepsByWorkoutLogId[workoutLog.id];
  }

  double? _sessionWeightFor(WorkoutLog workoutLog) {
    return _sessionWeightByWorkoutLogId[workoutLog.id];
  }

  void _saveControlSnapshot() {
    _controlSnapshots[_snapshotKey] = _WorkoutControlSnapshot(
      currentExerciseIndex: _currentExerciseIndex,
      completedSetsByWorkoutLogId: Map.unmodifiable(
        _completedSetsByWorkoutLogId,
      ),
      sessionRepsByWorkoutLogId: Map.unmodifiable(_sessionRepsByWorkoutLogId),
      sessionWeightByWorkoutLogId: Map.unmodifiable(
        _sessionWeightByWorkoutLogId,
      ),
      restState: _restState,
      isPaused: _isPaused,
      isCompletionReady: _isCompletionReady,
      hasOpenedWorkoutSummary: _hasOpenedWorkoutSummary,
    );
  }

  void _openWorkoutSummary({bool force = false}) {
    if ((!force && _hasOpenedWorkoutSummary) || _workoutLogs.isEmpty) {
      return;
    }

    if (!_hasOpenedWorkoutSummary) {
      setState(() {
        _hasOpenedWorkoutSummary = true;
        _saveControlSnapshot();
      });
    }

    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          return WorkoutSummaryScreen(
            workoutLogs: _workoutLogs,
            selectedDateLabel: widget.selectedDateLabel,
            storageService: widget.storageService,
          );
        },
      ),
    );
  }
}

class _WorkoutControlSnapshot {
  const _WorkoutControlSnapshot({
    required this.currentExerciseIndex,
    required this.completedSetsByWorkoutLogId,
    required this.sessionRepsByWorkoutLogId,
    required this.sessionWeightByWorkoutLogId,
    required this.restState,
    required this.isPaused,
    required this.isCompletionReady,
    required this.hasOpenedWorkoutSummary,
  });

  final int currentExerciseIndex;
  final Map<String, int> completedSetsByWorkoutLogId;
  final Map<String, int?> sessionRepsByWorkoutLogId;
  final Map<String, double?> sessionWeightByWorkoutLogId;
  final CurrentWorkoutRestState? restState;
  final bool isPaused;
  final bool isCompletionReady;
  final bool hasOpenedWorkoutSummary;
}
