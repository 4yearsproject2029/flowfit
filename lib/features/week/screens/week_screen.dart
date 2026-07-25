import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../data/models/workout_log.dart';
import '../../../data/services/storage_service.dart';
import '../../history/screens/history_screen.dart';
import '../../workout_detail/screens/planned_session_detail_screen.dart';
import '../../workout_plan/screens/workout_plan_builder_screen.dart';

class WeekScreen extends StatefulWidget {
  WeekScreen({super.key, StorageService? storageService})
    : storageService = storageService ?? StorageService();

  final StorageService storageService;

  static const background = Color(0xFF050606);
  static const surface = Color(0xFF101214);
  static const elevated = Color(0xFF181B1F);
  static const border = Color(0xFF252A2E);
  static const accent = Color(0xFF18F7D3);
  static const accentDark = Color(0xFF073F39);
  static const primaryText = Color(0xFFF5F6F7);
  static const secondaryText = Color(0xFFA8AFB7);
  static const mutedText = Color(0xFF6F767E);

  @override
  State<WeekScreen> createState() => _WeekScreenState();
}

class _WeekScreenState extends State<WeekScreen> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = _dateOnly(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WeekScreen.background,
      body: SafeArea(
        child: ValueListenableBuilder<Box<WorkoutLog>>(
          valueListenable: widget.storageService.workoutLogsListenable,
          builder: (context, _, child) {
            return ValueListenableBuilder<Box<bool>>(
              valueListenable: widget.storageService.plannedRestListenable,
              builder: (context, _, child) {
                final weekDays = _weekDaysFor(_selectedDate);
                final selectedDateKey = _dateKey(_selectedDate);
                final workoutLogs = widget.storageService.getWorkoutLogsByDate(
                  selectedDateKey,
                );
                final sessionTitle = widget.storageService
                    .getWorkoutSessionTitle(selectedDateKey);
                final isPlannedRest = widget.storageService.isPlannedRestDate(
                  selectedDateKey,
                );

                return CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _WeekHeader(
                              weekRangeLabel: _weekRangeLabel(weekDays),
                              onPreviousWeek: () => _changeWeek(-7),
                              onNextWeek: () => _changeWeek(7),
                            ),
                            const SizedBox(height: 26),
                            _DaySelector(
                              weekDays: weekDays,
                              selectedDate: _selectedDate,
                              plannedDateKeys: _plannedDateKeysFor(weekDays),
                              onDateSelected: (date) {
                                setState(() {
                                  _selectedDate = date;
                                });
                              },
                            ),
                            const SizedBox(height: 28),
                            Row(
                              children: [
                                const _WeekSectionLabel("Today's Plan"),
                                const Spacer(),
                                if (workoutLogs.isNotEmpty || isPlannedRest)
                                  TextButton(
                                    onPressed: _openWorkoutPlanBuilder,
                                    style: TextButton.styleFrom(
                                      foregroundColor: WeekScreen.accent,
                                    ),
                                    child: const Text('Reschedule'),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            _SelectedDayPlanCard(
                              dateLabel: _selectedDateLabel(_selectedDate),
                              sessionTitle: sessionTitle,
                              workoutLogs: workoutLogs,
                              isPlannedRest: isPlannedRest,
                              onPlanWorkout: _openWorkoutPlanBuilder,
                              onOpenDetail: workoutLogs.isEmpty
                                  ? null
                                  : () => _openPlannedSessionDetail(
                                      sessionTitle: sessionTitle,
                                      selectedDateLabel: _selectedDateLabel(
                                        _selectedDate,
                                      ),
                                      workoutLogs: workoutLogs,
                                    ),
                            ),
                            const SizedBox(height: 24),
                            const _SuggestionsSection(),
                            const SizedBox(height: 28),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: _WeekBottomNavigation(
        storageService: widget.storageService,
      ),
    );
  }

  Future<void> _openWorkoutPlanBuilder() async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          return WorkoutPlanBuilderScreen(
            selectedDateKey: _dateKey(_selectedDate),
            selectedDateLabel: _selectedDateLabel(_selectedDate),
            storageService: widget.storageService,
          );
        },
      ),
    );

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _openPlannedSessionDetail({
    required String sessionTitle,
    required String selectedDateLabel,
    required List<WorkoutLog> workoutLogs,
  }) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          return PlannedSessionDetailScreen(
            sessionTitle: sessionTitle,
            selectedDateLabel: selectedDateLabel,
            workoutLogs: workoutLogs,
            storageService: widget.storageService,
          );
        },
      ),
    );

    if (mounted) {
      setState(() {});
    }
  }

  void _changeWeek(int dayOffset) {
    setState(() {
      _selectedDate = _selectedDate.add(Duration(days: dayOffset));
    });
  }

  Set<String> _plannedDateKeysFor(List<DateTime> weekDays) {
    return weekDays
        .where((date) {
          final key = _dateKey(date);
          return widget.storageService.getWorkoutLogsByDate(key).isNotEmpty ||
              widget.storageService.isPlannedRestDate(key);
        })
        .map(_dateKey)
        .toSet();
  }

  List<DateTime> _weekDaysFor(DateTime date) {
    final start = date.subtract(Duration(days: date.weekday - 1));
    return List.generate(
      7,
      (index) => _dateOnly(start.add(Duration(days: index))),
    );
  }

  DateTime _dateOnly(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  String _dateKey(DateTime date) {
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');

    return '$year-$month-$day';
  }

  String _selectedDateLabel(DateTime date) {
    return '${_shortMonth(date)} ${date.day}, ${date.year}';
  }

  String _weekRangeLabel(List<DateTime> weekDays) {
    final start = weekDays.first;
    final end = weekDays.last;
    if (start.year == end.year) {
      return '${_shortMonth(start)} ${start.day} - ${_shortMonth(end)} ${end.day}, ${end.year}';
    }
    return '${_shortMonth(start)} ${start.day}, ${start.year} - ${_shortMonth(end)} ${end.day}, ${end.year}';
  }

  String _shortMonth(DateTime date) {
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
    return monthLabels[date.month - 1];
  }
}

