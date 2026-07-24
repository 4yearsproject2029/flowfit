# RL-0017 Interpretation

## Document Metadata

Story ID:

```text
RL-0017
```

Epic:

```text
EP-14 Week Planning
```

Created Date:

```text
2026-07-24
```

Created By:

```text
User Story Interpreter Agent
```

Status:

```text
Approved
```

---

## Source Of Truth

When conflicts exist, follow this priority order:

1. user_stories/RL-0017/RL-0017_SPRINT_PLAN.md
2. user_stories/RL-0017/RL-0017_UX_SPEC.md
3. docs/EPIC_USER_STORY_TASKS.md
4. docs/ARCHITECTURE.md
5. docs/PROJECT_CONTEXT.md

UX specifications are authoritative only when:

```text
UX Required: Yes
```

is defined in:

```text
user_stories/RL-0017/RL-0017_SPRINT_PLAN.md
```

Do not expand scope.

---

## Workflow Validation

Read:

```text
user_stories/RL-0017/RL-0017_SPRINT_PLAN.md
```

Locate:

```text
UX Required: Yes
```

Rules:

* UX Required is Yes and `user_stories/RL-0017/RL-0017_UX_SPEC.md` is present.
* Interpretation may proceed.

---

## Story Summary

RL-0017 gives the app a dedicated Week planning destination. It solves the problem of weekly planning being hidden inside Dashboard or creation flows by showing the current local week, a selected-day plan preview, and a route into existing planning behavior while leaving detailed planned-session start behavior and History review to later stories.

---

## User Story

```text
As a user planning my week,
I want Week to show my local planned sessions by day,
so that I can understand the week without mixing planning with Dashboard or History review.
```

---

## Acceptance Criteria

| AC ID | Description |
| ----- | ----------- |
| AC-01 | Uses `design/approved/05_weekly_plan.png` for approved Week layout and screen composition. |
| AC-02 | Week owns screen structure, day navigation, planned session display, and existing local data presentation. |
| AC-03 | Week may reuse existing workout creation behavior when necessary. |
| AC-04 | Week does not own new inline editors, advanced planning tools, rescheduling systems, or new autosave experiences. |
| AC-05 | Week does not display read-only history as its primary purpose. |
| AC-06 | Week can show a session preview entry point, but detailed planned/session detail and Start Today behavior are deferred to `RL-0025`. |
| AC-07 | History list and completed Workout Detail behavior are deferred to `RL-0026` and `RL-0027`. |

---

## Acceptance Criteria Mapping

| AC ID | Functional Requirement | Validation Method |
| ----- | ---------------------- | ----------------- |
| AC-01 | Week screen layout shall follow the approved header, week selector, selected-day plan card, suggestions, and bottom navigation structure. | Widget test and visual inspection |
| AC-02 | Week shall display a current-week day selector and local planned data for the selected date. | Widget test |
| AC-03 | Week shall navigate to the existing Workout Plan Builder for planning or adjustment. | Widget test |
| AC-04 | Week shall not introduce inline editing, recurring planning, drag-and-drop sorting, or autosave planning behavior. | Code review and QA inspection |
| AC-05 | Week shall not show completed workout history as its primary surface. | Code review and widget test |
| AC-06 | Week may show preview rows, but shall not start a workout or open planned detail in this story. | Widget test and code review |
| AC-07 | Week shall not implement History list or completed Workout Detail. | Code review |

---

## Functional Requirements

* The system shall add a Week planning screen reachable from the bottom navigation.
* The system shall show the current Monday-to-Sunday local week range.
* The system shall allow users to select a day in the current week.
* The system shall show the saved local session title for the selected date.
* The system shall show selected-date exercises from existing `WorkoutLog` data in insertion order.
* The system shall show an empty state when the selected date has no saved workout and is not marked as planned rest.
* The system shall show a planned-rest state when the selected date is marked planned rest.
* The system shall reuse the existing Workout Plan Builder for planning or adjustment.
* The system shall refresh Week after the Workout Plan Builder route returns.
* The system shall keep Start Today, planned detail, History list, and completed Workout Detail out of RL-0017.

---

## Non-Functional Requirements

* The screen shall remain local-first with no backend, login, cloud sync, or external service behavior.
* The UI shall preserve readable text, 44px minimum touch targets, and non-overlapping content on common mobile widths.
* Existing Dashboard, Current Workout, Workout Summary, rest timer, XP, weekly-goal, and storage behavior shall remain intact.

---

## Data Requirements

### Existing Models Used

| Model | Usage |
| ----- | ----- |
| WorkoutLog | Reads selected-date exercise rows and completion state for preview display. |
| StorageService | Reads saved session titles, workout logs by date, and planned rest dates. |

