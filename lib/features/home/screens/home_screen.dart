import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../data/models/workout_log.dart';
import '../../../data/services/consistency_recovery_service.dart';
import '../../../data/services/level_service.dart';
import '../../../data/services/storage_service.dart';
import '../../../data/services/weekly_goal_service.dart';
import '../../current_workout/screens/current_workout_screen.dart';
import '../../workout_plan/screens/workout_plan_builder_screen.dart';

class _DashboardColors {
  static const background = Color(0xFF050606);
  static const surface = Color(0xFF101214);
  static const elevated = Color(0xFF181B1F);
  static const border = Color(0xFF252A2E);
  static const accent = Color(0xFF18F7D3);
  static const accentDark = Color(0xFF073F39);
  static const primaryText = Color(0xFFF5F6F7);
  static const secondaryText = Color(0xFFA8AFB7);
  static const mutedText = Color(0xFF6F767E);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final StorageService storageService = StorageService();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _DashboardColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 0),
              sliver: SliverToBoxAdapter(
                child: _DashboardHeader(storageService: storageService),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              sliver: SliverToBoxAdapter(
                child: ValueListenableBuilder<Box<WorkoutLog>>(
                  valueListenable: storageService.workoutLogsListenable,
                  builder: (context, _, child) {
                    return ValueListenableBuilder<Box<bool>>(
                      valueListenable: storageService.plannedRestListenable,
                      builder: (context, _, child) {
                        final selectedDateKey = _dateKey(selectedDate);
                        final workoutLogs = storageService.getWorkoutLogsByDate(
                          selectedDateKey,
                        );
                        final sessionTitle = storageService
                            .getWorkoutSessionTitle(selectedDateKey);
                        final isPlannedRest = storageService.isPlannedRestDate(
                          selectedDateKey,
                        );

                        return _TodaysFocusSection(
                          selectedDateLabel: _selectedDateLabel(selectedDate),
                          sessionTitle: sessionTitle,
                          workoutLogs: workoutLogs,
                          isPlannedRest: isPlannedRest,
                          onPrimaryAction: workoutLogs.isEmpty || isPlannedRest
                              ? null
                              : () => _openCurrentWorkout(workoutLogs),
                          onPlanWorkout: _showAddWorkoutSheet,
                          onMarkPlannedRest: () {
                            _markSelectedDateAsPlannedRest(selectedDateKey);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 0),
              sliver: SliverToBoxAdapter(
                child: ValueListenableBuilder<Box<WorkoutLog>>(
                  valueListenable: storageService.workoutLogsListenable,
                  builder: (context, box, child) {
                    final weeklyGoal = storageService.getWeeklyGoal();
                    if (weeklyGoal == null) {
                      return const SizedBox.shrink();
                    }

                    final progress = WeeklyGoalService().calculateProgress(
                      weeklyGoal: weeklyGoal,
                      workoutLogs: storageService.getWorkoutLogs(),
                      today: DateTime.now(),
                    );

                    return _WeeklyGoalSummarySection(progress: progress);
                  },
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 0),
              sliver: SliverToBoxAdapter(
                child: ValueListenableBuilder<Box<WorkoutLog>>(
                  valueListenable: storageService.workoutLogsListenable,
                  builder: (context, _, child) {
                    return ValueListenableBuilder<Box<bool>>(
                      valueListenable: storageService.plannedRestListenable,
                      builder: (context, _, child) {
                        final status = storageService
                            .getConsistencyRecoveryStatus(
                              today: DateTime.now(),
                            );

                        if (!status.hasReturnedAfterMissedWeek) {
                          return const SizedBox.shrink();
                        }

                        return _ConsistencyRecoverySection(status: status);
                      },
                    );
                  },
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 22, 20, 100),
              sliver: SliverToBoxAdapter(
                child: ValueListenableBuilder<Box<int>>(
                  valueListenable: storageService.xpTotalListenable,
                  builder: (context, box, child) {
                    return _NextAchievementSection(
                      xpTotal: storageService.getXpTotal(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const _DashboardBottomNavigation(),
    );
  }

  void _openCurrentWorkout(List<WorkoutLog> workoutLogs) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          return CurrentWorkoutScreen(
            workoutLogs: workoutLogs,
            selectedDateLabel: _selectedDateLabel(selectedDate),
          );
        },
      ),
    );
  }

  Future<void> _markSelectedDateAsPlannedRest(String selectedDateKey) async {
    await storageService.markPlannedRest(selectedDateKey);
  }

  Future<void> _showAddWorkoutSheet() async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          return WorkoutPlanBuilderScreen(
            selectedDateKey: _dateKey(selectedDate),
            selectedDateLabel: _selectedDateLabel(selectedDate),
            storageService: storageService,
          );
        },
      ),
    );

    if (mounted) {
      setState(() {});
    }
  }

  String _dateKey(DateTime date) {
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');

    return '$year-$month-$day';
  }

  String _selectedDateLabel(DateTime date) {
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

class _DashboardHeader extends StatelessWidget {
  const _DashboardHeader({required this.storageService});

  final StorageService storageService;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<int>>(
      valueListenable: storageService.xpTotalListenable,
      builder: (context, box, child) {
        final xpTotal = storageService.getXpTotal();
        final levelProgress = LevelService().calculateProgress(xpTotal);

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _greeting(),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: _DashboardColors.primaryText,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Let's crush your goals today.",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: _DashboardColors.secondaryText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Level ${levelProgress.currentLevel}',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: _DashboardColors.accent,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: _DashboardColors.surface,
                borderRadius: BorderRadius.circular(999),
                border: Border.all(
                  color: _DashboardColors.accent.withValues(alpha: 0.18),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.local_fire_department,
                    color: _DashboardColors.accent,
                    size: 17,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '$xpTotal XP',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: _DashboardColors.accent,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  String _greeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good morning';
    }
    if (hour < 18) {
      return 'Good afternoon';
    }
    return 'Good evening';
  }
}

class _DashboardSectionLabel extends StatelessWidget {
  const _DashboardSectionLabel(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: _DashboardColors.secondaryText,
        fontWeight: FontWeight.w900,
        letterSpacing: 0,
      ),
    );
  }
}

class _TodaysFocusSection extends StatelessWidget {
  const _TodaysFocusSection({
    required this.selectedDateLabel,
    required this.sessionTitle,
    required this.workoutLogs,
    required this.isPlannedRest,
    required this.onPrimaryAction,
    required this.onPlanWorkout,
    required this.onMarkPlannedRest,
  });

  final String selectedDateLabel;
  final String sessionTitle;
  final List<WorkoutLog> workoutLogs;
  final bool isPlannedRest;
  final VoidCallback? onPrimaryAction;
  final VoidCallback onPlanWorkout;
  final VoidCallback onMarkPlannedRest;

  @override
  Widget build(BuildContext context) {
    final completedCount = workoutLogs.where((log) => log.isCompleted).length;
    final totalCount = workoutLogs.length;
    final progressValue = totalCount == 0 ? 0.0 : completedCount / totalCount;
    final primaryLabel = completedCount == 0
        ? 'Start Workout'
        : 'Resume Workout';
    final title = isPlannedRest
        ? 'Planned rest day'
        : totalCount == 0
        ? 'No workout planned'
        : sessionTitle;
    final status = isPlannedRest
        ? 'Rest counts as part of staying consistent.'
        : totalCount == 0
        ? 'Add a simple plan when you are ready.'
        : '$completedCount / $totalCount exercises completed';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _DashboardSectionLabel("Today's Focus"),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(18, 22, 18, 18),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [_DashboardColors.elevated, _DashboardColors.surface],
            ),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: _DashboardColors.border),
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
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(
                                color: _DashboardColors.primaryText,
                                fontWeight: FontWeight.w900,
                                height: 1.02,
                              ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          status,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: _DashboardColors.secondaryText,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 76,
                    height: 64,
                    decoration: BoxDecoration(
                      color: _DashboardColors.accentDark.withValues(
                        alpha: 0.46,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      isPlannedRest
                          ? Icons.self_improvement
                          : Icons.fitness_center,
                      color: _DashboardColors.accent,
                      size: 40,
                    ),
                  ),
                ],
              ),
              if (totalCount > 0 && !isPlannedRest) ...[
                const SizedBox(height: 14),
                _AccentProgressBar(value: progressValue),
              ],
              const SizedBox(height: 18),
              if (onPrimaryAction == null)
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: isPlannedRest ? null : onPlanWorkout,
                    style: _primaryActionStyle(),
                    icon: const Icon(Icons.add),
                    label: const Text('Plan Workout'),
                  ),
                )
              else
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: onPrimaryAction,
                    style: _primaryActionStyle(),
                    icon: const Icon(Icons.play_arrow),
                    label: Text(primaryLabel),
                  ),
                ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    selectedDateLabel,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: _DashboardColors.mutedText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (!isPlannedRest)
                    TextButton(
                      onPressed: onMarkPlannedRest,
                      style: TextButton.styleFrom(
                        foregroundColor: _DashboardColors.accent,
                      ),
                      child: const Text('Mark planned rest'),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  ButtonStyle _primaryActionStyle() {
    return FilledButton.styleFrom(
      backgroundColor: _DashboardColors.accent,
      foregroundColor: Colors.black,
      disabledBackgroundColor: _DashboardColors.border,
      disabledForegroundColor: _DashboardColors.mutedText,
      minimumSize: const Size.fromHeight(54),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: const TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
    );
  }
}

