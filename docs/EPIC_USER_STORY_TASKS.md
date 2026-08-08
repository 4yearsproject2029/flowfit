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
2026-08-02
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
* The next new Story ID after the current backlog is `RL-0037`.

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
* `RL-0033` depends on completed `RL-0015` and `RL-0021` because the Workout Plan Builder must align with the approved Current Workout foundation and Phase 2 design handoff.
* `RL-0022` depends on `RL-0033` because set progression needs a saved daily session with multiple ordered exercises.
* `RL-0023` depends on `RL-0022`, so it indirectly depends on `RL-0033`.
* `RL-0025` depends on `RL-0033` because planned session detail and Start Today handoff require the saved composed session.
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
| 2026-07-16 | RL-0014 | Not Started | Done | Release Manager | Phase 2 Home Dashboard redesign approved by user, QA passed, accepted visual differences recorded in improvement backlog, and release artifacts synced. |
| 2026-07-17 | RL-0021 | Not Started | In Progress | Coordinator | Next eligible Phase 2 design handoff selected after RL-0014 closure to unblock RL-0015 and downstream Phase 2 screen implementation. |
| 2026-07-17 | RL-0021 | In Progress | Done | Release Manager | Phase 2 design handoff completed, Code Review approved, QA passed, user approval received by instruction to continue through release, and downstream implementation guidance synced. |
| 2026-07-17 | RL-0015 | Not Started | In Progress | Coordinator | Next eligible Current Workout foundation story selected after RL-0021 design handoff completion. |
| 2026-07-17 | RL-0015 | In Progress | Done | Release Manager | Current Workout foundation implemented, Code Review approved, QA passed, user approval received by instruction to continue through release, and release artifacts synced. |
| 2026-07-17 | RL-0022 | Not Started | In Progress | Coordinator | Next eligible Current Workout set progression story selected after RL-0015 foundation release. |
| 2026-07-17 | RL-0022 | In Progress | On Hold | Coordinator | Manual testing found missing screens that should be addressed before continuing Current Workout set progression. Partial implementation work remains preserved for later resume. |
| 2026-07-18 | RL-0033 | Not Started | In Progress | Coordinator | Next eligible P0 prerequisite story selected to resolve the workout-composition screen gap before RL-0022 resumes. |
| 2026-07-18 | RL-0033 | In Progress | Done | Release Manager | Workout Session Composition implementation, Code Review approval, QA pass, user approval by workflow instruction, and release closeout completed. |
| 2026-07-19 | RL-0022 | On Hold | In Progress | Coordinator | RL-0033 resolved the missing Workout Session Composition prerequisite, so RL-0022 resumed. |
| 2026-07-19 | RL-0022 | In Progress | Done | Release Manager | Current Workout set progression, rest handoff, focused QA pass, user approval by workflow instruction, and release closeout completed. |
| 2026-07-19 | RL-0023 | Not Started | In Progress | Coordinator | Next eligible P0 Current Workout control states story selected after RL-0022 release. |
| 2026-07-19 | RL-0018 | Not Started | In Progress | Coordinator | Next eligible Rest Timer Overlay story selected after RL-0023 release according to the Phase 2 recommended order. |
| 2026-07-19 | RL-0023 | In Progress | Done | Release Manager | Current Workout pause, resume, skip, adjust, return-state recovery, focused QA pass, user approval by workflow instruction, and release closeout completed. |
| 2026-07-19 | RL-0018 | In Progress | Done | Release Manager | Rest Timer overlay implementation, Code Review approval, focused QA pass, user approval by workflow instruction, and release closeout completed. |
| 2026-07-19 | RL-0016 | Not Started | In Progress | Coordinator | Next eligible P0 Completion Celebration story selected after RL-0018 release; RL-0022 dependency is Done. |
| 2026-07-19 | RL-0016 | In Progress | Done | Release Manager | Workout Summary celebration shell implemented, Code Review approved, focused QA pass, user approval by workflow instruction, and release closeout completed. |
| 2026-07-20 | RL-0034 | Not Started | In Progress | Coordinator | Behavior-preserving Current Workout structural refactor selected before additional workout-flow expansion. |
| 2026-07-20 | RL-0034 | In Progress | Done | Release Manager | Current Workout structural refactor completed, Code Review approved, QA passed with documented widget-harness limitation, and release closeout completed. |
| 2026-07-20 | RL-0035 | Not Started | In Progress | Coordinator | User-reported Weekly Progress overcount bug selected as a P0 hotfix before additional Phase 2 feature work. |
| 2026-07-20 | RL-0035 | In Progress | Done | Release Manager | Weekly Progress now counts completed daily sessions once, focused service and storage regressions passed, analyzer passed, and release artifacts synced. |
| 2026-07-20 | RL-0024 | Not Started | In Progress | Coordinator | Next eligible P0 Workout Summary private details and sharing story selected after RL-0035 hotfix release; RL-0016 dependency is Done. |
| 2026-07-20 | RL-0024 | In Progress | Done | Release Manager | Workout Summary private details, optional share-card entry, Plan Tomorrow, Back to Dashboard, privacy defaults, focused QA pass, user approval by workflow instruction, and release closeout completed. |
| 2026-07-20 | RL-0032 | Not Started | In Progress | Coordinator | Next eligible Phase 2 story selected after RL-0024 release; dependencies RL-0018, RL-0023, and RL-0034 are Done. |
| 2026-07-20 | RL-0032 | In Progress | Done | Release Manager | Cross-screen rest timer continuity completed, Code Review approved, QA passed, user approval by workflow instruction, and release closeout completed. |
| 2026-07-24 | RL-0017 | Not Started | In Progress | Coordinator | Next eligible Phase 2 Week Planning story selected after RL-0032 release; dependencies RL-0014 and RL-0021 are Done. |
| 2026-07-24 | RL-0017 | In Progress | Done | Release Manager | Week Planning screen implementation, Code Review approval, focused QA pass, user approval by workflow instruction, and release closeout completed. |
| 2026-07-24 | RL-0025 | Not Started | In Progress | Coordinator | Next eligible Planned Session Detail and Start Today story selected after RL-0017 release; dependencies RL-0017, RL-0015, and RL-0033 are Done. |
| 2026-07-24 | RL-0025 | In Progress | Done | Release Manager | Planned Session Detail and Start Today handoff completed, Code Review approved, QA passed, user approval by workflow instruction, and release closeout completed. |
| 2026-07-25 | RL-0026 | Not Started | In Progress | Coordinator | Next eligible Read-Only History story selected after RL-0025 release; dependencies RL-0016 and RL-0017 are Done. |
| 2026-07-25 | RL-0026 | In Progress | Done | Release Manager | Read-Only History screen completed, Code Review approved, focused QA passed, and release closeout completed. |
| 2026-07-25 | RL-0027 | Not Started | In Progress | Coordinator | Next eligible Completed Workout Detail story selected after RL-0026 release; dependency RL-0026 is Done. |
| 2026-07-25 | RL-0027 | In Progress | Done | Release Manager | Completed Workout Detail screen completed, Code Review approved, focused QA passed, and release closeout completed. |
| 2026-07-25 | RL-0036 | Not Started | In Progress | Coordinator | User-reported bottom navigation tab switching bug selected as a P0 hotfix before RL-0019. |
| 2026-07-25 | RL-0036 | In Progress | Done | Release Manager | Bottom navigation tab switching hotfix completed, Code Review approved, focused QA passed, and release closeout completed. |
| 2026-07-25 | RL-0019 | Not Started | In Progress | Coordinator | Next eligible Achievement Hub Foundation story selected after RL-0036 release; dependencies RL-0016 and RL-0021 are Done. |
| 2026-07-25 | RL-0019 | In Progress | Done | Release Manager | Achievement Hub Foundation completed, Code Review approved, focused QA passed, and release closeout completed. |
| 2026-07-25 | RL-0028 | Not Started | In Progress | Coordinator | Next eligible Achievement Milestones And Titles story selected after RL-0019 release. |
| 2026-07-25 | RL-0028 | In Progress | Done | Release Manager | Achievement Milestones And Titles completed, Code Review approved, focused QA passed, and release closeout completed. |
| 2026-08-02 | RL-0029 | Not Started | In Progress | Coordinator | Next eligible Achievement Unlock And Share Moments story selected after RL-0028 and RL-0024 release. |
| 2026-08-02 | RL-0029 | In Progress | Done | Release Manager | Achievement Unlock And Share Moments completed, Code Review approved, focused QA passed, and release closeout completed. |

