# RL-0018 Sprint Plan

## Story

Story ID:
RL-0018

Epic:
EP-14 Rest Timer Overlay

Status:
Done

User Story:
As a user resting during a workout, I want a focused Rest Timer overlay, so that I can manage the current rest interval without leaving Current Workout.

## Acceptance Criteria

- Uses `design/approved/03_timer.png` for approved rest overlay layout and screen composition.
- Rest Timer belongs to Workout Flow and is not a Dashboard section.
- Rest Timer appears as an overlay/modal while resting during an active workout.
- Overlay includes countdown UI, skip rest, extend rest, close/dismiss, and return-to-Current-Workout behavior.
- Existing timer presets and accessibility touch targets remain usable.
- Timer survival across navigation, global/floating timer state, return-to-workout entry from other screens, and active timer persistence are deferred to `RL-0032`.

## Dependencies

- RL-0022: Done.
- RL-0023: Done.

## Scope

In scope:

- Add a focused Rest Timer overlay/modal while Current Workout is in rest state.
- Show countdown UI in the overlay.
- Provide Skip Rest, Extend Rest, close/dismiss, and return-to-Current-Workout behavior.
- Preserve existing standalone RestTimer preset/touch-target behavior.
- Keep overlay state scoped to Current Workout.

Out of scope:

- Cross-screen/global timer continuity.
- Floating timer state outside Current Workout.
- Timer persistence across app restart.
- Background timer service.
- Dashboard timer section.
- Workout Summary implementation.
- Backend, login, cloud sync, external services, or new analytics.

## Execution Order

1. Coordinator selects RL-0018 after RL-0023 release.
2. UX Designer produces overlay/modal guidance.
3. User Story Interpreter produces implementation-ready requirements.
4. Code Writer implements the overlay and focused tests.
5. Code Reviewer reviews overlay behavior, accessibility, and scope boundaries.
6. QA Tester runs focused overlay and regression checks.
7. Release Manager closes RL-0018 and synchronizes release artifacts.

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
RL-0018 introduces a modal Rest Timer overlay with countdown controls inside the primary workout flow.

Status:
Completed

## User Approval Decision

User Approval Required:
Yes

Reason:
RL-0018 changes the primary workout execution flow during rest.

Approval Evidence:
User instructed Coordinator to continue workflow until release.

Status:
Approved

## Required Deliverables

- `user_stories/RL-0018/RL-0018_SPRINT_PLAN.md`
- `user_stories/RL-0018/RL-0018_UX_SPEC.md`
- `user_stories/RL-0018/RL-0018_INTERPRETATION.md`
- `user_stories/RL-0018/RL-0018_IMPLEMENTATION_NOTES.md`
- `user_stories/RL-0018/RL-0018_CODE_REVIEW.md`
- `user_stories/RL-0018/RL-0018_QA_REPORT.md`
- `user_stories/RL-0018/RL-0018_RELEASE_NOTE.md`
- `docs/EPIC_USER_STORY_TASKS.md`
- `docs/SPRINT_PLAN.md`
- `DEVELOPMENT_LOG.md`

Status:
Completed

## Risks Or Blockers

- Do not drift into RL-0032 cross-screen/global timer continuity.
- Do not reintroduce Rest Timer as a Dashboard section.
- Full `flutter test -r expanded` has an existing Hive-backed widget harness stall; focused tests are expected release evidence if the full suite repeats that limitation.

## Expected Outcome

- RL-0018 is Done.
- Current Workout rest state can open a focused Rest Timer overlay.
- Overlay countdown, Skip Rest, Extend Rest, close/dismiss, and return behavior are available.
- Existing timer preset/touch-target behavior remains intact.
- RL-0032 continuity scope remains deferred.

## Agent Handoff

Current Agent:

```text
Release Manager
```

Completed Output:

```text
user_stories/RL-0018/RL-0018_RELEASE_NOTE.md
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
RL-0018 is Done. Select the next eligible story from docs/EPIC_USER_STORY_TASKS.md.
```