class _WeeklyGoalSummarySection extends StatelessWidget {
  const _WeeklyGoalSummarySection({required this.progress});

  final WeeklyGoalProgress progress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _DashboardSectionLabel('Weekly Progress'),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: _DashboardColors.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: _DashboardColors.border),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      progress.progressLabel,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: _DashboardColors.primaryText,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      progress.statusMessage,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: _DashboardColors.secondaryText,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _AccentProgressBar(value: progress.progressValue),
                    const SizedBox(height: 8),
                    Text(
                      progress.goalLabel,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: _DashboardColors.mutedText,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _DashboardColors.accentDark,
                  border: Border.all(
                    color: _DashboardColors.accent.withValues(alpha: 0.34),
                    width: 2,
                  ),
                ),
                child: const Icon(
                  Icons.directions_run,
                  color: _DashboardColors.accent,
                  size: 24,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ConsistencyRecoverySection extends StatelessWidget {
  const _ConsistencyRecoverySection({required this.status});

  final ConsistencyRecoveryStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _DashboardColors.accentDark,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: _DashboardColors.accent.withValues(alpha: 0.24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            status.title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: _DashboardColors.primaryText,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            status.message,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: _DashboardColors.primaryText,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            status.reassurance,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: _DashboardColors.accent,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _NextAchievementSection extends StatelessWidget {
  const _NextAchievementSection({required this.xpTotal});

  final int xpTotal;

  @override
  Widget build(BuildContext context) {
    final levelProgress = LevelService().calculateProgress(xpTotal);
    final remainingXp =
        levelProgress.xpPerLevel - levelProgress.xpIntoCurrentLevel;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _DashboardSectionLabel('Next Achievement'),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: _DashboardColors.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: _DashboardColors.border),
          ),
          child: Row(
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  color: _DashboardColors.accentDark,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.emoji_events_outlined,
                  color: _DashboardColors.accent,
                  size: 32,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Level ${levelProgress.nextLevel}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: _DashboardColors.primaryText,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$remainingXp XP until your next level.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: _DashboardColors.secondaryText,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      levelProgress.progressLabel,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: _DashboardColors.accent,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Saved only on this device. Uninstalling RepLog or switching devices may result in data loss.',
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: _DashboardColors.mutedText),
        ),
      ],
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
          color: _DashboardColors.accent,
        ),
      ),
    );
  }
}

