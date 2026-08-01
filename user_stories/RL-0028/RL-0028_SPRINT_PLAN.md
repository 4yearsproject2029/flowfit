# RL-0028 Sprint Plan

## Story

Story ID:
RL-0028

Story Name:
Achievement Milestones And Titles

Epic:
EP-14 Journey Separation

Status:
In Progress

## Coordinator Decision

Selected Story:
RL-0028

Reason:
RL-0019 is released and the live backlog identifies RL-0028 as the next eligible story. RL-0028 builds directly on the Achievement hub foundation by adding a small predefined local milestone and title presentation without introducing public comparison or a complex achievement engine.

## Inputs Considered

- User instruction to continue the workflow.
- /Users/jounghwapak/Developer/AI_Agents/system/coordinator.md
- docs/EPIC_USER_STORY_TASKS.md
- docs/SPRINT_PLAN.md
- docs/PROJECT_CONTEXT.md
- docs/ARCHITECTURE.md
- user_stories/RL-0028/RL-0028_TASKS.md
- user_stories/RL-0019/RL-0019_RELEASE_NOTE.md
- lib/features/achievement/screens/achievement_screen.dart
- design/approved/06_achievement.png

## Dependency Validation

- RL-0019 is Done and provides the implemented Achievement hub foundation.
- Existing local XP, level, weekly-goal, and workout-log data are available.
- No unresolved dependency blocks this story.

## Scope

In Scope:

- Add a small predefined local milestone catalog to Achievement.
- Show locked, in-progress, and unlocked milestone states using simple local rules.
- Show a title collection with current, unlocked, and locked title states.
- Reuse existing XP, level, and completed-workout data.
- Preserve consistency-first, non-punitive, non-comparative language.
- Add focused tests for locked, in-progress, unlocked, and current-title states.

Out Of Scope:

- Generic rule engines, configurable achievements, dynamic achievement definitions, backend systems, public ranking, percentile claims, social comparison, public profiles, penalties, level loss, recent unlock feeds, share moments, and Today tab behavior.

## UX Routing Decision

UX Required:
Yes

Reason:
RL-0028 expands the Achievement screen hierarchy with new milestone and title states.

## User Approval Decision

User Approval Required:
Yes

Reason:
The story changes a primary user-facing Achievement experience.

## Agent Handoff

Current Agent:
Coordinator

Next Agent:
UX Designer

Expected Output:
user_stories/RL-0028/RL-0028_UX_SPEC.md
