# RL-0008 Interpretation

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
User Story Interpreter Agent
```

Status:

```text
Ready for UX
```

---

## Story Summary

RL-0008 makes the user's selected weekly workout goal visible and actionable on the home screen. The app should show the selected weekly goal, count completed workouts in the current week, update progress immediately when workouts are completed or uncompleted, recognize when the weekly target is reached, and preserve progress after app restart through existing local data.

This story builds directly on RL-0002 and RL-0005. RL-0002 already stores the selected weekly goal locally during onboarding. RL-0005 already stores workout completion state locally. RL-0008 should calculate weekly progress from those existing persisted values rather than introducing backend, login, cloud sync, analytics SDKs, streaks, badges, share cards, or new XP awards.

---

## Acceptance Mapping

| AC ID | Acceptance Criteria | Interpretation |
| ----- | ------------------- | -------------- |
| AC-01 | The app displays the selected weekly goal. | Show the locally saved weekly goal on the home screen. |
| AC-02 | The app displays completed workouts for the current week. | Count completed workout logs whose date falls within the current Monday-Sunday week. |
| AC-03 | Progress updates immediately. | Recalculate and refresh the weekly goal display when workout logs are added, completed, uncompleted, or deleted. |
| AC-04 | Goal completion is recognized when the target is reached. | Show a clear completed state when completed workouts for the week are greater than or equal to the selected goal. |
| AC-05 | Goal progress persists after app restart. | Derive progress from persisted weekly goal and persisted workout completion state after Hive is reopened. |

---

## Weekly Goal Rules

| Rule | Decision |
| ---- | -------- |
| Goal source | Existing persisted weekly goal from onboarding. |
| Valid goal range | 1-5 workouts per week, matching RL-0002. |
| Week start | Monday. |
| Week end | Sunday. |
| Week basis | Current calendar week based on the device's local current date. |
| Date comparison | Use date-only values and existing `yyyy-MM-dd` workout-log date keys. |
| Counted workouts | Completed workout logs only. |
| Uncounted workouts | Incomplete workout logs, deleted logs, and logs outside the current week. |
| Multiple workouts on one day | Count each completed workout log. |
| Completion threshold | Goal is complete when completed count is greater than or equal to selected weekly goal. |
| Over-goal behavior | Continue showing completed count; do not cap the count, but cap progress indicator value at 100%. |
| Persistence | No new persistence required for progress; derive from existing local weekly goal and workout logs. |

Examples:

| Weekly Goal | Current-Week Completed Workouts | Display State |
| ----------- | ------------------------------- | ------------- |
| 3 | 0 | `0 / 3 workouts` |
| 3 | 1 | `1 / 3 workouts` |
| 3 | 3 | Goal complete |
| 3 | 4 | Goal complete, `4 / 3 workouts` |

---

## Functional Requirements

* The system shall read the selected weekly goal from local storage.
* The system shall calculate the current Monday-Sunday week from the local current date.
* The system shall count completed workout logs within the current week.
* The system shall display the selected weekly goal.
* The system shall display completed current-week workout count.
* The system shall display progress toward the selected weekly goal.
* The system shall recognize goal completion when completed count is greater than or equal to the selected weekly goal.
* The system shall update progress immediately after workout completion changes.
* The system shall preserve progress after app restart by recalculating from persisted data.
* The system shall keep weekly goal language beginner-friendly and consistency-focused.

---

## Non-Functional Requirements

* Weekly goal calculation should be isolated enough to unit test without rendering the full home screen.
* The home-screen UI should remain readable on common iPhone screen sizes.
* The implementation should preserve existing onboarding, workout logging, completion, XP, level, calendar, and timer behavior.
* The implementation should avoid new dependencies unless directly required for the MVP weekly goal display.
* The implementation should avoid changing Hive adapter read/write order or persisted workout model structure.

---

## Out Of Scope

* Streaks.
* Consistency recovery or missed-week encouragement.
* New XP awards for reaching a weekly goal.
* Badges.
* Share cards.
* Weekly history.
* Editing the selected weekly goal after onboarding.
* Notifications or reminders.
* Backend, login, cloud sync, analytics SDK, social graph, public ranking, or external services.
* Dart package rename, bundle identifier changes, Android namespace changes, or generated project renames.

---

## Task Interpretation

| Task ID | Interpretation |
| ------- | -------------- |
| RL-0008-T01 | Define weekly goal progress rules, current-week boundaries, acceptance mapping, and scope boundaries in this interpretation. |
| RL-0008-T02 | UX Designer should specify how selected goal, completed count, progress, and completion state appear in the existing home experience. |
| RL-0008-T03 | Code Writer should implement weekly goal progress calculation from persisted workout logs and weekly goal data. |
| RL-0008-T04 | Code Writer should display selected weekly goal, completed count, and target-reached state on the home screen. |
| RL-0008-T05 | Code Writer should ensure weekly progress updates immediately after completion toggles and remains consistent after deletes. |
| RL-0008-T06 | QA Tester should validate calculation, completion threshold, toggle updates, restart persistence, and out-of-week exclusions. |
| RL-0008-T07 | Code Reviewer should review weekly boundary rules, edge cases, UI scope, and absence of out-of-scope systems. |

---

## Execution Order Validation

1. RL-0002 is Done and persists the selected weekly goal.
2. RL-0005 is Done and persists workout completion state.
3. RL-0008-T01 is complete with this interpretation.
4. UX should define the home-screen presentation before implementation.
5. Code Writer should implement weekly goal calculation before wiring the home-screen display.
6. QA and Code Review should verify both date-boundary behavior and user-facing progress before release closeout.

---

## Risks And Mitigations

| Risk | Mitigation |
| ---- | ---------- |
| Current-week boundaries differ from the visible weekly calendar. | Use Monday-Sunday boundaries to match the existing `WeeklyCalendar`. |
| Goal progress does not update after completion toggles. | Reuse the workout log listenable path where practical. |
| Weekly goals become a streak or recovery system. | Keep RL-0008 limited to selected goal, completed count, progress, and target reached state. |
| Goal completion adds XP or badges prematurely. | Do not add new rewards in this story. |
| Over-goal progress creates awkward UI. | Allow count to exceed target while capping progress indicator value at 100%. |

---

## Success Criteria

* The home screen shows the selected weekly goal.
* The home screen shows completed workouts for the current Monday-Sunday week.
* Completing or uncompleting a workout updates weekly progress immediately.
* Goal completion is recognized when completed count reaches the selected goal.
* Restarting the app preserves weekly goal progress by recalculating from local data.
* Existing onboarding, workout logging, completion, XP, and level behavior continue to pass validation.
* No out-of-scope systems are introduced.

---

## Agent Handoff

Current Agent:

```text
User Story Interpreter
```

Completed Output:

```text
user_stories/RL-0008/RL-0008_INTERPRETATION.md
```

Next Agent:

```text
UX Designer
```

Next Prompt:

```text
/Users/jounghwapak/Developer/AI_Agents/prompts/ux_designer.md
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

Expected Output:

```text
user_stories/RL-0008/RL-0008_UX_SPEC.md
```

Instructions:

* Complete RL-0008-T02 only.
* Design the weekly goal progress presentation for the existing home experience.
* Keep the design beginner-friendly and consistency-focused.
* Do not implement code during the UX stage.