class _WeekHeader extends StatelessWidget {
  const _WeekHeader({
    required this.weekRangeLabel,
    required this.onPreviousWeek,
    required this.onNextWeek,
  });

  final String weekRangeLabel;
  final VoidCallback onPreviousWeek;
  final VoidCallback onNextWeek;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: WeekScreen.accent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.bolt, color: Colors.black, size: 22),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'Your Week',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: WeekScreen.primaryText,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),
        Text(
          'WEEK PLANNING',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: WeekScreen.accent,
            fontWeight: FontWeight.w900,
            letterSpacing: 0,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            Expanded(
              child: Text(
                weekRangeLabel,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: WeekScreen.primaryText,
                  fontWeight: FontWeight.w900,
                  height: 1.05,
                ),
              ),
            ),
            _WeekArrowButton(
              tooltip: 'Previous week',
              icon: Icons.chevron_left,
              onPressed: onPreviousWeek,
            ),
            const SizedBox(width: 8),
            _WeekArrowButton(
              tooltip: 'Next week',
              icon: Icons.chevron_right,
              onPressed: onNextWeek,
            ),
          ],
        ),
      ],
    );
  }
}

class _WeekArrowButton extends StatelessWidget {
  const _WeekArrowButton({
    required this.tooltip,
    required this.icon,
    required this.onPressed,
  });

  final String tooltip;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      tooltip: tooltip,
      style: IconButton.styleFrom(
        backgroundColor: WeekScreen.surface,
        foregroundColor: WeekScreen.primaryText,
        minimumSize: const Size.square(44),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      icon: Icon(icon),
    );
  }
}

class _DaySelector extends StatelessWidget {
  const _DaySelector({
    required this.weekDays,
    required this.selectedDate,
    required this.plannedDateKeys,
    required this.onDateSelected,
  });

