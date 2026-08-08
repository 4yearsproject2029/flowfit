# RL-0037 Release Note

## Story

RL-0037 Today Navigation To Current Workout Bug Fix

## Release Status

Done

## Summary

The visible Today bottom navigation item is now accessible. From Home, Week, Achievement, and History, tapping Today routes users into today's Current Workout when a runnable local workout exists, returns to the active rest/workout context when one exists, and safely falls back to Home when no runnable workout is planned.

## Files Changed

- `lib/features/navigation/widgets/phase2_bottom_navigation.dart`
- `lib/features/navigation/services/today_navigation_service.dart`
- `lib/features/home/screens/home_screen.dart`
- `lib/features/week/screens/week_screen.dart`
- `lib/features/history/screens/history_screen.dart`
- `lib/features/achievement/screens/achievement_screen.dart`
- `test/widget_test.dart`
- `docs/EPIC_USER_STORY_TASKS.md`
- `docs/SPRINT_PLAN.md`
- `docs/DEVELOPMENT_LOG.md`
- `user_stories/RL-0037/RL-0037_TASKS.md`
- `user_stories/RL-0037/RL-0037_IMPLEMENTATION_NOTES.md`
- `user_stories/RL-0037/RL-0037_CODE_REVIEW.md`
- `user_stories/RL-0037/RL-0037_QA_REPORT.md`

## Verification

- `flutter test test/widget_test.dart --plain-name 'Today nav' -r expanded`
- `flutter analyze`
- `git diff --check`

## Release Decision

Released.

## Next Recommended Story

RL-0031
