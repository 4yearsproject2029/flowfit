# RL-0035 Implementation Notes

## Summary

Updated Weekly Progress so completed daily sessions are counted once per date instead of once per completed exercise row.

## Files Changed

* `lib/data/services/weekly_goal_service.dart`
* `test/weekly_goal_service_test.dart`
* `test/storage_service_test.dart`

## Implementation Details

`WeeklyGoalService.calculateProgress` now filters completed logs inside the active Monday-to-Sunday week and adds their normalized date to a set. The resulting completed workout count is the number of unique completed session dates.

This preserves:

* Existing Monday-to-Sunday week boundaries.
* Existing `WeeklyGoalProgress` labels and progress-value behavior.
* Existing Hive `WorkoutLog` schema.
* Existing Home Dashboard and Workout Summary consumers.

## Verification

```text
dart format lib/data/services/weekly_goal_service.dart test/weekly_goal_service_test.dart test/storage_service_test.dart
flutter test test/weekly_goal_service_test.dart -r expanded
flutter test test/storage_service_test.dart --plain-name "weekly goal progress counts one completed daily session once" -r expanded
flutter analyze
```

All commands passed.
