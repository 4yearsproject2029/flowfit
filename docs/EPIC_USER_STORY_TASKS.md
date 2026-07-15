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
2026-07-15
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
2. `design/approved/*` for approved Phase 2 visual layout and screen composition
3. `docs/PRODUCT_BRIEF.md`
4. `docs/PROJECT_CONTEXT.md`
5. `docs/ARCHITECTURE.md`
6. `docs/EPIC_USER_STORY_TASKS.md`

Existing documents remain authoritative for behavior, business rules, privacy boundaries, persistence, and technical constraints.

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
* The next new Story ID after the current backlog is `RL-0021`.

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
| EP-06 | Weekly Goals | Track weekly consistency and encourage recovery without harsh punishment. | P0 | Done |
| EP-07 | Share Cards | Let users optionally celebrate progress with privacy-conscious share cards. | P1 | Done |
| EP-08 | Privacy | Give users control over metrics shown on share cards. | P1 | Done |
| EP-09 | MVP Validation | Calculate local metrics that help evaluate whether RepLog improves consistency. | P1 | Done |
| EP-10 | MVP Quality | Validate the MVP experience for accessibility, reliability, and iPhone usability. | P1 | Done |

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
| Done | RL-0010 | EP-07 | Share Cards | Must Have | P1 | L | RL-0006, RL-0007, RL-0008 | Yes | No | As a user, I want to create a share card for workout completion, level-up, or weekly goal completion, so that I can celebrate progress without exposing embarrassing numbers. | - Users can generate workout completion cards.<br>- Users can generate level-up cards.<br>- Users can generate weekly goal cards.<br>- Weight, sets, reps, calories, and PRs are hidden by default.<br>- Share card generation is optional and user-initiated. |
| Done | RL-0011 | EP-08 | Privacy | Should Have | P1 | M | RL-0010 | Yes | No | As a user, I want control over which metrics appear on share cards, so that I can share progress comfortably. | - Share cards show consistency-focused metrics by default.<br>- Users can preview cards before sharing.<br>- Hidden performance metrics require explicit opt-in.<br>- Share cards are never published automatically.<br>- Share preferences persist locally. |
| Done | RL-0012 | EP-09 | MVP Validation | Should Have | P1 | M | RL-0004, RL-0008, RL-0010 | No | No | As a product stakeholder, I want local MVP validation metrics, so that I can evaluate whether RepLog improves consistency. | - The app calculates weekly goal completion rate locally.<br>- The app calculates average workouts per week locally.<br>- The app calculates average share cards generated locally.<br>- The app detects returns after missed weeks.<br>- Metrics require no login or backend. |
| Done | RL-0013 | EP-10 | MVP Quality | Should Have | P1 | S | RL-0001, RL-0004, RL-0006, RL-0007, RL-0008, RL-0010 | Yes | Yes | As a beginner fitness user, I want the MVP experience to be accessible and reliable, so that I can use RepLog comfortably during workouts. | - Core screens use readable text and large touch targets.<br>- Primary flows work on common iPhone screen sizes.<br>- Offline logging, XP, levels, goals, and share cards pass manual QA.<br>- `flutter analyze` passes.<br>- `flutter test` passes. |

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
| 2026-07-01 | RL-0010 | Not Started | In Progress | Coordinator | Next eligible share-card story selected after RL-0009 completion. |
| 2026-07-01 | RL-0010 | In Progress | Done | Release Manager | Share-card implementation, privacy defaults, Code Review approval, QA pass, and release closeout completed. |
| 2026-07-01 | RL-0011 | Not Started | In Progress | Coordinator | Next eligible share-card privacy story selected after RL-0010 completion. |
| 2026-07-01 | RL-0011 | In Progress | Done | Release Manager | Share-card privacy controls, explicit opt-in persistence coverage, QA pass with documented widget-test limitation, and release closeout completed. |
| 2026-07-01 | RL-0012 | Not Started | In Progress | Coordinator | Next eligible MVP validation metrics story selected after RL-0011 completion. |
| 2026-07-01 | RL-0012 | In Progress | Done | Release Manager | Local MVP validation metrics, share-card generation count persistence, QA pass with documented widget-test limitation, and release closeout completed. |
| 2026-07-01 | RL-0013 | Not Started | In Progress | Coordinator | Next eligible MVP quality story selected after RL-0012 completion. |
| 2026-07-01 | RL-0013 | In Progress | Done | Release Manager | MVP quality pass completed with rest timer touch-target improvement, QA pass, user approval, and release closeout. |

