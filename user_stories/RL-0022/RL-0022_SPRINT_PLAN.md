# RL-0022 Sprint Plan

## Story

Story ID:
RL-0022

Epic:
EP-12 Guided Workout Flow

Status:
On Hold

User Story:
As a user moving through a workout, I want Complete Set to advance me into a rest state or the next exercise, so that workout progress is clear without adding timer UI yet.

## Acceptance Criteria

- Builds on the Current Workout screen foundation from `RL-0015`.
- Complete Set updates local workout progress for the active exercise without duplicating XP/reward behavior.
- Current Workout progresses through Exercise -> Rest state -> Next Exercise using existing local workout data.
- RL-0022 does not implement timer countdown UI, timer controls, overlay/modal UI, or cross-screen timer continuity.
- Rest state exposes the information required by `RL-0018`, such as active workout, completed set/exercise, next exercise, suggested rest duration, and return target.
- Completion state is reached when all planned sets/exercises are done and can hand off to `RL-0016`.
- Existing workout completion and local persistence behavior remain intact.

## Dependencies

- RL-0015: Done.

## Hold Decision

Status:
On Hold

Date:
2026-07-17

Reason:
Manual testing found missing screens that should be addressed before Current Workout set progression continues.

Resume Condition:
Resume RL-0022 only after the missing-screen gap is resolved or explicitly waived by the user.

Preserved Work:
Partial Current Workout set-progression implementation and focused widget-test work remain in the repository for later resume.

## Scope

In scope:

- Add Current Workout set progression on top of the RL-0015 foundation.
- Change Complete Set from placeholder feedback into a story-scoped progression action.
- Represent Exercise -> Rest state -> Next Exercise using existing local workout data.
- Expose rest-state information needed by RL-0018 without implementing timer UI.
- Reach a completion-ready state after all planned sets/exercises are done.
- Preserve existing XP/reward idempotency and local persistence behavior.

Out of scope:

- Timer countdown UI.
- Timer controls.
- Rest overlay or modal UI.
- Cross-screen timer continuity.
- Pause, adjust, skip, and resume states from RL-0023.
- Workout Summary implementation from RL-0016.
- Backend, login, cloud sync, external analytics SDK, external asset services, social graph, public ranking, broad content systems, or data-model rewrites.

## Execution Order

1. Confirm RL-0015 is Done and Current Workout foundation exists.
2. Produce UX guidance for Complete Set progression, rest-state display, next exercise handoff, and completion-ready state.
3. Interpret RL-0022 into story-scoped state, persistence, and deferral requirements.
4. Implement progression using existing local workout data and the Current Workout foundation.
5. Add or update focused tests for exercise progression, rest-state information, next exercise display, completion-ready state, and no XP duplication.
6. Run static analysis and relevant tests.
7. Complete Code Review and QA.
8. Release RL-0022 after QA passes and user approval is satisfied.

## Agent Assignments

1. Coordinator
2. UX Designer
3. User Story Interpreter
4. Code Writer
5. Code Reviewer
6. QA Tester
7. Release Manager

## UX Routing Decision

UX Required:
Yes

Reason:
RL-0022 changes the primary Current Workout interaction flow by adding progression, rest state, and next-exercise handoff behavior.

Next Agent:
Coordinator

Next Prompt:
Review missing screens before resuming RL-0022.

## User Approval Decision

User Approval Required:
Yes

Reason:
RL-0022 changes the primary workout execution flow and must be validated before release.

## Required Deliverables

- `user_stories/RL-0022/RL-0022_SPRINT_PLAN.md`
- `user_stories/RL-0022/RL-0022_UX_SPEC.md`
- `user_stories/RL-0022/RL-0022_INTERPRETATION.md`
- `user_stories/RL-0022/RL-0022_IMPLEMENTATION_NOTES.md`
- `user_stories/RL-0022/RL-0022_CODE_REVIEW.md`
- `user_stories/RL-0022/RL-0022_QA_REPORT.md`
- `user_stories/RL-0022/RL-0022_RELEASE_NOTE.md`

## Risks Or Blockers

- RL-0022 is On Hold because manual testing found missing screens.
- RL-0022 must not drift into timer overlay or cross-screen timer continuity.
- RL-0022 must not implement RL-0023 pause, adjust, skip, or resume controls.
- Completion behavior must not duplicate XP/reward behavior.

## Expected Outcome

- RL-0022 remains preserved as On Hold.
- Coordinator reviews the missing-screen issue before selecting or resuming the next implementation step.
- RL-0018 and RL-0016 handoff work does not proceed through RL-0022 until the gap is resolved or explicitly waived.

## Agent Handoff

Current Agent:

```text
Coordinator
```

Completed Output:

```text
docs/EPIC_USER_STORY_TASKS.md
docs/SPRINT_PLAN.md
user_stories/RL-0022/RL-0022_SPRINT_PLAN.md
```

Next Agent:

```text
Coordinator
```

Next Prompt:

```text
Review the missing screens found during manual testing, decide whether backlog/story sequencing needs adjustment, and do not continue RL-0022 until the missing-screen gap is resolved or explicitly waived.
```

Required Input Files:

- `docs/EPIC_USER_STORY_TASKS.md`
- `docs/PRODUCT_BRIEF.md`
- `docs/PROJECT_CONTEXT.md`
- `docs/ARCHITECTURE.md`
- `docs/USER_JOURNEY.md`
- `docs/SCREEN_STRUCTURE.md`
- `user_stories/RL-0022/RL-0022_TASKS.md`
- `user_stories/RL-0022/RL-0022_SPRINT_PLAN.md`
- `user_stories/RL-0015/RL-0015_RELEASE_NOTE.md`
- `user_stories/RL-0021/RL-0021_UX_SPEC.md`
- `design/approved/02_current_workout.png`
- `design/approved/03_timer.png`

Optional Input Files:

- `docs/LOW-FI-WIREFRAME.md`
- Existing completed story artifacts for historical context only.

Expected Output:

- Missing-screen assessment or follow-up story selection.
- Updated sprint plan for the selected next step.
- RL-0022 remains On Hold until resume approval.

Blocking Conditions:

- Stop if progression requires timer countdown UI, timer controls, overlay/modal UI, or cross-screen continuity.
- Stop if progression cannot preserve XP/reward idempotency.
- Stop if implementation would require backend, login, cloud sync, external asset services, or broad content systems.
- Stop if the next step would continue RL-0022 without resolving or explicitly waiving the missing-screen issue.

Instructions:

- Preserve RL-0022 partial work for later resume.
- Do not continue RL-0022 until the missing-screen issue is resolved or explicitly waived.
- Keep any next selected work scoped to the missing-screen gap or an explicitly approved follow-up.
