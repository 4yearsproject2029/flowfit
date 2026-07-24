# RL-0025 Interpretation

## Document Metadata

Story ID:

```text
RL-0025
```

Epic:

```text
EP-14 Planned Session Detail And Start Today
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

1. user_stories/RL-0025/RL-0025_SPRINT_PLAN.md
2. user_stories/RL-0025/RL-0025_UX_SPEC.md
3. docs/EPIC_USER_STORY_TASKS.md
4. docs/ARCHITECTURE.md
5. docs/PROJECT_CONTEXT.md

UX specifications are authoritative only when:

```text
UX Required: Yes
```

is defined in:

```text
user_stories/RL-0025/RL-0025_SPRINT_PLAN.md
```

Do not expand scope.

---

## Workflow Validation

Read:

```text
user_stories/RL-0025/RL-0025_SPRINT_PLAN.md
```

Locate:

```text
UX Required: Yes
```

Rules:

* UX Required is Yes and `user_stories/RL-0025/RL-0025_UX_SPEC.md` is present.
* Interpretation may proceed.

---

## Story Summary

RL-0025 adds a planned-session detail screen between Week and Current Workout. It lets users inspect the saved local session and start it cleanly without creating duplicate records, while keeping completed History detail separate for later stories.

---

## User Story

```text
As a user viewing a planned session,
I want a focused detail screen that can start today's workout,
so that planning can hand off cleanly to Current Workout.
```

---

## Acceptance Criteria

| AC ID | Description |
| ----- | ----------- |
| AC-01 | Uses `design/approved/08_workout_detail.png` only for planned/session detail that can start a workout. |
| AC-02 | Planned Session Detail displays session name, exercises, sets/reps, notes, and Start Workout or Start Today action where appropriate. |
| AC-03 | Start Workout hands off to Current Workout using the locally saved composed session without creating duplicate completed records. |
| AC-04 | Planned/session detail remains separate from completed History detail. |
| AC-05 | Local persistence preserves planned workout data and active workout handoff state. |
| AC-06 | QA covers Week -> planned detail -> Start Today -> Current Workout navigation. |

---

## Acceptance Criteria Mapping

| AC ID | Functional Requirement | Validation Method |
| ----- | ---------------------- | ----------------- |
| AC-01 | Implement a planned-session detail screen using the approved Workout Detail structure only for planned sessions. | Widget test and review |
| AC-02 | Show session name, date, exercises, target sets/reps/weight, notes, and a Start action. | Widget test |
| AC-03 | Start action shall open Current Workout with existing selected-date `WorkoutLog` rows and shall not create records. | Widget and storage test |
| AC-04 | Detail route shall not be reachable from History and shall not present completed-history language. | Review and widget test |
| AC-05 | Planning data shall remain in existing local storage and active handoff shall use current workout state behavior. | Storage regression |
| AC-06 | QA shall verify Week -> planned detail -> Start Today -> Current Workout. | QA report |

---

## Functional Requirements

* The system shall open Planned Session Detail from a saved session preview in Week.
* The system shall display the saved session title and selected date.
* The system shall display locally saved exercise rows in insertion order.
* The system shall display sets, reps, weight, and notes where available.
* The system shall show a Start Today action for the current date and Start Workout for other selected dates.
* The system shall open Current Workout with the existing selected-date workout logs.
* The system shall not create duplicate workout logs during Start Today.
* The system shall keep planned detail separate from History and completed Workout Detail.

---

## Non-Functional Requirements

* The feature shall remain local-first with no backend, login, cloud sync, or external services.
* The UI shall remain readable and non-overlapping on common mobile widths.
* Existing Week, Dashboard, Current Workout, and storage behavior shall remain intact.

---

## Data Requirements

### Existing Models Used

| Model | Usage |
| ----- | ----- |
| WorkoutLog | Represents saved planned exercises and Current Workout handoff rows. |
| StorageService | Reads session title and selected-date workout logs. |

### New Fields Required

| Model | Field | Type | Default Value |
| ----- | ----- | ---- | ------------- |
| None | None | None | None |

```text
No data model changes required.
```

### Persistence Rules

* Planned detail reads existing local data.
* Starting a workout does not create, edit, or complete workout logs.

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
user_stories/RL-0025/RL-0025_UX_SPEC.md
```

Required screens:

* Planned Session Detail screen.

Required components:

* Detail header.
* Session summary card.
* Local metrics.
* Movement list.
* Primary Start Today or Start Workout action.

Required feedback behavior:

* Back returns to Week.
* Start opens Current Workout.
* Empty planned detail does not expose Start action.

---

## Validation Rules

* Start action is available only when planned exercises exist.
* Start action uses existing workout log objects.
* Planned detail does not expose History or completed-detail behavior.

---

## Edge Cases

| Scenario | Expected Behavior |
| -------- | ----------------- |
| Empty planned detail | Show no exercises planned and no start action. |
| Exercise has no sets or reps | Show available fields only. |
| Exercise has notes | Show note text under the exercise row. |
| Future selected date | Start action label uses Start Workout. |
| Current selected date | Start action label uses Start Today. |
| Offline usage | Continue using local Hive-backed storage. |

---

## Dependencies

### Story Dependencies

| Story ID | Relationship |
| -------- | ------------ |
| RL-0017 | Depends On |
| RL-0015 | Depends On |
| RL-0033 | Depends On |

### Technical Dependencies

* Existing `WeekScreen`.
* Existing `CurrentWorkoutScreen`.
* Existing `StorageService`.
* Existing `WorkoutLog` model.

---

## In Scope

* Planned Session Detail screen.
* Week preview to planned detail navigation.
* Start Today or Start Workout handoff to Current Workout.
* Read-only planned exercise display.
* Focused widget and storage regression coverage.

---

## Out Of Scope

* Future stories
* Nice-to-have improvements
* Refactoring unrelated code
* Architecture changes

Story-specific exclusions:

* Completed History detail.
* History list.
* Inline planned-session editing.
* New persistence models.
* Duplicate completed records.

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

* Place planned detail under `lib/features/workout_detail/screens/` so RL-0027 can later add completed detail without overloading Week.
* Keep the screen constructor explicit about planned session data to prevent accidental History reuse.
* Add a focused widget test that starts from Week and reaches Current Workout.

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
user_stories/RL-0025/RL-0025_INTERPRETATION.md
```

Next Agent:

```text
Code Writer
```

Next Prompt:

```text
/Users/jounghwapak/Developer/AI_Agents/prompts/generate_code.md
```

Required Input Files:

- docs/ARCHITECTURE.md
- docs/PROJECT_CONTEXT.md
- user_stories/RL-0025/RL-0025_SPRINT_PLAN.md
- user_stories/RL-0025/RL-0025_INTERPRETATION.md

Optional Input Files:

- user_stories/RL-0025/RL-0025_UX_SPEC.md
- design/approved/08_workout_detail.png

Expected Output:

- user_stories/RL-0025/RL-0025_IMPLEMENTATION_NOTES.md
- Planned detail implementation in app source
- Focused test coverage

Blocking Conditions:

- Stop if implementation would require completed History detail or a new persistence model.

Instructions:

- Implement only planned-session detail and Start Today handoff behavior.