---

## Metrics

| Metric | Value |
| ------ | ----- |
| Total Stories | 21 |
| Not Started | 7 |
| In Progress | 0 |
| Blocked | 0 |
| On Hold | 0 |
| Done | 14 |
| Canceled | 0 |

Completion Rate:

```text
14 / (21 - 0) = 66.7%
```

MVP Completion Rate:

```text
14 / (14 - 0) = 100%
```

---

## Backlog Update Summary

Stories added:

* `RL-0014`: Dashboard Redesign.
* `RL-0015`: Guided Workout Flow.
* `RL-0016`: Completion Celebration.
* `RL-0017`: Planning And Review Separation.
* `RL-0018`: Floating Rest Timer.
* `RL-0019`: Achievement Motivation Refinement.
* `RL-0020`: Phase 2 Journey QA.

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
* `RL-0010`: Status updated to In Progress after Coordinator selected share cards as the next eligible story after RL-0009.
* `RL-0010`: Status updated to Done after share-card implementation, privacy-default verification, Code Review approval, QA pass, and release closeout.
* `RL-0011`: Status updated to In Progress after Coordinator selected privacy controls as the next eligible story after RL-0010.
* `RL-0011`: Status updated to Done after share-card privacy controls, explicit opt-in persistence coverage, Code Review approval, QA pass with documented widget-test limitation, and release closeout.
* `RL-0012`: Status updated to In Progress after Coordinator selected local MVP validation metrics as the next eligible story after RL-0011.
* `RL-0012`: Status updated to Done after local MVP validation metric calculation, share-card generation count persistence, Code Review approval, QA pass with documented widget-test limitation, and release closeout.
* `RL-0013`: Status updated to In Progress after Coordinator selected MVP quality validation as the next eligible story after RL-0012.
* `RL-0013`: Status updated to Done after rest timer touch-target improvement, small iPhone/widget validation, static analysis, full tests, user approval, and release closeout.
* `RL-0004`: Dependency updated from `RL-0005` to `RL-0002, RL-0005` because offline persistence acceptance criteria include onboarding and weekly goal state.
* `RL-0013`: Dependency updated to include `RL-0007`, and acceptance criteria now explicitly include levels in MVP manual QA.
* `RL-0014` through `RL-0020`: Acceptance criteria aligned with approved Phase 2 visual design files in `design/approved/`.

Priority changes:

* None.

Reasoning:

* Existing stories still match the Product Brief, Project Context, and Architecture.
* Story IDs were preserved.
* Done story `RL-0000` was not modified beyond being represented in the template-compatible backlog.
* Done stories `RL-0000` through `RL-0013` remain preserved.
* Phase 2 updates were limited to design traceability, missing story/task coverage, requirement clarification, and acceptance-criteria alignment.

---

## Related Documents

* `docs/PRODUCT_BRIEF.md`
* `docs/PROJECT_CONTEXT.md`
* `docs/ARCHITECTURE.md`
* `docs/USER_JOURNEY.md`
* `docs/SCREEN_STRUCTURE.md`
* `docs/LOW-FI-WIREFRAME.md`
* `docs/REPLOG_CODEBASE_AUDIT.md`
* `docs/PRODUCT_OWNER_RL-0001_SELECTION.md`
* `design/approved/*`

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
| v1.13 | 2026-07-01 | Coordinator Agent | Selected RL-0010 as the next eligible share-card story and started the sprint. |
| v1.14 | 2026-07-01 | Release Manager Agent | Closed RL-0010 as Done after share-card implementation, privacy-default verification, QA pass, and release closeout. |
| v1.15 | 2026-07-01 | Coordinator Agent | Selected RL-0011 as the next eligible privacy story and started the sprint. |
| v1.16 | 2026-07-01 | Release Manager Agent | Closed RL-0011 as Done after share-card privacy controls, persisted preference validation, QA pass, and release closeout. |
| v1.17 | 2026-07-01 | Coordinator Agent | Selected RL-0012 as the next eligible MVP validation metrics story and started the sprint. |
| v1.18 | 2026-07-01 | Release Manager Agent | Closed RL-0012 as Done after local MVP validation metrics, share-card generation count persistence, QA pass, and release closeout. |
| v1.19 | 2026-07-01 | Coordinator Agent | Selected RL-0013 as the next eligible MVP quality story and started the sprint. |
| v1.20 | 2026-07-01 | Release Manager Agent | Closed RL-0013 as Done after MVP quality validation, touch-target improvement, QA pass, and release closeout. |
| v1.21 | 2026-07-15 | Business Analyst Agent | Synchronized Phase 2 backlog with approved UI designs, added screen-story mapping, clarified conflicts, and added RL-0014 through RL-0020 task coverage. |

