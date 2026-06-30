# RL-0008 Implementation Notes

## Document Metadata

Story ID:

```text
RL-0008
```

Epic:

```text
EP-06 Weekly Goals
```

Created Date:

```text
2026-06-30
```

Created By:

```text
Code Writer Agent
```

Status:

```text
Ready for Code Review
```

---

## Implementation Summary

RL-0008 adds MVP weekly goal progress on top of the onboarding weekly goal and persisted workout completion behavior. The home screen now displays selected weekly goal progress, completed current-week workouts, and a target-reached state.

---

## Changes Made

* Added `WeeklyGoalService` and `WeeklyGoalProgress` for weekly goal calculation.
* Defined current week as Monday through Sunday, matching the existing weekly calendar.
* Added all-workout-log retrieval to `StorageService`.
* Added a home-screen weekly goal summary below the level and XP summary.
* Updated widget coverage for the visible weekly goal summary.
* Added unit coverage for weekly goal calculation, week boundaries, over-goal display, and progress capping.
* Added storage regression coverage that weekly goal progress persists after Hive restart.

---

## Files Added

* `lib/data/services/weekly_goal_service.dart`
* `test/weekly_goal_service_test.dart`
* `user_stories/RL-0008/RL-0008_IMPLEMENTATION_NOTES.md`

---

## Files Modified

* `lib/data/services/storage_service.dart`
* `lib/features/home/screens/home_screen.dart`
* `test/storage_service_test.dart`
* `test/widget_test.dart`
* `user_stories/RL-0008/RL-0008_TASKS.md`
* `docs/SPRINT_PLAN.md`
* `docs/EPIC_USER_STORY_TASKS.md`
* `user_stories/RL-0008/RL-0008_SPRINT_PLAN.md`

---

## Weekly Goal Rules Implemented

| Rule | Implementation |
| ---- | -------------- |
| Goal source | Existing persisted weekly goal from onboarding. |
| Week start | Monday. |
| Week end | Sunday. |
| Counted workouts | Completed workout logs in the current Monday-Sunday week. |
| Completion threshold | Complete when completed count is greater than or equal to selected goal. |
| Over-goal behavior | Display count over goal while capping progress indicator at 100%. |
| Persistence | Derived from persisted weekly goal and workout logs. |

---

## Verification

Commands:

```bash
dart format lib/data/services/weekly_goal_service.dart lib/data/services/storage_service.dart lib/features/home/screens/home_screen.dart test/weekly_goal_service_test.dart test/storage_service_test.dart test/widget_test.dart
flutter test test/weekly_goal_service_test.dart -r expanded
flutter test test/storage_service_test.dart -r expanded
flutter test test/widget_test.dart -r expanded
```

Results:

* `dart format` passed after rerunning outside the sandbox because Flutter SDK cache access was blocked by `/Users/jounghwapak/flutter/bin/cache/engine.stamp`.
* `flutter test test/weekly_goal_service_test.dart -r expanded` passed with 3 passing tests.
* `flutter test test/storage_service_test.dart -r expanded` passed with 5 passing tests.
* `flutter test test/widget_test.dart -r expanded` passed with 4 passing tests and 2 documented skipped tests.

---

## Scope Notes

No streaks, consistency recovery, new XP awards, badges, share cards, weekly history, edit-goal flow, backend, login, cloud sync, analytics SDK, social graph, public ranking, package rename, bundle identifier change, Android namespace change, or generated project rename was added.

---

## Agent Handoff

Current Agent:

```text
Code Writer
```

Completed Output:

```text
user_stories/RL-0008/RL-0008_IMPLEMENTATION_NOTES.md
```

Next Agent:

```text
Code Reviewer
```

Next Prompt:

```text
/Users/jounghwapak/Developer/AI_Agents/prompts/code_reviewer.md
```

Required Input Files:

* docs/PRODUCT_BRIEF.md
* docs/PROJECT_CONTEXT.md
* docs/ARCHITECTURE.md
* docs/EPIC_USER_STORY_TASKS.md
* docs/SPRINT_PLAN.md
* user_stories/RL-0008/RL-0008_TASKS.md
* user_stories/RL-0008/RL-0008_SPRINT_PLAN.md
* user_stories/RL-0008/RL-0008_INTERPRETATION.md
* user_stories/RL-0008/RL-0008_UX_SPEC.md
* user_stories/RL-0008/RL-0008_IMPLEMENTATION_NOTES.md

Expected Output:

```text
user_stories/RL-0008/RL-0008_CODE_REVIEW.md
```
