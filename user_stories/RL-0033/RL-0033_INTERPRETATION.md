# RL-0033 Interpretation

## Document Metadata

Story ID:

```text
RL-0033
```

Created Date:

```text
2026-07-18
```

Created By:

```text
User Story Interpreter Agent
```

Status:

```text
Ready For Implementation
```

---

## Source Documents

Required Inputs:

* `user_stories/RL-0033/RL-0033_SPRINT_PLAN.md`
* `user_stories/RL-0033/RL-0033_UX_SPEC.md`
* `docs/PROJECT_CONTEXT.md`
* `docs/ARCHITECTURE.md`
* `docs/EPIC_USER_STORY_TASKS.md`

Optional Inputs:

* `user_stories/RL-0033/RL-0033_TASKS.md`
* `docs/USER_JOURNEY.md`
* `docs/SCREEN_STRUCTURE.md`
* `user_stories/RL-0021/RL-0021_UX_SPEC.md`

---

## Workflow Validation

UX Required:

```text
Yes
```

UX Spec Loaded:

```text
Yes
```

User Approval Required:

```text
Yes
```

Dependency Status:

```text
RL-0015 and RL-0021 are Done.
```

---

## User Story

```text
As a user preparing today's workout,
I want to create one daily workout session with multiple ordered exercises,
so that Dashboard and Current Workout know what workout should be started and guided.
```

---

## Story Intent

RL-0033 fills the missing Workout Planning prerequisite discovered during RL-0022 validation.

The story creates one local daily session for the selected date. The saved session gives Dashboard a valid planned workout to show and gives Current Workout a valid ordered exercise list to start from.

RL-0033 does not continue set progression. It prepares executable session data for later Current Workout stories.

---

## Functional Requirements

FR-01:
Provide a Workout Plan Builder screen reachable from Dashboard when the selected date has no saved daily session.

FR-02:
Allow the user to create or edit one session title for the selected date.

FR-03:
Allow the user to add a planned exercise through an Add Exercise bottom sheet.

FR-04:
Require exercise name before adding or saving an exercise.

FR-05:
Allow category selection using existing workout categories.

FR-06:
Allow sets and reps to be captured where provided.

FR-07:
Allow weight and memo to remain optional.

FR-08:
Allow multiple exercises in one saved daily session.

FR-09:
Append new exercises to the end of the session.

FR-10:
Allow editing an existing exercise without changing its order.

FR-11:
Allow deleting an exercise.

FR-12:
Display visible exercise numbering that closes the gap after deletion.

FR-13:
Disable or block Save Workout when the session has no valid exercises.

FR-14:
Persist session title and exercises locally.

FR-15:
Preserve persisted session title and exercises after app restart.

FR-16:
Dashboard must show the saved session as today's workout handoff.

FR-17:
Dashboard Start Workout must open Current Workout with the saved session exercises.

FR-18:
Current Workout handoff must reuse saved exercise records and must not create duplicate completed records.

---

## Data Requirements

DR-01:
Exercise data may reuse the existing `WorkoutLog` local model when compatible with acceptance criteria.

DR-02:
Exercise order must be stable and based on insertion order.

DR-03:
Session title must persist locally per selected date.

DR-04:
Any new local persistence must avoid breaking existing Hive boxes and adapters.

DR-05:
Existing workout completion, XP award, weekly goal, recovery, share-card, and validation metrics behavior must continue to read existing workout logs.

---

## UI Requirements

UI-01:
Workout Plan Builder follows the approved `design/approved/09_workout_plan_builder.png` composition at a practical Material implementation level.

UI-02:
Add Exercise bottom sheet follows the approved `design/approved/10_add_exercise.png` composition at a practical Material implementation level.

UI-03:
Use existing Phase 2 dark UI patterns from Dashboard and Current Workout.

UI-04:
Show selected date and a back action on the builder.

UI-05:
Show session title prominently.

UI-06:
Show exercise count and total planned sets.

UI-07:
Show each exercise with number, name, category, sets, reps, optional weight, edit action, and delete action.

UI-08:
Show an empty state when no exercises exist.