class _DashboardBottomNavigation extends StatelessWidget {
  const _DashboardBottomNavigation();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: _DashboardColors.surface,
        border: Border(top: BorderSide(color: _DashboardColors.border)),
      ),
      padding: const EdgeInsets.fromLTRB(8, 7, 8, 8),
      child: SafeArea(
        top: false,
        child: Row(
          children: const [
            _DashboardNavItem(
              icon: Icons.home_outlined,
              selectedIcon: Icons.home,
              label: 'Home',
              isSelected: true,
            ),
            _DashboardNavItem(icon: Icons.today_outlined, label: 'Today'),
            _DashboardNavItem(
              icon: Icons.calendar_month_outlined,
              label: 'Week',
            ),
            _DashboardNavItem(
              icon: Icons.emoji_events_outlined,
              label: 'Achievement',
            ),
            _DashboardNavItem(icon: Icons.history, label: 'History'),
          ],
        ),
      ),
    );
  }
}

class _DashboardNavItem extends StatelessWidget {
  const _DashboardNavItem({
    required this.icon,
    required this.label,
    this.selectedIcon,
    this.isSelected = false,
  });

  final IconData icon;
  final IconData? selectedIcon;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final color = isSelected
        ? _DashboardColors.accent
        : _DashboardColors.secondaryText;

    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            isSelected ? selectedIcon ?? icon : icon,
            color: color,
            size: 24,
          ),
          const SizedBox(height: 2),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: color,
              fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
