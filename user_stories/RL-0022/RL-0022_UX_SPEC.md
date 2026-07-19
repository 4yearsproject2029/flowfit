# RL-0022 UX Spec

## Document Metadata

Story ID:

```text
RL-0022
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

- `user_stories/RL-0022/RL-0022_SPRINT_PLAN.md`
- `docs/EPIC_USER_STORY_TASKS.md`
- `docs/USER_JOURNEY.md`
- `docs/SCREEN_STRUCTURE.md`
- `user_stories/RL-0015/RL-0015_RELEASE_NOTE.md`
- `user_stories/RL-0021/RL-0021_UX_SPEC.md`
- `user_stories/RL-0033/RL-0033_RELEASE_NOTE.md`
- `design/approved/02_current_workout.png`

## UX Summary

RL-0022 keeps the user inside Current Workout while turning Complete Set into a clear progression action. The screen must show whether the user is performing an exercise, resting after a set, ready for the next exercise, or complete enough for the future Workout Summary handoff.

## Screen Behavior

- Exercise state shows current exercise number, exercise name, instruction or memo, set target, rep target, set progress, and a single `Complete Set` primary action.
- Rest state appears after a completed set when more work remains.
- Rest state shows the completed exercise or set, the next exercise, a suggested rest duration, and `Return target: Current Workout`.
- The rest state uses `Continue Workout` as the single primary action.
- Completion-ready state appears after all planned sets and exercises are complete.
- Completion-ready state does not open Workout Summary yet; RL-0016 owns that screen.

## Scope Boundaries

- Do not add timer countdown UI.
- Do not add timer controls.
- Do not add rest overlay or modal UI.
- Do not add cross-screen timer continuity.
- Do not add pause, adjust, skip, or resume controls.
- Do not add Workout Summary navigation.

## Accessibility And Layout

- Primary actions remain full-width and touch-safe.
- Text must remain readable on compact iPhone layouts through the existing scrollable Current Workout layout.
- State labels must be visible without relying only on color.
- Rest handoff details must be text-readable for downstream QA.

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
Interpret RL-0022 using this UX spec, the sprint plan, and the backlog acceptance criteria. Keep scope limited to Current Workout set progression and rest handoff without timer UI.
```
