# RL-0029 Sprint Plan

## Story

Story ID:
RL-0029

Story Name:
Achievement Unlock And Share Moments

Epic:
EP-14 Journey Separation

Status:
Done

## Coordinator Decision

Selected Story:
RL-0029

Reason:
RL-0028 and RL-0024 are released, and the live backlog identifies RL-0029 as the next eligible story. RL-0029 builds on released Achievement milestones, titles, and existing share-card privacy behavior by adding recent unlock visibility and an optional user-initiated share moment.

## Inputs Considered

- User instruction to proceed the workflow through release without skipping documentation.
- /Users/jounghwapak/Developer/AI_Agents/system/coordinator.md
- docs/EPIC_USER_STORY_TASKS.md
- docs/SPRINT_PLAN.md
- docs/PROJECT_CONTEXT.md
- docs/ARCHITECTURE.md
- user_stories/RL-0029/RL-0029_TASKS.md
- user_stories/RL-0028/RL-0028_RELEASE_NOTE.md
- user_stories/RL-0024/RL-0024_RELEASE_NOTE.md
- lib/features/achievement/screens/achievement_screen.dart
- lib/features/share_cards/widgets/share_cards_section.dart
- design/approved/06_achievement.png

## Dependency Validation

- RL-0028 is Done and provides local milestones and title states.
- RL-0024 is Done and provides optional share-card entry behavior with privacy defaults.
- Existing share-card generation tracking is local.
- No unresolved dependency blocks this story.

## Scope

In Scope:

- Show recent unlock moments inside Achievement when local milestone or title state makes recognition available.
- Keep unlock copy consistency-focused, private, and non-comparative.
- Add a user-initiated share entry from Achievement recognition moments.
- Reuse existing share-card preview and privacy defaults.
- Preserve Dashboard separation; Dashboard remains a short-term preview only.
- Add focused tests for unlock visibility, optional share entry, and privacy/default boundaries.

Out Of Scope:

- Automatic social posting, public profiles, rankings, percentile claims, social pressure, penalties, level loss, backend systems, login, cloud sync, notification systems, configurable reward rules, generic unlock engines, and Dashboard expansion into a full Achievement hub.

## UX Routing Decision

UX Required:
Yes

Reason:
RL-0029 changes the Achievement screen interaction surface and introduces an optional share entry point.

## User Approval Decision

User Approval Required:
Yes

Reason:
The story changes a primary user-facing Achievement reward/share experience.

## Agent Handoff

Current Agent:
Coordinator

Next Agent:
UX Designer

Expected Output:
user_stories/RL-0029/RL-0029_UX_SPEC.md