---

## Metrics

| Metric | Value |
| ------ | ----- |
| Total Stories | 36 |
| Not Started | 4 |
| In Progress | 0 |
| Blocked | 0 |
| On Hold | 0 |
| Done | 32 |
| Canceled | 0 |

Completion Rate:

```text
32 / (36 - 0) = 88.9%
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
* `RL-0017`: Week Planning.
* `RL-0018`: Floating Rest Timer.
* `RL-0019`: Achievement Hub Foundation.
* `RL-0020`: Phase 2 Final Journey QA.
* `RL-0021`: Phase 2 Design Handoff.
* `RL-0022`: Current Workout Set Progression.
* `RL-0023`: Current Workout Control States.
* `RL-0024`: Workout Summary Private Details And Sharing.
* `RL-0025`: Planned Session Detail And Start Today.
* `RL-0026`: Read-Only History.
* `RL-0027`: Completed Workout Detail.
* `RL-0028`: Achievement Milestones And Titles.
* `RL-0029`: Achievement Unlock And Share Moments.
* `RL-0030`: Phase 2 Screen QA.
* `RL-0031`: Phase 2 Journey Regression QA.
* `RL-0032`: Cross-Screen Rest Timer Continuity.
* `RL-0033`: Workout Session Composition.
* `RL-0034`: Current Workout Structural Refactor.
* `RL-0035`: Weekly Session Progress Bug Fix.
* `RL-0036`: Bottom Navigation Tab Switching Bug Fix.

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
* `RL-0015`, `RL-0016`, `RL-0017`, `RL-0019`, and `RL-0020`: Scope narrowed so each story remains independently implementable and testable.
* `RL-0021` through `RL-0031`: Added split Phase 2 stories for design handoff, Current Workout states, Workout Summary details, Week/History/Detail separation, Achievement depth, and QA slices.
* `RL-0018`: Scope narrowed to Rest Timer overlay/modal only.
* `RL-0032`: Added Cross-Screen Rest Timer Continuity for global timer state, navigation survival, and return-to-workout entry.
* `RL-0022`, `RL-0023`, `RL-0028`, `RL-0030`, `RL-0031`, and `RL-0020`: Acceptance criteria clarified to reduce implementation and QA overlap risk.
* `RL-0014`: Status updated to Done after Home Dashboard visual alignment, full QA pass, user approval, release artifacts, and improvement backlog entries for accepted visual differences.
* `RL-0021`: Status updated to In Progress after Coordinator selected the remaining Phase 2 design handoff checkpoint before RL-0015 and downstream screen implementation.
* `EP-15`: Status updated to In Progress because its Phase 2 design handoff story is now active.
* `RL-0021`: Status updated to Done after Phase 2 design handoff documentation, Code Review approval, QA pass, user approval by workflow instruction, and release closeout.
* `RL-0015`: Status updated to In Progress after Coordinator selected Current Workout foundation as the next eligible Phase 2 story.
* `RL-0015`: Status updated to Done after Current Workout foundation implementation, Code Review approval, QA pass, user approval by workflow instruction, and release closeout.
* `EP-12`: Status updated to In Progress because its Current Workout foundation story is now complete and downstream Current Workout stories remain.
* `RL-0022`: Status updated to In Progress after Coordinator selected Current Workout set progression as the next eligible Phase 2 story.
* `RL-0022`: Status updated to On Hold after manual testing found missing screens that should be resolved before continuing set progression.
* `RL-0033`: Added as a prerequisite story for Workout Session Composition using approved `09_workout_plan_builder.png` and `10_add_exercise.png`.
* `RL-0033`: Status updated to In Progress after Coordinator selected it as the next eligible prerequisite story before RL-0022 resumes.
* `RL-0033`: Status updated to Done after Workout Session Composition implementation, Code Review approval, QA pass, user approval, and release closeout.
* `RL-0022`: Dependency updated to require `RL-0033` before set progression resumes because Current Workout needs one saved daily session with multiple ordered exercises.
* `RL-0022`: Status updated to Done after RL-0033 resolved the missing-screen prerequisite and Current Workout set progression passed focused QA.
* `RL-0023`: Dependency remains downstream of `RL-0022`, and therefore also requires `RL-0033` indirectly.
* `RL-0023`: Status updated to Done after Current Workout pause, resume, skip, adjust, return-state recovery, focused QA pass, user approval, and release closeout.
* `RL-0018`: Status updated to Done after Rest Timer overlay implementation, existing timer regression coverage, focused QA pass, user approval, and release closeout.
* `RL-0025`: Dependency updated to include `RL-0033` because planned session detail and Start Today handoff require a saved composed session.
* `RL-0030` and `RL-0031`: QA scope updated to include Workout Plan Builder and Add Exercise bottom sheet validation.
* `RL-0034`: Added as a behavior-preserving Current Workout structural refactor after Solution Architect review found the 1,584-line screen increases future workout-flow feature cost and regression risk.
* `RL-0034`: Status updated to In Progress after Coordinator selected it as the next eligible P0 story before additional workout-flow expansion.
* `RL-0034`: Status updated to Done after structural refactor implementation, Code Review approval, QA pass, and release closeout.
* `RL-0032`: Dependency updated to include `RL-0034` because cross-screen rest timer continuity should build on the extracted Current Workout structure.
* `RL-0035`: Added as a P0 bug-fix story after user validation found Weekly Progress counted completed exercises inside one daily session as multiple workouts.
* `RL-0035`: Status updated to Done after weekly goal progress was corrected to de-duplicate completed daily sessions by date.
* `RL-0024`: Status updated to In Progress after Coordinator selected the next eligible P0 story following RL-0035 release.
* `RL-0024`: Status updated to Done after Workout Summary private details, optional sharing, Plan Tomorrow, Back to Dashboard, privacy-default verification, Code Review approval, QA pass, user approval by workflow instruction, and release closeout.
* `RL-0032`: Status updated to In Progress after Coordinator selected Cross-Screen Rest Timer Continuity as the next eligible story following RL-0024 release.
* `RL-0026`: Status updated to Done after Read-Only History implementation, Code Review approval, focused QA pass, and release closeout.
* `RL-0027`: Status updated to Done after completed Workout Detail implementation, Code Review approval, focused QA pass, and release closeout.
* `RL-0036`: Status updated to Done after bottom navigation tab switching hotfix, Code Review approval, focused QA pass, and release closeout.

Priority changes:

* None.

Reasoning:

* Existing stories still match the Product Brief, Project Context, and Architecture.
* Story IDs were preserved.
* Done story `RL-0000` was not modified beyond being represented in the template-compatible backlog.
* Done stories `RL-0000` through `RL-0014` remain preserved.
* Phase 2 updates were limited to design traceability, missing design handoff coverage, oversized-story splitting, requirement clarification, dependency updates, acceptance-criteria alignment, and approved RL-0014 release closeout.
* The new planning flow resolves the missing prerequisite found during RL-0022 validation without redesigning Dashboard, Week, or Current Workout.

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
* `docs/IMPROVEMENT_BACKLOG.md`
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
| v1.22 | 2026-07-16 | Business Analyst Agent | Split oversized Phase 2 stories into independently implementable stories RL-0021 through RL-0031, added design handoff coverage, and updated dependencies, metrics, task files, and implementation order. |
| v1.23 | 2026-07-16 | Business Analyst Agent | Final Phase 2 risk-reduction pass: split Rest Timer continuity into RL-0032, clarified adjustment, rest-state, Week planning, milestone, QA, and RL-0014/RL-0021 sequencing rules. |
| v1.24 | 2026-07-16 | Release Manager Agent | Closed RL-0014 as Done after approved Home Dashboard redesign, QA pass, release artifacts, and accepted visual-difference backlog entries. |
| v1.25 | 2026-07-17 | Coordinator Agent | Selected RL-0021 as the next eligible Phase 2 design handoff story and started the sprint. |
| v1.26 | 2026-07-17 | Release Manager Agent | Closed RL-0021 as Done after Phase 2 design handoff documentation, Code Review approval, QA pass, user approval, and release closeout. |
| v1.27 | 2026-07-17 | Coordinator Agent | Selected RL-0015 as the next eligible Current Workout foundation story and started the sprint. |
| v1.28 | 2026-07-17 | Release Manager Agent | Closed RL-0015 as Done after Current Workout foundation implementation, Code Review approval, QA pass, user approval, and release closeout. |
| v1.29 | 2026-07-17 | Coordinator Agent | Selected RL-0022 as the next eligible Current Workout set progression story and started the sprint. |
| v1.30 | 2026-07-17 | Coordinator Agent | Put RL-0022 on hold after manual testing found missing screens; preserved partial Current Workout set-progression work for later resume. |
| v1.31 | 2026-07-17 | Business Analyst Agent | Added RL-0033 Workout Session Composition as the prerequisite planning flow for ordered daily sessions, mapped approved screens 09 and 10, and updated downstream dependencies and implementation order. |
| v1.32 | 2026-07-18 | Coordinator Agent | Selected RL-0033 as the next eligible prerequisite story and started the sprint. |
| v1.33 | 2026-07-18 | Release Manager Agent | Closed RL-0033 as Done after Workout Session Composition implementation, QA pass, and release closeout. |
| v1.34 | 2026-07-19 | Release Manager Agent | Closed RL-0022 as Done after Current Workout set progression implementation, focused QA pass, and release closeout. |
| v1.35 | 2026-07-19 | Release Manager Agent | Closed RL-0023 as Done after Current Workout control states implementation, focused QA pass, and release closeout. |
| v1.36 | 2026-07-19 | Release Manager Agent | Closed RL-0018 as Done after Rest Timer overlay implementation, focused QA pass, and release closeout. |
| v1.37 | 2026-07-20 | Release Manager Agent | Added and closed RL-0035 after fixing Weekly Progress to count completed daily sessions instead of completed exercise rows. |
| v1.38 | 2026-07-25 | Release Manager Agent | Closed RL-0026 as Done after Read-Only History implementation, focused QA pass, and release closeout. |
| v1.39 | 2026-07-25 | Release Manager Agent | Closed RL-0027 as Done after completed Workout Detail implementation, focused QA pass, and release closeout. |
| v1.40 | 2026-07-25 | Coordinator Agent | Added and selected RL-0036 as a focused bottom navigation tab switching hotfix. |
| v1.41 | 2026-07-25 | Release Manager Agent | Closed RL-0036 as Done after bottom navigation tab switching hotfix, focused QA pass, and release closeout. |
| v1.42 | 2026-07-25 | Coordinator Agent | Selected RL-0019 as the next eligible Achievement Hub Foundation story and started the sprint. |
| v1.43 | 2026-07-25 | Release Manager Agent | Closed RL-0019 as Done after Achievement hub foundation implementation, focused QA pass, and release closeout. |
| v1.44 | 2026-07-25 | Coordinator Agent | Selected RL-0028 as the next eligible Achievement Milestones And Titles story and started the sprint. |
| v1.45 | 2026-07-25 | Release Manager Agent | Closed RL-0028 as Done after Achievement milestone and title implementation, focused QA pass, and release closeout. |

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
user_stories/RL-0033/RL-0033_SPRINT_PLAN.md
docs/PRODUCT_BRIEF.md
docs/PROJECT_CONTEXT.md
docs/IMPROVEMENT_BACKLOG.md
user_stories/RL-0014/RL-0014_TASKS.md
user_stories/RL-0014/RL-0014_IMPLEMENTATION_NOTES.md
user_stories/RL-0014/RL-0014_CODE_REVIEW.md
user_stories/RL-0014/RL-0014_QA_REPORT.md
user_stories/RL-0014/RL-0014_RELEASE_NOTE.md
user_stories/RL-0015/RL-0015_TASKS.md
user_stories/RL-0015/RL-0015_SPRINT_PLAN.md
user_stories/RL-0015/RL-0015_UX_SPEC.md
user_stories/RL-0015/RL-0015_INTERPRETATION.md
user_stories/RL-0015/RL-0015_IMPLEMENTATION_NOTES.md
user_stories/RL-0015/RL-0015_CODE_REVIEW.md
user_stories/RL-0015/RL-0015_QA_REPORT.md
user_stories/RL-0015/RL-0015_RELEASE_NOTE.md
user_stories/RL-0016/RL-0016_TASKS.md
user_stories/RL-0017/RL-0017_TASKS.md
user_stories/RL-0018/RL-0018_TASKS.md
user_stories/RL-0018/RL-0018_SPRINT_PLAN.md
user_stories/RL-0018/RL-0018_UX_SPEC.md
user_stories/RL-0018/RL-0018_INTERPRETATION.md
user_stories/RL-0018/RL-0018_IMPLEMENTATION_NOTES.md
user_stories/RL-0018/RL-0018_CODE_REVIEW.md
user_stories/RL-0018/RL-0018_QA_REPORT.md
user_stories/RL-0018/RL-0018_RELEASE_NOTE.md
user_stories/RL-0019/RL-0019_TASKS.md
user_stories/RL-0020/RL-0020_TASKS.md
user_stories/RL-0021/RL-0021_TASKS.md
user_stories/RL-0021/RL-0021_SPRINT_PLAN.md
user_stories/RL-0021/RL-0021_UX_SPEC.md
user_stories/RL-0021/RL-0021_INTERPRETATION.md
user_stories/RL-0021/RL-0021_IMPLEMENTATION_NOTES.md
user_stories/RL-0021/RL-0021_CODE_REVIEW.md
user_stories/RL-0021/RL-0021_QA_REPORT.md
user_stories/RL-0021/RL-0021_RELEASE_NOTE.md
user_stories/RL-0022/RL-0022_TASKS.md
user_stories/RL-0023/RL-0023_TASKS.md
user_stories/RL-0024/RL-0024_TASKS.md
user_stories/RL-0025/RL-0025_TASKS.md
user_stories/RL-0026/RL-0026_TASKS.md
user_stories/RL-0027/RL-0027_TASKS.md
user_stories/RL-0028/RL-0028_TASKS.md
user_stories/RL-0029/RL-0029_TASKS.md
user_stories/RL-0030/RL-0030_TASKS.md
user_stories/RL-0031/RL-0031_TASKS.md
user_stories/RL-0032/RL-0032_TASKS.md
user_stories/RL-0033/RL-0033_TASKS.md
user_stories/RL-0033/RL-0033_SPRINT_PLAN.md
user_stories/RL-0033/RL-0033_UX_SPEC.md
user_stories/RL-0033/RL-0033_INTERPRETATION.md
user_stories/RL-0033/RL-0033_IMPLEMENTATION_NOTES.md
user_stories/RL-0033/RL-0033_CODE_REVIEW.md
user_stories/RL-0033/RL-0033_QA_REPORT.md
user_stories/RL-0033/RL-0033_RELEASE_NOTE.md
```