### New Fields Required

| Model | Field | Type | Default Value |
| ----- | ----- | ---- | ------------- |
| None | None | None | None |

```text
No data model changes required.
```

### Persistence Rules

* Week reads existing local session and planned-rest data.
* Any planning changes must be performed by the existing Workout Plan Builder.

### Migration Requirements

* None

---

## UI Requirements

UX Required:

```text
Yes
```

Reference:

```text
user_stories/RL-0017/RL-0017_UX_SPEC.md
```

Required screens:

* Week Planning screen.

Required components:

* Week header.
* Current-week range.
* Day selector.
* Selected-day plan card.
* Empty and planned-rest states.
* Existing planning action.
* Bottom navigation with Week selected.

Required feedback behavior:

* Selected day updates immediately.
* Saved plan appears after returning from the existing builder.
* Missing plan state is clear and actionable.

---

## Validation Rules

* Selected-date planning action must pass the selected date key and label to the existing builder.
* Week must not show completed History as its primary data source.
* Week must not expose Start Today or Current Workout handoff from the session preview.

---

## Edge Cases

| Scenario | Expected Behavior |
| -------- | ----------------- |
| Empty state | Show no workout planned and a Plan Workout action. |
| Planned rest day | Show planned rest messaging and an Adjust Plan action. |
| Saved session with one exercise | Show session title, one exercise preview row, and exercise count. |
| Saved session with many exercises | Show the first three preview rows and a remaining count. |
| Offline usage | Continue reading and writing through local Hive-backed storage. |
| Persistence failure | Existing storage behavior applies; no new persistence path is introduced. |

---

## Dependencies

### Story Dependencies

| Story ID | Relationship |
| -------- | ------------ |
| RL-0014 | Depends On |
| RL-0021 | Depends On |

### Technical Dependencies

* Existing `StorageService`.
* Existing `WorkoutLog` model.
* Existing `WorkoutPlanBuilderScreen`.
* Existing Home bottom-navigation pattern.

---

## In Scope

* Week planning screen structure.
* Current-week day navigation.
* Local planned-session preview.
* Empty and planned-rest states.
* Reuse of existing workout creation behavior.
* Bottom navigation route from Home to Week and back.

---

## Out Of Scope

* Future stories
* Nice-to-have improvements
* Refactoring unrelated code
* Architecture changes

Story-specific exclusions:

* Planned Session Detail and Start Today.
* History list.
* Completed Workout Detail.
* New inline editors.
* Advanced planning tools.
* Rescheduling systems.
* New autosave experiences.

---

## Execution Order Validation

Verify:

* Dependencies are resolved.
* Acceptance criteria are testable.
* Required inputs exist.
* UX decisions are available when required.

Result:

```text
Valid
```

---

## Risks Or Blockers

```text
None
```

---

## Recommendations

* Add Week as a focused screen under `lib/features/week/screens/`.
* Keep Week styling compatible with the existing dark Phase 2 screen language.
* Reuse date-key formatting and builder refresh behavior already present in Home.
* Add focused widget coverage for local planned-session display, empty state, and builder navigation.

---

## Success Criteria For Moving To Code Writer

Implementation may begin only when:

* All acceptance criteria are covered.
* Dependencies are resolved.
* Scope boundaries are clear.
* Validation rules are documented.
* Edge cases are documented.
* UX decisions are available when required.

---

## Agent Handoff

Current Agent:

```text
User Story Interpreter Agent
```

Completed Output:

```text
user_stories/RL-0017/RL-0017_INTERPRETATION.md
```

Next Agent:

```text
Code Writer
```

Next Prompt:

```text
/Users/jounghwapak/Developer/AI_Agents/prompts/write_code.md
```

Required Input Files:

- docs/ARCHITECTURE.md
- docs/EPIC_USER_STORY_TASKS.md
- user_stories/RL-0017/RL-0017_SPRINT_PLAN.md
- user_stories/RL-0017/RL-0017_UX_SPEC.md
- user_stories/RL-0017/RL-0017_INTERPRETATION.md

Optional Input Files:

- user_stories/RL-0017/RL-0017_TASKS.md
- design/approved/05_weekly_plan.png

Expected Output:

- user_stories/RL-0017/RL-0017_IMPLEMENTATION_NOTES.md
- Week planning implementation in app source
- Focused test coverage

Blocking Conditions:

- Stop if implementation would require new data models or deferred RL-0025/RL-0026/RL-0027 scope.

Instructions:

- Implement only the Week planning scope described here.
- Preserve local-first boundaries and existing workflow behavior.
