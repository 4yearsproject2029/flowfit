# RL-0023 Sprint Plan

## Story

Story ID:
RL-0023

Epic:
EP-12 Guided Workout Flow

Status:
Done

User Story:
As a user whose active session needs small adjustments, I want pause, adjust, skip, and resume states in Current Workout, so that the flow remains flexible without becoming an editor.

## Acceptance Criteria

- Current Workout supports pause and resume states with clear status text and primary action changes.
- Users can skip the active exercise or set without corrupting local workout progress.
- Adjust is limited to changing current session reps and current session weight only.
- Adjust must not modify weekly plans, edit workout templates, become a workout editor, or modify historical records.
- Control states do not turn Current Workout into the Week planner or History editor.
- Navigation away and back preserves enough local state to continue the active workout.
- QA covers pause, resume, skip, current-session reps/weight adjustment, and return-to-workout behavior.

## Dependencies

- RL-0022: Done.
- RL-0033: Done indirectly through RL-0022.

## Scope

In scope:

- Add pause and resume states to Current Workout.
- Add session-local Skip Set and Skip Exercise controls.
- Add session-local reps and weight adjustment.
- Preserve active workout control state when navigating back to Dashboard and returning during the same app session.
- Keep focused widget coverage for the control states.

Out of scope:

- Editing saved workout plans.
- Editing workout templates.
- Editing historical records.
- Pause persistence across app restart.
- New Hive fields or adapters.
- Timer overlay, timer countdown, timer controls, or cross-screen timer continuity.
- Workout Summary implementation.
- Week planner or History editor behavior.

## Execution Order

Completed:

1. Coordinator selected RL-0023 as the next eligible P0 story after RL-0022 release.
2. UX Designer produced control-state guidance.
3. User Story Interpreter produced implementation-ready requirements.
4. Code Writer implemented Current Workout pause, resume, skip, adjust, and return-state behavior.
5. Code Reviewer approved the implementation.
6. QA Tester passed focused RL-0023 evidence.
7. Release Manager closed RL-0023 and synchronized release artifacts.

Next coordinator action:

1. Select the next eligible story from `docs/EPIC_USER_STORY_TASKS.md`.

## Agent Assignments

1. Coordinator
2. UX Designer
3. User Story Interpreter
4. Code Writer
5. Code Reviewer
6. QA Tester
7. Release Manager
8. Coordinator

## UX Routing Decision

UX Required:
Yes

Reason:
RL-0023 changes primary Current Workout interaction behavior by adding pause, resume, skip, and adjust states.

Status:
Completed

## User Approval Decision

User Approval Required:
Yes

Reason:
RL-0023 changes the primary workout execution flow.

Approval Evidence:
User instructed Coordinator to continue workflow until release.

Status:
Approved

## Required Deliverables

- `user_stories/RL-0023/RL-0023_SPRINT_PLAN.md`
- `user_stories/RL-0023/RL-0023_UX_SPEC.md`
- `user_stories/RL-0023/RL-0023_INTERPRETATION.md`
- `user_stories/RL-0023/RL-0023_IMPLEMENTATION_NOTES.md`
- `user_stories/RL-0023/RL-0023_CODE_REVIEW.md`
- `user_stories/RL-0023/RL-0023_QA_REPORT.md`
- `user_stories/RL-0023/RL-0023_RELEASE_NOTE.md`
- `docs/EPIC_USER_STORY_TASKS.md`
- `docs/SPRINT_PLAN.md`
- `DEVELOPMENT_LOG.md`

Status:
Completed

## Risks Or Blockers

- Full `flutter test -r expanded` still has the existing Hive-backed widget harness stall; focused widget and storage regression tests passed.
- Session control snapshots are in-memory only and intentionally do not survive app restart.
- Skip behavior updates active session progress only and does not grant completion XP for skipped work.

## Expected Outcome

- RL-0023 is Done.
- Current Workout supports pause/resume, skip set, skip exercise, current-session reps/weight adjustment, and return-to-workout state recovery.
- Saved plans, templates, and historical records remain unchanged by adjust controls.

## Agent Handoff

Current Agent:

```text
Release Manager
```

Completed Output:

```text
user_stories/RL-0023/RL-0023_RELEASE_NOTE.md
docs/EPIC_USER_STORY_TASKS.md
docs/SPRINT_PLAN.md
DEVELOPMENT_LOG.md
```

Next Agent:

```text
Coordinator
```

Next Prompt:

```text
RL-0023 is Done. Select the next eligible story from docs/EPIC_USER_STORY_TASKS.md.
```

Required Input Files:

- `docs/EPIC_USER_STORY_TASKS.md`
- `docs/SPRINT_PLAN.md`
- `user_stories/RL-0023/RL-0023_RELEASE_NOTE.md`

Expected Output:

- Coordinator routing decision for the next story.

Blocking Conditions:

- Do not modify Done stories unless a later approved story explicitly requires it.
