# RL-0028 UX Specification

## Story

Story ID:
RL-0028

Story Name:
Achievement Milestones And Titles

Design Reference:
design/approved/06_achievement.png

## UX Goal

Achievement should feel more meaningful by showing a small set of local milestones and titles that recognize consistency without turning progress into comparison, pressure, or a complex reward system.

## Screen Responsibility

Achievement Milestones And Titles Owns:

- A small predefined milestone catalog.
- Locked, in-progress, and unlocked milestone states.
- A title collection with current, unlocked, and locked states.
- Clear requirements and supportive progress copy.

Achievement Milestones And Titles Does Not Own:

- Recent unlock feed.
- Share moments.
- Configurable achievements.
- Dynamic achievement definitions.
- Public ranking or percentile claims.
- Penalties, level loss, or public profiles.

## Design Adaptation

The approved Achievement visual includes medals and milestone rows. RL-0028 may replace RL-0019 placeholder rows with real local rows, but the catalog must stay small, static, and understandable. Any "top user" or public comparison language from the visual is excluded.

## Layout

- Keep the existing RL-0019 header, level, Rep Score, featured progress, and growth signals.
- Add `MILESTONES` with concise rows for a predefined catalog.
- Each milestone row shows an icon, title, requirement, progress text, and state label.
- Add `TITLE COLLECTION` with compact rows for current, unlocked, and locked titles.
- The current title should be visibly identified without implying public status.
- Locked milestones and titles should feel invitational, not punitive.

## Interaction Rules

- Milestone and title rows are read-only.
- Rows do not open detail screens in RL-0028.
- No sharing or posting action is introduced.
- No local data is mutated by viewing Achievement.
- Existing Home, Week, Achievement, and History bottom navigation behavior remains unchanged.

## Feedback Mechanisms

- Unlocked state uses positive recognition copy.
- In-progress state shows progress toward the requirement.
- Locked state shows what consistency action can unlock it.
- Title state identifies the currently active title.

## Empty States

| Scenario | Message | Action |
| -------- | ------- | ------ |
| No completed workouts | Complete one workout to unlock your first milestone. | Go Home |
| Level 1 only | Keep showing up to unlock the next title. | Go Home |

## Error States

| Scenario | Message | Recovery Action |
| -------- | ------- | --------------- |
| Local progress unavailable | Local progress will refresh when this device data is available. | Return Home |

## Loading States

Not required for MVP because Achievement reads local state already available in the app.

## Accessibility And Layout

- Milestone rows must wrap long copy without overflow.
- State labels must be text-backed, not color-only.
- Touch targets should remain at least 44px even though rows are read-only.
- Locked styling must remain readable against the dark surface.

## QA Focus

- Locked milestone state renders.
- In-progress milestone state renders.
- Unlocked milestone state renders.
- Current title state renders.
- No rankings, percentile claims, public profiles, penalties, level loss, generic rule engine, dynamic definitions, or share moments appear.

## Agent Handoff

Current Agent:
UX Designer

Next Agent:
User Story Interpreter

Expected Output:
user_stories/RL-0028/RL-0028_INTERPRETATION.md
