# RL-0018 UX Spec

## Document Metadata

Story ID:

```text
RL-0018
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

- `user_stories/RL-0018/RL-0018_SPRINT_PLAN.md`
- `docs/EPIC_USER_STORY_TASKS.md`
- `docs/USER_JOURNEY.md`
- `docs/SCREEN_STRUCTURE.md`
- `user_stories/RL-0021/RL-0021_UX_SPEC.md`
- `user_stories/RL-0022/RL-0022_RELEASE_NOTE.md`
- `user_stories/RL-0023/RL-0023_RELEASE_NOTE.md`
- `design/approved/03_timer.png`

## UX Summary

RL-0018 adds a focused Rest Timer overlay while the user is resting inside Current Workout. The overlay should feel connected to the active workout and temporary rest interval, not like a standalone Dashboard timer or cross-screen global timer.

## Entry Point

- Current Workout enters rest state after a set or exercise transition.
- The rest state exposes a timer entry action.
- The timer opens as a modal overlay over Current Workout.

## Overlay Behavior

- Show a clear `REST TIMER` label.
- Show the active or completed exercise context.
- Show a large countdown value.
- Provide `Skip Rest` as the primary completion action.
- Provide `Extend Rest` as a secondary action that adds time to the current countdown.
- Provide a close/dismiss control.
- Closing the overlay returns to Current Workout without navigating away from the active workout flow.
- Skip Rest closes the overlay and returns to Current Workout ready to continue.

## Scope Boundaries

- Do not create cross-screen timer persistence.
- Do not create a floating/global timer.
- Do not add a background service.
- Do not add app-restart persistence.
- Do not add Dashboard timer UI.
- Do not implement RL-0032.

## Accessibility And Layout

- Overlay controls must remain touch-safe.
- Countdown text must be readable on compact iPhone layouts.
- Close, Skip Rest, and Extend Rest controls must be labeled.
- The overlay should use dark surfaces and cyan primary action styling consistent with Phase 2 Current Workout.

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
Interpret RL-0018 using this UX spec, the sprint plan, and backlog acceptance criteria. Keep the timer overlay scoped to Current Workout and defer cross-screen continuity to RL-0032.
```