---

## Agent Handoff

Current Agent:

```text
Business Analyst
```

Completed Output:

```text
docs/EPIC_USER_STORY_TASKS.md
docs/PRODUCT_BRIEF.md
docs/PROJECT_CONTEXT.md
user_stories/RL-0014/RL-0014_TASKS.md
user_stories/RL-0015/RL-0015_TASKS.md
user_stories/RL-0016/RL-0016_TASKS.md
user_stories/RL-0017/RL-0017_TASKS.md
user_stories/RL-0018/RL-0018_TASKS.md
user_stories/RL-0019/RL-0019_TASKS.md
user_stories/RL-0020/RL-0020_TASKS.md
```

Next Agent:

```text
Coordinator
```

Next Prompt:

```text
Select the next eligible Phase 2 story from `docs/EPIC_USER_STORY_TASKS.md` and prepare the sprint handoff without reopening completed MVP stories.
```

Required Input Files:

- `docs/EPIC_USER_STORY_TASKS.md`
- `docs/PRODUCT_BRIEF.md`
- `docs/USER_JOURNEY.md`
- `docs/SCREEN_STRUCTURE.md`
- `docs/PROJECT_CONTEXT.md`
- `design/approved/*`

Optional Input Files:

- `docs/LOW-FI-WIREFRAME.md`
- `docs/ARCHITECTURE.md`
- Existing `user_stories/RL-0000` through `user_stories/RL-0013` artifacts for history only.

Expected Output:

* Phase 2 Coordinator handoff for the selected story, expected to start with `RL-0014`.

Blocking Conditions:

* None.

Instructions:

* RL-0013 is Done.
* All current MVP backlog stories are Done.
* Preserve Story IDs and completed story state.
* Do not implement code during backlog synchronization.

---

## Phase 2 Backlog Addendum

Phase 2: UI/UX Redesign & Product Refinement.

Approved UX source of truth:

```text
docs/USER_JOURNEY.md
```

Phase 2 product loop:

```text
Guide -> Complete -> Celebrate -> Reward -> Come Back
```

Phase 2 priorities:

* Consistency over performance
* Reward and recognition over competition
* Simplicity over complexity
* Motivation over analytics

Phase 2 rules:

* Preserve all completed MVP stories.
* Do not reopen or rewrite `RL-0000` through `RL-0013`.
* New Phase 2 stories begin at `RL-0014`.
* Approved PNGs in `design/approved/` are the source of truth for Phase 2 UI layout and screen composition.
* Existing product, journey, screen, architecture, and backlog documents remain the source of truth for behavior and business rules.
* The Dashboard answers "What should I do today?"
* Current Workout answers "What should I do next?"
* RepLog must behave as a Workout Flow Assistant, not a workout logging app.
* No backend, login, cloud sync, social graph, public ranking, or external analytics SDK may be introduced in Phase 2 stories.

Approved Phase 2 design references:

