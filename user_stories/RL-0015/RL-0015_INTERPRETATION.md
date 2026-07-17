# RL-0015 Interpretation

## Document Metadata

Story ID:

```text
RL-0015
```

Epic:

```text
EP-12 Guided Workout Flow
```

Created Date:

```text
2026-07-17
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

1. user_stories/RL-0015/RL-0015_SPRINT_PLAN.md
2. user_stories/RL-0015/RL-0015_UX_SPEC.md
3. docs/EPIC_USER_STORY_TASKS.md
4. docs/ARCHITECTURE.md
5. docs/PROJECT_CONTEXT.md

UX specifications are authoritative only when:

```text
UX Required: Yes
```

is defined in:

```text
user_stories/RL-0015/RL-0015_SPRINT_PLAN.md
```

Do not expand scope.

---

## Workflow Validation

Read:

```text
user_stories/RL-0015/RL-0015_SPRINT_PLAN.md
```

Locate:

```text
UX Required:
```

Allowed values:

* Yes
* No

Result:

```text
Valid
```

---

## Story Summary

RL-0015 creates the Current Workout screen foundation. It gives today’s workout a dedicated execution surface where users can see the active exercise and the next action without mixing execution into Dashboard, Week planning, or History review.

This story is needed now because RL-0022 and RL-0023 depend on a focused Current Workout foundation before progression, rest, pause, adjust, skip, resume, and completion behavior can be layered in safely.

---

## User Story

```text
As a user starting today's workout,
I want a Current Workout screen foundation that clearly shows the active exercise and next action,
so that workout execution has a focused home separate from Dashboard and planning.
```

---

## Acceptance Criteria

| AC ID | Description |
| ----- | ----------- |
| AC-01 | Uses `design/approved/02_current_workout.png` for approved Current Workout layout and screen composition. |
| AC-02 | Current Workout displays workout title, active exercise, instruction text, sets/reps target, progress indicator, and one primary Complete Set action placeholder. |
| AC-03 | Current Workout is reachable from Dashboard Start/Resume or an existing local workout entry without adding backend, login, cloud sync, or broad content systems. |
| AC-04 | Workout execution is visually and functionally separated from Dashboard, Week planning, and History review. |
| AC-05 | Existing workout log data and local persistence remain intact. |
| AC-06 | Pause, adjust, skip, multi-set progression, rest handoff, resume state, and completion navigation are deferred to dependent stories. |

---

## Acceptance Criteria Mapping

| AC ID | Functional Requirement | Validation Method |
| ----- | ---------------------- | ----------------- |
| AC-01 | Implement a dark Current Workout screen using the approved composition as guidance. | Widget QA |
| AC-02 | Display workout title, active exercise name, instruction text, sets/reps tiles, progress percent/bar, and Complete Set placeholder. | Widget test and manual inspection |
| AC-03 | Dashboard Start/Resume shall navigate to Current Workout using local workout logs. | Widget test |
| AC-04 | Current Workout shall live in its own screen and not add execution controls to Week or History. | Code review and QA |
| AC-05 | Implementation shall not modify Hive models, adapters, or existing persistence behavior. | Code review and regression tests |
| AC-06 | Deferred controls and progression shall not be implemented in RL-0015. | Code review and QA |

---

## Functional Requirements

* The system shall add a Current Workout screen.
* The Dashboard Today’s Focus primary action shall navigate to Current Workout when a workout exists for the selected date.
* The Current Workout screen shall select the first incomplete local workout log as the active exercise, or the last workout log when all are complete.
* The Current Workout screen shall display local workout log fields where available.
* The Complete Set placeholder shall not mutate workout completion, set progression, rest state, XP, or navigation.
* The implementation shall not add backend, login, cloud sync, external asset services, or broad content systems.

---

## Non-Functional Requirements

* The screen should fit common iPhone widths without overlapping text or actions.
* The primary action should have a touch target of at least 44px.
* The implementation should reuse existing Flutter/Material patterns and avoid broad refactors.
* Existing tests should remain passing except documented known skips.

---

## Data Requirements

### Existing Models Used

| Model | Usage |
| ----- | ----- |
| WorkoutLog | Drives Current Workout title, active exercise, category, sets, reps, progress, and local entry state. |

### New Fields Required

| Model | Field | Type | Default Value |
| ----- | ----- | ---- | ------------- |
| None | None | None | None |

No data model changes required.

### Persistence Rules

* Existing workout log persistence remains unchanged.
* Complete Set placeholder must not write to persistence in RL-0015.

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
user_stories/RL-0015/RL-0015_UX_SPEC.md
```