Next Agent:

```text
Coordinator
```

Next Prompt:

```text
RL-0018 is Done. Select the next eligible story from docs/EPIC_USER_STORY_TASKS.md.
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
- Existing `user_stories/RL-0000` through `user_stories/RL-0014` artifacts for history only.
- `docs/IMPROVEMENT_BACKLOG.md`

Expected Output:

* Coordinator routing decision for the next story.
* Done story states remain preserved.

Blocking Conditions:

* Do not modify Done stories unless a later approved story explicitly requires it.

Instructions:

* RL-0013 is Done.
* RL-0014 is Done.
* RL-0021 is Done.
* RL-0015 is Done.
* RL-0033 is Done.
* RL-0022 is Done.
* RL-0023 is Done.
* RL-0018 is Done.
* RL-0016 is Done.
* RL-0034 is Done.
* The next eligible P0 feature story is RL-0024.
* Preserve Story IDs and completed story state.
* Do not modify Done stories unless a later approved story explicitly requires it.
* Use `user_stories/RL-0021/RL-0021_UX_SPEC.md` as implementation-ready Phase 2 design handoff guidance.

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
| `design/approved/02_current_workout.png` | Current Workout Active | `RL-0015`, `RL-0022`, `RL-0023` |
| `design/approved/03_timer.png` | Rest Timer Overlay | `RL-0018`, `RL-0032`, supports `RL-0022` |
| `design/approved/04_workkout_summary.png` | Workout Summary | `RL-0016`, `RL-0024` |
| `design/approved/05_weekly_plan.png` | Week Planning | `RL-0017`, supports `RL-0025` |
| `design/approved/06_achievement.png` | Achievement Hub | `RL-0019`, `RL-0028`, `RL-0029` |
| `design/approved/07_history.png` | History | `RL-0026` |
| `design/approved/08_workout_detail.png` | Workout Detail / Session Detail | `RL-0025`, `RL-0027`, supports `RL-0015` |
| `design/approved/09_workout_plan_builder.png` | Workout Plan Builder | `RL-0033` |
| `design/approved/10_add_exercise.png` | Add Exercise Bottom Sheet | `RL-0033` |

Screen to story mapping:

| Approved Screen | Existing MVP Capability Reused | Phase 2 Story | Notes |
| --------------- | ------------------------------ | ------------- | ----- |
| Home Dashboard | RepLog identity, XP total, level progress, weekly goal progress, selected workout data | `RL-0014` | Refocuses Home into greeting, XP signal, Today's Focus, Weekly Progress, Next Achievement, and bottom navigation. Removes dashboard role overlap from timer, history, share cards, and editing. |
| Phase 2 Design Handoff | Approved PNGs, source-of-truth docs, current Material 3 foundation | `RL-0021` | Converts approved visual direction into implementation-ready screen notes, asset decisions, and QA checkpoints without redesigning the approved UX. |
| Current Workout Active | Workout log completion, local workout data, timer provider | `RL-0015`, `RL-0022`, `RL-0023` | `RL-0015` establishes the screen foundation, `RL-0022` adds set progression/rest handoff, and `RL-0023` adds pause, adjust, skip, and resume states. |
| Rest Timer Overlay | Existing rest timer presets and accessibility improvements | `RL-0018`, `RL-0032` | `RL-0018` owns only the rest overlay/modal UI and timer controls in Current Workout. `RL-0032` owns cross-screen/global timer continuity after the overlay exists. |
| Workout Summary | XP, levels, weekly goal progress, achievement/share-card systems | `RL-0016`, `RL-0024` | `RL-0016` creates the immediate celebration/reward shell; `RL-0024` adds private session details, optional sharing, and return actions. History must not reopen this celebration state. |
| Week Planning | Weekly calendar, weekly goal, workout logs | `RL-0017`, `RL-0025` | `RL-0017` owns Week planning structure; `RL-0025` owns planned/session detail and Start Today handoff. |
| Workout Plan Builder | Existing workout creation fields, weekly/day context, local persistence | `RL-0033` | Creates or edits one daily workout session containing multiple ordered exercises. Saved sessions feed Dashboard Today's Workout and Current Workout. |
| Add Exercise Bottom Sheet | Existing workout fields and local validation patterns | `RL-0033` | Adds or edits one exercise inside the daily session. New exercises append by insertion order. |
| Achievement Hub | XP, levels, share card privacy, consistency/recovery signals | `RL-0019`, `RL-0028`, `RL-0029` | `RL-0019` creates the Achievement hub foundation, `RL-0028` adds milestone/title depth, and `RL-0029` adds recent unlock/share moments without comparison. |
| History | Existing workout logs and completion state | `RL-0026` | Makes completed-workout review read-only and distinct from planning and summary. |
| Workout Detail / Session Detail | Existing workout detail fields and startable workout data | `RL-0025`, `RL-0027`, supports `RL-0015` | Planned/session detail can start a workout; completed History detail remains read-only and cannot act like Workout Summary. |

Requirement conflicts, gaps, and clarifications:

| Area | Issue | Resolution |
| ---- | ----- | ---------- |
| Workout Summary metrics | Approved summary includes duration, volume, calories, sets done, PR/growth-style details, while product rules avoid analytics pressure and embarrassing performance sharing. | Allow these only as private completion-summary details. Keep Dashboard and Achievement consistency-first, and keep share-card performance metrics hidden unless explicitly opted in by existing privacy rules. |
| Achievement streak language | Approved Achievement image includes active streak and "top 5% of users", while current docs reject comparison pressure and harsh missed-week punishment. | Keep streak wording supportive and non-punitive. Do not implement public ranking, percentile comparison, social comparison, or penalty mechanics. |
| History vs Today nav label | Approved `07_history.png` highlights the Today nav icon while showing History content. | Treat the screen title and file name as authoritative: this is History. Bottom-nav active-state mismatch requires UX clarification during `RL-0017`, not backlog restructuring. |
| Workout Detail start action | Approved `08_workout_detail.png` includes Start Workout, while `docs/USER_JOURNEY.md` says History detail is read-only. | Split responsibility: planned/session detail from Week may start a workout; completed History detail remains read-only and cannot act like Workout Summary. |
| Rest timer global behavior | Existing docs mention globally available floating timer; approved PNG shows a modal overlay over Current Workout. | `RL-0018` implements the overlay/modal only. Cross-screen floating/persistent behavior is split into `RL-0032` to avoid combining UI, countdown controls, navigation survival, and persistence in one cycle. |
| Phase 2 design handoff order | The design handoff should ideally precede screen implementation, but `RL-0014` is now Done. | Recommended handling: do not reopen `RL-0014` unless a significant UX issue is discovered later. Run `RL-0021` as the remaining backlog/design step before starting `RL-0015`, and route accepted Home visual differences through `docs/IMPROVEMENT_BACKLOG.md`. |
| Visual assets | Approved designs use exercise imagery and rich icons; current MVP mostly uses Material widgets. | `RL-0021`, `RL-0015`, `RL-0017`, and `RL-0030` must validate asset strategy without adding backend, sync, or broad content systems. |
| New achievements/titles | Approved designs show medals, titles, categories, and milestone lists beyond the MVP's simple level/XP display. | `RL-0019` may refine the Achievement presentation, but any new reward taxonomy must remain local, simple, and non-comparative. |
| Missing workout composition flow | RL-0022 validation found Current Workout progression has no approved way to create one daily session with multiple ordered exercises. | Add `RL-0033` before resuming `RL-0022`. `RL-0015` remains Done and is not reopened; `RL-0022`, `RL-0023`, and `RL-0025` must use the saved session from `RL-0033`. |
| Reorder affordance | Approved Workout Plan Builder shows a Reorder action, but the approved prerequisite scope only requires insertion-order behavior. | `RL-0033` preserves insertion order, appends new exercises to the end, closes numbering gaps after delete, and defers drag-and-drop or manual sorting to a later approved story. |

---

## RL-0033 Prerequisite Re-Evaluation

| Story | Existing Status | Prerequisite Decision | Reason |
| ----- | --------------- | --------------------- | ------ |
| `RL-0015` | Done | Do not retroactively add `RL-0033` or reopen the story. | `RL-0015` delivered the Current Workout foundation and placeholder action before the missing composition flow was discovered. Future stories that depend on executable multi-exercise data must use `RL-0033`. |
| `RL-0022` | Done | `RL-0033` was a direct prerequisite. | Set progression required a saved daily session with multiple ordered exercises before Exercise -> Rest -> Next Exercise could be validated. |
| `RL-0023` | Done | `RL-0033` was an indirect prerequisite through `RL-0022`. | Pause, adjust, skip, and resume states use the same composed-session state model after progression exists. |

Migration impact:

* Existing MVP workout logs and completed history should remain readable.
* `RL-0033` may require a new local persisted session shape or an extension of existing workout data; implementation must document any Hive adapter or migration impact before model changes.
* Dashboard should treat missing daily-session data as a planning empty state, not as a failed workout.
* Current Workout should start only from a valid saved session or a legacy-compatible workout entry.
* Partial `RL-0022` work remains preserved and should be resumed only after `RL-0033` is Done or explicitly waived.

---

## Phase 2 Epic Summary

| Epic ID | Epic | Goal | Priority | Status |
| ------- | ---- | ---- | -------- | ------ |
| EP-11 | Dashboard Redesign | Refocus Home Dashboard around today's next action and remove dashboard responsibilities that belong elsewhere. | P0 | Done |
| EP-12 | Guided Workout Flow | Make Current Workout the primary execution surface for step-by-step workout guidance. | P0 | In Progress |
| EP-13 | Completion Celebration | Separate immediate post-workout celebration from history review and reinforce rewards after completion. | P0 | Not Started |
| EP-14 | Journey Separation | Align Week, History, Achievement, and Rest Timer with their approved responsibilities. | P1 | In Progress |
| EP-15 | Phase 2 UX Quality | Validate the redesigned journey across common iPhone layouts, accessibility expectations, and local-first behavior. | P1 | In Progress |

---

## Phase 2 Recommended Implementation Order

Original ideal order if no implementation work has started:

```text
RL-0021
↓
RL-0014
↓
RL-0015
↓
RL-0033
↓
RL-0022
↓
RL-0023
↓
RL-0018
↓
RL-0016
↓
RL-0034
↓
RL-0035
↓
RL-0024
↓
RL-0032
↓
RL-0017
↓
RL-0025
↓
RL-0026
↓
RL-0027
↓
RL-0019
↓
RL-0028
↓
RL-0029
↓
RL-0030
↓
RL-0031
↓
RL-0020
```

Recommended handling after `RL-0014`, `RL-0021`, and `RL-0015` closure:

```text
RL-0014 is Done.
RL-0021 is Done.
RL-0015 is Done.
Do not reopen RL-0014 unless a significant UX issue is discovered later.
Add RL-0033 for the missing workout-composition prerequisite.
Resume the remaining split stories after RL-0033 is complete or explicitly waived.
```

Current recommended order after RL-0015 closure:

```text
RL-0033
↓
RL-0022
↓
RL-0023
↓
RL-0018
↓
RL-0016
↓
RL-0034
↓
RL-0035
↓
RL-0024
↓
RL-0032
↓
RL-0017
↓
RL-0025
↓
RL-0026
↓
RL-0027
↓
RL-0019
↓
RL-0028
↓
RL-0029
↓
RL-0030
↓
RL-0031
↓
RL-0020
```

---

## Phase 2 User Story Backlog

| Status | Story ID | Epic ID | Epic | MVP | Priority | Effort | Depends On | UX Required | User Approval Required | User Story | Acceptance Criteria |
| ------ | -------- | ------- | ---- | --- | -------- | ------ | ---------- | ----------- | ---------------------- | ---------- | ------------------- |
| Done | RL-0014 | EP-11 | Dashboard Redesign | Must Have | P0 | M | RL-0013 | Yes | Yes | As a beginner fitness user, I want the Home Dashboard to clearly tell me what I should do today, so that I can start or resume my workout without sorting through unrelated information. | - Uses `design/approved/01_home_screen.png` for approved layout and screen composition.<br>- Dashboard presents greeting/identity context, visible XP signal, Today's Focus, Weekly Progress, Next Achievement, and bottom navigation.<br>- Dashboard provides a clear Start or Resume Workout action from Today's Focus.<br>- Dashboard excludes History, Rest Timer, Share Cards, exercise editing, muscle maps, and detailed statistics as primary dashboard sections.<br>- Dashboard language emphasizes today's action and consistency.<br>- Existing offline data and completed MVP reward state remain intact. |
| Done | RL-0015 | EP-12 | Guided Workout Flow | Must Have | P0 | M | RL-0014, RL-0021 | Yes | Yes | As a user starting today's workout, I want a Current Workout screen foundation that clearly shows the active exercise and next action, so that workout execution has a focused home separate from Dashboard and planning. | - Uses `design/approved/02_current_workout.png` for approved Current Workout layout and screen composition.<br>- Current Workout displays workout title, active exercise, instruction text, sets/reps target, progress indicator, and one primary Complete Set action placeholder.<br>- Current Workout is reachable from Dashboard Start/Resume or an existing local workout entry without adding backend, login, cloud sync, or broad content systems.<br>- Workout execution is visually and functionally separated from Dashboard, Week planning, and History review.<br>- Existing workout log data and local persistence remain intact.<br>- Pause, adjust, skip, multi-set progression, rest handoff, resume state, and completion navigation are deferred to dependent stories. |
| Done | RL-0016 | EP-13 | Completion Celebration | Must Have | P0 | M | RL-0022 | Yes | Yes | As a user who just completed a workout, I want an immediate celebration screen that recognizes completion and reward progress, so that finishing feels meaningful before I return to the app. | - Uses `design/approved/04_workkout_summary.png` for the approved Workout Summary celebration layout and screen composition.<br>- Workout Summary appears immediately after workout completion from Current Workout.<br>- Workout Summary leads with celebration and recognition before supporting details.<br>- XP, level, weekly goal, achievement, or recovery rewards are shown when existing local data makes them relevant.<br>- Workout Summary cannot be reopened from History as if it were a normal detail screen.<br>- Private stats, optional share-card generation, Plan Tomorrow, and detailed return actions are deferred to `RL-0024`. |
| Done | RL-0017 | EP-14 | Week Planning | Should Have | P1 | M | RL-0014, RL-0021 | Yes | Yes | As a user planning my week, I want Week to show my local planned sessions by day, so that I can understand the week without mixing planning with Dashboard or History review. | - Uses `design/approved/05_weekly_plan.png` for approved Week layout and screen composition.<br>- Week owns screen structure, day navigation, planned session display, and existing local data presentation.<br>- Week may reuse existing workout creation behavior when necessary.<br>- Week does not own new inline editors, advanced planning tools, rescheduling systems, or new autosave experiences.<br>- Week does not display read-only history as its primary purpose.<br>- Week can show a session preview entry point, but detailed planned/session detail and Start Today behavior are deferred to `RL-0025`.<br>- History list and completed Workout Detail behavior are deferred to `RL-0026` and `RL-0027`. |
| Done | RL-0018 | EP-14 | Rest Timer Overlay | Should Have | P1 | M | RL-0022 | Yes | Yes | As a user resting during a workout, I want a focused Rest Timer overlay, so that I can manage the current rest interval without leaving Current Workout. | - Uses `design/approved/03_timer.png` for approved rest overlay layout and screen composition.<br>- Rest Timer belongs to Workout Flow and is not a Dashboard section.<br>- Rest Timer appears as an overlay/modal while resting during an active workout.<br>- Overlay includes countdown UI, skip rest, extend rest, close/dismiss, and return-to-Current-Workout behavior.<br>- Existing timer presets and accessibility touch targets remain usable.<br>- Timer survival across navigation, global/floating timer state, return-to-workout entry from other screens, and active timer persistence are deferred to `RL-0032`. |
| Done | RL-0019 | EP-14 | Achievement Hub Foundation | Should Have | P1 | M | RL-0016, RL-0021 | Yes | Yes | As a consistency-focused user, I want an Achievement hub that shows my level and long-term growth without comparison, so that progress feels motivating rather than judgmental. | - Uses `design/approved/06_achievement.png` for approved Achievement hub layout and screen composition.<br>- Achievement displays level, XP/rep score concept, current title/reward state, and high-level progress using existing local XP/level data where possible.<br>- Achievement language prioritizes consistency, return, and recognition over performance.<br>- Dashboard shows only short-term achievement preview, not full achievement detail.<br>- Achievement does not introduce rankings, leaderboards, public percentile claims, social comparison, public profiles, penalties, or level loss.<br>- Detailed medals, milestone lists, title collection, recent unlocks, and share moments are deferred to `RL-0028` and `RL-0029`. |
| Not Started | RL-0020 | EP-15 | Phase 2 Final Journey QA | Should Have | P1 | S | RL-0031 | Yes | Yes | As a release reviewer, I want a final Phase 2 readiness review, so that already-completed screen and integration QA can be evaluated without repeating the entire QA pass. | - Reviews `RL-0030` screen QA and `RL-0031` integration/regression QA evidence instead of repeating all previous QA work.<br>- Confirms no unresolved blockers remain for the Guide -> Complete -> Celebrate -> Reward -> Come Back loop.<br>- Confirms final validation evidence includes `flutter analyze` and `flutter test`, or documented skipped-test limitations.<br>- Confirms privacy, local-first, no-backend, no-login, no-cloud-sync, and non-comparison boundaries remain intact.<br>- Release readiness notes identify accepted limitations and remaining Phase 2 UX risks without reopening completed MVP stories.<br>- RL-0020 does not add new feature implementation or broad manual screen retesting unless previous QA evidence is missing or blocked. |
| Done | RL-0021 | EP-15 | Phase 2 Design Handoff | Must Have | P0 | S | RL-0013 | Yes | Yes | As an implementation team, I want approved Phase 2 designs translated into build-ready guidance, so that developers can implement the redesign consistently without redesigning it during coding. | - Reviews all files in `design/approved/` and records screen-specific implementation notes without changing approved UX direction.<br>- Defines reusable layout, color, icon, typography, spacing, and asset-handling guidance compatible with existing Material 3 constraints.<br>- Identifies which approved visual elements can use existing Material widgets and which require local assets or simplified placeholders.<br>- Adds design QA checkpoints for each approved screen, including mobile layout, touch targets, contrast, and non-overlap expectations.<br>- Does not introduce backend, login, cloud sync, external asset services, new product scope, or redesigned flows.<br>- Because `RL-0014` is Done, the handoff may record Home follow-up guidance but must not reopen RL-0014 unless a significant UX issue is discovered later.<br>- Produces a handoff artifact usable by Code Writer, Code Reviewer, and QA agents. |
| Done | RL-0033 | EP-12 | Workout Session Composition | Must Have | P0 | M | RL-0015, RL-0021 | Yes | Yes | As a user preparing today's workout, I want to create one daily workout session with multiple ordered exercises, so that Dashboard and Current Workout know what workout should be started and guided. | - Uses `design/approved/09_workout_plan_builder.png` for approved Workout Plan Builder layout and screen composition.<br>- Uses `design/approved/10_add_exercise.png` for approved Add Exercise bottom sheet layout and screen composition.<br>- User can create one daily workout session with a session title and at least one valid exercise.<br>- User can add multiple exercises, and new exercises append in insertion order.<br>- User can edit an existing exercise without changing its order.<br>- User can delete an exercise, and remaining exercise numbering closes the gap.<br>- Session and exercises persist locally and remain available after app restart.<br>- Dashboard can show the saved daily session as today's workout handoff.<br>- Current Workout can start from the saved session without creating duplicate completed records.<br>- Scope excludes templates, drag-and-drop sorting, multiple sessions per day, cloud sync, achievements, and timer flow. |
| Done | RL-0022 | EP-12 | Current Workout Set Progression | Must Have | P0 | M | RL-0015, RL-0033 | Yes | Yes | As a user moving through a workout, I want Complete Set to advance me into a rest state or the next exercise, so that workout progress is clear without adding timer UI yet. | - Builds on the Current Workout screen foundation from `RL-0015` and the composed daily session from `RL-0033`.<br>- Complete Set updates local workout progress for the active exercise without duplicating XP/reward behavior.<br>- Current Workout progresses through the saved exercise order using Exercise -> Rest state -> Next Exercise.<br>- RL-0022 does not implement timer countdown UI, timer controls, overlay/modal UI, or cross-screen timer continuity.<br>- Rest state exposes the information required by `RL-0018`, such as active workout, completed set/exercise, next exercise, suggested rest duration, and return target.<br>- Completion state is reached when all planned sets/exercises in the saved session are done and can hand off to `RL-0016`.<br>- Existing workout completion and local persistence behavior remain intact. |
| Done | RL-0023 | EP-12 | Current Workout Control States | Must Have | P0 | M | RL-0022 | Yes | Yes | As a user whose active session needs small adjustments, I want pause, adjust, skip, and resume states in Current Workout, so that the flow remains flexible without becoming an editor. | - Current Workout supports pause and resume states with clear status text and primary action changes.<br>- Users can skip the active exercise or set without corrupting local workout progress.<br>- Adjust is limited to changing current session reps and current session weight only.<br>- Adjust must not modify weekly plans, edit workout templates, become a workout editor, or modify historical records.<br>- Control states do not turn Current Workout into the Week planner or History editor.<br>- Navigation away and back preserves enough local state to continue the active workout.<br>- QA covers pause, resume, skip, current-session reps/weight adjustment, and return-to-workout behavior. |
| Done | RL-0034 | EP-12 | Current Workout Structural Refactor | Must Have | P0 | S | RL-0016, RL-0018, RL-0022, RL-0023 | No | No | As a development team, I want Current Workout split into smaller behavior-preserving modules, so that upcoming workout-flow features can be implemented with lower regression risk. | - `CurrentWorkoutScreen` remains the route-level screen entry point.<br>- Rest timer overlay UI is extracted from `current_workout_screen.dart` into a focused widget/module without changing user-facing behavior.<br>- Current-session adjustment UI is extracted from `current_workout_screen.dart` into a focused widget/module without changing user-facing behavior.<br>- Current Workout display cards/widgets are extracted into focused widget files where doing so does not alter behavior.<br>- Pure workout-progress calculations or state-transition helpers are extracted only when focused tests can preserve current behavior.<br>- No UX redesign, new feature behavior, persistence schema change, new dependency, backend, login, cloud sync, or broad state-management migration is introduced.<br>- Focused Current Workout widget tests, relevant service tests, `flutter analyze`, and diff hygiene pass or known harness limitations are documented. |
| Done | RL-0035 | EP-06 | Weekly Session Progress Bug Fix | Must Have | P0 | S | RL-0008, RL-0033 | No | Yes | As a beginner fitness user, I want Weekly Progress to count completed workout sessions instead of completed exercises, so that my weekly goal reflects how many sessions I completed rather than how many exercises were inside one session. | - Weekly Progress counts completed daily workout sessions, not completed exercise rows.<br>- Completing one daily session increases Weekly Progress by exactly 1 regardless of how many exercises are completed in that session.<br>- Multiple completed exercises with the same session date count as one completed workout session.<br>- The same completed session is not counted more than once.<br>- Existing Monday-to-Sunday weekly boundary behavior remains unchanged.<br>- Incomplete exercises do not count toward Weekly Progress.<br>- No Hive schema migration, backend, login, cloud sync, or broad workout-history redesign is introduced. |
| Done | RL-0024 | EP-13 | Workout Summary Private Details And Sharing | Must Have | P0 | M | RL-0016 | Yes | Yes | As a user reviewing a completed workout, I want private session details and optional sharing to be available only from the completion summary, so that I can celebrate without weakening privacy. | - Builds on the immediate Workout Summary from `RL-0016`.<br>- Private session details such as duration, volume, calories, sets, or moment of day appear only in the completion-summary context where locally available.<br>- Optional share-card generation is available only as a user-initiated action.<br>- Existing share-card privacy defaults remain intact and performance metrics remain hidden unless explicitly opted in by existing rules.<br>- Plan Tomorrow and Back to Dashboard actions return users to the correct journey without reopening History as Summary.<br>- History cannot reopen the celebration summary state. |
| Done | RL-0025 | EP-14 | Planned Session Detail And Start Today | Should Have | P1 | M | RL-0017, RL-0015, RL-0033 | Yes | Yes | As a user viewing a planned session, I want a focused detail screen that can start today's workout, so that planning can hand off cleanly to Current Workout. | - Uses `design/approved/08_workout_detail.png` only for planned/session detail that can start a workout.<br>- Planned Session Detail displays session name, exercises, sets/reps, notes, and Start Workout or Start Today action where appropriate.<br>- Start Workout hands off to Current Workout using the locally saved composed session without creating duplicate completed records.<br>- Planned/session detail remains separate from completed History detail.<br>- Local persistence preserves planned workout data and active workout handoff state.<br>- QA covers Week -> planned detail -> Start Today -> Current Workout navigation. |
| Done | RL-0026 | EP-14 | Read-Only History | Should Have | P1 | M | RL-0016, RL-0017 | Yes | Yes | As a user reviewing completed sessions, I want History to show completed workouts without editing or celebration states, so that review feels clear and safe. | - Uses `design/approved/07_history.png` for approved History layout and screen composition.<br>- History displays completed workout records grouped by recent periods where practical.<br>- History is read-only and excludes planning edits, Start Workout, rest timer controls, and Workout Summary celebration behavior.<br>- History can navigate to completed Workout Detail, deferred to `RL-0027`.<br>- Dashboard and Week do not duplicate History as a primary section.<br>- QA verifies completed records are review-only and navigation returns cleanly. |
| Done | RL-0027 | EP-14 | Completed Workout Detail | Should Have | P1 | M | RL-0026 | Yes | Yes | As a user opening a completed workout, I want Workout Detail to show what I did without acting like Summary or planning, so that history review remains read-only. | - Uses `design/approved/08_workout_detail.png` only for completed History detail in this story.<br>- Completed Workout Detail displays completed record fields such as exercises, sets, reps, weight, notes, and date where locally available.<br>- Completed Workout Detail excludes Start Workout, celebration animations, reward granting, and summary-only sharing prompts.<br>- Detail state cannot modify completed history records unless a later approved story explicitly adds editing.<br>- Navigation returns to History and then Dashboard predictably.<br>- QA verifies completed detail does not reopen Workout Summary. |
| Done | RL-0036 | EP-14 | Bottom Navigation Tab Switching Bug Fix | Must Have | P0 | S | RL-0014, RL-0017, RL-0026 | Yes | Yes | As a user moving between implemented tabs, I want bottom navigation to switch directly between Home, Week, and History, so that I do not have to route through Home when changing sections. | - Home can open Week and History directly.<br>- Week can open Home and History directly.<br>- History can open Home and Week directly.<br>- Re-selecting the current implemented tab does not push duplicate routes.<br>- Today and Achievement remain placeholders until approved stories implement them.<br>- Existing Week, History, planned Session Detail, and completed Workout Detail behavior remains intact. |
| Done | RL-0028 | EP-14 | Achievement Milestones And Titles | Should Have | P1 | M | RL-0019 | Yes | Yes | As a user checking long-term growth, I want a small set of predefined milestones and titles to show what I can unlock next, so that Achievement feels meaningful without becoming a complex achievement engine. | - Builds on the Achievement hub foundation from `RL-0019`.<br>- Uses a small predefined local milestone catalog.<br>- Reuses existing XP and completion data where possible.<br>- Displays medals or achievements, milestone progress, and title/reward collection using simple local rules.<br>- Does not introduce generic rule engines, configurable achievements, dynamic achievement definitions, backend systems, public ranking, percentile claims, social comparison, public profiles, penalties, or level loss.<br>- Unlock requirements are clear, consistency-focused, and non-punitive.<br>- QA verifies milestone and title states for locked, in-progress, and unlocked examples. |
| Done | RL-0029 | EP-14 | Achievement Unlock And Share Moments | Should Have | P1 | S | RL-0028, RL-0024 | Yes | Yes | As a user who earns recognition, I want recent unlock and share moments to be visible only when I choose, so that rewards feel celebratory and private. | - Achievement shows recent unlock moments without requiring social posting.<br>- Share actions are user-initiated and preserve existing share-card privacy defaults.<br>- Recent unlock language reinforces consistency and return, not performance comparison.<br>- Dashboard remains limited to short-term preview and does not become the full Achievement hub.<br>- Existing share-card generation tracking remains local.<br>- QA covers unlock visibility, share entry point, and privacy-default preservation. |
| Not Started | RL-0030 | EP-15 | Phase 2 Screen QA | Should Have | P1 | M | RL-0032, RL-0024, RL-0027, RL-0029, RL-0033 | Yes | Yes | As a QA reviewer, I want each approved Phase 2 screen validated independently, so that screen-level layout and accessibility issues are caught before integration testing. | - Screen QA only: validates Home, Workout Plan Builder, Add Exercise bottom sheet, Current Workout, Rest Timer, Workout Summary, Week, Achievement, History, and Workout Detail independently against `design/approved/` responsibilities.<br>- Checks common iPhone layouts for readable text, touch targets, contrast, navigation predictability, and non-overlapping content.<br>- Confirms each screen owns only its intended responsibility.<br>- Does not validate full cross-screen journeys, navigation survival, or end-to-end regression flows except where needed to enter the screen under test.<br>- Runs `flutter analyze`.<br>- Runs focused widget or service tests relevant to changed screens where available.<br>- Documents any skipped tests or manual-only checks without changing production behavior just for the harness. |
| Not Started | RL-0031 | EP-15 | Phase 2 Journey Regression QA | Should Have | P1 | M | RL-0030 | Yes | Yes | As a QA reviewer, I want cross-screen integration and regression QA, so that the redesigned screens work together as one product experience. | - Cross-screen integration and regression QA only.<br>- Validates Dashboard -> Workout Plan Builder -> Add Exercise -> Save Workout -> Dashboard -> Current Workout handoff.<br>- Validates Dashboard -> Current Workout -> Rest -> Completion -> Summary -> Achievement/Reward -> Dashboard flow.<br>- Validates Week -> Planned Session Detail -> Start Today -> Current Workout handoff.<br>- Validates History -> Completed Workout Detail review without reopening Summary.<br>- Validates Rest Timer continuity behavior from `RL-0032` across allowed navigation paths.<br>- Validates Achievement rewards and share moments preserve privacy and non-comparison rules.<br>- Runs `flutter test` or documents skipped tests as known limitations.<br>- Produces final integration evidence for `RL-0020` release readiness. |
| Done | RL-0032 | EP-14 | Cross-Screen Rest Timer Continuity | Should Have | P1 | M | RL-0018, RL-0023, RL-0034 | Yes | Yes | As a user resting during an active workout, I want the timer to survive navigation and give me a way back to the workout, so that rest remains connected to the workout flow across screens. | - Builds on the Rest Timer overlay from `RL-0018`.<br>- Timer survives allowed navigation during an active workout flow.<br>- Global/floating timer state remains visible or recoverable where it supports active workout continuity.<br>- Users have a clear return-to-workout entry point from active timer state.<br>- Active timer state persists during the workout flow without introducing backend, login, cloud sync, or cross-device behavior.<br>- Timer continuity remains scoped to active workout flow and is not a Dashboard feature, standalone timer mode, or background service outside the app.<br>- QA covers navigation survival, active timer state, return-to-workout entry, and cleanup when rest/workout ends. |

---

## Phase 2 Split Mapping

| Original Story | Previous Scope | Revised Story Set | Rationale |
| -------------- | -------------- | ----------------- | --------- |
| `RL-0015` | Current Workout layout, set progression, rest handoff, pause, adjust, skip, start, resume, and completion. | `RL-0015` Current Workout foundation; `RL-0022` set progression and rest handoff; `RL-0023` pause, adjust, skip, and resume states. | The original story combined UI foundation, workout state machine, persistence, controls, and completion handoff. The split keeps each development cycle focused on one Current Workout responsibility. |
| `RL-0016` | Celebration, reward display, private stats, sharing, Plan Tomorrow, Back to Dashboard, and History separation. | `RL-0016` immediate celebration/reward shell; `RL-0024` private details, optional sharing, Plan Tomorrow, and return actions. | The original story mixed completion routing, reward display, private metrics, share privacy, and navigation. The split protects summary correctness before adding optional detail and sharing. |
| `RL-0017` | Week planning, History, planned/session detail, completed detail, Start Today, read-only review, and navigation. | `RL-0017` Week planning; `RL-0025` planned session detail and Start Today; `RL-0026` read-only History; `RL-0027` completed Workout Detail. | The original story covered three screens and two different detail modes. The split keeps planning, start handoff, history list, and completed detail independently testable. |
| `RL-0018` | Rest overlay/modal UI, countdown controls, cross-screen timer survival, global/floating timer state, return-to-workout entry, and active timer persistence. | `RL-0018` Rest Timer overlay only; `RL-0032` Cross-Screen Rest Timer Continuity. | The original Rest Timer scope still combined UI controls, countdown, navigation survival, and persistence. The split lets overlay behavior ship before global continuity is added. |
| `RL-0019` | Achievement hub, medals, milestones, titles, recent unlocks, share moments, Dashboard preview, and non-comparison rules. | `RL-0019` Achievement hub foundation; `RL-0028` milestones and titles; `RL-0029` unlock and share moments. | The original story combined screen foundation, reward taxonomy, unlock state, privacy, and sharing. The split preserves non-comparison boundaries while allowing incremental motivation depth. |
| `RL-0020` | Full Phase 2 journey QA, screen QA, accessibility, layout, automation, skipped-test review, and release readiness. | `RL-0030` screen-level QA; `RL-0031` cross-screen integration and regression QA; `RL-0020` final release-readiness review only. | The original QA story was small in effort but large in validation surface. The split separates screen acceptance, integration/regression, and final release review so RL-0020 does not repeat all prior QA work. |
| Missing design coverage | Approved PNGs were mapped to implementation stories, but there was no dedicated design handoff story. | `RL-0021` Phase 2 Design Handoff. | The backlog needed a non-redesign design step that converts approved visual references into implementation notes, asset decisions, and QA checkpoints before remaining screen work proceeds. |

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
| `RL-0021` | `user_stories/RL-0021/RL-0021_TASKS.md` |
| `RL-0022` | `user_stories/RL-0022/RL-0022_TASKS.md` |
| `RL-0023` | `user_stories/RL-0023/RL-0023_TASKS.md` |
| `RL-0024` | `user_stories/RL-0024/RL-0024_TASKS.md` |
| `RL-0025` | `user_stories/RL-0025/RL-0025_TASKS.md` |
| `RL-0026` | `user_stories/RL-0026/RL-0026_TASKS.md` |
| `RL-0027` | `user_stories/RL-0027/RL-0027_TASKS.md` |
| `RL-0036` | `user_stories/RL-0036/RL-0036_TASKS.md` |
| `RL-0028` | `user_stories/RL-0028/RL-0028_TASKS.md` |
| `RL-0029` | `user_stories/RL-0029/RL-0029_TASKS.md` |
| `RL-0030` | `user_stories/RL-0030/RL-0030_TASKS.md` |
| `RL-0031` | `user_stories/RL-0031/RL-0031_TASKS.md` |
| `RL-0032` | `user_stories/RL-0032/RL-0032_TASKS.md` |
| `RL-0033` | `user_stories/RL-0033/RL-0033_TASKS.md` |
| `RL-0034` | `user_stories/RL-0034/RL-0034_TASKS.md` |
| `RL-0035` | `user_stories/RL-0035/RL-0035_TASKS.md` |
