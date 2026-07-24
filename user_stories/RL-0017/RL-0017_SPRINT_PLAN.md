# RL-0017 Sprint Plan

## Document Metadata

Story ID:

```text
RL-0017
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
* user_stories/RL-0017/RL-0017_TASKS.md
* Latest RL-0032 release handoff

Selection criteria:

* Highest priority
* MVP alignment
* Dependencies resolved
* Lowest implementation risk
* Highest user value

Selection Summary:

```text
RL-0017 is the next eligible Phase 2 P1 story after RL-0032 release. It is Not Started, its dependencies RL-0014 and RL-0021 are Done, and it unlocks planned-session detail/start-today and read-only History work in RL-0025 and RL-0026.
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
| Story ID | RL-0017 |
| Epic | EP-14 Week Planning |
| Priority | P1 |
| MVP | Should Have |
| Depends On | RL-0014, RL-0021 |
| UX Required | Yes |
| User Approval Required | Yes |

---

## User Story

```text
As a user planning my week,
I want Week to show my local planned sessions by day,
so that I can understand the week without mixing planning with Dashboard or History review.
```

---

## Acceptance Criteria

* Uses `design/approved/05_weekly_plan.png` for approved Week layout and screen composition.
* Week owns screen structure, day navigation, planned session display, and existing local data presentation.
* Week may reuse existing workout creation behavior when necessary.
* Week does not own new inline editors, advanced planning tools, rescheduling systems, or new autosave experiences.
* Week does not display read-only history as its primary purpose.
* Week can show a session preview entry point, but detailed planned/session detail and Start Today behavior are deferred to `RL-0025`.
* History list and completed Workout Detail behavior are deferred to `RL-0026` and `RL-0027`.

```text
docs/EPIC_USER_STORY_TASKS.md
```

---

## Execution Scope

In Scope:

* Create the Week screen structure using the approved weekly plan design.
* Add day navigation for the current local week.
* Display locally saved planned workout sessions for the selected day.
* Reuse the existing Workout Plan Builder when the selected day has no plan or the user chooses to plan.
* Keep the Week surface separate from Dashboard, History, and Workout Detail responsibilities.

Out Of Scope:

* Future stories
* Nice-to-have improvements
* Unapproved refactoring
* Architecture changes
* New inline editors, advanced planning tools, rescheduling systems, or autosave experiences
* Planned Session Detail and Start Today behavior owned by RL-0025
* History list and completed Workout Detail behavior owned by RL-0026 and RL-0027

---

## Dependency Validation

Dependencies:

```text
- RL-0014: Done
- RL-0021: Done
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
| user_stories/RL-0017/RL-0017_TASKS.md | Present |

---

## UX Routing Decision

UX Required:

```text
Yes
```

Reason:

* New screen introduced
* Navigation changed
* Visual hierarchy affects user understanding
* Accessibility-sensitive workflow
* Story changes a primary workflow

---

## User Approval Decision

User Approval Required:

```text
Yes
```

Reason:

* RL-0017 changes the primary Week planning experience.
* The backlog marks user approval required for this story.
* The user instructed the workflow to continue without stopping through release.

---

## Risks

| Risk | Impact | Mitigation |
| ---- | ------ | ---------- |
| Week and Dashboard responsibilities overlap | User confusion about where to plan versus where to start today | Week will own weekly planning and selected-day preview; Dashboard remains today's focus. |
| RL-0025 scope leaks into RL-0017 | Planned-session detail/start-today behavior ships before its story | Keep RL-0017 preview-only and route plan/edit behavior to the existing builder. |
| Existing local session data is sparse | Empty or rest-day states may look broken | Define clear empty and planned-rest states in UX and QA. |

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

* `user_stories/RL-0017/RL-0017_CODE_REVIEW.md` approved.
* `user_stories/RL-0017/RL-0017_QA_REPORT.md` passed.
* `user_stories/RL-0017/RL-0017_RELEASE_NOTE.md` completed.
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
user_stories/RL-0017/RL-0017_RELEASE_NOTE.md
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

- user_stories/RL-0017/RL-0017_RELEASE_NOTE.md

Expected Output:

- Next story selection and sprint plan update

Blocking Conditions:

- Stop if no eligible story exists.

Instructions:

- Preserve completed RL-0017 release artifacts.
- Select the next eligible story from the current backlog state.
