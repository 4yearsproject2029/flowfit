import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../data/models/workout_log.dart';
import '../../../data/services/storage_service.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key, StorageService? storageService})
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: ValueListenableBuilder<Box<WorkoutLog>>(
          valueListenable: storageService.workoutLogsListenable,
          builder: (context, _, child) {
            final sessions = _completedSessions();

            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
                  sliver: SliverToBoxAdapter(
                    child: _HistoryHeader(completedSessions: sessions.length),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
                  sliver: SliverToBoxAdapter(
                    child: _HistorySummary(sessions: sessions),
                  ),
                ),
                if (sessions.isEmpty)
                  const SliverFillRemaining(
                    hasScrollBody: false,
                    child: _HistoryEmptyState(),
                  )
                else
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(20, 24, 20, 100),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        _groupedSessionWidgets(sessions),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: const _HistoryBottomNavigation(),
    );
  }

  List<_CompletedSession> _completedSessions() {
    final sessionsByDate = <String, List<WorkoutLog>>{};
    for (final log in storageService.getWorkoutLogs()) {
      if (!log.isCompleted) {
        continue;
      }
      sessionsByDate.putIfAbsent(log.date, () => <WorkoutLog>[]).add(log);
    }

    final sessions = sessionsByDate.entries.map((entry) {
      final logs = [...entry.value]
        ..sort((first, second) => first.createdAt.compareTo(second.createdAt));
      return _CompletedSession(
        dateKey: entry.key,
        title: storageService.getWorkoutSessionTitle(entry.key),
        logs: logs,
      );
    }).toList();

    sessions.sort((first, second) {
      final dateComparison = second.date.compareTo(first.date);
      if (dateComparison != 0) {
        return dateComparison;
      }
      return second.latestCreatedAt.compareTo(first.latestCreatedAt);
    });

    return sessions;
  }

  List<Widget> _groupedSessionWidgets(List<_CompletedSession> sessions) {
    final now = DateTime.now();
    final thisWeekStart = _startOfWeek(now);
    final lastWeekStart = thisWeekStart.subtract(const Duration(days: 7));
    final grouped = <String, List<_CompletedSession>>{
      'THIS WEEK': <_CompletedSession>[],
      'LAST WEEK': <_CompletedSession>[],
      'EARLIER': <_CompletedSession>[],
    };

    for (final session in sessions) {
      final sessionWeekStart = _startOfWeek(session.date);
      if (sessionWeekStart == thisWeekStart) {
        grouped['THIS WEEK']!.add(session);
      } else if (sessionWeekStart == lastWeekStart) {
        grouped['LAST WEEK']!.add(session);
      } else {
        grouped['EARLIER']!.add(session);
      }
    }

    final widgets = <Widget>[];
    for (final entry in grouped.entries) {
      if (entry.value.isEmpty) {
        continue;
      }
      widgets
        ..add(_HistorySectionLabel(entry.key))
        ..add(const SizedBox(height: 10));
      for (final session in entry.value) {
        widgets
          ..add(_HistorySessionRow(session: session))
          ..add(const SizedBox(height: 10));
      }
      widgets.add(const SizedBox(height: 14));
    }

    return widgets;
  }

  DateTime _startOfWeek(DateTime date) {
    final normalized = DateTime(date.year, date.month, date.day);
    return normalized.subtract(Duration(days: normalized.weekday - 1));
  }
}

class _CompletedSession {
  const _CompletedSession({
    required this.dateKey,
    required this.title,
    required this.logs,
  });

  final String dateKey;
  final String title;
  final List<WorkoutLog> logs;

  DateTime get date {
    final parts = dateKey.split('-');
    if (parts.length != 3) {
      return latestCreatedAt;
    }
    final year = int.tryParse(parts[0]);
    final month = int.tryParse(parts[1]);
    final day = int.tryParse(parts[2]);
    if (year == null || month == null || day == null) {
      return latestCreatedAt;
    }
    return DateTime(year, month, day);
  }

  DateTime get latestCreatedAt {
    return logs
        .map((log) => log.createdAt)
        .reduce(
          (latest, current) => current.isAfter(latest) ? current : latest,
        );
  }

  int get totalSets {
    return logs.fold<int>(0, (total, log) => total + (log.sets ?? 0));
  }

  double get totalVolume {
    return logs.fold<double>(0, (total, log) {
      final sets = log.sets;
      final reps = log.reps;
      final weight = log.weight;
      if (sets == null || reps == null || weight == null) {
        return total;
      }
      return total + (sets * reps * weight);
    });
  }
}

class _HistoryHeader extends StatelessWidget {
  const _HistoryHeader({required this.completedSessions});