Required screens:

* Current Workout foundation screen.

Required components:

* Back action.
* Current Workout label.
* Workout progress title and percent.
* Progress bar.
* Active exercise card.
* Instruction text.
* Sets and reps target tiles.
* Complete Set placeholder.

Required feedback behavior:

* Complete Set placeholder can show a lightweight message but must not advance workout state.

---

## Validation Rules

* Current Workout must only open when local workout data exists from Dashboard.
* Missing sets or reps must be displayed safely, not treated as errors.
* Complete Set placeholder must not toggle workout completion.

---

## Edge Cases

| Scenario | Expected Behavior |
| -------- | ----------------- |
| No workout planned | Dashboard still shows Plan Workout; Current Workout is not launched. |
| Some workouts completed | Current Workout selects first incomplete workout and displays progress. |
| All workouts completed | Current Workout can display the last workout as context without granting rewards or navigating to Summary. |
| Missing sets or reps | Target tile shows `Not set`. |
| User taps Complete Set placeholder | User sees placeholder feedback and no persistence changes occur. |

---

## Dependencies

### Story Dependencies

| Story ID | Relationship |
| -------- | ------------ |
| RL-0014 | Depends On |
| RL-0021 | Depends On |

### Technical Dependencies

* Existing `HomeScreen`.
* Existing `WorkoutLog` model.
* Existing `StorageService` and local Hive data.
* Existing widget-test Hive setup.

---

## In Scope

* Current Workout screen foundation.
* Dashboard navigation to Current Workout.
* Display of local workout data.
* Placeholder Complete Set action.
* Focused widget coverage where practical.

---

## Out Of Scope

* Pause, adjust, skip.
* Multi-set progression.
* Rest handoff.
* Resume state beyond opening the foundation screen.
* Completion navigation.
* Workout Summary.
* Timer overlay.
* Data model changes.

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

* Keep the Current Workout screen’s public API simple so RL-0022 can add progression without undoing this foundation.
* Prefer local placeholder visuals over introducing image assets during RL-0015.

---

## Success Criteria For Moving To Code Writer

Implementation may begin only when:

* All acceptance criteria are covered.
* Dependencies are resolved.
* Scope boundaries are clear.
* Validation rules are documented.
* Edge cases are documented.
* UX decisions are available when required.

Result:

```text
Ready
```

---

## Agent Handoff

Current Agent:

```text
User Story Interpreter
```

Completed Output:

```text
user_stories/RL-0015/RL-0015_INTERPRETATION.md
```

Next Agent:

```text
Code Writer
```

Next Prompt:

```text
AI_Agents/prompts/write_code.md
```

Required Input Files:

- `user_stories/RL-0015/RL-0015_SPRINT_PLAN.md`
- `user_stories/RL-0015/RL-0015_UX_SPEC.md`
- `user_stories/RL-0015/RL-0015_INTERPRETATION.md`
- `docs/EPIC_USER_STORY_TASKS.md`

Optional Input Files:

- `docs/PRODUCT_BRIEF.md`
- `docs/PROJECT_CONTEXT.md`
- `docs/ARCHITECTURE.md`
- `docs/USER_JOURNEY.md`
- `docs/SCREEN_STRUCTURE.md`
- `user_stories/RL-0021/RL-0021_UX_SPEC.md`

Expected Output:

- Current Workout screen foundation implementation.
- `user_stories/RL-0015/RL-0015_IMPLEMENTATION_NOTES.md`

Blocking Conditions:

- Stop if implementation requires deferred RL-0022/RL-0023 behavior.
- Stop if implementation requires persistence model changes.

Instructions:

- Keep implementation story-scoped.
- Preserve existing data and completion behavior.
