# RL-0008 Release Note

## Document Metadata

Story ID:

```text
RL-0008
```

Epic:

```text
EP-06 Weekly Goals
```

Release Date:

```text
2026-06-30
```

Release Manager:

```text
Release Manager Agent
```

Status:

```text
Released
```

---

## Release Summary

RL-0008 released MVP weekly goal progress. The home screen now displays the selected weekly goal, completed current-week workouts, progress toward the goal, and a goal-complete state.

---

## Scope Released

* Added weekly goal progress calculation from persisted local data.
* Counted completed workout logs within the current Monday-Sunday week.
* Added home-screen weekly goal summary.
* Added goal completion recognition when completed workouts meet or exceed the selected target.
* Preserved progress after restart by deriving from persisted weekly goal and workout completion state.
* Added automated coverage for weekly boundaries, over-goal behavior, restart persistence, and visible home-screen progress.

---

## Acceptance Criteria Result

| AC ID | Acceptance Criteria | Result |
| ----- | ------------------- | ------ |
| AC-01 | The app displays the selected weekly goal. | Passed |
| AC-02 | The app displays completed workouts for the current week. | Passed |
| AC-03 | Progress updates immediately. | Passed |
| AC-04 | Goal completion is recognized when the target is reached. | Passed |
| AC-05 | Goal progress persists after app restart. | Passed |

---

## Verification

Commands:

```bash
dart format lib/data/services/weekly_goal_service.dart lib/data/services/storage_service.dart lib/features/home/screens/home_screen.dart test/weekly_goal_service_test.dart test/storage_service_test.dart test/widget_test.dart
flutter test test/weekly_goal_service_test.dart -r expanded
flutter test test/storage_service_test.dart -r expanded
flutter test test/widget_test.dart -r expanded
flutter analyze
flutter test -r expanded
```

Results:

* Dart format passed.
* Weekly-goal service test slice passed with 3 passing tests.
* Storage-service test slice passed with 5 passing tests.
* Widget test slice passed with 4 passing tests and 2 documented skipped tests.
* `flutter analyze` passed with no issues.
* Full test suite passed with 15 passing tests and 2 documented skipped tests.

---

## Files Created

* `lib/data/services/weekly_goal_service.dart`
* `test/weekly_goal_service_test.dart`
* `user_stories/RL-0008/RL-0008_SPRINT_PLAN.md`
* `user_stories/RL-0008/RL-0008_INTERPRETATION.md`
* `user_stories/RL-0008/RL-0008_UX_SPEC.md`
* `user_stories/RL-0008/RL-0008_IMPLEMENTATION_NOTES.md`
* `user_stories/RL-0008/RL-0008_CODE_REVIEW.md`
* `user_stories/RL-0008/RL-0008_QA_REPORT.md`
* `user_stories/RL-0008/RL-0008_RELEASE_NOTE.md`

---

## Files Modified

* `docs/EPIC_USER_STORY_TASKS.md`
* `docs/SPRINT_PLAN.md`
* `DEVELOPMENT_LOG.md`
* `lib/data/services/storage_service.dart`
* `lib/features/home/screens/home_screen.dart`
* `test/storage_service_test.dart`
* `test/widget_test.dart`
* `user_stories/RL-0008/RL-0008_TASKS.md`

---

## Packages Added

```text
None
```

---

## Database / Migration Notes

```text
No database migration required. Weekly goal progress is derived from the persisted weekly goal and workout logs.
```

---

## Known Limitations

* Existing callback-write widget tests remain skipped for the documented widget-test infrastructure reason.
* Streaks, consistency recovery, weekly history, share cards, badges, and weekly goal rewards remain future-story scope.

---

## Final Decision

```text
Released
```

Decision rationale:

* Code Review approved RL-0008.
* QA passed RL-0008.
* `flutter analyze` passed.
* Full automated test suite passed.
* No story-level release blockers remain.

---

## Agent Handoff

Current Agent:

```text
Release Manager
```

Completed Output:

```text
user_stories/RL-0008/RL-0008_RELEASE_NOTE.md
```

Next Agent:

```text
Coordinator
```

Next Prompt:

```text
/Users/jounghwapak/Developer/AI_Agents/prompts/create_sprint_plan.md
```

Expected Output:

```text
Coordinator story selection and sprint plan for the next eligible story.
```
