# RL-0025 Sprint Plan

## Document Metadata

Story ID:

```text
RL-0025
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
2026-07-24
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

* docs/EPIC_USER_STORY_TASKS.md
* docs/SPRINT_PLAN.md
* docs/DEVELOPMENT_LOG.md
* user_stories/RL-0025/RL-0025_TASKS.md
* Latest RL-0017 release handoff

Selection criteria:

* Highest priority
* MVP alignment
* Dependencies resolved
* Lowest implementation risk
* Highest user value

Selection Summary:

```text
RL-0025 is the next eligible Phase 2 P1 story after RL-0017 release. It extends the Week planning journey with planned-session detail and Start Today handoff, and its dependencies RL-0017, RL-0015, and RL-0033 are Done.
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
| Story ID | RL-0025 |
| Epic | EP-14 Planned Session Detail And Start Today |
| Priority | P1 |
| MVP | Should Have |
| Depends On | RL-0017, RL-0015, RL-0033 |
| UX Required | Yes |
| User Approval Required | Yes |

---

## User Story

```text
As a user viewing a planned session,
I want a focused detail screen that can start today's workout,
so that planning can hand off cleanly to Current Workout.
```

---

## Acceptance Criteria

* Uses `design/approved/08_workout_detail.png` only for planned/session detail that can start a workout.
* Planned Session Detail displays session name, exercises, sets/reps, notes, and Start Workout or Start Today action where appropriate.
* Start Workout hands off to Current Workout using the locally saved composed session without creating duplicate completed records.
* Planned/session detail remains separate from completed History detail.
* Local persistence preserves planned workout data and active workout handoff state.
* QA covers Week -> planned detail -> Start Today -> Current Workout navigation.

```text
docs/EPIC_USER_STORY_TASKS.md
```

---

## Execution Scope

In Scope:

* Add a planned session detail screen for saved local workout sessions.
* Open planned detail from Week session preview.
* Display session title, selected date, exercises, sets, reps, weight, and notes where locally available.
* Add Start Today or Start Workout action when a planned session can hand off to Current Workout.
* Hand off to Current Workout with existing saved `WorkoutLog` rows without creating records.
* Preserve local-first persistence behavior.

Out Of Scope:

* Future stories
* Nice-to-have improvements
* Unapproved refactoring
* Architecture changes
* Completed History detail behavior owned by RL-0027
* History list behavior owned by RL-0026
* Editing planned sessions inside detail
* Backend, login, cloud sync, templates, recurring plans, or multi-session scheduling

---

## Dependency Validation

Dependencies:

```text
- RL-0017: Done
- RL-0015: Done
- RL-0033: Done
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
| user_stories/RL-0025/RL-0025_TASKS.md | Present |

---

## UX Routing Decision

UX Required:

```text
Yes
```

Reason:

* New screen introduced
* Navigation changed
* Complex interaction flow
* Accessibility-sensitive workflow
* Story changes a primary workflow

---

## User Approval Decision

User Approval Required:

```text
Yes
```

Reason:

* RL-0025 changes Week -> planned detail -> Current Workout handoff behavior.
* The backlog marks user approval required for this story.
* The user instructed the workflow to continue.

---

## Risks

| Risk | Impact | Mitigation |
| ---- | ------ | ---------- |
| Planned detail duplicates History detail | Journey responsibilities blur before RL-0026/RL-0027 | Scope detail to planned sessions only and avoid completed-history entry points. |
| Start handoff creates duplicate completed records | Local data could become misleading | Pass existing selected-date `WorkoutLog` rows to Current Workout without creating records. |
| Week preview becomes an editor | Scope expands beyond RL-0025 | Keep editing in the existing Workout Plan Builder and detail display-focused. |

---

## Definition Of Ready

The story is ready when:

* Dependencies are resolved.
* Required documents exist.
* Acceptance criteria are testable.
* Scope boundaries are clear.
* UX routing decision is complete.

---

## Release Closeout

Status:

```text
Done
```

Release Evidence:

* `user_stories/RL-0025/RL-0025_CODE_REVIEW.md` approved.
* `user_stories/RL-0025/RL-0025_QA_REPORT.md` passed.
* `user_stories/RL-0025/RL-0025_RELEASE_NOTE.md` completed.
* `docs/EPIC_USER_STORY_TASKS.md` updated to Done.
* `docs/DEVELOPMENT_LOG.md` updated.

---

## Agent Handoff

Current Agent:

```text
Release Manager Agent
```

Completed Output:

```text
user_stories/RL-0025/RL-0025_RELEASE_NOTE.md
docs/EPIC_USER_STORY_TASKS.md
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

Required Input Files:

- docs/EPIC_USER_STORY_TASKS.md
- docs/SPRINT_PLAN.md
- docs/DEVELOPMENT_LOG.md

Optional Input Files:

- user_stories/RL-0025/RL-0025_RELEASE_NOTE.md

Expected Output:

- Next story selection and sprint plan update

Blocking Conditions:

- Stop if no eligible story exists.

Instructions:

- Preserve completed RL-0025 release artifacts.
- Select the next eligible story from the current backlog state.
