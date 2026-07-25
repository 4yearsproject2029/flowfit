import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../data/models/workout_log.dart';
import '../../../data/services/level_service.dart';
import '../../../data/services/storage_service.dart';
import '../../history/screens/history_screen.dart';
import '../../navigation/widgets/phase2_bottom_navigation.dart';
import '../../week/screens/week_screen.dart';

class AchievementScreen extends StatelessWidget {
  AchievementScreen({super.key, StorageService? storageService})
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
        child: ValueListenableBuilder<Box<int>>(
          valueListenable: storageService.xpTotalListenable,
          builder: (context, _, child) {
            return ValueListenableBuilder<Box<WorkoutLog>>(
              valueListenable: storageService.workoutLogsListenable,
              builder: (context, _, child) {
                final xpTotal = storageService.getXpTotal();
                final levelProgress = LevelService().calculateProgress(xpTotal);
                final completedSessions = _completedSessionCount();

                return CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
                      sliver: SliverToBoxAdapter(
                        child: _AchievementHeader(
                          canPop: Navigator.of(context).canPop(),
                          onBack: () => Navigator.of(context).maybePop(),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
                      sliver: SliverToBoxAdapter(
                        child: _SummaryMetrics(
                          level: levelProgress.currentLevel,
                          xpTotal: xpTotal,
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
                      sliver: SliverToBoxAdapter(
                        child: _FeaturedProgressCard(
                          levelProgress: levelProgress,
                          title: _titleFor(levelProgress.currentLevel),
                          xpTotal: xpTotal,
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(20, 22, 20, 0),
                      sliver: SliverToBoxAdapter(
                        child: _GrowthSignalsSection(
                          completedSessions: completedSessions,
                          weeklyGoal: storageService.getWeeklyGoal(),
                        ),
                      ),
                    ),
                    const SliverPadding(
                      padding: EdgeInsets.fromLTRB(20, 22, 20, 100),
                      sliver: SliverToBoxAdapter(
                        child: _UpcomingRecognitionSection(),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: Phase2BottomNavigation(
        selectedTab: Phase2Tab.achievement,
        onHomeSelected: () => Navigator.of(context).popUntil((route) {
          return route.isFirst;
        }),
        onWeekSelected: () => _openWeek(context),
        onHistorySelected: () => _openHistory(context),
      ),
    );
  }

  int _completedSessionCount() {
    return storageService
        .getWorkoutLogs()
        .where((log) => log.isCompleted)
        .map((log) => log.date)
        .toSet()
        .length;
  }

  String _titleFor(int level) {
    if (level >= 10) {
      return 'Flow Regular';
    }
    if (level >= 5) {
      return 'Consistency Builder';
    }
    if (level >= 2) {
      return 'Steady Starter';
    }
    return 'First Rep Ready';
  }

  void _openWeek(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (context) {
          return WeekScreen(storageService: storageService);
        },
      ),
    );
  }

  void _openHistory(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (context) {
          return HistoryScreen(storageService: storageService);
        },
      ),
    );
  }
}

class _AchievementHeader extends StatelessWidget {
  const _AchievementHeader({required this.canPop, required this.onBack});

  final bool canPop;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (canPop)
          IconButton(
            onPressed: onBack,
            icon: const Icon(
              Icons.arrow_back,
              color: AchievementScreen.primaryText,
            ),
            tooltip: 'Back',
          )
        else
          const SizedBox(width: 4),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            'Achievements',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: AchievementScreen.primaryText,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        IconButton(
          onPressed: null,
          icon: const Icon(Icons.settings_outlined),
          color: AchievementScreen.secondaryText,
          disabledColor: AchievementScreen.secondaryText,
          tooltip: 'Achievement settings',
        ),
      ],
    );
  }
}

class _SummaryMetrics extends StatelessWidget {
  const _SummaryMetrics({required this.level, required this.xpTotal});

  final int level;
  final int xpTotal;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _MetricCard(
            label: 'CURRENT LEVEL',
            value: 'Level $level',
            icon: Icons.emoji_events_outlined,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _MetricCard(
            label: 'REP SCORE',
            value: '$xpTotal XP',
            icon: Icons.bolt,
          ),
        ),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  final String label;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 96),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AchievementScreen.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AchievementScreen.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AchievementScreen.accent, size: 18),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AchievementScreen.secondaryText,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AchievementScreen.primaryText,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}