UI-09:
Add, edit, delete, close, and back controls must be touch-safe and understandable.

---

## Validation Rules

VR-01:
Exercise name is required.

VR-02:
Session cannot be saved with zero exercises.

VR-03:
Sets and reps are optional but should not crash when omitted or invalid.

VR-04:
Deleting an exercise must not delete unrelated dates.

VR-05:
Editing an exercise must retain its original creation order.

VR-06:
Existing completed logs must remain readable.

---

## Non-Functional Requirements

NFR-01:
Implementation must remain local-first and offline.

NFR-02:
Implementation must not add backend, login, cloud sync, external analytics SDK, external asset services, social graph, or public ranking.

NFR-03:
Implementation should make the smallest effective change and reuse existing Flutter/Hive patterns.

NFR-04:
Implementation must preserve existing tests or document known harness limitations without changing production behavior solely for test harness stability.

---

## Acceptance Criteria Mapping

| Acceptance Criteria | Implementation Interpretation |
| ------------------- | ----------------------------- |
| Uses Workout Plan Builder approved design. | Add a dedicated builder screen with dark Phase 2 layout, session title, summary, exercise list, add action, and save action. |
| Uses Add Exercise approved design. | Add a focused bottom sheet for one exercise with name, category, sets, reps, weight, and memo. |
| Create one daily session with title and one valid exercise. | Persist one title per date and one or more exercise records for that date. |
| Add multiple exercises in insertion order. | Append new exercise records using creation time order. |
| Edit existing exercise without changing order. | Update the existing record while preserving id and createdAt. |
| Delete exercise and close numbering gap. | Delete the record and render list numbers from current sorted list index. |
| Persist after app restart. | Store title and exercises in Hive-backed local storage. |
| Dashboard handoff. | Dashboard reads selected date session title/exercises and shows Start Workout when valid. |
| Current Workout handoff. | Start Workout passes saved exercise records to Current Workout. |
| Scope exclusions. | Do not implement templates, sorting, multiple sessions, cloud sync, achievements, or timer flow. |

---

## Implementation Boundaries

Code Writer must not:

* Resume or release RL-0022.
* Add set progression beyond existing Current Workout behavior.
* Add Week screen planning.
* Add templates or drag-and-drop sorting.
* Add multiple sessions per day.
* Add timer flow.
* Add achievements, XP changes, share cards, backend, login, cloud sync, or analytics.
* Rewrite completed MVP systems.

---

## Recommended Implementation Approach

* Reuse existing `WorkoutLog` records for planned exercises where possible.
* Add minimal local storage for session title if required.
* Add a dedicated feature screen under `lib/features/workout_plan/`.
* Route Dashboard Plan Workout into the builder.
* Keep Current Workout receiving a list of existing `WorkoutLog` records.
* Add focused service tests for title persistence and ordered exercise behavior.
* Add focused widget coverage for Dashboard handoff and Current Workout start where stable.

---

## Risks

* Adding new Hive adapters would increase migration risk; prefer primitive boxes or existing models where possible.
* Existing widget tests have known Hive callback limitations; service tests may be the stronger evidence for persistence behavior.
* Existing `WorkoutLog` is also used for completed/history records, so implementation must preserve completed behavior.

---

## Agent Handoff

Current Agent:

```text
User Story Interpreter
```

Completed Output:

```text
user_stories/RL-0033/RL-0033_INTERPRETATION.md
```

Next Agent:

```text
Code Writer
```

Next Prompt:

```text
AI_Agents/prompts/generate_code.md
```

Required Input Files:

* `user_stories/RL-0033/RL-0033_SPRINT_PLAN.md`
* `user_stories/RL-0033/RL-0033_INTERPRETATION.md`
* `user_stories/RL-0033/RL-0033_UX_SPEC.md`
* `docs/ARCHITECTURE.md`
* `docs/PROJECT_CONTEXT.md`

Expected Output:

* Source code changes.
* `user_stories/RL-0033/RL-0033_IMPLEMENTATION_NOTES.md`

Blocking Conditions:

* Stop if implementation requires broad persistence migration, backend, cloud sync, templates, multiple sessions per day, or RL-0022 progression.
