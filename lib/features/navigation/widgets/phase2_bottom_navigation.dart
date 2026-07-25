import 'package:flutter/material.dart';

enum Phase2Tab { home, week, achievement, history }

class Phase2BottomNavigation extends StatelessWidget {
  const Phase2BottomNavigation({
    super.key,
    required this.selectedTab,
    this.onHomeSelected,
    this.onWeekSelected,
    this.onAchievementSelected,
    this.onHistorySelected,
  });

  final Phase2Tab selectedTab;
  final VoidCallback? onHomeSelected;
  final VoidCallback? onWeekSelected;
  final VoidCallback? onAchievementSelected;
  final VoidCallback? onHistorySelected;

  static const surface = Color(0xFF101214);
  static const border = Color(0xFF252A2E);
  static const accent = Color(0xFF18F7D3);
  static const secondaryText = Color(0xFFA8AFB7);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: surface,
        border: Border(top: BorderSide(color: border)),
      ),
      padding: const EdgeInsets.fromLTRB(8, 7, 8, 8),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            _Phase2NavItem(
              icon: Icons.home_outlined,
              selectedIcon: Icons.home,
              label: 'Home',
              isSelected: selectedTab == Phase2Tab.home,
              onTap: selectedTab == Phase2Tab.home ? null : onHomeSelected,
            ),
            const _Phase2NavItem(icon: Icons.today_outlined, label: 'Today'),
            _Phase2NavItem(
              icon: Icons.calendar_month_outlined,
              selectedIcon: Icons.calendar_month,
              label: 'Week',
              isSelected: selectedTab == Phase2Tab.week,
              onTap: selectedTab == Phase2Tab.week ? null : onWeekSelected,
            ),
            _Phase2NavItem(
              icon: Icons.emoji_events_outlined,
              selectedIcon: Icons.emoji_events,
              label: 'Achievement',
              isSelected: selectedTab == Phase2Tab.achievement,
              onTap: selectedTab == Phase2Tab.achievement
                  ? null
                  : onAchievementSelected,
            ),
            _Phase2NavItem(
              icon: Icons.history,
              label: 'History',
              isSelected: selectedTab == Phase2Tab.history,
              onTap: selectedTab == Phase2Tab.history
                  ? null
                  : onHistorySelected,
            ),
          ],
        ),
      ),
    );
  }
}

class _Phase2NavItem extends StatelessWidget {
  const _Phase2NavItem({
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
        ? Phase2BottomNavigation.accent
        : Phase2BottomNavigation.secondaryText;

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
