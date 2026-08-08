# RL-0037 Sprint Plan

## Story

Story ID:
RL-0037

Story Name:
Today Navigation To Current Workout Bug Fix

Epic:
EP-12 Guided Workout Flow

Status:
Done

## Coordinator Decision

Selected Story:
RL-0037

Reason:
The visible Today bottom navigation item is currently inaccessible because it is rendered without an action. User direction clarified that Today should route into the current workout flow. This is a P0 navigation hotfix that should be completed before RL-0031 journey regression QA so the regression pass validates a working primary nav item.

## Inputs Considered

- User report that the Today tab is inaccessible.
- User direction that Today should redirect to the Current Workout page.
- /Users/jounghwapak/Developer/AI_Agents/system/coordinator.md
- docs/EPIC_USER_STORY_TASKS.md
- docs/SPRINT_PLAN.md
- docs/ARCHITECTURE.md
- user_stories/RL-0036/RL-0036_RELEASE_NOTE.md
- lib/features/navigation/widgets/phase2_bottom_navigation.dart
- lib/features/home/screens/home_screen.dart
- lib/features/current_workout/screens/current_workout_screen.dart
- lib/features/current_workout/services/rest_timer_continuity_service.dart

## Dependency Validation

- RL-0015 is Done and provides Current Workout screen foundation.
- RL-0033 is Done and provides saved daily workout session composition.
- RL-0036 is Done and provides shared bottom navigation behavior for implemented tabs.
- No unresolved dependency blocks this hotfix.

## Scope

In Scope:

- Make the Today bottom nav item actionable from Home, Week, Achievement, and History.
- Route Today to `CurrentWorkoutScreen` when today's local session has runnable workout rows.
- Preserve active rest/current workout continuity when an active rest timer exists.
- Provide a safe no-session fallback rather than opening an empty Current Workout screen.
- Prevent duplicate Current Workout routes when Today is reselected in the current workout flow.
- Preserve existing implemented tab switching behavior.

Out Of Scope:

- Building a separate Today screen.
- Redesigning bottom navigation visuals.
- Changing workout persistence schema.
- Changing weekly planning, History detail, Achievement, share cards, rewards, or timer behavior beyond Today routing.
- Adding backend, login, cloud sync, external routing packages, or a broad router migration.

## UX Routing Decision

UX Required:
Yes

Reason:
The story changes primary bottom navigation behavior and the user's route into today's workout flow.

## User Approval Decision

User Approval Required:
Yes

Reason:
The story changes a primary navigation path and was explicitly requested by the user.

## Agent Handoff

Current Agent:
Release Manager

Next Agent:
Coordinator

Expected Output:
user_stories/RL-0037/RL-0037_RELEASE_NOTE.md

## Release Closeout

Result:
Released

Completed Artifacts:

- user_stories/RL-0037/RL-0037_UX_SPEC.md
- user_stories/RL-0037/RL-0037_INTERPRETATION.md
- user_stories/RL-0037/RL-0037_IMPLEMENTATION_NOTES.md
- user_stories/RL-0037/RL-0037_CODE_REVIEW.md
- user_stories/RL-0037/RL-0037_QA_REPORT.md
- user_stories/RL-0037/RL-0037_RELEASE_NOTE.md

Verification:

- `flutter test test/widget_test.dart --plain-name 'Today nav' -r expanded`
- `flutter analyze`
- `git diff --check`

Next Recommended Story:
RL-0031
