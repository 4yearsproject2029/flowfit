# RL-0030 UX Specification

## Story

Story ID:
RL-0030

Story Name:
Phase 2 Screen QA

Design References:

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

## UX Goal

RL-0030 should validate that each released Phase 2 screen independently matches its approved responsibility and remains readable, navigable, and usable on common iPhone layouts before broader integration QA begins.

## Screen Responsibility

Phase 2 Screen QA Owns:

- Screen-by-screen validation.
- Approved visual responsibility checks.
- Layout, text readability, touch-target, contrast, and non-overlap observations.
- Documentation of manual-only or harness-limited checks.

Phase 2 Screen QA Does Not Own:

- New feature implementation.
- Cross-screen journey regression.
- Product redesign.
- Reopening accepted visual differences without a clear blocker.
- Production changes made only for test harness convenience.

## Screen Checklist

| Screen | Design Reference | Responsibility To Validate |
| ------ | ---------------- | -------------------------- |
| Home | `01_home_screen.png` | Daily focus, weekly progress, next achievement, and bottom navigation. |
| Current Workout | `02_current_workout.png` | Active exercise guidance, progress, rest/complete states, and controls. |
| Rest Timer | `03_timer.png` | Focused rest countdown and active workout return context. |
| Workout Summary | `04_workkout_summary.png` | Completion celebration, private details, sharing, and return actions. |
| Week | `05_weekly_plan.png` | Weekly plan ownership and planned session visibility. |
| Achievement | `06_achievement.png` | Level, milestones, titles, recent unlocks, and non-comparative recognition. |
| History | `07_history.png` | Read-only completed-session review. |
| Workout Detail | `08_workout_detail.png` | Planned and completed detail responsibilities remain distinct. |
| Workout Plan Builder | `09_workout_plan_builder.png` | Daily session composition with ordered exercises. |
| Add Exercise | `10_add_exercise.png` | Exercise entry/editing bottom sheet behavior. |

## Interaction Rules

- Screen QA may navigate only as needed to enter the target screen.
- QA must not validate full end-to-end journeys as RL-0030 scope.
- Any discovered implementation defect should be documented as a QA finding; production changes are not part of RL-0030 unless the workflow is rerouted.
- Existing privacy, local-first, no-backend, no-login, no-cloud-sync, and non-comparison boundaries must remain visible in the evidence.

## Accessibility And Layout

- Text should be readable on common iPhone-sized viewports.
- Primary actions should have clear labels and reachable touch targets.
- Visual state should not depend on color alone.
- Screen content should avoid obvious overlap or clipped critical copy.
- Navigation controls should be predictable and reversible where the screen owns a return path.

## QA Focus

- Each approved Phase 2 screen is represented in QA evidence.
- Screen ownership is not blurred across Home, Week, History, Achievement, Summary, and Current Workout.
- `flutter analyze` passes.
- Focused tests run where practical.
- Any skipped broad widget-file run or manual-only validation is explicitly documented.

## Agent Handoff

Current Agent:
UX Designer

Next Agent:
User Story Interpreter

Expected Output:
user_stories/RL-0030/RL-0030_INTERPRETATION.md
