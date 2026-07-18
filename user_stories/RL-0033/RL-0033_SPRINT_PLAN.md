# RL-0033 Sprint Plan

## Document Metadata

Story ID:

```text
RL-0033
```

Project Name:

```text
RepLog
```

Project Prefix:

```text
RL
```

Created Date:

```text
2026-07-18
```

Coordinator:

```text
Coordinator Agent
```

Status:

```text
Done
```

---

## Source Of Truth

Priority order when conflicts exist:

1. docs/EPIC_USER_STORY_TASKS.md
2. docs/USER_JOURNEY.md
3. docs/SCREEN_STRUCTURE.md
4. docs/PROJECT_CONTEXT.md
5. docs/ARCHITECTURE.md
6. docs/PRODUCT_BRIEF.md

---

## Story Selection Reason

Decision Point:

```text
Initial Selection
```

Inputs Considered:

* docs/EPIC_USER_STORY_TASKS.md
* docs/SPRINT_PLAN.md
* docs/PRODUCT_BRIEF.md
* docs/PROJECT_CONTEXT.md
* docs/ARCHITECTURE.md
* docs/USER_JOURNEY.md
* docs/SCREEN_STRUCTURE.md
* user_stories/RL-0033/RL-0033_TASKS.md
* user_stories/RL-0015/RL-0015_RELEASE_NOTE.md
* user_stories/RL-0021/RL-0021_UX_SPEC.md
* design/approved/09_workout_plan_builder.png
* design/approved/10_add_exercise.png

Selection Criteria:

* Highest priority eligible story.
* P0 Must Have story.
* Direct dependencies are Done.
* Resolves the missing workout-composition prerequisite found during RL-0022 validation.
* Unblocks RL-0022, RL-0023, RL-0025, RL-0030, and downstream Phase 2 journey QA.

Selection Summary:

```text
RL-0033 was selected because RL-0022 is On Hold until the app has an approved way to compose one local daily workout session containing multiple ordered exercises. RL-0033 is the smallest prerequisite story that resolves that gap without continuing set progression or widening scope into Week, History, achievements, cloud sync, timer flow, templates, or sorting.
```

Previous Story State:

```text
Not Started
```

New Story State:

```text
Done
```

---

## Story Snapshot

| Field | Value |
| ----- | ----- |
| Story ID | RL-0033 |
| Epic | EP-12 Workout Session Composition |
| Priority | P0 |
| MVP | Must Have |
| Depends On | RL-0015, RL-0021 |
| UX Required | Yes |
| User Approval Required | Yes |

---

## User Story

```text
As a user preparing today's workout,
I want to create one daily workout session with multiple ordered exercises,
so that Dashboard and Current Workout know what workout should be started and guided.
```

---

## Acceptance Criteria

* Uses `design/approved/09_workout_plan_builder.png` for approved Workout Plan Builder layout and screen composition.
* Uses `design/approved/10_add_exercise.png` for approved Add Exercise bottom sheet layout and screen composition.
* User can create one daily workout session with a session title and at least one valid exercise.
* User can add multiple exercises, and new exercises append in insertion order.
* User can edit an existing exercise without changing its order.
* User can delete an exercise, and remaining exercise numbering closes the gap.
* Session and exercises persist locally and remain available after app restart.
* Dashboard can show the saved daily session as today's workout handoff.
* Current Workout can start from the saved session without creating duplicate completed records.
* Scope excludes templates, drag-and-drop sorting, multiple sessions per day, cloud sync, achievements, and timer flow.

```text
docs/EPIC_USER_STORY_TASKS.md
```

---

## Execution Scope

In Scope:

* Workout Plan Builder screen for one selected day.
* Session title capture and local persistence.
* Add Exercise bottom sheet for a single planned exercise.
* Add, edit, and delete planned exercises.
* Preserve insertion order using existing local ordering or a compatible local persistence approach.
* Disable or block saving an empty session.
* Dashboard handoff from no-plan state into Workout Plan Builder.
* Dashboard display of saved session as today's workout handoff.
* Current Workout start from the saved session.
* Focused automated coverage where stable.

Out Of Scope:

* RL-0022 set progression.
* Pause, adjust, skip, and resume states.
* Timer countdown UI, timer controls, overlay/modal UI, and cross-screen timer continuity.
* Workout Summary and celebration behavior.
* Week planning screen implementation.
* Planned Session Detail.
* History review.
* Achievements.
* Templates.
* Drag-and-drop sorting.
* Multiple sessions per day.
* Backend, login, cloud sync, social graph, public ranking, external analytics SDK, or external asset services.
* Broad data-model rewrite.

---

## Dependency Validation

Dependencies:

```text
RL-0015, RL-0021
```

Validation Result:

```text
All dependencies are complete.
```

Dependency Notes:

* RL-0015 delivered the Current Workout foundation and Dashboard start handoff.
* RL-0021 delivered the Phase 2 design handoff.
* RL-0022 remains On Hold and must not resume during RL-0033.

---

## Required Document Checklist