| Design File | Approved Screen | Primary Story Mapping |
| ----------- | --------------- | --------------------- |
| `design/approved/01_home_screen.png` | Home Dashboard | `RL-0014` |
| `design/approved/02_current_workout.png` | Current Workout Active | `RL-0015` |
| `design/approved/03_timer.png` | Rest Timer Overlay | `RL-0018`, supports `RL-0015` |
| `design/approved/04_workkout_summary.png` | Workout Summary | `RL-0016` |
| `design/approved/05_weekly_plan.png` | Week Planning | `RL-0017`, supports `RL-0015` |
| `design/approved/06_achievement.png` | Achievement Hub | `RL-0019` |
| `design/approved/07_history.png` | History | `RL-0017` |
| `design/approved/08_workout_detail.png` | Workout Detail / Session Detail | `RL-0017`, supports `RL-0015` |

Screen to story mapping:

| Approved Screen | Existing MVP Capability Reused | Phase 2 Story | Notes |
| --------------- | ------------------------------ | ------------- | ----- |
| Home Dashboard | RepLog identity, XP total, level progress, weekly goal progress, selected workout data | `RL-0014` | Refocuses Home into greeting, XP signal, Today's Focus, Weekly Progress, Next Achievement, and bottom navigation. Removes dashboard role overlap from timer, history, share cards, and editing. |
| Current Workout Active | Workout log completion, local workout data, timer provider | `RL-0015` | Introduces the guided Today/Current Workout execution surface with active exercise, set progress, pause, adjust, skip, complete-set, and resume states. |
| Rest Timer Overlay | Existing rest timer presets and accessibility improvements | `RL-0018` | Moves rest from pinned dashboard content to an overlay/modal tied to active workout flow. |
| Workout Summary | XP, levels, weekly goal progress, achievement/share-card systems | `RL-0016` | Creates immediate post-completion celebration and reward summary. History must not reopen this celebration state. |
| Week Planning | Weekly calendar, weekly goal, workout logs | `RL-0017` | Separates planning from Home and History with date navigation, today's plan, reschedule, session preview, and Start Today. |
| Achievement Hub | XP, levels, share card privacy, consistency/recovery signals | `RL-0019` | Turns long-term reward display into a dedicated hub while keeping comparison/social features out of scope. |
| History | Existing workout logs and completion state | `RL-0017` | Makes completed-workout review read-only and distinct from planning and summary. |
| Workout Detail / Session Detail | Existing workout detail fields and startable workout data | `RL-0017`, `RL-0015` | Must distinguish planned/session detail that can start a workout from completed history detail that is read-only. |

Requirement conflicts, gaps, and clarifications:

| Area | Issue | Resolution |
| ---- | ----- | ---------- |
| Workout Summary metrics | Approved summary includes duration, volume, calories, sets done, PR/growth-style details, while product rules avoid analytics pressure and embarrassing performance sharing. | Allow these only as private completion-summary details. Keep Dashboard and Achievement consistency-first, and keep share-card performance metrics hidden unless explicitly opted in by existing privacy rules. |
| Achievement streak language | Approved Achievement image includes active streak and "top 5% of users", while current docs reject comparison pressure and harsh missed-week punishment. | Keep streak wording supportive and non-punitive. Do not implement public ranking, percentile comparison, social comparison, or penalty mechanics. |
| History vs Today nav label | Approved `07_history.png` highlights the Today nav icon while showing History content. | Treat the screen title and file name as authoritative: this is History. Bottom-nav active-state mismatch requires UX clarification during `RL-0017`, not backlog restructuring. |
| Workout Detail start action | Approved `08_workout_detail.png` includes Start Workout, while `docs/USER_JOURNEY.md` says History detail is read-only. | Split responsibility: planned/session detail from Week may start a workout; completed History detail remains read-only and cannot act like Workout Summary. |
| Rest timer global behavior | Existing docs mention globally available floating timer; approved PNG shows a modal overlay over Current Workout. | Implement Rest Timer as a workout-flow overlay first. Cross-screen floating/persistent behavior remains `RL-0018` scope only where it supports active workout continuity. |
| Visual assets | Approved designs use exercise imagery and rich icons; current MVP mostly uses Material widgets. | `RL-0015`, `RL-0017`, and `RL-0020` must validate asset strategy without adding backend, sync, or broad content systems. |
| New achievements/titles | Approved designs show medals, titles, categories, and milestone lists beyond the MVP's simple level/XP display. | `RL-0019` may refine the Achievement presentation, but any new reward taxonomy must remain local, simple, and non-comparative. |

