# RL-0037 UX Specification

## Story

Story ID:
RL-0037

Story Name:
Today Navigation To Current Workout Bug Fix

Design References:

- design/approved/01_home_screen.png
- design/approved/02_current_workout.png

## UX Goal

The Today bottom nav item should behave like a direct shortcut into today's workout flow. Users should not encounter an inert visible tab, a blank workout screen, or duplicate Current Workout routes.

## Screen Responsibility

Today Navigation Owns:

- The bottom-nav action for `Today`.
- Direct access to today's runnable Current Workout when local session data exists.
- Safe fallback when no runnable workout exists.
- Active-rest/current-workout return behavior.

Today Navigation Does Not Own:

- A standalone Today screen.
- Dashboard redesign.
- Week planning changes.
- History review changes.
- Workout Summary changes.
- New persistence or router architecture.

## Navigation Rules

- From Home, Week, Achievement, or History, tapping Today should inspect today's local workout state.
- If today's saved session has at least one runnable workout row, Today opens `CurrentWorkoutScreen`.
- If active rest continuity exists, Today should return to that active Current Workout/rest context.
- If no runnable session exists, Today should route to a safe today-focused fallback, preferably Home's Today's Focus or the existing workout planning entry point.
- Re-tapping Today while already in the current workout flow should not push duplicate Current Workout routes.
- Existing Home, Week, Achievement, and History direct tab switching must remain unchanged.

## Empty State

| Scenario | Expected UX |
| -------- | ----------- |
| No workout planned for today | User lands on a safe today-focused fallback and can plan a workout; no empty Current Workout route is shown. |

## Accessibility And Layout

- Today must be tappable and exposed as an actionable bottom-nav item.
- Selected/active state should remain understandable without relying on color alone where practical.
- The hotfix should not change nav labels or visual hierarchy unless required for action state.

## QA Focus

- Today is actionable from Home, Week, Achievement, and History.
- Today opens Current Workout for a valid saved daily session.
- Today handles active-rest continuity.
- Today handles no-session fallback safely.
- Today reselect does not create duplicate routes.
- Existing tab switching and completed-story screen responsibilities remain intact.

## Agent Handoff

Current Agent:
UX Designer

Next Agent:
User Story Interpreter

Expected Output:
user_stories/RL-0037/RL-0037_INTERPRETATION.md
