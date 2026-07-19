# RL-0034 Sprint Plan

## Document Metadata

Story ID:

```text
RL-0034
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
2026-07-20
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
2. docs/PROJECT_CONTEXT.md
3. docs/ARCHITECTURE.md
4. docs/PRODUCT_BRIEF.md

---

## Story Selection Reason

Decision Point:

```text
Initial Selection
```

Inputs Considered:

* User approval to proceed with Coordinator routing starting with Solution Architect
* docs/EPIC_USER_STORY_TASKS.md
* docs/SPRINT_PLAN.md
* docs/PROJECT_CONTEXT.md
* docs/ARCHITECTURE.md
* user_stories/RL-0034/RL-0034_TASKS.md
* lib/features/current_workout/screens/current_workout_screen.dart

Selection criteria:

* Highest priority
* MVP alignment
* Dependencies resolved
* Lowest implementation risk
* Highest user value

Selection Summary:

```text
Selected because RL-0034 is the newly approved P0 behavior-preserving structural refactor that reduces regression risk before additional Current Workout-heavy stories, and all of its direct dependencies are Done.
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

| Field                  | Value |
| ---------------------- | ----- |
| Story ID               | RL-0034 |
| Epic                   | EP-12 Current Workout Structural Refactor |
| Priority               | P0 |
| MVP                    | Must Have |
| Depends On             | RL-0016, RL-0018, RL-0022, RL-0023 |
| UX Required            | No |
| User Approval Required | No |

---

## User Story

```text
As a development team,
I want Current Workout split into smaller behavior-preserving modules,
so that upcoming workout-flow features can be implemented with lower regression risk.
```

---

## Acceptance Criteria

* `CurrentWorkoutScreen` remains the route-level screen entry point.
* Rest timer overlay UI is extracted from `current_workout_screen.dart` into a focused widget/module without changing user-facing behavior.
* Current-session adjustment UI is extracted from `current_workout_screen.dart` into a focused widget/module without changing user-facing behavior.
* Current Workout display cards/widgets are extracted into focused widget files where doing so does not alter behavior.
* Pure workout-progress calculations or state-transition helpers are extracted only when focused tests can preserve current behavior.
* No UX redesign, new feature behavior, persistence schema change, new dependency, backend, login, cloud sync, or broad state-management migration is introduced.
* Focused Current Workout widget tests, relevant service tests, `flutter analyze`, and diff hygiene pass or known harness limitations are documented.

```text
docs/EPIC_USER_STORY_TASKS.md
```

---

## Execution Scope

In Scope:

* Behavior-preserving extraction from `current_workout_screen.dart`.
* Current Workout rest overlay, adjustment sheet, display widgets, and pure helpers where safe.
* Import cleanup and file responsibility clarification.
* Focused validation of existing Current Workout behavior.

Out Of Scope:

* Future stories
* Nice-to-have improvements
* Unapproved refactoring
* Architecture changes beyond the approved extraction boundary
* UX redesign
* New workout behavior
* Persistence schema changes
* New dependencies
* Backend, login, or cloud sync
* Broad Riverpod or global state migration

---

## Dependency Validation

Dependencies:

```text
RL-0016, RL-0018, RL-0022, RL-0023
```

Validation Result:

```text
All dependencies are complete.
```

---

## Required Document Checklist

| Document | Status |
| -------- | ------ |
| docs/PRODUCT_BRIEF.md | Present |
| docs/PROJECT_CONTEXT.md | Present |
| docs/ARCHITECTURE.md | Present |
| docs/EPIC_USER_STORY_TASKS.md | Present |
| user_stories/RL-0034/RL-0034_TASKS.md | Present |

---

## UX Routing Decision

UX Required:

```text
No
```

Reason:

```text
Existing UI and interaction behavior must be preserved. No UX redesign or visual behavior change is approved.
```

---

## User Approval Decision

User Approval Required:

```text
No
```

Reason:

```text
The story is a behavior-preserving internal refactor with no user-facing behavior, security, permission, integration, billing, or primary UX change.
```

---

## Agent Handoff

Current Agent:

```text
Coordinator
```

Completed Output:

```text
user_stories/RL-0034/RL-0034_SPRINT_PLAN.md
docs/SPRINT_PLAN.md
docs/EPIC_USER_STORY_TASKS.md
```

Next Agent:

```text
User Story Interpreter
```

Next Prompt:

```text
AI_Agents/prompts/interpret_user_story.md
```

Required Input Files:

- docs/PROJECT_CONTEXT.md
- docs/ARCHITECTURE.md
- docs/EPIC_USER_STORY_TASKS.md
- user_stories/RL-0034/RL-0034_TASKS.md
- user_stories/RL-0034/RL-0034_SPRINT_PLAN.md

Expected Output:

- user_stories/RL-0034/RL-0034_INTERPRETATION.md

Blocking Conditions:

- Stop if interpretation requires UX redesign, new behavior, persistence schema changes, new dependencies, backend, login, cloud sync, or broad state-management migration.
