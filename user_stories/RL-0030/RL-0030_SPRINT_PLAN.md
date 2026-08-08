# RL-0030 Sprint Plan

## Story

Story ID:
RL-0030

Story Name:
Phase 2 Screen QA

Epic:
EP-15 Phase 2 UX Quality

Status:
Done

## Coordinator Decision

Selected Story:
RL-0030

Reason:
RL-0029 is released, and the live backlog identifies RL-0030 as the next eligible story before Phase 2 journey regression QA. RL-0030 validates each approved Phase 2 screen independently against design responsibility, layout, accessibility, and screen ownership without adding implementation scope.

## Inputs Considered

- User instruction to continue the workflow.
- /Users/jounghwapak/Developer/AI_Agents/system/coordinator.md
- docs/EPIC_USER_STORY_TASKS.md
- docs/SPRINT_PLAN.md
- docs/PROJECT_CONTEXT.md
- docs/ARCHITECTURE.md
- docs/USER_JOURNEY.md
- docs/SCREEN_STRUCTURE.md
- user_stories/RL-0030/RL-0030_TASKS.md
- design/approved/01_home_screen.png
- design/approved/02_current_workout.png
- design/approved/03_timer.png
- design/approved/04_workkout_summary.png
- design/approved/05_weekly_plan.png
- design/approved/06_achievement.png
- design/approved/07_history.png
- design/approved/08_workout_detail.png
- design/approved/09_workout_plan_builder.png
- design/approved/10_add_exercise.png

## Dependency Validation

- RL-0032 is Done and provides cross-screen rest timer continuity.
- RL-0024 is Done and provides Workout Summary private details and sharing.
- RL-0027 is Done and provides Completed Workout Detail.
- RL-0029 is Done and provides Achievement unlock/share moments.
- RL-0033 is Done and provides Workout Plan Builder and Add Exercise.
- No unresolved dependency blocks this story.

## Scope

In Scope:

- Screen-only QA for Home, Workout Plan Builder, Add Exercise bottom sheet, Current Workout, Rest Timer, Workout Summary, Week, Achievement, History, and Workout Detail.
- Independent validation of approved screen responsibilities.
- Readable text, touch-target, contrast, navigation-predictability, and non-overlap checks for common iPhone layouts where agent evidence is practical.
- `flutter analyze`.
- Focused widget or service tests relevant to changed/validated screens where available.
- Documentation of skipped tests or manual-only checks without changing production behavior for the harness.

Out Of Scope:

- New feature implementation.
- Broad cross-screen journey regression.
- End-to-end integration validation beyond screen entry needed for screen QA.
- Production changes just to satisfy test harness limitations.
- Reopening completed MVP stories unless QA finds a clear unresolved blocker.

## UX Routing Decision

UX Required:
Yes

Reason:
RL-0030 validates visual hierarchy, layout, accessibility, and approved screen responsibilities.

## User Approval Decision

User Approval Required:
Yes

Reason:
The story is a manual/visual QA checkpoint for primary Phase 2 screens.

## Agent Handoff

Current Agent:
Coordinator

Next Agent:
UX Designer

Expected Output:
user_stories/RL-0030/RL-0030_UX_SPEC.md
