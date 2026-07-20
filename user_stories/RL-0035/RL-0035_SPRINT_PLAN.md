# RL-0035 Sprint Plan

## Document Metadata

Story ID:

```text
RL-0035
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
3. docs/PROJECT_CONTEXT.md
4. docs/ARCHITECTURE.md
5. docs/PRODUCT_BRIEF.md

---

## Story Selection Reason

Decision Point:

```text
Bug Intake
```

Inputs Considered:

* User-reported weekly session progress bug
* docs/PRODUCT_BRIEF.md
* docs/PROJECT_CONTEXT.md
* docs/ARCHITECTURE.md
* docs/EPIC_USER_STORY_TASKS.md
* docs/SPRINT_PLAN.md
* lib/data/services/weekly_goal_service.dart
* lib/features/workout_plan/screens/workout_plan_builder_screen.dart
* lib/features/current_workout/screens/current_workout_screen.dart

Selection Summary:

```text
Selected because Weekly Progress is a completed P0 consistency feature and the current daily-session model can overcount one session as multiple workouts when the session contains multiple completed exercise logs.
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
| Story ID | RL-0035 |
| Epic | EP-06 Weekly Goals |
| Priority | P0 |
| MVP | Must Have |
| Depends On | RL-0008, RL-0033 |
| UX Required | No |
| User Approval Required | Yes |

---

## User Story

```text
As a beginner fitness user,
I want Weekly Progress to count completed workout sessions instead of completed exercises,
so that my weekly goal reflects how many days/sessions I showed up rather than how many exercises were inside one session.
```

---

## Acceptance Criteria

* Weekly Progress counts completed daily workout sessions, not completed exercise rows.
* Completing one daily session increases Weekly Progress by exactly 1 regardless of how many exercises are completed in that session.
* Multiple completed exercises with the same session date count as one completed workout session.
* The same completed session is not counted more than once.
* Existing Monday-to-Sunday weekly boundary behavior remains unchanged.
* Incomplete exercises do not count toward Weekly Progress.
* No Hive schema migration, backend, login, cloud sync, or broad workout-history redesign is introduced.

---

## Execution Scope

In Scope:

* Weekly goal progress calculation.
* Focused service tests for duplicate exercise rows within one daily session.
* Existing Home Dashboard and Workout Summary consumers of `WeeklyGoalService`.

Out Of Scope:

* UX redesign.
* New session persistence model.
* XP reward changes.
* Achievement, share-card, Week, History, or timer feature expansion.

---

## Dependency Validation

Dependencies:

```text
RL-0008, RL-0033
```

Validation Result:

```text
All dependencies are complete.
```

---

## UX Routing Decision

UX Required:

```text
No
```

Reason:

```text
The fix changes service-level counting semantics only. Existing Dashboard and Summary UI reuse the corrected progress value without new layout, navigation, or interaction decisions.
```

---

## User Approval Decision

User Approval Required:

```text
Yes
```

Reason:

```text
The user explicitly reported the bug from manual validation and requested the workflow to fix it.
```

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
user_stories/RL-0035/RL-0035_TASKS.md
user_stories/RL-0035/RL-0035_SPRINT_PLAN.md
user_stories/RL-0035/RL-0035_INTERPRETATION.md
user_stories/RL-0035/RL-0035_IMPLEMENTATION_NOTES.md
user_stories/RL-0035/RL-0035_CODE_REVIEW.md
user_stories/RL-0035/RL-0035_QA_REPORT.md
user_stories/RL-0035/RL-0035_RELEASE_NOTE.md
docs/DEVELOPMENT_LOG.md
```

Next Agent:

```text
Coordinator
```

Next Prompt:

```text
/Users/jounghwapak/Developer/AI_Agents/prompts/create_sprint_plan.md
```

Expected Output:

```text
Next story selection after RL-0035.
```
