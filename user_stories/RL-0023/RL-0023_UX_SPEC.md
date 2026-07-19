# RL-0023 UX Spec

## Document Metadata

Story ID:

```text
RL-0023
```

Created Date:

```text
2026-07-19
```

Created By:

```text
UX Designer Agent
```

Status:

```text
Approved
```

## Source Documents

- `docs/EPIC_USER_STORY_TASKS.md`
- `docs/USER_JOURNEY.md`
- `docs/SCREEN_STRUCTURE.md`
- `user_stories/RL-0021/RL-0021_UX_SPEC.md`
- `user_stories/RL-0022/RL-0022_RELEASE_NOTE.md`
- `design/approved/02_current_workout.png`

## UX Summary

RL-0023 adds flexible active-session controls to Current Workout while preserving the screen's execution responsibility. Pause, resume, skip, and adjust must feel like temporary workout controls, not plan editing, history editing, or a new workout builder.

## Screen Behavior

- Exercise state keeps Complete Set as the primary action.
- Secondary controls appear near the primary action: Pause, Adjust, Skip Set, and Skip Exercise.
- Pause replaces the exercise card with a clear paused state and changes the primary action to Resume Workout.
- Resume returns the user to the same active exercise or rest state.
- Adjust opens a compact bottom sheet for current reps and current weight.
- Skip Set advances only the current active session's set progress.
- Skip Exercise advances only the current active session's exercise progress.
- Navigating back to Dashboard and returning to Current Workout preserves enough in-memory state to continue the session.

## Scope Boundaries

- Do not modify saved workout plans.
- Do not modify templates.
- Do not modify historical records.
- Do not make Current Workout an editor.
- Do not introduce timer overlay, timer controls, or cross-screen timer continuity.
- Do not persist pause/adjust/skip state across app restart in this story.

## Accessibility And Layout

- Primary and secondary controls must remain touch-safe.
- Controls may wrap on compact screens.
- Paused state must use clear text, not only icon or color.
- Adjustment fields must have visible labels.

## Agent Handoff

Current Agent:

```text
UX Designer
```

Next Agent:

```text
User Story Interpreter
```

Next Prompt:

```text
Interpret RL-0023 using this UX spec, the sprint plan, and the backlog acceptance criteria. Keep controls current-session-only.
```
