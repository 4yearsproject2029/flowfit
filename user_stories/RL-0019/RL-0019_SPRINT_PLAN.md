# RL-0019 Sprint Plan

## Story

Story ID:
RL-0019

Story Name:
Achievement Hub Foundation

Epic:
EP-14 Journey Separation

Status:
In Progress

## Coordinator Decision

Selected Story:
RL-0019

Reason:
RL-0036 is released and the live Phase 2 backlog identifies RL-0019 as the next eligible story. RL-0019 has all dependencies complete, delivers the approved Achievement screen foundation, and unblocks RL-0028 and RL-0029.

## Inputs Considered

- User instruction to continue the workflow.
- /Users/jounghwapak/Developer/AI_Agents/system/coordinator.md
- docs/EPIC_USER_STORY_TASKS.md
- docs/SPRINT_PLAN.md
- docs/PROJECT_CONTEXT.md
- docs/ARCHITECTURE.md
- docs/DEVELOPMENT_LOG.md
- user_stories/RL-0019/RL-0019_TASKS.md
- design/approved/06_achievement.png
- lib/data/services/level_service.dart
- lib/data/services/storage_service.dart
- lib/features/home/screens/home_screen.dart
- lib/features/navigation/widgets/phase2_bottom_navigation.dart

## Dependency Validation

- RL-0016 is Done and provides completion reward context.
- RL-0021 is Done and provides Phase 2 design handoff direction.
- Existing local XP and level services are available.
- No unresolved dependency blocks this story.

## Scope

In Scope:

- Implement the Achievement hub foundation using `design/approved/06_achievement.png` for screen composition.
- Display local level, XP/rep score concept, current recognition state, and high-level progress.
- Reinforce consistency, return, and recognition without comparison pressure.
- Connect the Achievement bottom navigation tab as an implemented primary tab.
- Keep Home limited to a short achievement preview.
- Add focused tests for Achievement display, navigation, and non-comparison boundaries.

Out Of Scope:

- Detailed medals, milestone catalog, title collection, unlock feed, or share moments.
- Rankings, leaderboards, public percentile claims, public profiles, social graph, penalties, level loss, backend, login, cloud sync, analytics SDKs, or broad gamification rewrites.
- Implementing the Today tab.

## UX Routing Decision

UX Required:
Yes

Reason:
RL-0019 introduces a new primary screen and changes bottom navigation behavior by making Achievement an implemented tab.

## User Approval Decision

User Approval Required:
Yes

Reason:
The story changes a primary user-facing experience and introduces a new main navigation destination.

## Agent Handoff

Current Agent:
Coordinator

Next Agent:
UX Designer

Expected Output:
user_stories/RL-0019/RL-0019_UX_SPEC.md
