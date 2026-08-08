import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../data/models/workout_log.dart';
import '../../../data/services/level_service.dart';
import '../../../data/services/storage_service.dart';
import '../../history/screens/history_screen.dart';
import '../../navigation/services/today_navigation_service.dart';
import '../../navigation/widgets/phase2_bottom_navigation.dart';
import '../../share_cards/models/share_card_data.dart';
import '../../share_cards/widgets/share_card_preview.dart';
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
                final milestoneStates = _milestoneStates(
                  completedSessions: completedSessions,
                  xpTotal: xpTotal,
                  currentLevel: levelProgress.currentLevel,
                );
                final titleStates = _titleStates(
                  currentLevel: levelProgress.currentLevel,
                );
                final recentUnlocks = _recentUnlocks(
                  milestoneStates: milestoneStates,
                  titleStates: titleStates,
                );

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
                    SliverPadding(
                      padding: EdgeInsets.fromLTRB(20, 22, 20, 100),
                      sliver: SliverToBoxAdapter(
                        child: _RecognitionSections(
                          milestoneStates: milestoneStates,
                          titleStates: titleStates,
                          recentUnlocks: recentUnlocks,
                          storageService: storageService,
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
      bottomNavigationBar: Phase2BottomNavigation(
        selectedTab: Phase2Tab.achievement,
        onHomeSelected: () => Navigator.of(context).popUntil((route) {
          return route.isFirst;
        }),
        onTodaySelected: () => _openToday(context),
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

  Future<void> _openToday(BuildContext context) {
    return TodayNavigationService.openToday(
      context: context,
      storageService: storageService,
      replaceCurrentRoute: true,
    );
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

  List<_MilestoneState> _milestoneStates({
    required int completedSessions,
    required int xpTotal,
    required int currentLevel,
  }) {
    final firstFinishProgress = completedSessions.clamp(0, 1);
    final steadyWeekProgress = completedSessions.clamp(0, 3);
    final levelTwoProgress = xpTotal.clamp(0, LevelService.xpPerLevel);

    return [
      _MilestoneState(
        icon: Icons.check_circle_outline,
        title: 'First Finish',
        requirement: 'Complete 1 workout session.',
        progressLabel: '$firstFinishProgress / 1 session',
        stateLabel: completedSessions >= 1 ? 'Unlocked' : 'Locked',
        isUnlocked: completedSessions >= 1,
      ),
      _MilestoneState(
        icon: Icons.calendar_month_outlined,
        title: 'Steady Week',
        requirement: 'Complete 3 workout sessions on this device.',
        progressLabel: '$steadyWeekProgress / 3 sessions',
        stateLabel: completedSessions >= 3
            ? 'Unlocked'
            : completedSessions > 0
            ? 'In progress'
            : 'Locked',
        isUnlocked: completedSessions >= 3,
      ),
      _MilestoneState(
        icon: Icons.bolt,
        title: 'Level 2',
        requirement: 'Earn 100 Rep Score points by completing workouts.',
        progressLabel: '$levelTwoProgress / 100 XP',
        stateLabel: currentLevel >= 2
            ? 'Unlocked'
            : xpTotal > 0
            ? 'In progress'
            : 'Locked',
        isUnlocked: currentLevel >= 2,
      ),
    ];
  }

  List<_TitleState> _titleStates({required int currentLevel}) {
    return [
      _TitleState(
        title: 'First Rep Ready',
        requirement: 'Available at Level 1.',
        levelRequired: 1,
        isCurrent: currentLevel < 2,
        isUnlocked: currentLevel >= 1,
      ),
      _TitleState(
        title: 'Steady Starter',
        requirement: 'Unlock at Level 2.',
        levelRequired: 2,
        isCurrent: currentLevel >= 2 && currentLevel < 5,
        isUnlocked: currentLevel >= 2,
      ),
      _TitleState(
        title: 'Consistency Builder',
        requirement: 'Unlock at Level 5.',
        levelRequired: 5,
        isCurrent: currentLevel >= 5 && currentLevel < 10,
        isUnlocked: currentLevel >= 5,
      ),
      _TitleState(
        title: 'Flow Regular',
        requirement: 'Unlock at Level 10.',
        levelRequired: 10,
        isCurrent: currentLevel >= 10,
        isUnlocked: currentLevel >= 10,
      ),
    ];
  }

  List<_RecentUnlockState> _recentUnlocks({
    required List<_MilestoneState> milestoneStates,
    required List<_TitleState> titleStates,
  }) {
    final unlocks = <_RecentUnlockState>[];

    for (final milestone in milestoneStates.where(
      (state) => state.isUnlocked,
    )) {
      unlocks.add(
        _RecentUnlockState(
          icon: milestone.icon,
          title: milestone.title,
          detail: _recentUnlockDetailForMilestone(milestone.title),
          shareCard: ShareCardData(
            type: ShareCardType.level,
            title: milestone.title,
            message: 'Recognition unlocked.',
            detail: milestone.requirement,
          ),
        ),
      );
    }

    for (final titleState in titleStates.where(
      (state) => state.isUnlocked && state.levelRequired > 1,
    )) {
      unlocks.add(
        _RecentUnlockState(
          icon: Icons.workspace_premium_outlined,
          title: titleState.title,
          detail: 'A new local title is ready when you want to use it.',
          shareCard: ShareCardData(
            type: ShareCardType.level,
            title: titleState.title,
            message: 'New title unlocked.',
            detail: titleState.requirement,
          ),
        ),
      );
    }

    return unlocks.take(3).toList();
  }

  String _recentUnlockDetailForMilestone(String title) {
    switch (title) {
      case 'First Finish':
        return 'You finished your first local workout.';
      case 'Steady Week':
        return 'Three local sessions are part of your rhythm now.';
      case 'Level 2':
        return 'Your Rep Score moved you into the next level.';
    }

    return 'You earned this through local workout progress.';
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

class _MilestoneState {
  const _MilestoneState({
    required this.icon,
    required this.title,
    required this.requirement,
    required this.progressLabel,
    required this.stateLabel,
    required this.isUnlocked,
  });

  final IconData icon;
  final String title;
  final String requirement;
  final String progressLabel;
  final String stateLabel;
  final bool isUnlocked;
}

class _TitleState {
  const _TitleState({
    required this.title,
    required this.requirement,
    required this.levelRequired,
    required this.isCurrent,
    required this.isUnlocked,
  });

  final String title;
  final String requirement;
  final int levelRequired;
  final bool isCurrent;
  final bool isUnlocked;
}

class _RecognitionSections extends StatelessWidget {
  const _RecognitionSections({
    required this.milestoneStates,
    required this.titleStates,
    required this.recentUnlocks,
    required this.storageService,
  });

  final List<_MilestoneState> milestoneStates;
  final List<_TitleState> titleStates;
  final List<_RecentUnlockState> recentUnlocks;
  final StorageService storageService;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionLabel('MILESTONES'),
        const SizedBox(height: 10),
        for (final milestone in milestoneStates) ...[
          _MilestoneRow(milestone: milestone),
          const SizedBox(height: 10),
        ],
        const SizedBox(height: 12),
        const _SectionLabel('TITLE COLLECTION'),
        const SizedBox(height: 10),
        for (final title in titleStates) ...[
          _TitleRow(titleState: title),
          const SizedBox(height: 10),
        ],
        const SizedBox(height: 12),
        _RecentUnlocksSection(
          recentUnlocks: recentUnlocks,
          storageService: storageService,
        ),
      ],
    );
  }
}

class _RecentUnlockState {
  const _RecentUnlockState({
    required this.icon,
    required this.title,
    required this.detail,
    required this.shareCard,
  });

  final IconData icon;
  final String title;
  final String detail;
  final ShareCardData shareCard;
}

class _RecentUnlocksSection extends StatelessWidget {
  const _RecentUnlocksSection({
    required this.recentUnlocks,
    required this.storageService,
  });

  final List<_RecentUnlockState> recentUnlocks;
  final StorageService storageService;

  @override
  Widget build(BuildContext context) {
    final shareableUnlock = recentUnlocks.isEmpty ? null : recentUnlocks.first;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionLabel('RECENT UNLOCKS'),
        const SizedBox(height: 10),
        if (recentUnlocks.isEmpty)
          const _RecentUnlockEmptyState()
        else ...[
          for (final unlock in recentUnlocks) ...[
            _RecentUnlockRow(unlock: unlock),
            const SizedBox(height: 10),
          ],
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: shareableUnlock == null
                  ? null
                  : () => _showShareMoment(context, shareableUnlock.shareCard),
              icon: const Icon(Icons.ios_share_outlined),
              label: const Text('Share moment'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AchievementScreen.accent,
                side: const BorderSide(color: AchievementScreen.accent),
                minimumSize: const Size.fromHeight(48),
              ),
            ),
          ),
        ],
      ],
    );
  }

  void _showShareMoment(BuildContext context, ShareCardData card) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * 0.9,
      ),
      builder: (context) {
        return _AchievementSharePreviewSheet(
          card: card,
          storageService: storageService,
        );
      },
    );
  }
}

