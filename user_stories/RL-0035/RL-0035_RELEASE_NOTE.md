# RL-0035 Release Note

## Story

RL-0035 - Weekly Session Progress Bug Fix

## Status

Done

## Summary

Fixed a Weekly Progress bug where a completed daily workout session with multiple exercises could count each completed exercise as a separate workout.

Weekly Progress now counts unique completed daily sessions for the active Monday-to-Sunday week. A session with six completed exercises now contributes one completed workout session.

## User Impact

Users see accurate weekly goal progress after completing multi-exercise daily sessions.

Example:

```text
Weekly goal: 5 workout sessions
Completed daily session: 6 exercises
Weekly Progress: 1 / 5 workouts complete
```

## Verification

* `flutter test test/weekly_goal_service_test.dart -r expanded` passed.
* `flutter test test/storage_service_test.dart --plain-name "weekly goal progress counts one completed daily session once" -r expanded` passed.
* `flutter analyze` passed.

## Release Decision

Released.