---

## Phase 2 Epic Summary

| Epic ID | Epic | Goal | Priority | Status |
| ------- | ---- | ---- | -------- | ------ |
| EP-11 | Dashboard Redesign | Refocus Home Dashboard around today's next action and remove dashboard responsibilities that belong elsewhere. | P0 | Not Started |
| EP-12 | Guided Workout Flow | Make Current Workout the primary execution surface for step-by-step workout guidance. | P0 | Not Started |
| EP-13 | Completion Celebration | Separate immediate post-workout celebration from history review and reinforce rewards after completion. | P0 | Not Started |
| EP-14 | Journey Separation | Align Week, History, Achievement, and Rest Timer with their approved responsibilities. | P1 | Not Started |
| EP-15 | Phase 2 UX Quality | Validate the redesigned journey across common iPhone layouts, accessibility expectations, and local-first behavior. | P1 | Not Started |

---

## Phase 2 Recommended Implementation Order

```text
RL-0014
↓
RL-0015
↓
RL-0016
↓
RL-0017
↓
RL-0018
↓
RL-0019
↓
RL-0020
```

---

## Phase 2 User Story Backlog

| Status | Story ID | Epic ID | Epic | MVP | Priority | Effort | Depends On | UX Required | User Approval Required | User Story | Acceptance Criteria |
| ------ | -------- | ------- | ---- | --- | -------- | ------ | ---------- | ----------- | ---------------------- | ---------- | ------------------- |
| Not Started | RL-0014 | EP-11 | Dashboard Redesign | Must Have | P0 | M | RL-0013 | Yes | Yes | As a beginner fitness user, I want the Home Dashboard to clearly tell me what I should do today, so that I can start or resume my workout without sorting through unrelated information. | - Uses `design/approved/01_home_screen.png` for approved layout and screen composition.<br>- Dashboard presents greeting/identity context, visible XP signal, Today's Focus, Weekly Progress, Next Achievement, and bottom navigation.<br>- Dashboard provides a clear Start or Resume Workout action from Today's Focus.<br>- Dashboard excludes History, Rest Timer, Share Cards, exercise editing, muscle maps, and detailed statistics as primary dashboard sections.<br>- Dashboard language emphasizes today's action and consistency.<br>- Existing offline data and completed MVP reward state remain intact. |
| Not Started | RL-0015 | EP-12 | Guided Workout Flow | Must Have | P0 | L | RL-0014 | Yes | Yes | As a user in an active workout, I want Current Workout to tell me what to do next, so that I can move through my workout with minimal friction. | - Uses `design/approved/02_current_workout.png` for Current Workout layout and `design/approved/08_workout_detail.png` where planned/session detail starts a workout.<br>- Current Workout displays exercise progress, active timer/status, current exercise, instruction text, sets/reps, and primary Complete Set action.<br>- Users can pause, adjust, skip, complete a set, and progress through Exercise -> Rest -> Next Exercise without returning to Dashboard.<br>- Current Workout supports start, resume, and completion states.<br>- Workout execution is separated from planning and history review.<br>- Existing workout completion and local persistence behavior remain intact. |
| Not Started | RL-0016 | EP-13 | Completion Celebration | Must Have | P0 | M | RL-0015 | Yes | Yes | As a user who completed a workout, I want an immediate celebration and reward summary, so that finishing feels recognized and motivates me to come back. | - Uses `design/approved/04_workkout_summary.png` for approved layout and screen composition.<br>- Workout Summary appears immediately after workout completion.<br>- Workout Summary leads with celebration and recognition before supporting details.<br>- XP, level, weekly goal, achievement, or recovery rewards are shown when relevant.<br>- Private session details such as duration, volume, calories, sets, or moment of the day may appear only in this completion context and must not weaken share-card privacy defaults.<br>- Optional share-card generation is available only as a user-initiated action.<br>- Workout Summary cannot be reopened from History as if it were a normal detail screen. |
| Not Started | RL-0017 | EP-14 | Planning And Review Separation | Should Have | P1 | M | RL-0014 | Yes | Yes | As a user, I want Week and History to have clear separate purposes, so that planning future workouts and reviewing completed workouts do not feel mixed together. | - Uses `design/approved/05_weekly_plan.png`, `design/approved/07_history.png`, and `design/approved/08_workout_detail.png` for approved layout and screen composition.<br>- Week focuses on weekly workout planning, day navigation, today's plan, session preview, rescheduling, and Start Today.<br>- Week uses auto-save behavior for planning changes where practical.<br>- History focuses on read-only completed workout review grouped by recent periods.<br>- Workout Detail distinguishes planned/session detail that can start a workout from completed History detail that remains read-only.<br>- Workout Detail in History displays completed records without acting like Workout Summary.<br>- Planning and review flows return cleanly to Dashboard. |
| Not Started | RL-0018 | EP-14 | Floating Rest Timer | Should Have | P1 | M | RL-0015 | Yes | Yes | As a user resting during a workout, I want the Rest Timer to stay available while I navigate, so that I can keep my workout flow without being trapped on one screen. | - Uses `design/approved/03_timer.png` for approved rest overlay layout and screen composition.<br>- Rest Timer belongs to Workout Flow and is not a Dashboard section.<br>- Rest Timer appears as an overlay/modal while resting during an active workout.<br>- Rest Timer supports skip rest, extend rest, dismiss/close, and return-to-workout behavior where appropriate.<br>- Users can resume Current Workout from the active timer state.<br>- Cross-screen floating behavior is included only where it supports active workout continuity.<br>- Existing timer presets and accessibility touch targets remain usable. |
| Not Started | RL-0019 | EP-14 | Achievement Motivation Refinement | Should Have | P1 | M | RL-0016 | Yes | Yes | As a consistency-focused user, I want Achievement to recognize long-term growth without comparison, so that I feel rewarded for returning and showing up. | - Uses `design/approved/06_achievement.png` for approved layout and screen composition while honoring non-comparison product rules.<br>- Achievement displays level, XP/rep score, medals or achievements, milestones, current title/reward state, and recent unlock/share moments as long-term motivation.<br>- Achievement language prioritizes consistency, return, and recognition over performance.<br>- Dashboard shows only short-term achievement preview, not full achievement detail.<br>- Achievement does not introduce rankings, leaderboards, public percentile claims, social comparison, public profiles, penalties, or level loss.<br>- Existing XP, levels, share cards, and privacy controls remain intact. |
| Not Started | RL-0020 | EP-15 | Phase 2 Journey QA | Should Have | P1 | S | RL-0014, RL-0015, RL-0016, RL-0017, RL-0018, RL-0019 | Yes | Yes | As a beginner fitness user, I want the redesigned RepLog journey to feel clear, accessible, and reliable, so that I can complete workouts consistently. | - Manual QA validates the full Guide -> Complete -> Celebrate -> Reward -> Come Back loop across approved screens in `design/approved/`.<br>- Dashboard answers "What should I do today?" without role overlap.<br>- Current Workout answers "What should I do next?" without role overlap.<br>- Week, Achievement, History, Workout Detail, Workout Summary, and Rest Timer preserve their approved responsibilities.<br>- Core screens work on common iPhone screen sizes.<br>- Accessibility checks cover readable text, touch targets, contrast, navigation predictability, and non-overlapping content.<br>- `flutter analyze` passes.<br>- `flutter test` passes or any skipped tests are explicitly documented as known limitations. |

---

## Phase 2 Task Breakdowns

Story-level Phase 2 task files:

| Story ID | Task File |
| -------- | --------- |
| `RL-0014` | `user_stories/RL-0014/RL-0014_TASKS.md` |
| `RL-0015` | `user_stories/RL-0015/RL-0015_TASKS.md` |
| `RL-0016` | `user_stories/RL-0016/RL-0016_TASKS.md` |
| `RL-0017` | `user_stories/RL-0017/RL-0017_TASKS.md` |
| `RL-0018` | `user_stories/RL-0018/RL-0018_TASKS.md` |
| `RL-0019` | `user_stories/RL-0019/RL-0019_TASKS.md` |
| `RL-0020` | `user_stories/RL-0020/RL-0020_TASKS.md` |
