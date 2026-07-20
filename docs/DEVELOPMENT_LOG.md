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

### RL-0024

Epic:

EP-13 Workout Summary Private Details And Sharing

Status:

Done

Summary:

- Added private local session details to Workout Summary, including exercises, sets, volume when derivable, weekly goal progress, and moment context.
- Added optional user-initiated share-card access from Summary while preserving existing privacy defaults.
- Added Plan Tomorrow routing to the planning flow and kept Back to Dashboard as a clear Summary exit.
- Preserved Summary/History separation by avoiding any History route that reopens the celebration Summary state.

Acceptance Criteria:

- Passed

Files Created:

- user_stories/RL-0024/RL-0024_SPRINT_PLAN.md
- user_stories/RL-0024/RL-0024_UX_SPEC.md
- user_stories/RL-0024/RL-0024_INTERPRETATION.md
- user_stories/RL-0024/RL-0024_IMPLEMENTATION_NOTES.md
- user_stories/RL-0024/RL-0024_CODE_REVIEW.md
- user_stories/RL-0024/RL-0024_QA_REPORT.md
- user_stories/RL-0024/RL-0024_RELEASE_NOTE.md

Files Modified:

- docs/EPIC_USER_STORY_TASKS.md
- docs/SPRINT_PLAN.md
- docs/DEVELOPMENT_LOG.md
- user_stories/RL-0024/RL-0024_TASKS.md
- lib/features/workout_summary/screens/workout_summary_screen.dart
- test/widget_test.dart

Packages Added:

- None

Manual Steps:

- Complete a Current Workout and confirm Workout Summary shows private session details.
- Tap a share-card action and confirm preview opens only by explicit user action.
- Confirm performance metrics remain hidden unless existing privacy controls opt them in.
- Tap Plan Tomorrow and confirm the planning flow opens for the next day.
- Confirm History does not reopen Workout Summary.

Commit References:

- Not committed

QA Result:

Passed

User Approval:

Approved by explicit user workflow instruction to continue until release is complete on 2026-07-20.

Known Limitations:

- None

Lessons Learned:

- Reusing the existing share-card section/service kept privacy behavior aligned and avoided parallel sharing logic.

Next Recommended Story:

RL-0032

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

---

### RL-0032

Epic:

EP-14 Cross-Screen Rest Timer Continuity

Status:

Done

Summary:

- Added runtime-local active rest timer continuity for the active workout flow.
- Added a compact Dashboard recovery affordance that shows remaining/rest-complete state and a Return action.
- Preserved the existing RL-0018 Rest Timer overlay as the full-control timer surface.
- Added cleanup so the compact affordance disappears after rest advances or the active workout flow no longer has rest state.

Acceptance Criteria:

- Passed

Files Created:

- lib/features/current_workout/services/rest_timer_continuity_service.dart
- lib/features/current_workout/widgets/active_rest_timer_affordance.dart
- user_stories/RL-0032/RL-0032_SPRINT_PLAN.md
- user_stories/RL-0032/RL-0032_UX_SPEC.md
- user_stories/RL-0032/RL-0032_INTERPRETATION.md
- user_stories/RL-0032/RL-0032_IMPLEMENTATION_NOTES.md
- user_stories/RL-0032/RL-0032_CODE_REVIEW.md
- user_stories/RL-0032/RL-0032_QA_REPORT.md
- user_stories/RL-0032/RL-0032_RELEASE_NOTE.md

Files Modified:

- docs/EPIC_USER_STORY_TASKS.md
- docs/SPRINT_PLAN.md
- docs/DEVELOPMENT_LOG.md
- user_stories/RL-0032/RL-0032_TASKS.md
- lib/features/current_workout/screens/current_workout_screen.dart
- lib/features/home/screens/home_screen.dart
- test/widget_test.dart

Packages Added:

- None

Manual Steps:

- Start Current Workout with at least two exercises.
- Complete a set to enter rest state.
- Navigate back to Dashboard and confirm the compact Rest timer affordance appears.
- Tap Return and confirm Current Workout opens at the active rest state.
- Continue the workout and confirm the Dashboard affordance clears.

Commit References:

- Not committed

QA Result:

Passed

User Approval:

Approved by explicit user workflow instruction to continue until release is complete on 2026-07-20.

Known Limitations:

- Week, History, and Achievement route validation is deferred because those named surfaces are not separate navigable screens in the current app.
- App restart persistence, background timers, cross-device sync, backend, login, and cloud sync remain out of scope.

Lessons Learned:

- A runtime-local service was sufficient for in-app rest continuity and avoided a broad state-management rewrite.
- Timer tick listeners need a newly published value so compact countdown UI reliably rebuilds.

Next Recommended Story:

RL-0017
