# RL-0027 Interpretation

## Story

As a user opening a completed workout, I want Workout Detail to show what I did without acting like Summary or planning, so that history review remains read-only.

## Acceptance Criteria Interpretation

1. Completed Workout Detail must use `design/approved/08_workout_detail.png` only for completed History detail in this story.
2. The screen must display completed record fields such as exercises, sets, reps, weight, notes, and date where locally available.
3. The screen must exclude Start Workout, Start Today, celebration animation, reward granting, and summary-only sharing prompts.
4. The screen must not modify completed history records.
5. Navigation must return to History and then Dashboard predictably.
6. The screen must not reopen Workout Summary.
7. Planned Session Detail from RL-0025 remains the only detail mode that can start Current Workout.

## Implementation Guidance

- Add a completed detail screen under `lib/features/workout_detail/screens/`.
- Wire RL-0026 History session rows to push the completed detail screen.
- Pass the completed session title, date label, and completed workout logs from History.
- Keep the completed detail widget separate from `PlannedSessionDetailScreen` because planned detail includes start behavior that completed detail must not inherit.
- Reuse existing `WorkoutLog` data and helper formatting where practical.
- Do not add Hive fields, migrations, or new storage services.

## Exclusions

- No edits, deletes, starts, rest controls, reward grants, share card generation, or Workout Summary navigation.
- No changes to weekly progress, XP, levels, or summary reward behavior.
- No backend, login, cloud sync, external assets, or analytics.

## Suggested Verification

- `flutter test test/widget_test.dart --plain-name 'opens completed Workout Detail from History as read-only review' -r expanded`
- `flutter test test/widget_test.dart --plain-name 'planned Session Detail still starts Current Workout after completed detail release' -r expanded`
- `flutter analyze`
- `git diff --check`

## Agent Handoff

Current Agent:
User Story Interpreter

Next Agent:
Code Writer

Expected Output:
user_stories/RL-0027/RL-0027_IMPLEMENTATION_NOTES.md

