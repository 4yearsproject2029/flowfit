# RL-0004 Release Note

## Document Metadata

Story ID:

```text
RL-0004
```

Epic:

```text
EP-04 Offline Experience
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

RL-0004 released the offline MVP persistence baseline. Workout logs, completion state, weekly goal, and onboarding state persist locally through the existing Hive storage path. RepLog continues to require no login, network connection, backend service, or cloud sync for MVP flows.

Users are now informed on onboarding and the home screen that data is saved only on the device and that uninstalling RepLog or switching devices may result in data loss.

---

## Scope Released

* Added local data-loss messaging to onboarding.
* Added local data-loss messaging to the home screen.
* Verified workout log restart persistence.
* Verified completion-state restart persistence.
* Verified weekly-goal restart persistence.
* Verified onboarding-state restart persistence.
* Verified no runtime login, network, or backend dependency was introduced.

---

## Acceptance Criteria Result

| AC ID | Acceptance Criteria | Result |
| ----- | ------------------- | ------ |
| AC-01 | Workout logs persist after app restart. | Passed |
| AC-02 | Completion state persists after restart. | Passed |
| AC-03 | Weekly goals and onboarding state persist after restart. | Passed |
| AC-04 | No login or network connection is required. | Passed |
| AC-05 | Users are informed that uninstalling the app or changing devices may result in data loss. | Passed |

---

## Verification

Commands:

```bash
dart format lib/features/home/screens/home_screen.dart lib/features/onboarding/screens/onboarding_screen.dart test/storage_service_test.dart
flutter test test/storage_service_test.dart -r expanded
rg -n "http|https|firebase|supabase|network|internet|login|auth" lib pubspec.yaml
flutter analyze
flutter test -r expanded
```

Results:

* Dart format passed.
* Focused storage-service tests passed with 2 passing tests.
* Source scan found no runtime login/network/backend dependency.
* `flutter analyze` passed with no issues.
* `flutter test -r expanded` passed with 7 passing tests and 2 documented skipped tests.

---

## Files Created

* `user_stories/RL-0004/RL-0004_SPRINT_PLAN.md`
* `user_stories/RL-0004/RL-0004_UX_SPEC.md`
* `user_stories/RL-0004/RL-0004_INTERPRETATION.md`
* `user_stories/RL-0004/RL-0004_IMPLEMENTATION_NOTES.md`
* `user_stories/RL-0004/RL-0004_CODE_REVIEW.md`
* `user_stories/RL-0004/RL-0004_QA_REPORT.md`
* `user_stories/RL-0004/RL-0004_RELEASE_NOTE.md`

---

## Files Modified

* `docs/EPIC_USER_STORY_TASKS.md`
* `docs/SPRINT_PLAN.md`
* `DEVELOPMENT_LOG.md`
* `lib/features/home/screens/home_screen.dart`
* `lib/features/onboarding/screens/onboarding_screen.dart`
* `test/storage_service_test.dart`
* `test/widget_test.dart`
* `user_stories/RL-0004/RL-0004_TASKS.md`

---

## Packages Added

```text
None
```

---

## Database / Migration Notes

```text
No migration required. Existing Hive boxes and adapters remain unchanged.
```

---

## Known Limitations

* Existing callback-write widget tests remain skipped for the documented widget-test infrastructure reason.
* Data export, backup, and cloud sync remain out of scope.

---

## Final Decision

```text
Released
```

Decision rationale:

* Code Review approved RL-0004.
* QA passed RL-0004.
* Focused persistence validation passed.
* No release blockers remain.

---

## Agent Handoff

Current Agent:

```text
Release Manager
```

Completed Output:

```text
user_stories/RL-0004/RL-0004_RELEASE_NOTE.md
```

Next Agent:

```text
Coordinator
```
