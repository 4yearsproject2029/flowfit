import 'package:flutter/material.dart';

import '../../../data/models/workout_log.dart';
import '../../../data/services/storage_service.dart';

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

  static const _background = Color(0xFF050606);
  static const _surface = Color(0xFF101214);
  static const _elevated = Color(0xFF181B1F);
  static const _border = Color(0xFF252A2E);
  static const _accent = Color(0xFF18F7D3);
  static const _accentDark = Color(0xFF073F39);
  static const _primaryText = Color(0xFFF5F6F7);
  static const _secondaryText = Color(0xFFA8AFB7);
  static const _mutedText = Color(0xFF6F767E);

  @override
  State<CurrentWorkoutScreen> createState() => _CurrentWorkoutScreenState();
}

class _CurrentWorkoutScreenState extends State<CurrentWorkoutScreen> {
  late int _currentExerciseIndex;
  late final Map<String, int> _completedSetsByWorkoutLogId;
  late final Set<String> _syncedCompletedWorkoutLogIds;
  _RestState? _restState;
  bool _isCompletionReady = false;

  List<WorkoutLog> get _workoutLogs => widget.workoutLogs;

  @override
  void initState() {
    super.initState();
    _currentExerciseIndex = _firstActiveExerciseIndex();
    _completedSetsByWorkoutLogId = {
      for (final workoutLog in _workoutLogs)
        if (workoutLog.isCompleted) workoutLog.id: _targetSets(workoutLog),
    };
    _syncedCompletedWorkoutLogIds = {
      for (final workoutLog in _workoutLogs)
        if (workoutLog.isCompleted) workoutLog.id,
    };
    _isCompletionReady =
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
      backgroundColor: CurrentWorkoutScreen._background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _CurrentWorkoutHeader(dateLabel: widget.selectedDateLabel),
                    const SizedBox(height: 30),
                    Text(
                      'CURRENT WORKOUT',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: CurrentWorkoutScreen._secondaryText,
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
                                  color: CurrentWorkoutScreen._primaryText,
                                  fontWeight: FontWeight.w900,
                                  height: 1.04,
                                ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        _ProgressPill(label: '$progressPercent%'),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _AccentProgressBar(value: progress),
                    const SizedBox(height: 24),
                    if (_isCompletionReady)
                      const _CompletionReadyCard()
                    else if (activeWorkout == null)
                      const _NoActiveWorkoutCard()
                    else if (_restState != null)
                      _RestStateCard(restState: _restState!)
                    else
                      _ActiveExerciseCard(
                        workoutLog: activeWorkout,
                        completedSets: _completedSetsFor(activeWorkout),
                        targetSets: _targetSets(activeWorkout),
                      ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: _primaryAction(activeWorkout),
                        style: FilledButton.styleFrom(
                          backgroundColor: CurrentWorkoutScreen._accent,
                          foregroundColor: Colors.black,
                          disabledBackgroundColor: CurrentWorkoutScreen._border,
                          disabledForegroundColor:
                              CurrentWorkoutScreen._mutedText,
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

    if (_restState != null) {
      return 'Rest after set ${_restState!.completedSetNumber}';
    }

    return 'Exercise ${_currentExerciseIndex + 1} of ${_workoutLogs.length}';
  }

  VoidCallback? _primaryAction(WorkoutLog? activeWorkout) {
    if (activeWorkout == null || _isCompletionReady) {
      return null;
    }

    if (_restState != null) {
      return _continueFromRest;
    }

    return () {
      _completeActiveSet(activeWorkout);
    };
  }

  IconData _primaryActionIcon() {
    if (_isCompletionReady) {
      return Icons.flag_outlined;
    }
    if (_restState != null) {
      return Icons.arrow_forward;
    }
    return Icons.check;
  }

  String _primaryActionLabel() {
    if (_isCompletionReady) {
      return 'Summary comes next';
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
        _restState = _RestState(
          activeWorkoutName: activeWorkout.workoutName,
          completedSetNumber: nextCompletedSet,
          completedSetTotal: targetSets,
          nextWorkoutName: _workoutLogs[nextExerciseIndex].workoutName,
          nextExerciseIndex: nextExerciseIndex,
          suggestedRestDuration: '90 sec',
          returnTarget: 'Current Workout',
        );
      }
    });

    if (exerciseComplete) {
      await _syncWorkoutCompletion(activeWorkout);
    }
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
    });
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
}

class _CurrentWorkoutHeader extends StatelessWidget {
  const _CurrentWorkoutHeader({required this.dateLabel});

