# RL-0037 Implementation Notes

## Summary

Implemented the Today bottom-navigation hotfix as a shared route helper instead of a new screen or router rewrite.

## Files Changed

- `lib/features/navigation/widgets/phase2_bottom_navigation.dart`
- `lib/features/navigation/services/today_navigation_service.dart`
- `lib/features/home/screens/home_screen.dart`
- `lib/features/week/screens/week_screen.dart`
- `lib/features/history/screens/history_screen.dart`
- `lib/features/achievement/screens/achievement_screen.dart`
- `test/widget_test.dart`

## Implementation Details

- Added an `onTodaySelected` callback to `Phase2BottomNavigation`.
- Created `TodayNavigationService.openToday` to centralize Today routing behavior.
- Wired Home, Week, Achievement, and History to the shared Today routing helper.
- When an active rest timer exists, Today opens `CurrentWorkoutScreen` with the active rest session logs and label.
- When today's local workout rows include at least one incomplete row, Today opens `CurrentWorkoutScreen` for today's session.
- When no runnable workout exists for today, Today falls back to the Home route instead of opening an empty Current Workout state.
- Secondary tabs use route replacement for Today so the replaced tab does not sit between Current Workout and Home.

## Scope Kept Out

- No standalone Today screen.
- No persisted data model changes.
- No external routing package or broad navigation rewrite.
- No changes to History detail, Achievement content, workout planning, XP, share cards, or sync behavior.

## Verification

- `dart format lib/features/navigation/widgets/phase2_bottom_navigation.dart lib/features/navigation/services/today_navigation_service.dart lib/features/home/screens/home_screen.dart lib/features/week/screens/week_screen.dart lib/features/history/screens/history_screen.dart lib/features/achievement/screens/achievement_screen.dart test/widget_test.dart`
- `flutter test test/widget_test.dart --plain-name 'Today nav' -r expanded`
- `flutter analyze`
- `git diff --check`

Result:
Passed
