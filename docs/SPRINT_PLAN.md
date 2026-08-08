# Sprint Plan

## Current Story

Story ID:
RL-0037

Status:
Done

Reason:
RL-0037 was completed as a small P0 bug-fix story after user validation found the visible Today bottom navigation item was inaccessible. Today now routes into today's Current Workout flow when possible and safely falls back to Home when no runnable workout exists.

## Routing Decision Traceability

Decision Point:
Coordinator Hotfix Routing After RL-0030

Selected Story:
RL-0037

Previous Story State:
Not Started

New Story State:
Done

Inputs Considered:

- User report that the Today tab is inaccessible.
- User direction that Today should redirect to the Current Workout page.
- /Users/jounghwapak/Developer/AI_Agents/system/coordinator.md
- docs/EPIC_USER_STORY_TASKS.md
- docs/SPRINT_PLAN.md
- user_stories/RL-0037/RL-0037_TASKS.md
- user_stories/RL-0037/RL-0037_UX_SPEC.md
- user_stories/RL-0037/RL-0037_INTERPRETATION.md
- lib/features/navigation/widgets/phase2_bottom_navigation.dart
- lib/features/home/screens/home_screen.dart
- lib/features/current_workout/screens/current_workout_screen.dart
- lib/features/current_workout/services/rest_timer_continuity_service.dart

Dependency and Blocker Status:

- RL-0015 is Done.
- RL-0033 is Done.
- RL-0036 is Done.
- RL-0030 is Done.
- RL-0031 remains Not Started and can resume after this hotfix release.
- RL-0037 is released with no unresolved blockers.

Selection Summary:
RL-0037 should fix the visible Today nav item before journey regression QA. Today should act as a workout-flow shortcut: route to today's Current Workout when a runnable session exists, return to active workout/rest context when applicable, and avoid an empty Current Workout route when no workout exists.

## Dependency Validation

- PRODUCT_BRIEF.md: Present.
- PROJECT_CONTEXT.md: Present.
- ARCHITECTURE.md: Present.
- EPIC_USER_STORY_TASKS.md: Present and updated with RL-0037 Done.
- RL-0037 task file: Present.
- Story dependencies: RL-0015, RL-0033, RL-0036.
- Dependency status: all direct dependencies are Done.

## Execution Order

Completed:

1. Coordinator selected RL-0037 and updated story status.
2. UX Designer produced the focused RL-0037 UX specification.
3. User Story Interpreter interpreted RL-0037 against bottom-nav, Current Workout, and fallback-routing boundaries.

4. Code Writer implements the interpreted story.
5. Code Reviewer reviews implementation.
6. QA Tester validates Today navigation behavior.
7. Release Manager closes the story and synchronizes release artifacts if QA passes.

## Assigned Agents

1. Coordinator
2. UX Designer
3. User Story Interpreter
4. Code Writer
5. Code Reviewer
6. QA Tester
7. Release Manager
8. Coordinator

## UX Routing Decision

UX Required:
Yes

Result:
Completed

## User Approval Decision

User Approval Required:
Yes

Approval Evidence:
Approved by user direction that Today should redirect to the Current Workout page on 2026-08-08.

## Required Deliverables

- user_stories/RL-0037/RL-0037_SPRINT_PLAN.md
- user_stories/RL-0037/RL-0037_UX_SPEC.md
- user_stories/RL-0037/RL-0037_INTERPRETATION.md
- user_stories/RL-0037/RL-0037_IMPLEMENTATION_NOTES.md
- user_stories/RL-0037/RL-0037_CODE_REVIEW.md
- user_stories/RL-0037/RL-0037_QA_REPORT.md
- user_stories/RL-0037/RL-0037_RELEASE_NOTE.md
- docs/EPIC_USER_STORY_TASKS.md
- docs/SPRINT_PLAN.md
- docs/DEVELOPMENT_LOG.md

Status:
Done

## Risks Or Blockers

- No-session Today behavior must be safe; it should not open an empty Current Workout route.
- Duplicate Current Workout routes must be avoided.
- Active rest/current workout continuity should be preserved.
- RL-0031 journey regression QA can resume now that this hotfix is released.

## Expected Outcome

- Today is no longer an inert visible tab.
- Today supports the Guide step by taking users into today's workout flow when possible.
- Existing Home, Week, Achievement, and History tab switching remains intact.
- No new Today screen or broad routing migration is introduced.

## Next Recommended Story

Story ID:
RL-0031

Reason:
RL-0037 is released; RL-0031 can resume journey regression QA against the fixed Today navigation behavior.

## Agent Handoff

Current Agent:

```text
Release Manager
```

Completed Output:

```text
user_stories/RL-0037/RL-0037_SPRINT_PLAN.md
user_stories/RL-0037/RL-0037_UX_SPEC.md
user_stories/RL-0037/RL-0037_INTERPRETATION.md
user_stories/RL-0037/RL-0037_IMPLEMENTATION_NOTES.md
user_stories/RL-0037/RL-0037_CODE_REVIEW.md
user_stories/RL-0037/RL-0037_QA_REPORT.md
user_stories/RL-0037/RL-0037_RELEASE_NOTE.md
docs/EPIC_USER_STORY_TASKS.md
docs/SPRINT_PLAN.md
docs/DEVELOPMENT_LOG.md
```

Next Agent:

```text
Coordinator
```

Next Prompt:

```text
/Users/jounghwapak/Developer/AI_Agents/system/coordinator.md
```

Required Input Files:

- user_stories/RL-0037/RL-0037_SPRINT_PLAN.md
- user_stories/RL-0037/RL-0037_UX_SPEC.md
- user_stories/RL-0037/RL-0037_INTERPRETATION.md
- user_stories/RL-0037/RL-0037_TASKS.md
- docs/EPIC_USER_STORY_TASKS.md
- docs/ARCHITECTURE.md
- lib/features/navigation/widgets/phase2_bottom_navigation.dart
- lib/features/home/screens/home_screen.dart
- lib/features/week/screens/week_screen.dart
- lib/features/history/screens/history_screen.dart
- lib/features/achievement/screens/achievement_screen.dart
- lib/features/current_workout/screens/current_workout_screen.dart
- lib/features/current_workout/services/rest_timer_continuity_service.dart

Expected Output:

```text
Selection and kickoff for RL-0031 when the workflow resumes.
```

Blocking Conditions:

- None for the released RL-0037 hotfix.

Instructions:

- Resume workflow from RL-0031 when ready.
