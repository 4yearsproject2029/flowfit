# Development Log

This document tracks the history of completed User Stories.

Rules:

* Append entries only.

---

## 2026-07-20

### RL-0034

Epic:

EP-12 Current Workout Structural Refactor

Status:

Done

Summary:

- Extracted Current Workout presentation widgets from `current_workout_screen.dart`.
- Kept `CurrentWorkoutScreen` as the route-level state, navigation, and storage owner.
- Reduced `current_workout_screen.dart` from 1,584 lines to 584 lines.
- Added focused widget-only tests for extracted active card, adjustment sheet, and rest timer overlay behavior.

Acceptance Criteria:

- Passed

Files Created:

- lib/features/current_workout/models/current_workout_rest_state.dart
- lib/features/current_workout/widgets/active_exercise_card.dart
- lib/features/current_workout/widgets/adjust_session_sheet.dart
- lib/features/current_workout/widgets/control_actions_row.dart
- lib/features/current_workout/widgets/current_workout_header.dart
- lib/features/current_workout/widgets/current_workout_palette.dart
- lib/features/current_workout/widgets/current_workout_progress_widgets.dart
- lib/features/current_workout/widgets/current_workout_state_cards.dart
- lib/features/current_workout/widgets/rest_timer_overlay.dart
- test/current_workout_widgets_test.dart
- user_stories/RL-0034/RL-0034_INTERPRETATION.md
- user_stories/RL-0034/RL-0034_IMPLEMENTATION_NOTES.md
- user_stories/RL-0034/RL-0034_CODE_REVIEW.md
- user_stories/RL-0034/RL-0034_QA_REPORT.md
- user_stories/RL-0034/RL-0034_RELEASE_NOTE.md

Files Modified:

- docs/ARCHITECTURE.md
- docs/EPIC_USER_STORY_TASKS.md
- docs/PROJECT_CONTEXT.md
- docs/SPRINT_PLAN.md
- lib/features/current_workout/screens/current_workout_screen.dart
- user_stories/RL-0034/RL-0034_TASKS.md
- user_stories/RL-0034/RL-0034_SPRINT_PLAN.md

Packages Added:

- None

Manual Steps:

- None

Commit References:

- refactor(RL-0034): extract Current Workout presentation widgets

QA Result:

Passed

User Approval:

Not Required

Known Limitations:

- Existing Hive-backed broad widget-test harness can stall; focused widget-only tests were added and passed.

Lessons Learned:

- Keeping state transitions in the route-level screen while extracting presentation widgets reduced regression risk and gave future workout-flow stories clearer file boundaries.

Next Recommended Story:

RL-0024

---

### RL-0035

Epic:

EP-06 Weekly Goals

Status:

Done

Summary:

- Fixed Weekly Progress overcounting when one daily workout session contains multiple completed exercises.
- Updated `WeeklyGoalService` to count unique completed session dates in the current Monday-to-Sunday week.
- Added pure service and storage-backed regressions for a six-exercise completed daily session.

Acceptance Criteria:

- Passed

Files Created:

- user_stories/RL-0035/RL-0035_TASKS.md
- user_stories/RL-0035/RL-0035_SPRINT_PLAN.md
- user_stories/RL-0035/RL-0035_INTERPRETATION.md
- user_stories/RL-0035/RL-0035_IMPLEMENTATION_NOTES.md
- user_stories/RL-0035/RL-0035_CODE_REVIEW.md
- user_stories/RL-0035/RL-0035_QA_REPORT.md
- user_stories/RL-0035/RL-0035_RELEASE_NOTE.md

Files Modified:

- docs/EPIC_USER_STORY_TASKS.md
- docs/SPRINT_PLAN.md
- docs/DEVELOPMENT_LOG.md
- lib/data/services/weekly_goal_service.dart
- test/weekly_goal_service_test.dart
- test/storage_service_test.dart

Packages Added:

- None

Manual Steps:

- Confirm after completing a six-exercise daily session with weekly goal 5, Dashboard Weekly Progress shows `1 / 5 workouts complete`.

Commit References:

- Not committed

QA Result:

Passed

User Approval:

Required by bug report and workflow instruction

Known Limitations:

- Date-based de-duplication assumes the current one-daily-session-per-date product constraint.

Lessons Learned:

- Weekly goal progress must use session semantics after Workout Session Composition introduced multiple exercise rows per daily session.

Next Recommended Story:

RL-0024
