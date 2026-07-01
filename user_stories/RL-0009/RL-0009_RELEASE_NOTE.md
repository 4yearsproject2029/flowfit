# RL-0009 Release Note

## Document Metadata

Story ID:

```text
RL-0009
```

Epic:

```text
EP-06 Consistency Recovery
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

RL-0009 released MVP consistency recovery. RepLog now detects return-after-missed-week behavior locally, preserves XP and level progress, treats planned rest as neutral, and shows encouraging home-screen language when a user returns.

---

## Scope Released

* Added local consistency recovery calculation for missed Monday-Sunday workout weeks.
* Added primitive Hive boxes for planned rest dates and local recovery metric dates.
* Added home-screen recovery encouragement: `Welcome back`, preserved-progress copy, and `No XP lost. No level lost.`
* Added selected-date planned rest state and neutral planned-rest messaging.
* Preserved XP totals and level progress when missed-week behavior is detected.
* Added regression coverage for recovery detection, planned rest, XP and level preservation, stale metric cleanup, and visible recovery UI.

---

## Acceptance Criteria Result

| AC ID | Acceptance Criteria | Result |
| ----- | ------------------- | ------ |
| AC-01 | Missing a workout week does not remove XP. | Passed |
| AC-02 | Missing a workout week does not reduce levels. | Passed |
| AC-03 | Returning after a missed week is detectable for metrics. | Passed |
| AC-04 | The app displays encouraging language after returning. | Passed |
| AC-05 | Planned rest days do not count as failures. | Passed |

---

## Verification

Commands:

```bash
dart format lib/data/services/storage_service.dart test/storage_service_test.dart
flutter test test/consistency_recovery_service_test.dart -r expanded
flutter test test/storage_service_test.dart -r expanded
flutter test test/widget_test.dart -r expanded
flutter analyze
flutter test -r expanded
```

Results:

* Dart format passed.
* Recovery service test slice passed with 4 passing tests.
* Storage service test slice passed with 9 passing tests.
* Widget test slice passed with 6 passing tests and 2 documented skipped tests.
* `flutter analyze` passed with no issues.
* Full automated test suite passed with 25 passing tests and 2 documented skipped tests.

---

## Files Created

* `lib/data/services/consistency_recovery_service.dart`
* `test/consistency_recovery_service_test.dart`
* `user_stories/RL-0009/RL-0009_SPRINT_PLAN.md`
* `user_stories/RL-0009/RL-0009_INTERPRETATION.md`
* `user_stories/RL-0009/RL-0009_UX_SPEC.md`
* `user_stories/RL-0009/RL-0009_IMPLEMENTATION_NOTES.md`
* `user_stories/RL-0009/RL-0009_CODE_REVIEW.md`
* `user_stories/RL-0009/RL-0009_QA_REPORT.md`
* `user_stories/RL-0009/RL-0009_RELEASE_NOTE.md`

---

## Files Modified

* `docs/EPIC_USER_STORY_TASKS.md`
* `docs/SPRINT_PLAN.md`
* `DEVELOPMENT_LOG.md`
* `lib/data/local/local_database.dart`
* `lib/data/services/storage_service.dart`
* `lib/features/home/screens/home_screen.dart`
* `test/storage_service_test.dart`
* `test/widget_test.dart`
* `user_stories/RL-0009/RL-0009_TASKS.md`
* `user_stories/RL-0009/RL-0009_SPRINT_PLAN.md`

---

## Packages Added

```text
None
```

---

## Database / Migration Notes

```text
No adapter migration required. Planned rest dates and recovery metric dates use primitive Hive boxes.
```

---

## Known Limitations

* Existing callback-write widget tests remain skipped for the documented widget-test infrastructure reason.
* Planned rest is intentionally MVP-small and tied to selected dates, not a full scheduling calendar.
* Recovery metrics remain local primitive signals for later RL-0012 use.
* Share cards, privacy controls, and MVP validation dashboards remain future-story scope.

---

## Final Decision

```text
Released
```

Decision rationale:

* Code Review approved RL-0009 after the stale-metric cleanup fix.
* QA passed RL-0009.
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
user_stories/RL-0009/RL-0009_RELEASE_NOTE.md
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
