# Sprint Plan

## Current Story

Story ID:
RL-0035

Status:
Done

Reason:
RL-0035 was selected as a P0 bug-fix hotfix after user validation found Weekly Progress counted completed exercise rows instead of completed daily workout sessions. The fix protects the completed Weekly Goals behavior now that one daily session can contain multiple ordered exercises.

## Routing Decision Traceability

Decision Point:
Bug Intake

Selected Story:
RL-0035

Previous Story State:
Not Started

New Story State:
Done

Inputs Considered:

- User-reported Weekly Progress bug
- /Users/jounghwapak/Developer/AI_Agents/system/coordinator.md
- docs/PRODUCT_BRIEF.md
- docs/PROJECT_CONTEXT.md
- docs/ARCHITECTURE.md
- docs/EPIC_USER_STORY_TASKS.md
- docs/SPRINT_PLAN.md
- lib/data/services/weekly_goal_service.dart
- lib/features/workout_plan/screens/workout_plan_builder_screen.dart
- lib/features/current_workout/screens/current_workout_screen.dart
- test/weekly_goal_service_test.dart
- test/storage_service_test.dart

Dependency and Blocker Status:

- RL-0008 is Done.
- RL-0033 is Done.
- No unresolved RL-0035 blockers are present.

Selection Summary:
RL-0035 was selected ahead of the next Phase 2 feature because it fixes a user-visible regression in the completed Weekly Goals system. The root cause was that the existing weekly goal service counted completed `WorkoutLog` rows, while the current daily-session model stores each exercise as a separate log on the same session date.

## Dependency Validation

- PRODUCT_BRIEF.md: Present.
- PROJECT_CONTEXT.md: Present.
- ARCHITECTURE.md: Present.
- EPIC_USER_STORY_TASKS.md: Present and updated with RL-0035.
- RL-0035 task file: Present.
- Story dependencies: RL-0008, RL-0033.
- Dependency status: all direct dependencies are Done.

## Execution Order

Completed:

1. Coordinator read `coordinator.md`.
2. Solution Architect identified the row-count versus session-count mismatch.
3. Business Analyst added RL-0035 and task breakdown.
4. Coordinator selected RL-0035.
5. User Story Interpreter produced bug-fix interpretation.
6. Code Writer corrected `WeeklyGoalService`.
7. Code Reviewer approved the focused implementation.
8. QA Tester validated focused service, storage, and analyzer evidence.
9. Release Manager closed RL-0035 and returned control to Coordinator.

## Assigned Agents

1. Solution Architect
2. Business Analyst
3. Coordinator
4. User Story Interpreter
5. Code Writer
6. Code Reviewer
7. QA Tester
8. Release Manager
9. Coordinator

## UX Routing Decision

UX Required:
No

Reason:
RL-0035 changes weekly progress counting semantics only. Existing Dashboard and Summary UI consume the corrected progress value without layout, navigation, copy, or interaction changes.

## User Approval Decision

User Approval Required:
Yes

Reason:
The user explicitly reported the bug from manual validation and requested the workflow to fix it.

Approval Evidence:
User instructed Codex to execute the coordinator workflow and fix the bug on 2026-07-20.

## Required Deliverables

- user_stories/RL-0035/RL-0035_TASKS.md
- user_stories/RL-0035/RL-0035_SPRINT_PLAN.md
- user_stories/RL-0035/RL-0035_INTERPRETATION.md
- user_stories/RL-0035/RL-0035_IMPLEMENTATION_NOTES.md
- user_stories/RL-0035/RL-0035_CODE_REVIEW.md
- user_stories/RL-0035/RL-0035_QA_REPORT.md
- user_stories/RL-0035/RL-0035_RELEASE_NOTE.md
- docs/EPIC_USER_STORY_TASKS.md
- docs/SPRINT_PLAN.md
- docs/DEVELOPMENT_LOG.md

Status:
Done

## Risks Or Blockers

- Counting by date assumes the current Phase 2 constraint of one daily session per date.
- XP remains exercise-log based in this story because XP changes were out of scope.
- Broader MVP validation and consistency recovery services may need a future audit if stakeholders want all metrics to use session semantics.

## Expected Outcome

- A completed session with six exercises displays as `1 / 5 workouts complete`.
- Weekly Progress no longer shows values like `6 / 3 workouts complete` after one completed daily session.
- Existing Monday-to-Sunday week boundaries remain unchanged.

## Agent Handoff

Current Agent:

```text
Release Manager
```

Completed Output:

```text
docs/EPIC_USER_STORY_TASKS.md
docs/SPRINT_PLAN.md
docs/DEVELOPMENT_LOG.md
user_stories/RL-0035/RL-0035_TASKS.md
user_stories/RL-0035/RL-0035_SPRINT_PLAN.md
user_stories/RL-0035/RL-0035_INTERPRETATION.md
user_stories/RL-0035/RL-0035_IMPLEMENTATION_NOTES.md
user_stories/RL-0035/RL-0035_CODE_REVIEW.md
user_stories/RL-0035/RL-0035_QA_REPORT.md
user_stories/RL-0035/RL-0035_RELEASE_NOTE.md
```

Next Agent:

```text
Coordinator
```

Next Prompt:

```text
/Users/jounghwapak/Developer/AI_Agents/prompts/create_sprint_plan.md
```

Required Input Files:

- docs/EPIC_USER_STORY_TASKS.md
- docs/SPRINT_PLAN.md
- user_stories/RL-0035/RL-0035_RELEASE_NOTE.md

Expected Output:

- Next story selection after RL-0035.

Blocking Conditions:

- Stop if the next story's dependencies are not resolved.
