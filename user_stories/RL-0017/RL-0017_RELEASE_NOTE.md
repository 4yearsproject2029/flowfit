# RL-0017 Release Note

## Document Metadata

Story ID:

```text
RL-0017
```

Epic:

```text
EP-14 Week Planning
```

Release Date:

```text
2026-07-24
```

Released By:

```text
Release Manager Agent
```

Application Version:

```text
v0.0.0
```

Release Status:

```text
Done
```

---

## Source Documents

Required Inputs:

* user_stories/RL-0017/RL-0017_SPRINT_PLAN.md
* user_stories/RL-0017/RL-0017_INTERPRETATION.md
* user_stories/RL-0017/RL-0017_IMPLEMENTATION_NOTES.md
* user_stories/RL-0017/RL-0017_CODE_REVIEW.md
* user_stories/RL-0017/RL-0017_QA_REPORT.md
* docs/EPIC_USER_STORY_TASKS.md

Optional Inputs:

* docs/DEVELOPMENT_LOG.md

---

## Release Validation

| Validation Item | Result | Notes |
| --------------- | ------ | ----- |
| Acceptance Criteria Passed | Yes | All RL-0017 criteria passed in QA report. |
| Code Review Approved | Yes | `RL-0017_CODE_REVIEW.md` final decision is Approved. |
| QA Passed | Yes | `RL-0017_QA_REPORT.md` final decision is Pass. |
| Documentation Updated | Yes | Sprint plan, UX spec, interpretation, implementation notes, review, QA, release note, backlog, and development log updated. |
| User Approval Received | Yes | Approved by explicit user workflow instruction to run without stopping through release on 2026-07-24. |

---

## Summary

```text
Added a dedicated Week planning screen with current-week day navigation, selected-day local session preview, empty/rest states, and reuse of the existing Workout Plan Builder.
```

---

## User Value Delivered

Users can now understand their planned week from a planning-first destination instead of relying on Dashboard or History. The screen shows what is planned for the selected day and provides a clear path to plan or adjust local workouts while preserving future story boundaries.

---

## Acceptance Criteria Verification

| AC ID | Acceptance Criteria | Result | Notes |
| ----- | ------------------- | ------ | ----- |
| AC-01 | Uses `design/approved/05_weekly_plan.png` for approved Week layout and screen composition. | Passed | Week screen follows approved structure. |
| AC-02 | Week owns screen structure, day navigation, planned session display, and existing local data presentation. | Passed | Local selected-day data appears in Week. |
| AC-03 | Week may reuse existing workout creation behavior when necessary. | Passed | Existing Workout Plan Builder is reused. |
| AC-04 | Week does not own new inline editors, advanced planning tools, rescheduling systems, or new autosave experiences. | Passed | No deferred planning systems added. |
| AC-05 | Week does not display read-only history as its primary purpose. | Passed | History remains deferred. |
| AC-06 | Week can show a session preview entry point, but detailed planned/session detail and Start Today behavior are deferred to `RL-0025`. | Passed | `Start Today` is absent in RL-0017 tests. |
| AC-07 | History list and completed Workout Detail behavior are deferred to `RL-0026` and `RL-0027`. | Passed | No completed detail behavior added. |

```text
Passed
```

---

## Code Review Result

Status:

```text
Approved
```

Reference:

```text
user_stories/RL-0017/RL-0017_CODE_REVIEW.md
```

---

## QA Result

Status:

```text
Passed
```

Reference:

```text
user_stories/RL-0017/RL-0017_QA_REPORT.md
```

---

## User Approval

User Approval Required:

```text
Yes
```

Approval Status:

```text
Approved
```

Approval Date:

```text
2026-07-24
```

Approver:

```text
User
```

---

## Files Created

* lib/features/week/screens/week_screen.dart
* user_stories/RL-0017/RL-0017_SPRINT_PLAN.md
* user_stories/RL-0017/RL-0017_UX_SPEC.md
* user_stories/RL-0017/RL-0017_INTERPRETATION.md
* user_stories/RL-0017/RL-0017_IMPLEMENTATION_NOTES.md
* user_stories/RL-0017/RL-0017_CODE_REVIEW.md
* user_stories/RL-0017/RL-0017_QA_REPORT.md
* user_stories/RL-0017/RL-0017_RELEASE_NOTE.md

---

## Files Modified

* docs/EPIC_USER_STORY_TASKS.md
* docs/SPRINT_PLAN.md
* docs/DEVELOPMENT_LOG.md
* lib/features/home/screens/home_screen.dart
* test/widget_test.dart
* user_stories/RL-0017/RL-0017_TASKS.md
* user_stories/RL-0017/RL-0017_SPRINT_PLAN.md

---

## Packages Added

```text
None
```

---

## Configuration Changes

```text
None
```

---

## Known Limitations

* Planned Session Detail and Start Today remain deferred to RL-0025.
* History list and completed Workout Detail remain deferred to RL-0026 and RL-0027.
* Broad `test/widget_test.dart` can stall in the existing Hive-backed harness; focused RL-0017 tests passed.

---

## Related Documents

* user_stories/RL-0017/RL-0017_SPRINT_PLAN.md
* user_stories/RL-0017/RL-0017_INTERPRETATION.md
* user_stories/RL-0017/RL-0017_IMPLEMENTATION_NOTES.md
* user_stories/RL-0017/RL-0017_CODE_REVIEW.md
* user_stories/RL-0017/RL-0017_QA_REPORT.md

---

## Commit References

* feat(RL-0017): add Week planning screen

---

## Development Log Update

Confirm:

* Story summary appended.
* Modified files recorded.

Result:

```text
Completed
```

---

## Backlog Status Update

Previous Status:

```text
In Progress
```

New Status:

```text
Done
```

Updated By:

```text
Release Manager Agent
```

---

## Next Recommended Story

Story ID:

```text
RL-0025
```

Reason:

* RL-0025 is now unblocked by RL-0017.
* It extends the Week planning journey with planned-session detail and Start Today behavior.
* Dependencies RL-0017, RL-0015, and RL-0033 are Done.

---

## Release Checklist

* [x] Acceptance criteria passed
* [x] Code review approved
* [x] QA passed
* [x] User approval completed or not required
* [x] Documentation updated
* [x] DEVELOPMENT_LOG updated
* [x] EPIC_USER_STORY_TASKS updated

---

## Final Decision

```text
Done
```

---

## Agent Handoff

Current Agent:

```text
Release Manager Agent
```

Completed Output:

```text
user_stories/RL-0017/RL-0017_RELEASE_NOTE.md
docs/DEVELOPMENT_LOG.md
docs/EPIC_USER_STORY_TASKS.md
```

Next Agent:

```text
Coordinator
```

Next Prompt:

```text
/Users/jounghwapak/Developer/AI_Agents/prompts/create_sprint_plan.md
```

Required Input Files:

- docs/EPIC_USER_STORY_TASKS.md
- docs/SPRINT_PLAN.md
- docs/DEVELOPMENT_LOG.md

Optional Input Files:

- user_stories/RL-0017/RL-0017_RELEASE_NOTE.md

Expected Output:

- Next story selection and sprint plan update

Blocking Conditions:

- Stop if no eligible story exists.

Instructions:

- Select the next eligible story from the current backlog state.
- Preserve completed RL-0017 release artifacts.
