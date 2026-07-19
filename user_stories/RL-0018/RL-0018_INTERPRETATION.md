# RL-0018 Interpretation

## Document Metadata

Story ID:

```text
RL-0018
```

Epic:

```text
EP-14 Rest Timer Overlay
```

Created Date:

```text
2026-07-19
```

Created By:

```text
User Story Interpreter Agent
```

Status:

```text
Approved
```

## Source Of Truth

1. `user_stories/RL-0018/RL-0018_SPRINT_PLAN.md`
2. `user_stories/RL-0018/RL-0018_UX_SPEC.md`
3. `docs/EPIC_USER_STORY_TASKS.md`
4. `docs/ARCHITECTURE.md`
5. `docs/PROJECT_CONTEXT.md`

## Workflow Validation

UX Required:

```text
Yes
```

UX Spec Loaded:

```text
Yes
```

Dependency Status:

```text
RL-0022 and RL-0023 are Done.
```

## Story Summary

RL-0018 moves rest timing into the active Current Workout rest state. The user can open a focused timer overlay, watch a countdown, skip rest, extend rest, dismiss the overlay, and return to the current workout flow without adding cross-screen/global continuity.

## User Story

```text
As a user resting during a workout,
I want a focused Rest Timer overlay,
so that I can manage the current rest interval without leaving Current Workout.
```

## Acceptance Criteria

| AC ID | Description |
| ----- | ----------- |
| AC-01 | Uses `design/approved/03_timer.png` for approved rest overlay layout and screen composition. |
| AC-02 | Rest Timer belongs to Workout Flow and is not a Dashboard section. |
| AC-03 | Rest Timer appears as an overlay/modal while resting during an active workout. |
| AC-04 | Overlay includes countdown UI, skip rest, extend rest, close/dismiss, and return-to-Current-Workout behavior. |
| AC-05 | Existing timer presets and accessibility touch targets remain usable. |
| AC-06 | Timer survival across navigation, global/floating timer state, return-to-workout entry from other screens, and active timer persistence are deferred to `RL-0032`. |

## Functional Requirements

- Current Workout shall show a timer entry action only while in rest state.
- Tapping the timer entry action shall open a modal overlay.
- The overlay shall show countdown text.
- The overlay shall allow Skip Rest and return to Current Workout.
- The overlay shall allow Extend Rest and increase the countdown duration.
- The overlay shall allow close/dismiss and return to Current Workout.
- The existing standalone RestTimer widget shall remain usable and touch-safe.
- Timer overlay state shall remain scoped to Current Workout.

## Non-Functional Requirements

- Preserve local-first behavior.
- Avoid data migrations and new packages.
- Keep overlay controls touch-safe.
- Do not add global navigation state or background services.

## Data Requirements

Existing Models Used:

| Model | Usage |
| ----- | ----- |
| `WorkoutLog` | Provides active workout/rest context. |

New Fields Required:

```text
No data model changes required.
```

Persistence Rules:

- Overlay timer state is runtime-only for the active Current Workout rest state.
- No Hive changes are required.

Migration Requirements:

```text
None.
```

## UI Requirements

UX Required:

```text
Yes
```

The overlay must use the approved rest timer direction with readable countdown, clear controls, and Current Workout context.

## Agent Handoff

Current Agent:

```text
User Story Interpreter
```

Next Agent:

```text
Code Writer
```

Next Prompt:

```text
Implement RL-0018 Rest Timer overlay/modal in Current Workout rest state. Include countdown UI, Skip Rest, Extend Rest, close/dismiss, and return-to-Current-Workout behavior. Preserve existing RestTimer presets and defer cross-screen/global continuity to RL-0032.
```