  final int completedSessions;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: HistoryScreen.accent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.history, color: Colors.black, size: 22),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            'History',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: HistoryScreen.primaryText,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: HistoryScreen.accentDark,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle_outline,
                color: HistoryScreen.accent,
                size: 18,
              ),
              const SizedBox(width: 6),
              Text(
                '$completedSessions',
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: HistoryScreen.accent,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _HistorySummary extends StatelessWidget {
  const _HistorySummary({required this.sessions});

  final List<_CompletedSession> sessions;

  @override
  Widget build(BuildContext context) {
    final exerciseCount = sessions.fold<int>(
      0,
      (total, session) => total + session.logs.length,
    );

    return Row(
      children: [
        Expanded(
          child: _SummaryTile(
            label: 'WORKOUTS',
            value: '${sessions.length}',
            detail: 'Completed sessions',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _SummaryTile(
            label: 'EXERCISES',
            value: '$exerciseCount',
            detail: 'Logged movements',
          ),
        ),
      ],
    );
  }
}

class _SummaryTile extends StatelessWidget {
  const _SummaryTile({
    required this.label,
    required this.value,
    required this.detail,
  });

  final String label;
  final String value;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: HistoryScreen.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: HistoryScreen.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: HistoryScreen.secondaryText,
              fontWeight: FontWeight.w900,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: HistoryScreen.primaryText,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            detail,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: HistoryScreen.accent,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _HistorySectionLabel extends StatelessWidget {
  const _HistorySectionLabel(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: HistoryScreen.secondaryText,
        fontWeight: FontWeight.w900,
        letterSpacing: 0,
      ),
    );
  }
}

class _HistorySessionRow extends StatelessWidget {
  const _HistorySessionRow({required this.session});

  final _CompletedSession session;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: false,
      label: 'Completed history item for ${session.title}',
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: HistoryScreen.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: HistoryScreen.border),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: HistoryScreen.accentDark,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.check_circle_outline,
                color: HistoryScreen.accent,
                size: 24,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _dateLabel(session.date),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: HistoryScreen.secondaryText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    session.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: HistoryScreen.primaryText,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Wrap(
                    spacing: 10,
                    runSpacing: 5,
                    children: [
                      _HistoryMetaChip(
                        icon: Icons.fitness_center,
                        label: '${session.logs.length} exercises',
                      ),
                      if (session.totalSets > 0)
                        _HistoryMetaChip(
                          icon: Icons.repeat,
                          label: '${session.totalSets} sets',
                        ),
                      if (session.totalVolume > 0)
                        _HistoryMetaChip(
                          icon: Icons.monitor_weight_outlined,
                          label: '${session.totalVolume.round()} kg volume',
                        ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Text(
                    '100% Done',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: HistoryScreen.accent,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Tooltip(
              message: 'Workout Detail is coming in RL-0027',
              child: Icon(
                Icons.arrow_forward_ios,
                color: HistoryScreen.mutedText.withValues(alpha: 0.7),
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _dateLabel(DateTime date) {
    const weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    const months = [
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

    return '${weekdays[date.weekday - 1]}, ${months[date.month - 1]} ${date.day}';
  }
}

class _HistoryMetaChip extends StatelessWidget {
  const _HistoryMetaChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: HistoryScreen.secondaryText, size: 14),
        const SizedBox(width: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: HistoryScreen.secondaryText,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _HistoryEmptyState extends StatelessWidget {
  const _HistoryEmptyState();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 26, 20, 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: HistoryScreen.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: HistoryScreen.border),
            ),
            child: const Icon(
              Icons.history,
              color: HistoryScreen.accent,
              size: 30,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'No completed workouts yet',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: HistoryScreen.primaryText,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Finish a workout and it will appear here for review.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: HistoryScreen.secondaryText,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _HistoryBottomNavigation extends StatelessWidget {
  const _HistoryBottomNavigation();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: HistoryScreen.surface,
        border: Border(top: BorderSide(color: HistoryScreen.border)),
      ),
      padding: const EdgeInsets.fromLTRB(8, 7, 8, 8),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            _HistoryNavItem(
              icon: Icons.home_outlined,
              selectedIcon: Icons.home,
              label: 'Home',
              onTap: () => Navigator.of(context).popUntil((route) {
                return route.isFirst;
              }),
            ),
            const _HistoryNavItem(icon: Icons.today_outlined, label: 'Today'),
            const _HistoryNavItem(
              icon: Icons.calendar_month_outlined,
              label: 'Week',
            ),
            const _HistoryNavItem(
              icon: Icons.emoji_events_outlined,
              label: 'Achievement',
            ),
            const _HistoryNavItem(
              icon: Icons.history,
              label: 'History',
              isSelected: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _HistoryNavItem extends StatelessWidget {
  const _HistoryNavItem({
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
    final color = isSelected
        ? HistoryScreen.accent
        : HistoryScreen.secondaryText;

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