  final List<DateTime> weekDays;
  final DateTime selectedDate;
  final Set<String> plannedDateKeys;
  final ValueChanged<DateTime> onDateSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: weekDays.map((date) {
        final isSelected = _isSameDay(date, selectedDate);
        final hasPlan = plannedDateKeys.contains(_dateKey(date));

        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: _DayButton(
              date: date,
              isSelected: isSelected,
              hasPlan: hasPlan,
              onTap: () => onDateSelected(date),
            ),
          ),
        );
      }).toList(),
    );
  }

  bool _isSameDay(DateTime first, DateTime second) {
    return first.year == second.year &&
        first.month == second.month &&
        first.day == second.day;
  }

  String _dateKey(DateTime date) {
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');

    return '$year-$month-$day';
  }
}

class _DayButton extends StatelessWidget {
  const _DayButton({
    required this.date,
    required this.isSelected,
    required this.hasPlan,
    required this.onTap,
  });

  final DateTime date;
  final bool isSelected;
  final bool hasPlan;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final foregroundColor = isSelected ? Colors.black : WeekScreen.primaryText;
    final backgroundColor = isSelected ? WeekScreen.accent : WeekScreen.surface;

    return Semantics(
      button: true,
      selected: isSelected,
      label: '${_weekdayLabel(date)} ${date.day}',
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 78,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected ? WeekScreen.accent : WeekScreen.border,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _weekdayLabel(date),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: foregroundColor.withValues(alpha: 0.72),
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${date.day}',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: foregroundColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 6),
              Container(
                width: hasPlan ? 6 : 4,
                height: hasPlan ? 6 : 4,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.black : WeekScreen.accent,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _weekdayLabel(DateTime date) {
    const labels = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
    return labels[date.weekday - 1];
  }
}

class _WeekSectionLabel extends StatelessWidget {
  const _WeekSectionLabel(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: WeekScreen.secondaryText,
        fontWeight: FontWeight.w900,
        letterSpacing: 0,
      ),
    );
  }
}

class _SelectedDayPlanCard extends StatelessWidget {
  const _SelectedDayPlanCard({
    required this.dateLabel,
    required this.sessionTitle,
    required this.workoutLogs,
    required this.isPlannedRest,
    required this.onPlanWorkout,
    required this.onOpenDetail,
  });

  final String dateLabel;
  final String sessionTitle;
  final List<WorkoutLog> workoutLogs;
  final bool isPlannedRest;
  final VoidCallback onPlanWorkout;
  final VoidCallback? onOpenDetail;

