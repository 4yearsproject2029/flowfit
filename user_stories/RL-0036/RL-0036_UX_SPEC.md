# RL-0036 UX Specification

## Story

Story ID:
RL-0036

Story Name:
Bottom Navigation Tab Switching Bug Fix

## UX Goal

Bottom navigation should behave like tabs for implemented destinations. Users should be able to move directly between Home, Week, and History without routing through Home first.

## Expected Behavior

- Home -> Week opens Week.
- Home -> History opens History.
- Week -> Home returns to Dashboard.
- Week -> History opens History.
- History -> Home returns to Dashboard.
- History -> Week opens Week.
- Tapping the current tab does not push a duplicate copy of the current screen.

## Placeholder Behavior

- Today remains a visible placeholder tab with no implemented destination.
- Achievement remains a visible placeholder tab with no implemented destination until RL-0019.
- This story must not add Today or Achievement screens.

## Visual Rules

- Keep current bottom navigation styling.
- Preserve selected-state coloring on the active screen.
- Do not add new labels, explanatory copy, or redesign the tab bar.

## QA Focus

- Direct tab switching works from each implemented tab.
- Home return works from nested tab stacks.
- Repeated current-tab taps do not duplicate routes.
- Completed Workout Detail can still return to History.

## Agent Handoff

Current Agent:
UX Designer

Next Agent:
User Story Interpreter

Expected Output:
user_stories/RL-0036/RL-0036_INTERPRETATION.md

