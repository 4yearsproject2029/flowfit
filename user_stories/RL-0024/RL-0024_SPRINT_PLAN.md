# RL-0024 Sprint Plan

## Document Metadata

Story ID:

```text
RL-0024
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
Next Story Selection After RL-0035
```

Inputs Considered:

* User instruction to continue as Coordinator
* `/Users/jounghwapak/Developer/AI_Agents/system/coordinator.md`
* `docs/PRODUCT_BRIEF.md`
* `docs/PROJECT_CONTEXT.md`
* `docs/ARCHITECTURE.md`
* `docs/EPIC_USER_STORY_TASKS.md`
* `docs/SPRINT_PLAN.md`
* `user_stories/RL-0024/RL-0024_TASKS.md`
* `user_stories/RL-0016/RL-0016_UX_SPEC.md`
* `design/approved/04_workkout_summary.png`

Selection Summary:

```text
RL-0024 is the next eligible P0 Must Have story after RL-0035 release. It builds on completed RL-0016 and adds the private details, optional sharing, Plan Tomorrow, Back to Dashboard, privacy, and Summary/History separation behavior that RL-0016 explicitly deferred.
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
| Story ID | RL-0024 |
| Epic | EP-13 Workout Summary Private Details And Sharing |
| Priority | P0 |
| MVP | Must Have |
| Depends On | RL-0016 |
| UX Required | Yes |
| User Approval Required | Yes |

---

## User Story

```text
As a user reviewing a completed workout,
I want private session details and optional sharing to be available only from the completion summary,
so that I can celebrate without weakening privacy.
```

---

## Acceptance Criteria

* Builds on the immediate Workout Summary from `RL-0016`.
* Private session details such as duration, volume, calories, sets, or moment of day appear only in the completion-summary context where locally available.
* Optional share-card generation is available only as a user-initiated action.
* Existing share-card privacy defaults remain intact and performance metrics remain hidden unless explicitly opted in by existing rules.
* Plan Tomorrow and Back to Dashboard actions return users to the correct journey without reopening History as Summary.
* History cannot reopen the celebration summary state.

---

## Dependency Validation

Dependencies:

```text
RL-0016
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
| user_stories/RL-0024/RL-0024_TASKS.md | Present |
| design/approved/04_workkout_summary.png | Present |
| user_stories/RL-0016/RL-0016_UX_SPEC.md | Present |

---

## UX Routing Decision

UX Required:

```text
Yes
```

Reason:

```text
The story changes primary Workout Summary interactions, navigation behavior, privacy-sensitive detail presentation, and optional sharing entry points.
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
The story changes a primary user experience and includes optional sharing/privacy behavior.
```

Approval Evidence:

```text
Approved by explicit user workflow instruction to continue until release is complete on 2026-07-20.
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
docs/DEVELOPMENT_LOG.md
user_stories/RL-0024/RL-0024_RELEASE_NOTE.md
```

Next Agent:

```text
Coordinator
```

Required Input Files:

* `docs/PRODUCT_BRIEF.md`
* `docs/PROJECT_CONTEXT.md`
* `docs/ARCHITECTURE.md`
* `docs/EPIC_USER_STORY_TASKS.md`
* `docs/USER_JOURNEY.md`
* `user_stories/RL-0024/RL-0024_TASKS.md`
* `user_stories/RL-0024/RL-0024_SPRINT_PLAN.md`
* `user_stories/RL-0016/RL-0016_UX_SPEC.md`
* `design/approved/04_workkout_summary.png`

Expected Output:

```text
Next story selection
```

Success Criteria:

* RL-0024 is marked Done in backlog and story artifacts.
* RL-0024 release note and development log entry are present.
* Coordinator can select the next eligible story.
