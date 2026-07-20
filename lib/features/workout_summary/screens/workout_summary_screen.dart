import 'package:flutter/material.dart';

import '../../../data/models/workout_log.dart';
import '../../../data/services/level_service.dart';
import '../../../data/services/storage_service.dart';
import '../../../data/services/weekly_goal_service.dart';
import '../../share_cards/widgets/share_cards_section.dart';
import '../../workout_plan/screens/workout_plan_builder_screen.dart';

class WorkoutSummaryScreen extends StatelessWidget {
  const WorkoutSummaryScreen({
    super.key,
    required this.workoutLogs,
    required this.selectedDateLabel,
    required this.storageService,
  });

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
  static const _gold = Color(0xFFFFC857);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
              sliver: SliverToBoxAdapter(
                child: ValueListenableBuilder(
                  valueListenable: storageService.workoutLogsListenable,
                  builder: (context, _, child) {
                    return ValueListenableBuilder(
                      valueListenable: storageService.xpTotalListenable,
                      builder: (context, _, child) {
                        final xpTotal = storageService.getXpTotal();
                        final levelProgress = LevelService().calculateProgress(
                          xpTotal,
                        );
                        final weeklyProgress = _weeklyGoalProgress();
                        final xpMessage = storageService.getXpExplanation();
                        final sessionLogs = _summaryWorkoutLogs();
                        final privateDetails = _privateDetails(sessionLogs);
                        final momentDetail = _momentDetail(sessionLogs);

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _SummaryHeader(
                              selectedDateLabel: selectedDateLabel,
                            ),
                            const SizedBox(height: 28),
                            Text(
                              'Incredible work today.',
                              style: Theme.of(context).textTheme.headlineMedium
                                  ?.copyWith(
                                    color: _primaryText,
                                    fontWeight: FontWeight.w900,
                                    height: 1.04,
                                  ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'You finished the work in front of you. That is how consistency gets built.',
                              style: Theme.of(context).textTheme.bodyLarge
                                  ?.copyWith(
                                    color: _secondaryText,
                                    fontWeight: FontWeight.w700,
                                    height: 1.32,
                                  ),
                            ),
                            const SizedBox(height: 22),
                            _RewardCard(
                              xpMessage: xpMessage,
                              levelLabel: 'Level ${levelProgress.currentLevel}',
                              progressLabel: levelProgress.progressLabel,
                              weeklyLabel: weeklyProgress?.progressLabel,
                            ),
                            const SizedBox(height: 24),
                            _SummaryShareSection(
                              selectedDateLabel: selectedDateLabel,
                              workoutLogs: sessionLogs,
                              xpTotal: xpTotal,
                              weeklyProgress: weeklyProgress,
                              storageService: storageService,
                            ),
                            const SizedBox(height: 24),
                            _SectionLabel(label: 'SESSION SNAPSHOT'),
                            const SizedBox(height: 12),
                            _SnapshotGrid(details: privateDetails),
                            if (momentDetail != null) ...[
                              const SizedBox(height: 24),
                              _SectionLabel(label: 'MOMENT OF THE DAY'),
                              const SizedBox(height: 12),
                              _MomentCard(detail: momentDetail),
                            ],
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: FilledButton.icon(
                                onPressed: () {
                                  _openPlanTomorrow(context);
                                },
                                style: FilledButton.styleFrom(
                                  backgroundColor: _accent,
                                  foregroundColor: Colors.black,
                                  minimumSize: const Size.fromHeight(58),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                  ),
                                ),
                                icon: const Icon(Icons.calendar_today_outlined),
                                label: const Text('Plan Tomorrow'),
                              ),
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton.icon(
                                onPressed: () {
                                  Navigator.of(context).popUntil((route) {
                                    return route.isFirst;
                                  });
                                },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: _primaryText,
                                  minimumSize: const Size.fromHeight(58),
                                  side: const BorderSide(color: _border),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                  ),
                                ),
                                icon: const Icon(Icons.arrow_back),
                                label: const Text('Back to Dashboard'),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  WeeklyGoalProgress? _weeklyGoalProgress() {
    final weeklyGoal = storageService.getWeeklyGoal();
    if (weeklyGoal == null) {
      return null;
    }

    final summaryDate = _summaryDate();
    return WeeklyGoalService().calculateProgress(
      weeklyGoal: weeklyGoal,
      workoutLogs: storageService.getWorkoutLogs(),
      today: summaryDate,
    );
  }

  DateTime _summaryDate() {
    if (workoutLogs.isEmpty) {
      return DateTime.now();
    }

    return DateTime.tryParse(workoutLogs.first.date) ?? DateTime.now();
  }

  List<WorkoutLog> _summaryWorkoutLogs() {
    if (workoutLogs.isEmpty) {
      return const [];
    }

    final logs = storageService.getWorkoutLogsByDate(workoutLogs.first.date);
    return logs.isEmpty ? workoutLogs : logs;
  }

  int _totalSets(List<WorkoutLog> logs) {
    return logs.fold<int>(0, (total, workoutLog) {
      final sets = workoutLog.sets;
      return total + ((sets == null || sets < 1) ? 1 : sets);
    });
  }

  List<_PrivateDetail> _privateDetails(List<WorkoutLog> logs) {
    final details = <_PrivateDetail>[
      _PrivateDetail(label: 'Exercises', value: '${logs.length}'),
      _PrivateDetail(label: 'Sets done', value: '${_totalSets(logs)}'),
    ];

    final volume = _totalVolume(logs);
    if (volume != null) {
      details.add(_PrivateDetail(label: 'Volume', value: volume));
    }

    final moment = _momentOfDayLabel(logs);
    if (moment != null) {
      details.add(_PrivateDetail(label: 'Moment', value: moment));
    }

    final weeklyProgress = _weeklyGoalProgress();
    details.add(
      _PrivateDetail(
        label: 'Weekly goal',
        value: weeklyProgress?.progressLabel ?? 'Not set',
      ),
    );

    return details;
  }

  String? _totalVolume(List<WorkoutLog> logs) {
    var totalVolume = 0.0;
    for (final workoutLog in logs) {
      final sets = workoutLog.sets;
      final reps = workoutLog.reps;
      final weight = workoutLog.weight;
      if (sets == null || reps == null || weight == null) {
        continue;
      }
      totalVolume += sets * reps * weight;
    }

    if (totalVolume <= 0) {
      return null;
    }

    final value = totalVolume == totalVolume.roundToDouble()
        ? totalVolume.toInt().toString()
        : totalVolume.toStringAsFixed(1);
    return '$value kg';
  }

  String? _momentOfDayLabel(List<WorkoutLog> logs) {
    if (logs.isEmpty) {
      return null;
    }

    final hour = logs.first.createdAt.hour;
    if (hour < 12) {
      return 'Morning';
    }
    if (hour < 17) {
      return 'Afternoon';
    }
    return 'Evening';
  }

  _MomentDetail? _momentDetail(List<WorkoutLog> logs) {
    if (logs.isEmpty) {
      return null;
    }

    final firstNamedWorkout = logs.firstWhere(
      (workoutLog) => workoutLog.workoutName.trim().isNotEmpty,
      orElse: () => logs.first,
    );
    final title = firstNamedWorkout.workoutName.trim().isEmpty
        ? 'Workout completed'
        : firstNamedWorkout.workoutName.trim();
    final memo = firstNamedWorkout.memo?.trim();
    final detail = memo == null || memo.isEmpty
        ? '${logs.length} exercises completed'
        : memo;

    return _MomentDetail(title: title, detail: detail);
  }

  void _openPlanTomorrow(BuildContext context) {
    final tomorrow = _summaryDate().add(const Duration(days: 1));
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute<void>(
        builder: (context) {
          return WorkoutPlanBuilderScreen(
            selectedDateKey: _dateKey(tomorrow),
            selectedDateLabel: _dateLabel(tomorrow),
            storageService: storageService,
          );
        },
      ),
      (route) => route.isFirst,
    );
  }

  String _dateKey(DateTime date) {
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');

    return '$year-$month-$day';
  }

  String _dateLabel(DateTime date) {
    const monthNames = [
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

    return '${monthNames[date.month - 1]} ${date.day}';
  }
}

class _PrivateDetail {
  const _PrivateDetail({required this.label, required this.value});

  final String label;
  final String value;
}

class _MomentDetail {
  const _MomentDetail({required this.title, required this.detail});

  final String title;
  final String detail;
}

class _SummaryHeader extends StatelessWidget {
  const _SummaryHeader({required this.selectedDateLabel});

  final String selectedDateLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          tooltip: 'Back to current workout',
          icon: const Icon(
            Icons.arrow_back,
            color: WorkoutSummaryScreen._primaryText,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: WorkoutSummaryScreen._surface,
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: WorkoutSummaryScreen._border),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.emoji_events_outlined,
                color: WorkoutSummaryScreen._gold,
                size: 16,
              ),
              const SizedBox(width: 6),
              Text(
                selectedDateLabel,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: WorkoutSummaryScreen._secondaryText,
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

class _RewardCard extends StatelessWidget {
  const _RewardCard({
    required this.xpMessage,
    required this.levelLabel,
    required this.progressLabel,
    required this.weeklyLabel,
  });

  final String xpMessage;
  final String levelLabel;
  final String progressLabel;
  final String? weeklyLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: WorkoutSummaryScreen._accentDark,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: WorkoutSummaryScreen._accent.withValues(alpha: 0.28),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 54,
            width: 54,
            decoration: BoxDecoration(
              color: WorkoutSummaryScreen._accent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.workspace_premium_outlined,
              color: Colors.black,
              size: 30,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reward progress',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: WorkoutSummaryScreen._accent,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 0,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  xpMessage,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: WorkoutSummaryScreen._primaryText,
                    fontWeight: FontWeight.w800,
                    height: 1.28,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '$levelLabel - $progressLabel',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: WorkoutSummaryScreen._secondaryText,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (weeklyLabel != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    weeklyLabel!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: WorkoutSummaryScreen._secondaryText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: WorkoutSummaryScreen._secondaryText,
        fontWeight: FontWeight.w900,
        letterSpacing: 0,
      ),
    );
  }
}

class _SummaryShareSection extends StatelessWidget {
  const _SummaryShareSection({
    required this.selectedDateLabel,
    required this.workoutLogs,
    required this.xpTotal,
    required this.weeklyProgress,
    required this.storageService,
  });

  final String selectedDateLabel;
  final List<WorkoutLog> workoutLogs;
  final int xpTotal;
  final WeeklyGoalProgress? weeklyProgress;
  final StorageService storageService;

  @override
  Widget build(BuildContext context) {
    final baseTheme = Theme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: WorkoutSummaryScreen._surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: WorkoutSummaryScreen._border),
      ),
      child: Theme(
        data: baseTheme.copyWith(
          textTheme: baseTheme.textTheme.apply(
            bodyColor: WorkoutSummaryScreen._primaryText,
            displayColor: WorkoutSummaryScreen._primaryText,
          ),
          colorScheme: baseTheme.colorScheme.copyWith(
            primary: WorkoutSummaryScreen._accent,
            onSurface: WorkoutSummaryScreen._primaryText,
            onSurfaceVariant: WorkoutSummaryScreen._secondaryText,
            outline: WorkoutSummaryScreen._border,
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              foregroundColor: WorkoutSummaryScreen._primaryText,
              side: const BorderSide(color: WorkoutSummaryScreen._border),
              minimumSize: const Size(88, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        child: ShareCardsSection(
          selectedDateLabel: selectedDateLabel,
          workoutLogs: workoutLogs,
          xpTotal: xpTotal,
          weeklyGoalProgress: weeklyProgress,
          storageService: storageService,
        ),
      ),
    );
  }
}

class _SnapshotGrid extends StatelessWidget {
  const _SnapshotGrid({required this.details});

  final List<_PrivateDetail> details;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final spacing = constraints.maxWidth >= 360 ? 12.0 : 8.0;
        final tileWidth = (constraints.maxWidth - spacing) / 2;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            for (final detail in details)
              SizedBox(
                width: tileWidth,
                child: _SnapshotTile(label: detail.label, value: detail.value),
              ),
          ],
        );
      },
    );
  }
}

class _MomentCard extends StatelessWidget {
  const _MomentCard({required this.detail});

  final _MomentDetail detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: WorkoutSummaryScreen._elevated,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: WorkoutSummaryScreen._border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            detail.title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: WorkoutSummaryScreen._primaryText,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            detail.detail,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: WorkoutSummaryScreen._secondaryText,
              fontWeight: FontWeight.w700,
              height: 1.28,
            ),
          ),
        ],
      ),
    );
  }
}

class _SnapshotTile extends StatelessWidget {
  const _SnapshotTile({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      decoration: BoxDecoration(
        color: WorkoutSummaryScreen._elevated,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: WorkoutSummaryScreen._border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: WorkoutSummaryScreen._mutedText,
              fontWeight: FontWeight.w900,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: WorkoutSummaryScreen._primaryText,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
