# RL-0022 Interpretation

## Document Metadata

Story ID:

```text
RL-0022
```

Epic:

```text
EP-12 Guided Workout Flow
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

1. `user_stories/RL-0022/RL-0022_SPRINT_PLAN.md`
2. `user_stories/RL-0022/RL-0022_UX_SPEC.md`
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
RL-0015, RL-0021, and RL-0033 are Done.
```

## Story Summary

RL-0022 makes Current Workout usable as a guided execution flow after RL-0033 provides a saved ordered workout session. The user can complete sets, see a rest handoff, continue to the next exercise, and reach a completion-ready state without adding timer UI or Workout Summary behavior.

## User Story

```text
As a user moving through a workout,
I want Complete Set to advance me into a rest state or the next exercise,
so that workout progress is clear without adding timer UI yet.
```

## Acceptance Criteria

| AC ID | Description |
| ----- | ----------- |
| AC-01 | Builds on the Current Workout screen foundation from `RL-0015` and the composed daily session from `RL-0033`. |
| AC-02 | Complete Set updates local workout progress for the active exercise without duplicating XP/reward behavior. |
| AC-03 | Current Workout progresses through the saved exercise order using Exercise -> Rest state -> Next Exercise. |
| AC-04 | RL-0022 does not implement timer countdown UI, timer controls, overlay/modal UI, or cross-screen timer continuity. |
| AC-05 | Rest state exposes the information required by `RL-0018`, such as active workout, completed set/exercise, next exercise, suggested rest duration, and return target. |
| AC-06 | Completion state is reached when all planned sets/exercises in the saved session are done and can hand off to `RL-0016`. |
| AC-07 | Existing workout completion and local persistence behavior remain intact. |

## Functional Requirements

- Current Workout shall derive active exercises from the saved ordered daily session records.
- Complete Set shall increment progress for the active exercise.
- When more workout work remains, Complete Set shall show a rest state before the next active set or exercise.
- Continue Workout shall return from rest to the correct active exercise.
- When all planned sets and exercises are complete, Current Workout shall show a completion-ready state.
- Completion persistence shall reuse existing workout completion behavior and XP idempotency.

## Non-Functional Requirements

- Keep all behavior local-first and offline.
- Preserve existing Hive boxes and adapters.
- Avoid new dependencies.
- Keep changes scoped to Current Workout progression and focused test evidence.

## Data Requirements

Existing Models Used:

| Model | Usage |
| ----- | ----- |
| `WorkoutLog` | Planned exercise record, set/reps target, completion persistence, XP award key input. |

New Fields Required:

```text
No data model changes required.
```

Migration Requirements:

```text
None.
```

## UI Requirements

UX Required:

```text
Yes
```

Current Workout must expose exercise, rest, and completion-ready states using existing Phase 2 screen patterns.

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
Implement RL-0022 from the existing Current Workout foundation. Keep behavior limited to set progression, rest handoff, completion-ready state, and persistence/idempotency preservation.
```