class _RecentUnlockEmptyState extends StatelessWidget {
  const _RecentUnlockEmptyState();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AchievementScreen.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AchievementScreen.border),
      ),
      child: const _SignalRowContent(
        icon: Icons.auto_awesome_outlined,
        title: 'Recognition is warming up',
        detail: 'Complete a workout to make your first recognition moment.',
        isActive: false,
      ),
    );
  }
}

class _RecentUnlockRow extends StatelessWidget {
  const _RecentUnlockRow({required this.unlock});

  final _RecentUnlockState unlock;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AchievementScreen.elevated,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AchievementScreen.border),
      ),
      child: _SignalRowContent(
        icon: unlock.icon,
        title: unlock.title,
        detail: unlock.detail,
        isActive: true,
      ),
    );
  }
}

class _AchievementSharePreviewSheet extends StatefulWidget {
  const _AchievementSharePreviewSheet({
    required this.card,
    required this.storageService,
  });

  final ShareCardData card;
  final StorageService storageService;

  @override
  State<_AchievementSharePreviewSheet> createState() {
    return _AchievementSharePreviewSheetState();
  }
}

class _AchievementSharePreviewSheetState
    extends State<_AchievementSharePreviewSheet> {
  bool hasGenerated = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.9,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            16,
            16,
            16,
            MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Share card preview',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    tooltip: 'Close',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ShareCardPreview(card: widget.card),
              const SizedBox(height: 12),
              Text(
                'Performance numbers are hidden by default.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    setState(() {
                      hasGenerated = true;
                    });
                    unawaited(widget.storageService.recordShareCardGenerated());
                  },
                  child: const Text('Generate'),
                ),
              ),
              if (hasGenerated) ...[
                const SizedBox(height: 12),
                Text(
                  widget.card.confirmationLabel,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _MilestoneRow extends StatelessWidget {
  const _MilestoneRow({required this.milestone});

  final _MilestoneState milestone;

  @override
  Widget build(BuildContext context) {
    final isActive =
        milestone.isUnlocked || milestone.stateLabel == 'In progress';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isActive
            ? AchievementScreen.elevated
            : AchievementScreen.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AchievementScreen.border),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: isActive
                  ? AchievementScreen.accentDark
                  : const Color(0xFF1A1D20),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              milestone.icon,
              color: isActive
                  ? AchievementScreen.accent
                  : AchievementScreen.mutedText,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        milestone.title,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AchievementScreen.primaryText,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    _StatePill(
                      label: milestone.stateLabel,
                      isActive: milestone.isUnlocked,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  milestone.requirement,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AchievementScreen.secondaryText,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  milestone.progressLabel,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isActive
                        ? AchievementScreen.accent
                        : AchievementScreen.mutedText,
                    fontWeight: FontWeight.w800,
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

class _TitleRow extends StatelessWidget {
  const _TitleRow({required this.titleState});

  final _TitleState titleState;

  @override
  Widget build(BuildContext context) {
    final stateLabel = titleState.isCurrent
        ? 'Current title'
        : titleState.isUnlocked
        ? 'Unlocked'
        : 'Locked';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: titleState.isUnlocked
            ? AchievementScreen.elevated
            : AchievementScreen.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: titleState.isCurrent
              ? AchievementScreen.accent
              : AchievementScreen.border,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: titleState.isUnlocked
                  ? AchievementScreen.accentDark
                  : const Color(0xFF1A1D20),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              titleState.isUnlocked
                  ? Icons.workspace_premium_outlined
                  : Icons.lock_outline,
              color: titleState.isUnlocked
                  ? AchievementScreen.accent
                  : AchievementScreen.mutedText,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        titleState.title,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AchievementScreen.primaryText,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    _StatePill(
                      label: stateLabel,
                      isActive: titleState.isUnlocked,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  titleState.requirement,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: titleState.isUnlocked
                        ? AchievementScreen.secondaryText
                        : AchievementScreen.mutedText,
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

class _StatePill extends StatelessWidget {
  const _StatePill({required this.label, required this.isActive});

  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isActive
            ? AchievementScreen.accentDark
            : const Color(0xFF1A1D20),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: isActive
              ? AchievementScreen.accent
              : AchievementScreen.secondaryText,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class _SignalRow extends StatelessWidget {
  const _SignalRow({
    required this.icon,
    required this.title,
    required this.detail,
  });

  final IconData icon;
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AchievementScreen.elevated,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AchievementScreen.border),
      ),
      child: _SignalRowContent(
        icon: icon,
        title: title,
        detail: detail,
        isActive: true,
      ),
    );
  }
}

class _SignalRowContent extends StatelessWidget {
  const _SignalRowContent({
    required this.icon,
    required this.title,
    required this.detail,
    required this.isActive,
  });

  final IconData icon;
  final String title;
  final String detail;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: isActive
                ? AchievementScreen.accentDark
                : const Color(0xFF1A1D20),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: isActive
                ? AchievementScreen.accent
                : AchievementScreen.mutedText,
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
                  color: isActive
                      ? AchievementScreen.secondaryText
                      : AchievementScreen.mutedText,
                  height: 1.25,
                ),
              ),
            ],
          ),
        ),
      ],
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
