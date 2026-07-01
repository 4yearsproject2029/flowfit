# Epic User Story Tasks

This document is the single source of truth for the project backlog.

---

## Document Metadata

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
2026-06-20
```

Last Updated:

```text
2026-06-30
```

Owner:

```text
Business Analyst Agent
```

Status:

```text
Active
```

---

## Source Of Truth

Priority order when conflicts exist:

1. User instructions
2. `docs/PRODUCT_BRIEF.md`
3. `docs/PROJECT_CONTEXT.md`
4. `docs/ARCHITECTURE.md`
5. `docs/EPIC_USER_STORY_TASKS.md`

---

## Backlog Governance Rules

Rules:

* This document is the backlog source of truth.
* Story IDs use the `RL-0000` sequence and must never be reused.
* Preserve existing Story IDs whenever possible.
* Done stories are immutable.
* Canceled stories are immutable.
* Business Analyst may create only `Not Started` stories.
* Coordinator owns active status changes such as `In Progress`, `Blocked`, and `On Hold`.
* Release Manager owns completion status changes such as `Done`.
* No backend, login, cloud sync, social graph, public ranking, or external analytics SDK may be introduced into MVP stories unless approved product direction changes.

---

## Project Information

Project Name:

```text
RepLog
```

Project Prefix:

```text
RL
```

---

## Story ID Rules

Format:

```text
RL-0001
```

Rules:

* Story IDs must be unique.
* Story IDs must not be renumbered.
* Completed stories keep their IDs permanently.
* Canceled stories keep their IDs permanently.
* Split stories receive new IDs.
* The next new Story ID after the current backlog is `RL-0014`.

---

## Status Definitions

| Status | Description | Owner Agent |
| ------ | ----------- | ----------- |
| Not Started | Work has not begun. | Business Analyst |
| In Progress | Work is actively being developed. | Coordinator |
| Blocked | Work cannot continue due to dependencies or external constraints. | Coordinator |
| On Hold | Work is intentionally postponed. | Coordinator |
| Done | Work completed and approved. | Release Manager |
| Canceled | Work permanently removed from scope. | Release Manager |

Default status:

```text
Not Started
```

---

## Priority Definitions

| Priority | Description |
| -------- | ----------- |
| P0 | Critical for MVP |
| P1 | Important for MVP |
| P2 | Post-MVP enhancement |
| P3 | Low priority |

Prioritization order:

1. User value
2. MVP scope
3. Dependency resolution
4. Implementation risk
5. Downstream unblock impact

---

## Effort Definitions

| Effort | Description |
| ------ | ----------- |
| XS | Less than 0.5 day |
| S | 1 day |
| M | 2-3 days |
| L | 4-5 days |
| XL | More than 1 week |

---

## Epic Summary

| Epic ID | Epic | Goal | Priority | Status |
| ------- | ---- | ---- | -------- | ------ |
| EP-00 | Development Environment | Prepare the local Flutter and Hive project foundation so future RepLog stories can be implemented consistently. | P0 | Done |
| EP-01 | Brand Readiness | Present the app consistently as RepLog before introducing new habit-building features. | P0 | Done |
| EP-02 | Onboarding | Let users choose a realistic weekly workout goal before entering the main experience. | P0 | Done |
| EP-03 | Workout Logging | Preserve and improve fast workout logging and completion recognition. | P0 | Done |
| EP-04 | Offline Experience | Ensure core RepLog data persists locally and requires no network or account. | P0 | Done |
| EP-05 | Gamification | Reward showing up through XP and visible level progress. | P0 | Done |
| EP-06 | Weekly Goals | Track weekly consistency and encourage recovery without harsh punishment. | P0 | In Progress |
| EP-07 | Share Cards | Let users optionally celebrate progress with privacy-conscious share cards. | P1 | Not Started |
| EP-08 | Privacy | Give users control over metrics shown on share cards. | P1 | Not Started |
| EP-09 | MVP Validation | Calculate local metrics that help evaluate whether RepLog improves consistency. | P1 | Not Started |
| EP-10 | MVP Quality | Validate the MVP experience for accessibility, reliability, and iPhone usability. | P1 | Not Started |

---

## Recommended Implementation Order

```text
RL-0000
↓
RL-0001
↓
RL-0002
↓
RL-0003
↓
RL-0005
↓
RL-0004
↓
RL-0006
↓
RL-0007
↓
RL-0008
↓
RL-0009
↓
RL-0010
↓
RL-0011
↓
RL-0012
↓
RL-0013
```

---

## User Story Backlog

| Status | Story ID | Epic ID | Epic | MVP | Priority | Effort | Depends On | UX Required | User Approval Required | User Story | Acceptance Criteria |
| ------ | -------- | ------- | ---- | --- | -------- | ------ | ---------- | ----------- | ---------------------- | ---------- | ------------------- |
| Done | RL-0000 | EP-00 | Development Environment | Must Have | P0 | XS | - | No | No | As a developer, I want to prepare the RepLog development environment, so that future stories can be implemented consistently. | - Flutter app runs locally.<br>- Hive initialization works.<br>- Existing tests pass.<br>- `docs/PRODUCT_BRIEF.md` exists.<br>- `docs/PROJECT_CONTEXT.md` exists.<br>- `docs/ARCHITECTURE.md` exists. |
| Done | RL-0001 | EP-01 | Brand Readiness | Must Have | P0 | S | RL-0000 | No | No | As a beginner fitness user, I want the app to consistently present itself as RepLog, so that I trust I am using the intended habit-building product. | - All visible app names use RepLog instead of FlowFit.<br>- README and user-facing documentation refer to RepLog where they describe the current product identity.<br>- App title and primary screen labels use RepLog.<br>- iOS display name uses RepLog.<br>- Existing workout logging behavior still works after the naming update.<br>- Dart package name, bundle identifier, Android namespace, generated project names, backend, login, sync, analytics SDK, XP, badges, goals, share cards, social graph, and public ranking are not added or changed. |
| Done | RL-0002 | EP-02 | Onboarding | Must Have | P0 | M | RL-0001 | Yes | No | As a beginner fitness user, I want to choose my weekly workout goal on first launch, so that RepLog can track consistency against a realistic target. | - First-time users choose a weekly goal before reaching the main experience.<br>- Goal options include at least 1-5 workouts per week.<br>- The selected goal is saved locally.<br>- Returning users skip onboarding.<br>- The goal persists after app restart. |
| Done | RL-0003 | EP-03 | Workout Logging | Must Have | P0 | M | RL-0001 | Yes | No | As a beginner fitness user, I want to log a workout quickly, so that recording exercise does not feel like extra work. | - Users can create a workout log for the selected date.<br>- Workout name and category are required.<br>- Sets, reps, weight, and memo are optional.<br>- A valid workout can be saved in three taps or fewer after opening the add flow.<br>- New workouts appear immediately in the selected date's list. |
| Done | RL-0005 | EP-03 | Workout Completion | Must Have | P0 | S | RL-0003 | No | No | As a user, I want to mark a workout as complete, so that RepLog can recognize that I showed up. | - Workouts can be marked complete from the list.<br>- Completed workouts are visually distinguishable.<br>- Completion can be toggled without deleting the workout.<br>- Completion updates immediately.<br>- Completion state persists after app restart. |
| Done | RL-0004 | EP-04 | Offline Experience | Must Have | P0 | S | RL-0002, RL-0005 | No | No | As a user, I want my workouts and goals to persist offline, so that I can use RepLog without an internet connection. | - Workout logs persist after app restart.<br>- Completion state persists after restart.<br>- Weekly goals and onboarding state persist after restart.<br>- No login or network connection is required.<br>- Users are informed that uninstalling the app or changing devices may result in data loss. |
| Done | RL-0006 | EP-05 | Gamification - XP | Must Have | P0 | L | RL-0005 | No | No | As a user, I want to earn XP when I complete a workout, so that I feel motivated to stay consistent. | - Completing a workout grants XP once.<br>- XP updates immediately.<br>- XP persists after app restart.<br>- Toggling, editing, deleting, or recreating workouts does not duplicate XP.<br>- Users can see why XP was awarded. |
| Done | RL-0007 | EP-05 | Gamification - Levels | Must Have | P0 | M | RL-0006 | Yes | No | As a user, I want to see my level and progress toward the next level, so that my consistency feels visible. | - The home screen displays current level.<br>- The app displays XP progress toward the next level.<br>- Progress updates immediately after XP changes.<br>- Levels never decrease.<br>- Level progress persists after app restart. |
| Done | RL-0008 | EP-06 | Weekly Goals | Must Have | P0 | M | RL-0002, RL-0005 | Yes | No | As a user, I want to see progress toward my weekly workout goal, so that I know whether I am staying consistent. | - The app displays the selected weekly goal.<br>- The app displays completed workouts for the current week.<br>- Progress updates immediately.<br>- Goal completion is recognized when the target is reached.<br>- Goal progress persists after app restart. |
| Done | RL-0009 | EP-06 | Consistency Recovery | Should Have | P1 | S | RL-0008 | Yes | No | As a user, I want RepLog to handle missed weeks without harsh punishment, so that I feel encouraged to return. | - Missing a workout week does not remove XP.<br>- Missing a workout week does not reduce levels.<br>- Returning after a missed week is detectable for metrics.<br>- The app displays encouraging language after returning.<br>- Planned rest days do not count as failures. |
| Not Started | RL-0010 | EP-07 | Share Cards | Must Have | P1 | L | RL-0006, RL-0007, RL-0008 | Yes | No | As a user, I want to create a share card for workout completion, level-up, or weekly goal completion, so that I can celebrate progress without exposing embarrassing numbers. | - Users can generate workout completion cards.<br>- Users can generate level-up cards.<br>- Users can generate weekly goal cards.<br>- Weight, sets, reps, calories, and PRs are hidden by default.<br>- Share card generation is optional and user-initiated. |
| Not Started | RL-0011 | EP-08 | Privacy | Should Have | P1 | M | RL-0010 | Yes | No | As a user, I want control over which metrics appear on share cards, so that I can share progress comfortably. | - Share cards show consistency-focused metrics by default.<br>- Users can preview cards before sharing.<br>- Hidden performance metrics require explicit opt-in.<br>- Share cards are never published automatically.<br>- Share preferences persist locally. |
| Not Started | RL-0012 | EP-09 | MVP Validation | Should Have | P1 | M | RL-0004, RL-0008, RL-0010 | No | No | As a product stakeholder, I want local MVP validation metrics, so that I can evaluate whether RepLog improves consistency. | - The app calculates weekly goal completion rate locally.<br>- The app calculates average workouts per week locally.<br>- The app calculates average share cards generated locally.<br>- The app detects returns after missed weeks.<br>- Metrics require no login or backend. |
| Not Started | RL-0013 | EP-10 | MVP Quality | Should Have | P1 | S | RL-0001, RL-0004, RL-0006, RL-0007, RL-0008, RL-0010 | Yes | Yes | As a beginner fitness user, I want the MVP experience to be accessible and reliable, so that I can use RepLog comfortably during workouts. | - Core screens use readable text and large touch targets.<br>- Primary flows work on common iPhone screen sizes.<br>- Offline logging, XP, levels, goals, and share cards pass manual QA.<br>- `flutter analyze` passes.<br>- `flutter test` passes. |

Allowed MVP values:

* Must Have
* Should Have
* Could Have
* Won't Have

Allowed UX Required values:

* Yes
* No

Allowed User Approval Required values:

* Yes
* No

---

## Task Breakdown Rules

Task files live at:

```text
user_stories/{{STORY_ID}}/{{STORY_ID}}_TASKS.md
```

Task format:

| Status | Task ID | Description | Owner Agent |
| ------ | ------- | ----------- | ----------- |
| Done | RL-0001-T01 | Interpret requirements | User Story Interpreter |
| Done | RL-0001-T02 | Implement feature | Code Writer |
| Done | RL-0001-T03 | Review implementation | Code Reviewer |
| Done | RL-0001-T04 | Execute QA tests | QA Tester |
| Done | RL-0001-T05 | Close story | Release Manager |

Allowed Owner Agent values:

* UX Designer
* User Story Interpreter
* Code Writer
* Code Reviewer
* QA Tester
* Release Manager

Task rules:

* Tasks must not introduce requirements absent from the User Story or Acceptance Criteria.
* Tasks must not assign work to Coordinator, Product Owner, Solution Architect, or Business Analyst.
* Existing story task files are preserved unless a later Business Analyst pass explicitly updates them.

---

## Dependency Rules

Rules:

* Avoid circular dependencies.
* Prefer small, independently implementable stories.
* Minimize blocked work.
* Dependencies must reference valid Story IDs.
* Done dependencies are satisfied.
* On Hold, Blocked, or Canceled dependencies require Coordinator review before story selection.

Dependency validation:

* `RL-0001` depends on completed `RL-0000`.
* `RL-0004` depends on `RL-0002` and `RL-0005` because its acceptance criteria include onboarding, weekly goal, workout log, and completion persistence.
* `RL-0013` depends on `RL-0007` because MVP quality must validate level progress as part of the approved MVP scope.
* No circular dependencies identified.

---

## Story Status Change Log

| Date | Story ID | Previous Status | New Status | Changed By | Reason |
| ---- | -------- | --------------- | ---------- | ---------- | ------ |
| 2026-06-20 | RL-0000 | Not Started | In Progress | Coordinator | Highest-priority development-environment story selected for kickoff. |
| 2026-06-20 | RL-0000 | In Progress | Done | Release Manager | Environment verification, QA, and release closeout completed. |
| 2026-06-30 | RL-0001 | Not Started | In Progress | Coordinator | Highest-priority eligible P0 story selected after RL-0000 completion. |
| 2026-06-30 | RL-0001 | In Progress | Done | Release Manager | Brand-readiness implementation approved, QA passed, and release closeout completed. |
| 2026-06-30 | RL-0002 | Not Started | In Progress | Coordinator | Next eligible P0 onboarding story selected after RL-0001 completion. |
| 2026-06-30 | RL-0002 | In Progress | Done | Release Manager | Onboarding implementation, manual QA, release closeout, and widget-test cleanup completed. |
| 2026-06-30 | RL-0003 | Not Started | In Progress | Coordinator | Next eligible P0 workout logging story selected after RL-0002 completion. |
| 2026-06-30 | RL-0003 | In Progress | Done | Release Manager | Workout logging refinement, QA, and release closeout completed. |
| 2026-06-30 | RL-0005 | Not Started | In Progress | Coordinator | Next eligible P0 workout completion story selected after RL-0003 completion. |
| 2026-06-30 | RL-0005 | In Progress | Done | Release Manager | Workout completion behavior, persistence coverage, QA, and release closeout completed. |
| 2026-06-30 | RL-0004 | Not Started | In Progress | Coordinator | Next eligible P0 offline experience story selected after RL-0005 completion. |
| 2026-06-30 | RL-0004 | In Progress | Done | Release Manager | Offline persistence baseline, local data-loss messaging, QA, and release closeout completed. |
| 2026-06-30 | RL-0006 | Not Started | In Progress | Coordinator | Next eligible P0 XP story selected after RL-0004 completion. |
| 2026-06-30 | RL-0006 | In Progress | Done | Release Manager | XP award behavior, duplicate prevention, persistence, QA, and release closeout completed. |
| 2026-06-30 | RL-0007 | Not Started | In Progress | Coordinator | Next eligible P0 levels story selected after RL-0006 completion. |
| 2026-06-30 | RL-0007 | In Progress | Done | Release Manager | Level progress display, persistence coverage, QA, and release closeout completed. |
| 2026-06-30 | RL-0008 | Not Started | In Progress | Coordinator | Next eligible P0 weekly goals story selected after RL-0007 completion. |
| 2026-06-30 | RL-0008 | In Progress | Done | Release Manager | Weekly goal progress display, persistence coverage, QA, and release closeout completed. |
| 2026-06-30 | RL-0009 | Not Started | In Progress | Coordinator | Next eligible consistency recovery story selected after RL-0008 completion. |
| 2026-06-30 | RL-0009 | In Progress | Done | Release Manager | Consistency recovery behavior, planned-rest handling, QA pass, and release closeout completed. |

---

## Metrics

| Metric | Value |
| ------ | ----- |
| Total Stories | 14 |
| Not Started | 4 |
| In Progress | 0 |
| Blocked | 0 |
| On Hold | 0 |
| Done | 10 |
| Canceled | 0 |

Completion Rate:

```text
10 / (14 - 0) = 71.4%
```

MVP Completion Rate:

```text
10 / (14 - 0) = 71.4%
```

---

## Backlog Update Summary

Stories added:

* None.

Stories removed:

* None.

Stories updated:

* `RL-0001`: Acceptance criteria clarified to preserve existing workout behavior and exclude package rename, bundle identifier changes, generated project renames, backend, login, sync, analytics SDK, XP, badges, goals, share cards, social graph, and public ranking.
* `RL-0002`: Status updated to Done after onboarding implementation, Code Review approval, QA pass, user manual testing confirmation, and release closeout.
* `RL-0005`: Status updated to Done after workout completion behavior verification, persistence regression coverage, Code Review approval, QA pass, and release closeout.
* `RL-0004`: Status updated to Done after offline persistence verification, local data-loss messaging, Code Review approval, QA pass, and release closeout.
* `RL-0006`: Status updated to Done after XP award behavior, duplicate prevention, persistence, Code Review approval, QA pass, and release closeout.
* `RL-0007`: Status updated to Done after level progress display, persistence coverage, Code Review approval, QA pass, and release closeout.
* `RL-0008`: Status updated to Done after weekly goal progress display, persistence coverage, Code Review approval, QA pass, and release closeout.
* `RL-0009`: Status updated to Done after consistency recovery behavior, planned-rest handling, Code Review approval, QA pass, and release closeout.
* `RL-0004`: Dependency updated from `RL-0005` to `RL-0002, RL-0005` because offline persistence acceptance criteria include onboarding and weekly goal state.
* `RL-0013`: Dependency updated to include `RL-0007`, and acceptance criteria now explicitly include levels in MVP manual QA.

Priority changes:

* None.

Reasoning:

* Existing stories still match the Product Brief, Project Context, and Architecture.
* Story IDs were preserved.
* Done story `RL-0000` was not modified beyond being represented in the template-compatible backlog.
* Updates were limited to traceability, dependency accuracy, acceptance-criteria clarity, and ADF v3 generated-document compliance.

---

## Related Documents

* `docs/PRODUCT_BRIEF.md`
* `docs/PROJECT_CONTEXT.md`
* `docs/ARCHITECTURE.md`
* `docs/REPLOG_CODEBASE_AUDIT.md`
* `docs/PRODUCT_OWNER_RL-0001_SELECTION.md`

---

## Revision History

| Version | Date | Author | Summary |
| ------- | ---- | ------ | ------- |
| v1.0 | 2026-06-20 | Business Analyst Agent | Initial RepLog backlog created with stories `RL-0000` through `RL-0013`. |
| v1.1 | 2026-06-30 | Business Analyst Agent | Revalidated backlog against Product Brief, Project Context, and Architecture; updated ADF v3 structure, dependency traceability, metrics, and Agent Handoff. |
| v1.2 | 2026-06-30 | Release Manager Agent | Closed RL-0002 as Done after onboarding release validation and final widget-test cleanup with 4 passing tests and 2 skipped callback-write tests. |
| v1.3 | 2026-06-30 | Release Manager Agent | Closed RL-0003 as Done after workout logging refinement, QA pass, and release closeout. |
| v1.4 | 2026-06-30 | Release Manager Agent | Closed RL-0005 as Done after workout completion verification, persistence test coverage, QA pass, and release closeout. |
| v1.5 | 2026-06-30 | Release Manager Agent | Closed RL-0004 as Done after offline persistence verification, local data-loss messaging, QA pass, and release closeout. |
| v1.6 | 2026-06-30 | Release Manager Agent | Closed RL-0006 as Done after XP award behavior, duplicate prevention, persistence, QA pass, and release closeout. |
| v1.7 | 2026-06-30 | Coordinator Agent | Selected RL-0007 as the next eligible P0 story and started the levels sprint. |
| v1.8 | 2026-06-30 | Release Manager Agent | Closed RL-0007 as Done after level progress display, persistence coverage, QA pass, and release closeout. |
| v1.9 | 2026-06-30 | Coordinator Agent | Selected RL-0008 as the next eligible P0 story and started the weekly goals sprint. |
| v1.10 | 2026-06-30 | Release Manager Agent | Closed RL-0008 as Done after weekly goal progress display, persistence coverage, QA pass, and release closeout. |
| v1.11 | 2026-06-30 | Coordinator Agent | Selected RL-0009 as the next eligible consistency recovery story and started the sprint. |
| v1.12 | 2026-06-30 | Release Manager Agent | Closed RL-0009 as Done after consistency recovery, planned-rest handling, QA pass, and release closeout. |

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
user_stories/RL-0009/RL-0009_SPRINT_PLAN.md
user_stories/RL-0009/RL-0009_INTERPRETATION.md
user_stories/RL-0009/RL-0009_UX_SPEC.md
user_stories/RL-0009/RL-0009_IMPLEMENTATION_NOTES.md
user_stories/RL-0009/RL-0009_CODE_REVIEW.md
user_stories/RL-0009/RL-0009_QA_REPORT.md
user_stories/RL-0009/RL-0009_RELEASE_NOTE.md
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

* `/Users/jounghwapak/Developer/AI_Agents/workflows/default_workflow_v3_final.md`
* `docs/PRODUCT_BRIEF.md`
* `docs/PROJECT_CONTEXT.md`
* `docs/ARCHITECTURE.md`
* `docs/EPIC_USER_STORY_TASKS.md`
* `docs/SPRINT_PLAN.md`
* `user_stories/RL-0009/RL-0009_TASKS.md`
* `user_stories/RL-0009/RL-0009_SPRINT_PLAN.md`
* `user_stories/RL-0009/RL-0009_INTERPRETATION.md`
* `user_stories/RL-0009/RL-0009_UX_SPEC.md`
* `user_stories/RL-0009/RL-0009_RELEASE_NOTE.md`

Optional Input Files:

* `docs/REPLOG_CODEBASE_AUDIT.md`
* `user_stories/RL-0009/RL-0009_CODE_REVIEW.md`
* `user_stories/RL-0009/RL-0009_QA_REPORT.md`

Expected Output:

* Coordinator story selection and sprint plan for the next eligible story.

Blocking Conditions:

* None.

Instructions:

* RL-0008 is complete and must remain Done.
* RL-0009 is Done.
* Preserve Story IDs and completed story state.
* RL-0009 release is complete.
* Stop before selecting RL-0010 unless the Coordinator workflow is explicitly resumed.
* Do not add penalties, XP loss, level loss, streak systems, share cards, backend services, login, cloud sync, analytics SDK, social graph, or public ranking.
