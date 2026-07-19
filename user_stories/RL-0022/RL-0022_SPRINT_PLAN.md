# RL-0022 Sprint Plan

## Story

Story ID:
RL-0022

Epic:
EP-12 Guided Workout Flow

Status:
Done

User Story:
As a user moving through a workout, I want Complete Set to advance me into a rest state or the next exercise, so that workout progress is clear without adding timer UI yet.

## Acceptance Criteria

- Builds on the Current Workout screen foundation from `RL-0015` and the composed daily session from `RL-0033`.
- Complete Set updates local workout progress for the active exercise without duplicating XP/reward behavior.
- Current Workout progresses through the saved exercise order using Exercise -> Rest state -> Next Exercise.
- RL-0022 does not implement timer countdown UI, timer controls, overlay/modal UI, or cross-screen timer continuity.
- Rest state exposes the information required by `RL-0018`, such as active workout, completed set/exercise, next exercise, suggested rest duration, and return target.
- Completion state is reached when all planned sets/exercises in the saved session are done and can hand off to `RL-0016`.
- Existing workout completion and local persistence behavior remain intact.

## Dependencies

- RL-0015: Done.
- RL-0021: Done.
- RL-0033: Done.

## Resume Decision

Status:
Done

Date:
2026-07-19

Reason:
RL-0033 released the missing Workout Plan Builder and Add Exercise screens, satisfying the previous hold condition for RL-0022.

## Scope

In scope:

- Add Current Workout set progression on top of the RL-0015 foundation.
- Change Complete Set from placeholder feedback into a story-scoped progression action.
- Represent Exercise -> Rest state -> Next Exercise using saved local workout-session data.
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

Completed:

1. Coordinator resumed RL-0022 after RL-0033 released the missing planning prerequisite.
2. UX Designer produced Current Workout progression guidance.
3. User Story Interpreter produced implementation-ready requirements.
4. Code Writer finalized focused Current Workout progression coverage.
5. Code Reviewer approved the implementation.
6. QA Tester passed the story with focused evidence and documented the full-suite harness limitation.
7. Release Manager closed RL-0022 and synchronized release artifacts.

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
RL-0022 changes the primary Current Workout interaction flow by adding progression, rest state, and next-exercise handoff behavior.

Status:
Completed

## User Approval Decision

User Approval Required:
Yes

Reason:
RL-0022 changes the primary workout execution flow and must be validated before release.

Approval Evidence:
User instructed Coordinator to continue workflow until release.

Status:
Approved

## Required Deliverables

- `user_stories/RL-0022/RL-0022_SPRINT_PLAN.md`
- `user_stories/RL-0022/RL-0022_UX_SPEC.md`
- `user_stories/RL-0022/RL-0022_INTERPRETATION.md`
- `user_stories/RL-0022/RL-0022_IMPLEMENTATION_NOTES.md`
- `user_stories/RL-0022/RL-0022_CODE_REVIEW.md`
- `user_stories/RL-0022/RL-0022_QA_REPORT.md`
- `user_stories/RL-0022/RL-0022_RELEASE_NOTE.md`
- `docs/EPIC_USER_STORY_TASKS.md`
- `docs/SPRINT_PLAN.md`
- `DEVELOPMENT_LOG.md`

Status:
Completed

## Risks Or Blockers

- Full `flutter test -r expanded` still stalls in the existing Hive-backed widget harness after entering `test/widget_test.dart`; focused RL-0022 widget coverage, storage regression tests, and analyzer passed.
- RL-0022 intentionally did not implement timer countdown UI, timer controls, rest overlay/modal UI, cross-screen continuity, pause, adjust, skip, resume, or Workout Summary navigation.

## Expected Outcome

- RL-0022 is Done.
- Current Workout can progress through saved exercises using Complete Set.
- Rest state exposes handoff data for RL-0018.
- Completion-ready state can hand off to RL-0016 in a later story.

## Agent Handoff

Current Agent:

```text
Release Manager
```

Completed Output:

```text
user_stories/RL-0022/RL-0022_RELEASE_NOTE.md
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
RL-0022 is Done. Select the next eligible story from docs/EPIC_USER_STORY_TASKS.md.
```

Required Input Files:

- `docs/EPIC_USER_STORY_TASKS.md`
- `docs/SPRINT_PLAN.md`
- `user_stories/RL-0022/RL-0022_RELEASE_NOTE.md`

Expected Output:

- Coordinator routing decision for the next story.

Blocking Conditions:

- Do not modify Done stories unless a later approved story explicitly requires it.
