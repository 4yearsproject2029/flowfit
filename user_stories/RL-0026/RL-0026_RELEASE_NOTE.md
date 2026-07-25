# RL-0026 Release Note

## Story

Story ID:
RL-0026

Story Name:
Read-Only History

Epic:
EP-14 Journey Separation

Status:
Done

## Release Summary

RL-0026 adds a dedicated read-only History screen for completed workout session review. Completed local workout rows are grouped into session-level entries, keeping History distinct from Week planning, planned Session Detail, Current Workout, and Workout Summary.

## User-Facing Changes

- Home History navigation now opens a History screen.
- Week History navigation now opens the same History screen.
- History shows completed sessions with summary counts and recent-period grouping.
- Multiple completed exercises from one daily session appear as one completed session.
- History excludes incomplete planned workouts.
- History rows remain read-only until completed Workout Detail ships in RL-0027.

## Technical Changes

- Added `lib/features/history/screens/history_screen.dart`.
- Wired Home and Week bottom navigation to History.
- Added focused widget tests for History navigation, completed-session grouping, read-only exclusions, and Week-to-History root return.
- Reused existing `WorkoutLog` and `StorageService` data with no Hive schema change.

## Verification

- `flutter analyze`: Passed.
- `flutter test test/widget_test.dart --plain-name 'opens read-only History from dashboard navigation' -r expanded`: Passed.
- `flutter test test/widget_test.dart --plain-name 'History groups completed exercise rows into one session' -r expanded`: Passed.
- `flutter test test/widget_test.dart --plain-name 'opens History from Week and returns to dashboard Home' -r expanded`: Passed.
- `git diff --check`: Passed.

## Known Limitations

- Completed Workout Detail remains deferred to RL-0027.
- Manual device QA was not run in this agent environment.

## Release Decision

Released.

## Next Recommended Story

RL-0027

Reason:
RL-0027 is now eligible because RL-0026 is Done and can add completed Workout Detail while preserving the read-only History boundary.

