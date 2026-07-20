# RL-0032 Sprint Plan

## Document Metadata

Story ID:

```text
RL-0032
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

1. User instructions
2. docs/EPIC_USER_STORY_TASKS.md
3. docs/DEVELOPMENT_LOG.md
4. Latest story output files
5. docs/ARCHITECTURE.md
6. docs/PROJECT_CONTEXT.md
7. docs/PRODUCT_BRIEF.md

---

## Story Selection Reason

Decision Point:

```text
Next Story Selection After RL-0024
```

Inputs Considered:

* User instruction to continue as Coordinator
* `/Users/jounghwapak/Developer/AI_Agents/system/coordinator.md`
* `docs/PRODUCT_BRIEF.md`
* `docs/PROJECT_CONTEXT.md`
* `docs/ARCHITECTURE.md`
* `docs/EPIC_USER_STORY_TASKS.md`
* `docs/SPRINT_PLAN.md`
* `docs/DEVELOPMENT_LOG.md`
* `user_stories/RL-0032/RL-0032_TASKS.md`
* `user_stories/RL-0018/RL-0018_RELEASE_NOTE.md`
* `user_stories/RL-0023/RL-0023_RELEASE_NOTE.md`
* `user_stories/RL-0034/RL-0034_RELEASE_NOTE.md`
* `design/approved/03_timer.png`

Selection Summary:

```text
RL-0032 is the next eligible story after RL-0024 release. It builds on completed Rest Timer overlay, Current Workout control states, and Current Workout structural refactor work to add active-workout rest timer continuity across allowed navigation.
```

Previous Story State:

```text
In Progress
```

New Story State:

```text
Done
```

---

## Story Snapshot

| Field | Value |
| ----- | ----- |
| Story ID | RL-0032 |
| Epic | EP-14 Cross-Screen Rest Timer Continuity |
| Priority | P1 |
| MVP | Should Have |
| Depends On | RL-0018, RL-0023, RL-0034 |
| UX Required | Yes |
| User Approval Required | Yes |

---

## User Story

```text
As a user resting during an active workout,
I want the timer to survive navigation and give me a way back to the workout,
so that rest remains connected to the workout flow across screens.
```

---

## Acceptance Criteria

* Builds on the Rest Timer overlay from `RL-0018`.
* Timer survives allowed navigation during an active workout flow.
* Global/floating timer state remains visible or recoverable where it supports active workout continuity.
* Users have a clear return-to-workout entry point from active timer state.
* Active timer state persists during the workout flow without introducing backend, login, cloud sync, or cross-device behavior.
* Timer continuity remains scoped to active workout flow and is not a Dashboard feature, standalone timer mode, or background service outside the app.
* QA covers navigation survival, active timer state, return-to-workout entry, and cleanup when rest/workout ends.

---

## Execution Scope

In Scope:

* Cross-screen rest timer continuity during an active workout flow.
* Recoverable or visible active timer state where it supports workout continuity.
* Return-to-workout entry behavior from active timer state.
* Cleanup behavior when rest or workout ends.
* Preservation of completed RL-0018 overlay and RL-0023 Current Workout control behavior.

Out Of Scope:

* Standalone timer mode.
* Dashboard-owned timer feature.
* Backend, login, cloud sync, cross-device sync, or background service behavior.
* Rewriting Current Workout state management broadly.
* Future Phase 2 screen QA and integration QA stories.

---

## Dependency Validation

Dependencies:

```text
RL-0018, RL-0023, RL-0034
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
| user_stories/RL-0032/RL-0032_TASKS.md | Present |
| design/approved/03_timer.png | Present |

---

## UX Routing Decision

UX Required:

```text
Yes
```

Reason:

```text
The story changes cross-screen navigation behavior, active timer recovery, return-to-workout affordances, and interaction continuity in the primary workout flow.
```

Next Agent:

```text
Completed
```

Next Prompt:

```text
None
```

---

## User Approval Decision

User Approval Required:

```text
Yes
```

Reason:

```text
The story changes a primary workout-flow experience and navigation behavior during an active workout.
```

---

## Risks

| Risk | Impact | Mitigation |
| ---- | ------ | ---------- |
| Timer continuity expands into a Dashboard feature or standalone timer. | Scope creep and responsibility confusion. | Keep continuity scoped to active workout flow only. |
| Active timer state persists after rest or workout completion. | Stale state could confuse users. | Require cleanup behavior in UX, interpretation, implementation, and QA. |
| Navigation survival changes existing Current Workout controls. | Regression risk in pause, skip, adjust, and completion behavior. | Build from RL-0018, RL-0023, and RL-0034 artifacts and require focused regression checks. |

---

## Definition Of Ready

The story is ready when:

* Dependencies are resolved.
* Required documents exist.
* Acceptance criteria are testable.
* Scope boundaries are clear.
* UX routing decision is complete.

---

## Release Validation

| Validation Item | Result | Notes |
| --------------- | ------ | ----- |
| UX Specification | Completed | `user_stories/RL-0032/RL-0032_UX_SPEC.md` created and QA validated. |
| Interpretation | Completed | `user_stories/RL-0032/RL-0032_INTERPRETATION.md` created. |
| Implementation Notes | Completed | `user_stories/RL-0032/RL-0032_IMPLEMENTATION_NOTES.md` created. |
| Code Review | Approved | `user_stories/RL-0032/RL-0032_CODE_REVIEW.md` approved. |
| QA | Passed | `user_stories/RL-0032/RL-0032_QA_REPORT.md` passed. |
| User Approval | Approved | Explicit user instruction to continue until release completion on 2026-07-20. |
| Release Note | Completed | `user_stories/RL-0032/RL-0032_RELEASE_NOTE.md` created. |

---

## Agent Handoff

Current Agent:

```text
Release Manager
```

Completed Output:

```text
docs/EPIC_USER_STORY_TASKS.md
docs/SPRINT_PLAN.md
user_stories/RL-0032/RL-0032_SPRINT_PLAN.md
user_stories/RL-0032/RL-0032_RELEASE_NOTE.md
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

- docs/PRODUCT_BRIEF.md
- docs/PROJECT_CONTEXT.md
- docs/ARCHITECTURE.md
- docs/EPIC_USER_STORY_TASKS.md
- user_stories/RL-0032/RL-0032_TASKS.md
- user_stories/RL-0032/RL-0032_SPRINT_PLAN.md
- user_stories/RL-0032/RL-0032_RELEASE_NOTE.md

Optional Input Files:

- docs/DEVELOPMENT_LOG.md

Expected Output:

- Next eligible story selection

Blocking Conditions:

- Stop if no eligible next story exists.

Instructions:

- Preserve completed RL-0032 release artifacts.
- Select the next eligible story from the current backlog state.
