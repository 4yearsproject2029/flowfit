# RL-0026 Interpretation

## Story

As a user reviewing completed sessions, I want History to show completed workouts without editing or celebration states, so that review feels clear and safe.

## Acceptance Criteria Interpretation

1. History must use `design/approved/07_history.png` as layout direction while staying compatible with the current Material/Flutter implementation.
2. History must read existing local `WorkoutLog` records and include only completed records.
3. Completed records should be grouped by recent periods where practical.
4. Multiple completed exercise rows from the same date should render as one completed session row.
5. History must be read-only.
6. History must exclude planning edits, Start Workout, rest timer controls, Current Workout controls, and Workout Summary celebration behavior.
7. History may expose a future detail affordance, but completed Workout Detail implementation remains deferred to RL-0027.
8. Dashboard and Week may link to History, but must not duplicate History content as their own primary sections.
9. QA must verify read-only behavior and clean navigation.

## Implementation Guidance

- Add a new `HistoryScreen` under `lib/features/history/screens/`.
- Reuse existing `StorageService` and `WorkoutLog` data instead of introducing a new persistence model.
- Build session rows by grouping completed logs by `date`.
- Sort sessions by newest date first, then latest created time within that date.
- Display session title through `StorageService.getWorkoutSessionTitle(date)`.
- Keep row taps disabled or non-navigating until RL-0027.
- Wire Home and Week bottom navigation History items to push `HistoryScreen`.
- Preserve existing Home and Week content boundaries.

## Exclusions

- No Hive adapter change.
- No schema migration.
- No editing completed records.
- No completed detail screen.
- No Summary reopening.
- No sharing or rewards changes.
- No backend, login, cloud sync, or analytics.

## Suggested Verification

- `flutter test test/widget_test.dart --plain-name "opens read-only History from dashboard navigation" -r expanded`
- `flutter test test/widget_test.dart --plain-name "History groups completed exercise rows into one session" -r expanded`
- `flutter analyze`
- `git diff --check`

## Agent Handoff

Current Agent:
User Story Interpreter

Next Agent:
Code Writer

Expected Output:
user_stories/RL-0026/RL-0026_IMPLEMENTATION_NOTES.md

