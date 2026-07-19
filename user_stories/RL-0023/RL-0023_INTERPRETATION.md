# RL-0023 Interpretation

## Document Metadata

Story ID:

```text
RL-0023
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
RL-0022 is Done.
```

## Story Summary

RL-0023 adds session flexibility to Current Workout after RL-0022 delivered set progression. Users can pause, resume, skip sets or exercises, and adjust current-session reps/weight without altering saved plans or completed history.

## User Story

```text
As a user whose active session needs small adjustments,
I want pause, adjust, skip, and resume states in Current Workout,
so that the flow remains flexible without becoming an editor.
```

## Acceptance Criteria

| AC ID | Description |
| ----- | ----------- |
| AC-01 | Current Workout supports pause and resume states with clear status text and primary action changes. |
| AC-02 | Users can skip the active exercise or set without corrupting local workout progress. |
| AC-03 | Adjust is limited to changing current session reps and current session weight only. |
| AC-04 | Adjust must not modify weekly plans, edit workout templates, become a workout editor, or modify historical records. |
| AC-05 | Control states do not turn Current Workout into the Week planner or History editor. |
| AC-06 | Navigation away and back preserves enough local state to continue the active workout. |
| AC-07 | QA covers pause, resume, skip, current-session reps/weight adjustment, and return-to-workout behavior. |

## Functional Requirements

- Current Workout shall expose Pause, Adjust, Skip Set, and Skip Exercise secondary actions during active exercise state.
- Pause shall show clear paused text and change the primary action to Resume Workout.
- Resume shall restore the prior active session state.
- Adjust shall allow current-session reps and weight values to change in the running screen.
- Adjust shall not write the changed reps or weight back to saved `WorkoutLog` records.
- Skip Set shall advance local set progress.
- Skip Exercise shall advance local exercise progress to the next exercise or completion-ready state.
- Current Workout shall preserve in-memory control state after navigating back to Dashboard and reopening the same active workout session.

## Non-Functional Requirements

- Preserve local-first behavior.
- Avoid data migrations.
- Avoid new packages.
- Keep controls touch-safe on compact screens.
- Keep the implementation scoped to Current Workout.

## Data Requirements

Existing Models Used:

| Model | Usage |
| ----- | ----- |
| `WorkoutLog` | Source saved plan and historical persistence boundary. |

New Fields Required:

```text
No data model changes required.
```

Persistence Rules:

- Adjusted reps and weight are active-session values only.
- Pause, skip, and return state are in-memory active-session values only.
- Existing `WorkoutLog` persistence and completion behavior remain intact.

Migration Requirements:

```text
None.
```

## UI Requirements

UX Required:

```text
Yes
```

Current Workout must present controls as temporary session controls and avoid editing language.

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
Implement RL-0023 Current Workout control states: pause/resume, skip set, skip exercise, current-session reps/weight adjustment, and return-to-workout state recovery without modifying saved plans or history.
```
