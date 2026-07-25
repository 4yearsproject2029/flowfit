# RL-0036 Sprint Plan

## Story

Story ID:
RL-0036

Story Name:
Bottom Navigation Tab Switching Bug Fix

Epic:
EP-14 Journey Separation

Status:
In Progress

## Coordinator Decision

Selected Story:
RL-0036

Reason:
The user reported a distinct navigation bug after RL-0026 and RL-0027: bottom tabs sometimes cannot navigate directly from one tab to another, such as History to Week. This blocks core Phase 2 navigation and should be handled as a focused P0 hotfix before starting RL-0019.

## Inputs Considered

- User-reported expected and experienced behavior.
- /Users/jounghwapak/Developer/AI_Agents/system/coordinator.md
- docs/EPIC_USER_STORY_TASKS.md
- docs/SPRINT_PLAN.md
- docs/DEVELOPMENT_LOG.md
- lib/features/home/screens/home_screen.dart
- lib/features/week/screens/week_screen.dart
- lib/features/history/screens/history_screen.dart

## Dependency Validation

- RL-0014 is Done and introduced the Phase 2 bottom navigation.
- RL-0017 is Done and introduced Week navigation.
- RL-0026 is Done and introduced History navigation.
- RL-0027 is Done and connected History to completed detail.
- No unresolved dependency blocks this hotfix.

## Scope

In Scope:

- Fix direct tab switching among implemented Home, Week, and History surfaces.
- Prevent repeated taps on the current tab from stacking duplicate routes.
- Preserve disabled placeholder behavior for Today and Achievement until their screens are implemented.
- Add focused widget tests for affected navigation paths.

Out Of Scope:

- Implementing Today or Achievement screens.
- Redesigning the bottom navigation visuals.
- Changing workout data, History content, Week planning, completed detail, rewards, or persistence.

## UX Routing Decision

UX Required:
Yes

Reason:
The bug changes navigation behavior in a primary workflow surface. UX scope is limited to expected tab-switching behavior, not visual redesign.

## Agent Handoff

Current Agent:
Coordinator

Next Agent:
Code Writer

Expected Output:
user_stories/RL-0036/RL-0036_IMPLEMENTATION_NOTES.md

