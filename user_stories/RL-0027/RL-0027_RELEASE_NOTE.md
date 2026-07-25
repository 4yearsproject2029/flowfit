# RL-0027 Release Note

## Story

Story ID:
RL-0027

Story Name:
Completed Workout Detail

Epic:
EP-14 Journey Separation

Status:
Done

## Release Summary

RL-0027 adds completed Workout Detail from History. Users can open a completed session and review exercises, sets, reps, weight, notes, date, and local summary fields without entering planning, Current Workout, or Workout Summary behavior.

## User-Facing Changes

- History completed session rows now open Workout Detail.
- Completed Workout Detail displays session title, completed date, movement list, set count, and volume where available.
- Completed detail rows show exercise category, sets, reps, weight, and notes.
- Back navigation returns to History.
- Completed detail is clearly read-only.

## Technical Changes

- Added `lib/features/workout_detail/screens/completed_workout_detail_screen.dart`.
- Wired `HistoryScreen` rows to completed Workout Detail.
- Added focused widget tests for completed detail, read-only exclusions, and planned Session Detail regression.
- Reused existing `WorkoutLog` rows and session titles with no Hive schema change.

## Verification

- `flutter analyze`: Passed.
- `flutter test test/widget_test.dart --plain-name 'opens completed Workout Detail from History as read-only review' -r expanded`: Passed.
- `flutter test test/widget_test.dart --plain-name 'planned Session Detail still starts Current Workout after completed detail release' -r expanded`: Passed.
- `flutter test test/widget_test.dart --plain-name 'opens read-only History from dashboard navigation' -r expanded`: Passed.
- `flutter test test/widget_test.dart --plain-name 'History groups completed exercise rows into one session' -r expanded`: Passed.
- `git diff --check`: Passed.

## Known Limitations

- Manual device QA was not run in this agent environment.
- Completed history editing remains out of scope.

## Release Decision

Released.

## Next Recommended Story

RL-0019

Reason:
RL-0019 is the next eligible Phase 2 Journey Separation story and can begin the Achievement hub foundation using existing local XP and level data.