  final String dateLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          tooltip: 'Back to dashboard',
          icon: const Icon(
            Icons.arrow_back,
            color: CurrentWorkoutScreen._primaryText,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: CurrentWorkoutScreen._surface,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: CurrentWorkoutScreen._border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                color: CurrentWorkoutScreen._accent,
                size: 16,
              ),
              const SizedBox(width: 6),
              Text(
                dateLabel,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: CurrentWorkoutScreen._secondaryText,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProgressPill extends StatelessWidget {
  const _ProgressPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: CurrentWorkoutScreen._accentDark,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: CurrentWorkoutScreen._accent,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class _ActiveExerciseCard extends StatelessWidget {
  const _ActiveExerciseCard({
    required this.workoutLog,
    required this.completedSets,
    required this.targetSets,
  });

  final WorkoutLog workoutLog;
  final int completedSets;
  final int targetSets;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            CurrentWorkoutScreen._elevated,
            CurrentWorkoutScreen._surface,
          ],
        ),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: CurrentWorkoutScreen._border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.28),
            blurRadius: 22,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 176,
            width: double.infinity,
            decoration: BoxDecoration(
              color: CurrentWorkoutScreen._accentDark.withValues(alpha: 0.52),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.fitness_center,
              color: CurrentWorkoutScreen._accent,
              size: 72,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            workoutLog.workoutName,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: CurrentWorkoutScreen._primaryText,
              fontWeight: FontWeight.w900,
              height: 1.04,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            _instructionText(workoutLog),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: CurrentWorkoutScreen._secondaryText,
              fontWeight: FontWeight.w600,
              height: 1.32,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: _TargetTile(
                  label: 'Sets',
                  value: workoutLog.sets?.toString() ?? '1',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _TargetTile(
                  label: 'Reps',
                  value: workoutLog.reps?.toString() ?? 'Not set',
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _TargetTile(
            label: 'Set progress',
            value: '$completedSets / $targetSets',
          ),
        ],
      ),
    );
  }

  String _instructionText(WorkoutLog workoutLog) {
    final memo = workoutLog.memo?.trim();
    if (memo != null && memo.isNotEmpty) {
      return memo;
    }

    return 'Focus on your next ${workoutLog.category.toLowerCase()} movement. Complete the set when you are ready.';
  }
}

class _TargetTile extends StatelessWidget {
  const _TargetTile({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: CurrentWorkoutScreen._border),
      ),
      child: Column(
        children: [
          Text(
            label.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: CurrentWorkoutScreen._mutedText,
              fontWeight: FontWeight.w900,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: CurrentWorkoutScreen._primaryText,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

class _RestState {
  const _RestState({
    required this.activeWorkoutName,
    required this.completedSetNumber,
    required this.completedSetTotal,
    required this.nextWorkoutName,
    required this.nextExerciseIndex,
    required this.suggestedRestDuration,
    required this.returnTarget,
  });

  final String activeWorkoutName;
  final int completedSetNumber;
  final int completedSetTotal;
  final String nextWorkoutName;
  final int nextExerciseIndex;
  final String suggestedRestDuration;
  final String returnTarget;
}

class _RestStateCard extends StatelessWidget {
  const _RestStateCard({required this.restState});

  final _RestState restState;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: CurrentWorkoutScreen._surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: CurrentWorkoutScreen._border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.airline_seat_recline_normal,
                color: CurrentWorkoutScreen._accent,
                size: 30,
              ),
              const SizedBox(width: 10),
              Text(
                'REST STATE',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: CurrentWorkoutScreen._secondaryText,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            'Rest after ${restState.activeWorkoutName}',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: CurrentWorkoutScreen._primaryText,
              fontWeight: FontWeight.w900,
              height: 1.12,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Completed set ${restState.completedSetNumber} of ${restState.completedSetTotal}.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: CurrentWorkoutScreen._secondaryText,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          _HandoffRow(
            icon: Icons.fitness_center,
            label: 'Next',
            value: restState.nextWorkoutName,
          ),
          const SizedBox(height: 10),
          _HandoffRow(
            icon: Icons.hourglass_empty,
            label: 'Suggested rest',
            value: restState.suggestedRestDuration,
          ),
          const SizedBox(height: 10),
          _HandoffRow(
            icon: Icons.keyboard_return,
            label: 'Return target',
            value: restState.returnTarget,
          ),
        ],
      ),
    );
  }
}

class _CompletionReadyCard extends StatelessWidget {
  const _CompletionReadyCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: CurrentWorkoutScreen._surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: CurrentWorkoutScreen._border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.emoji_events_outlined,
            color: CurrentWorkoutScreen._accent,
            size: 36,
          ),
          const SizedBox(height: 12),
          Text(
            'Workout ready for summary',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: CurrentWorkoutScreen._primaryText,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'All planned sets are complete. Workout Summary can take over next.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: CurrentWorkoutScreen._secondaryText,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _HandoffRow extends StatelessWidget {
  const _HandoffRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: CurrentWorkoutScreen._accent, size: 20),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            '$label: $value',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: CurrentWorkoutScreen._primaryText,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}

class _NoActiveWorkoutCard extends StatelessWidget {
  const _NoActiveWorkoutCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: CurrentWorkoutScreen._surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: CurrentWorkoutScreen._border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.event_busy_outlined,
            color: CurrentWorkoutScreen._accent,
            size: 34,
          ),
          const SizedBox(height: 12),
          Text(
            'No workout is ready yet.',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: CurrentWorkoutScreen._primaryText,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Plan a workout from the Dashboard to start the flow.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: CurrentWorkoutScreen._secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}

class _AccentProgressBar extends StatelessWidget {
  const _AccentProgressBar({required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(999),
      child: SizedBox(
        height: 7,
        child: LinearProgressIndicator(
          value: value,
          backgroundColor: Colors.white.withValues(alpha: 0.08),
          color: CurrentWorkoutScreen._accent,
        ),
      ),
    );
  }
}
