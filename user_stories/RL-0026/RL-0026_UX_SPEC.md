# RL-0026 UX Specification

## Story

Story ID:
RL-0026

Story Name:
Read-Only History

Design Reference:
design/approved/07_history.png

## UX Goal

History gives users a calm review surface for completed workout sessions. It should answer "what have I already done?" without offering editing, workout-start, timer, or celebration actions.

## Screen Responsibility

History Owns:

- Completed workout review list.
- Recent-period grouping for completed records.
- Read-only completion summaries.
- Navigation toward completed Workout Detail when RL-0027 implements it.

History Does Not Own:

- Planning edits.
- Start Workout or Start Today handoff.
- Active Current Workout controls.
- Rest timer controls.
- Workout Summary celebration or reward granting.
- Dashboard or Week primary content.

## Layout

Use the approved dark Phase 2 visual language already present in Home and Week:

- Dark page background.
- Compact safe-area header with History title.
- Small completion-oriented summary tiles near the top.
- Section labels such as This Week, Last Week, and Earlier.
- Repeated completed-session rows with icon, date/time label, session name, metadata, completion indicator, and disabled forward affordance until completed detail exists.
- Bottom navigation with History selected.

## Content Rules

- Show only completed workout records.
- Group multiple completed exercise rows from the same date as one completed session.
- Use the saved session title when available.
- Show exercise count, approximate total sets, optional volume, and completion state from existing local rows.
- Use empty-state copy that encourages completing a workout rather than creating or editing from History.

## Interaction Rules

- Home bottom navigation History opens the History screen.
- Week bottom navigation History opens the History screen.
- Home bottom navigation Home remains the return destination.
- History rows may show an affordance for future detail navigation, but tapping must not open Workout Summary or planned Session Detail in RL-0026.
- No edit, delete, Start Workout, Start Today, pause, resume, skip, adjust, share, or rest timer controls appear in History.

## Accessibility And Layout

- Keep primary row targets at least 44 px high.
- Ensure text wraps or truncates predictably on compact iPhone widths.
- Avoid nested cards; use individual rows or summary tiles only.
- Maintain high contrast for primary text, secondary text, and selected navigation state.

## QA Focus

- Completed records appear in History.
- Incomplete planned records do not appear.
- Multiple completed exercises for one date appear as one session row.
- History has no editing, start, timer, or summary actions.
- Bottom navigation opens and returns predictably.

## Agent Handoff

Current Agent:
UX Designer

Next Agent:
User Story Interpreter

Expected Output:
user_stories/RL-0026/RL-0026_INTERPRETATION.md

