# RL-0027 UX Specification

## Story

Story ID:
RL-0027

Story Name:
Completed Workout Detail

Design Reference:
design/approved/08_workout_detail.png

## UX Goal

Completed Workout Detail lets users review what they already did without turning the record into a planner, active workout, or completion celebration.

## Screen Responsibility

Completed Workout Detail Owns:

- Completed session title.
- Completed date.
- Completed movement list.
- Sets, reps, weight, notes, and local metrics where available.
- Read-only return navigation back to History.

Completed Workout Detail Does Not Own:

- Start Workout or Start Today.
- Editing completed records.
- Workout Summary celebration.
- XP/reward granting.
- Share-card prompts.
- Planning actions.
- Rest timer or Current Workout controls.

## Design Adaptation

The approved visual includes a Start Workout button because the same design file supports planned/session detail. For RL-0027, completed History detail must remove that button and replace the bottom area with a read-only completion note or return affordance.

## Layout

- Use the existing dark Phase 2 surface language.
- Header: back button, title `Workout Detail`, read-only info icon.
- Summary card: session title, completed label, date, exercise count, total sets, and total volume when calculable.
- Movement list: one row per completed workout log in saved order.
- Rows show exercise name, category, sets, reps, weight, and memo where available.
- Bottom area reinforces `Completed record` or `Read-only history`.

## Interaction Rules

- History session rows open completed Workout Detail.
- Back returns to History.
- The detail screen has no mutation controls.
- The detail screen must not navigate to Current Workout.
- The detail screen must not navigate to Workout Summary.

## Accessibility And Layout

- Keep row touch/read targets visually stable on compact widths.
- Ensure long exercise names and memos wrap without overlapping.
- Use icons for back/info affordances and keep labels concise.
- Maintain high contrast and selected-read-only status clarity.

## QA Focus

- Completed detail opens from History.
- Completed fields render from local data.
- Start Workout, Start Today, edit, share, reward, and Summary copy/actions are absent.
- Back returns to History.
- Planned Session Detail still retains Start Today behavior from Week.

## Agent Handoff

Current Agent:
UX Designer

Next Agent:
User Story Interpreter

Expected Output:
user_stories/RL-0027/RL-0027_INTERPRETATION.md