  @override
  Widget build(BuildContext context) {
    final hasPlan = workoutLogs.isNotEmpty;
    final previewLogs = workoutLogs.take(3).toList();
    final remainingCount = workoutLogs.length - previewLogs.length;
    final title = isPlannedRest
        ? 'Planned rest day'
        : hasPlan
        ? sessionTitle
        : 'No workout planned';

    return InkWell(
      onTap: onOpenDetail,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: WeekScreen.elevated,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: WeekScreen.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: WeekScreen.primaryText,
                          fontWeight: FontWeight.w900,
                          height: 1.08,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        dateLabel,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: WeekScreen.secondaryText,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                _PlanBadge(
                  icon: isPlannedRest
                      ? Icons.self_improvement
                      : hasPlan
                      ? Icons.fitness_center
                      : Icons.add_task,
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (isPlannedRest)
              const _PlanMessage(
                title: 'Recovery is planned',
                message:
                    'This day stays focused on recovery, not history review.',
              )
            else if (!hasPlan)
              const _PlanMessage(
                title: 'Build a simple session',
                message:
                    'Use the existing planner to add exercises for this day.',
              )
            else ...[
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _PlanMetric(
                    icon: Icons.schedule,
                    label: '${_estimatedMinutes(workoutLogs)} min',
                  ),
                  _PlanMetric(
                    icon: Icons.local_fire_department_outlined,
                    label: '${workoutLogs.length} exercises',
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Text(
                'SESSION PREVIEW',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: WeekScreen.mutedText,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0,
                ),
              ),
              const SizedBox(height: 8),
              for (final log in previewLogs)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: _ExercisePreviewRow(workoutLog: log),
                ),
              if (remainingCount > 0)
                Text(
                  '+$remainingCount more exercises',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: WeekScreen.secondaryText,
                    fontWeight: FontWeight.w700,
                  ),
                ),
            ],
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: onPlanWorkout,
                style: FilledButton.styleFrom(
                  backgroundColor: WeekScreen.accent,
                  foregroundColor: Colors.black,
                  minimumSize: const Size.fromHeight(52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
                icon: Icon(hasPlan || isPlannedRest ? Icons.edit : Icons.add),
                label: Text(
                  hasPlan || isPlannedRest ? 'Adjust Plan' : 'Plan Workout',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _estimatedMinutes(List<WorkoutLog> logs) {
    final setCount = logs.fold<int>(0, (total, log) => total + (log.sets ?? 1));
    return (setCount * 4).clamp(15, 90);
  }
}

class _PlanBadge extends StatelessWidget {
  const _PlanBadge({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: WeekScreen.accentDark,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, color: WeekScreen.accent, size: 26),
    );
  }
}

class _PlanMessage extends StatelessWidget {
  const _PlanMessage({required this.title, required this.message});

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: WeekScreen.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: WeekScreen.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: WeekScreen.primaryText,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: WeekScreen.secondaryText,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _PlanMetric extends StatelessWidget {
  const _PlanMetric({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: WeekScreen.accent, size: 18),
        const SizedBox(width: 6),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: WeekScreen.primaryText,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

class _ExercisePreviewRow extends StatelessWidget {
  const _ExercisePreviewRow({required this.workoutLog});

  final WorkoutLog workoutLog;

  @override
  Widget build(BuildContext context) {
    final targetLabel = [
      if (workoutLog.sets != null) '${workoutLog.sets} sets',
      if (workoutLog.reps != null) '${workoutLog.reps} reps',
    ].join(' · ');

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
      decoration: BoxDecoration(
        color: WeekScreen.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: WeekScreen.border),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              workoutLog.workoutName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: WeekScreen.primaryText,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          if (targetLabel.isNotEmpty) ...[
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                targetLabel,
                textAlign: TextAlign.right,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: WeekScreen.secondaryText,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _SuggestionsSection extends StatelessWidget {
  const _SuggestionsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _WeekSectionLabel('Suggestions'),
        const SizedBox(height: 10),
        Row(
          children: const [
            Expanded(
              child: _SuggestionTile(
                icon: Icons.bolt,
                title: 'Active Recovery',
                subtitle: '15 min yoga',
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _SuggestionTile(
                icon: Icons.local_fire_department_outlined,
                title: 'Mobility Flow',
                subtitle: 'Full body stretch',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SuggestionTile extends StatelessWidget {
  const _SuggestionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 84),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: WeekScreen.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: WeekScreen.border),
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: WeekScreen.elevated,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: WeekScreen.accent, size: 20),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: WeekScreen.primaryText,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: WeekScreen.secondaryText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WeekBottomNavigation extends StatelessWidget {
  const _WeekBottomNavigation({required this.storageService});

  final StorageService storageService;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: WeekScreen.surface,
        border: Border(top: BorderSide(color: WeekScreen.border)),
      ),
      padding: const EdgeInsets.fromLTRB(8, 7, 8, 8),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            _WeekNavItem(
              icon: Icons.home_outlined,
              selectedIcon: Icons.home,
              label: 'Home',
              onTap: () => Navigator.of(context).pop(),
            ),
            const _WeekNavItem(icon: Icons.today_outlined, label: 'Today'),
            const _WeekNavItem(
              icon: Icons.calendar_month,
              label: 'Week',
              isSelected: true,
            ),
            const _WeekNavItem(
              icon: Icons.emoji_events_outlined,
              label: 'Achievement',
            ),
            _WeekNavItem(
              icon: Icons.history,
              label: 'History',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) {
                      return HistoryScreen(storageService: storageService);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _WeekNavItem extends StatelessWidget {
  const _WeekNavItem({
    required this.icon,
    required this.label,
    this.selectedIcon,
    this.isSelected = false,
    this.onTap,
  });

  final IconData icon;
  final IconData? selectedIcon;
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? WeekScreen.accent : WeekScreen.secondaryText;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          height: 54,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
        ),
      ),
    );
  }
}