| Document | Status |
| -------- | ------ |
| docs/PRODUCT_BRIEF.md | Present |
| docs/PROJECT_CONTEXT.md | Present |
| docs/ARCHITECTURE.md | Present |
| docs/EPIC_USER_STORY_TASKS.md | Present |
| docs/USER_JOURNEY.md | Present |
| docs/SCREEN_STRUCTURE.md | Present |
| user_stories/RL-0033/RL-0033_TASKS.md | Present |

---

## UX Routing Decision

UX Required:

```text
Yes
```

Reason:

* New screen introduced.
* Add Exercise bottom sheet introduced.
* Dashboard navigation changes.
* Planning-to-Current-Workout handoff affects the primary workflow.
* Empty, edit, delete, and ordering states need interaction guidance.

---

## User Approval Decision

User Approval Required:

```text
Yes
```

Reason:

* The story changes a primary planning workflow and the Dashboard-to-Current-Workout handoff.
* The user explicitly instructed the workflow to proceed until release.

Approval Evidence:

```text
User instructed Coordinator to start RL-0033 and not stop until release.
```

---

## Agent Invocation Sequence

1. UX Designer
2. User Story Interpreter
3. Code Writer
4. Code Reviewer
5. QA Tester
6. Release Manager
7. Coordinator

---

## Required Deliverables

* `user_stories/RL-0033/RL-0033_SPRINT_PLAN.md`
* `user_stories/RL-0033/RL-0033_UX_SPEC.md`
* `user_stories/RL-0033/RL-0033_INTERPRETATION.md`
* `user_stories/RL-0033/RL-0033_IMPLEMENTATION_NOTES.md`
* `user_stories/RL-0033/RL-0033_CODE_REVIEW.md`
* `user_stories/RL-0033/RL-0033_QA_REPORT.md`
* `user_stories/RL-0033/RL-0033_RELEASE_NOTE.md`
* `docs/EPIC_USER_STORY_TASKS.md`
* `docs/SPRINT_PLAN.md`
* `DEVELOPMENT_LOG.md`

---

## Risks Or Blockers

* Persistence must remain backward-compatible with existing workout logs.
* Existing completed workout behavior and XP idempotency must remain intact.
* The plan builder must not become a full Week planner, template builder, or history editor.
* The approved design includes a reorder affordance, but RL-0033 only requires insertion order.
* Widget tests involving Hive-backed callbacks may require focused service/widget coverage rather than speculative production changes.

---

## Success Criteria

* Dependencies are validated.
* UX spec exists because UX Required is Yes.
* Interpretation maps all acceptance criteria into implementation-ready requirements.
* Implementation provides one local daily session with title and ordered exercises.
* Tests or QA evidence cover create, add multiple, edit, delete, insertion order, persistence, Dashboard handoff, Current Workout handoff, and empty-state behavior.
* Code Review final decision is Approved.
* QA final decision is Pass.
* Release Manager closes RL-0033 as Done and returns control to Coordinator.

---

## Agent Handoff

Current Agent:

```text
Release Manager
```

Completed Output:

```text
docs/SPRINT_PLAN.md
user_stories/RL-0033/RL-0033_SPRINT_PLAN.md
docs/EPIC_USER_STORY_TASKS.md
user_stories/RL-0033/RL-0033_UX_SPEC.md
user_stories/RL-0033/RL-0033_INTERPRETATION.md
user_stories/RL-0033/RL-0033_IMPLEMENTATION_NOTES.md
user_stories/RL-0033/RL-0033_CODE_REVIEW.md
user_stories/RL-0033/RL-0033_QA_REPORT.md
user_stories/RL-0033/RL-0033_RELEASE_NOTE.md
DEVELOPMENT_LOG.md
```

Next Agent:

```text
Coordinator
```

Next Prompt:

```text
Review RL-0033 release completion, then decide whether to resume RL-0022 from On Hold now that the workout-composition prerequisite is Done.
```

Required Input Files:

* `docs/PRODUCT_BRIEF.md`
* `docs/PROJECT_CONTEXT.md`
* `docs/ARCHITECTURE.md`
* `docs/EPIC_USER_STORY_TASKS.md`
* `docs/USER_JOURNEY.md`
* `docs/SCREEN_STRUCTURE.md`
* `user_stories/RL-0033/RL-0033_TASKS.md`
* `user_stories/RL-0033/RL-0033_SPRINT_PLAN.md`
* `user_stories/RL-0021/RL-0021_UX_SPEC.md`
* `design/approved/09_workout_plan_builder.png`
* `design/approved/10_add_exercise.png`

Expected Output:

* Coordinator routing decision for the next story.

Blocking Conditions:

* Stop if required source documents are missing.
* Stop if direct dependencies are no longer Done.
* Do not continue RL-0022 during this story.

Instructions:

* Keep UX scoped to Workout Plan Builder and Add Exercise.
* Do not add future Week, Summary, History, Achievement, timer, sorting, or template behavior.
* Return control to Coordinator after release completion.