class _FeaturedProgressCard extends StatelessWidget {
  const _FeaturedProgressCard({
    required this.levelProgress,
    required this.title,
    required this.xpTotal,
  });

  final LevelProgress levelProgress;
  final String title;
  final int xpTotal;

  @override
  Widget build(BuildContext context) {
    final remainingXp =
        levelProgress.xpPerLevel - levelProgress.xpIntoCurrentLevel;
    final hasXp = xpTotal > 0;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AchievementScreen.accentDark,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF0D6E61)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: AchievementScreen.accent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'FEATURED',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(height: 22),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  color: const Color(0xFF0B5C52),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.local_fire_department_outlined,
                  color: AchievementScreen.accent,
                  size: 34,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AchievementScreen.primaryText,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      hasXp
                          ? 'You are building proof that showing up counts.'
                          : 'Start with one workout. Your first Rep Score points will appear here.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AchievementScreen.primaryText,
                        height: 1.25,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: levelProgress.progressValue,
              minHeight: 8,
              backgroundColor: const Color(0xFF062C28),
              valueColor: const AlwaysStoppedAnimation<Color>(
                AchievementScreen.accent,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(
                  levelProgress.progressLabel,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AchievementScreen.primaryText,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                '$remainingXp XP left',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AchievementScreen.primaryText,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GrowthSignalsSection extends StatelessWidget {
  const _GrowthSignalsSection({
    required this.completedSessions,
    required this.weeklyGoal,
  });

  final int completedSessions;
  final int? weeklyGoal;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionLabel('GROWTH SIGNALS'),
        const SizedBox(height: 10),
        _SignalRow(
          icon: Icons.check_circle_outline,
          title: 'Completed sessions',
          detail: completedSessions == 0
              ? 'Completion history will shape this hub after workouts are finished.'
              : '$completedSessions completed locally on this device.',
        ),
        const SizedBox(height: 10),
        _SignalRow(
          icon: Icons.calendar_month_outlined,
          title: 'Weekly rhythm',
          detail: weeklyGoal == null
              ? 'Choose a weekly goal to give your progress a rhythm.'
              : 'Your current target is $weeklyGoal workouts per week.',
        ),
      ],
    );
  }
}

class _UpcomingRecognitionSection extends StatelessWidget {
  const _UpcomingRecognitionSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _SectionLabel('UPCOMING RECOGNITION'),
        SizedBox(height: 10),
        _SignalRow(
          icon: Icons.workspace_premium_outlined,
          title: 'Milestones',
          detail: 'A small local milestone set arrives in RL-0028.',
          isMuted: true,
        ),
        SizedBox(height: 10),
        _SignalRow(
          icon: Icons.lock_outline,
          title: 'Private moments',
          detail: 'Future celebration moments arrive later, only by choice.',
          isMuted: true,
        ),
      ],
    );
  }
}

class _SignalRow extends StatelessWidget {
  const _SignalRow({
    required this.icon,
    required this.title,
    required this.detail,
    this.isMuted = false,
  });

  final IconData icon;
  final String title;
  final String detail;
  final bool isMuted;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isMuted ? AchievementScreen.surface : AchievementScreen.elevated,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AchievementScreen.border),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: isMuted
                  ? const Color(0xFF1A1D20)
                  : AchievementScreen.accentDark,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: isMuted
                  ? AchievementScreen.mutedText
                  : AchievementScreen.accent,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AchievementScreen.primaryText,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  detail,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isMuted
                        ? AchievementScreen.mutedText
                        : AchievementScreen.secondaryText,
                    height: 1.25,
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

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: AchievementScreen.secondaryText,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
