# Sprint Plan

## Current Story

Story ID:
RL-0009

Status:
In Progress

Reason:
RL-0009 is the next eligible story after RL-0008. RL-0008 is Done, and consistency recovery can now build on weekly goal progress without introducing punishment, XP loss, level loss, backend services, or public comparison.

## Routing Decision Traceability

Decision Point:
Coordinator Story Selection

Selected Story:
RL-0009

Previous Story State:
Not Started

New Story State:
In Progress

Inputs Considered:

- docs/EPIC_USER_STORY_TASKS.md
- docs/PRODUCT_BRIEF.md
- docs/PROJECT_CONTEXT.md
- docs/ARCHITECTURE.md
- docs/SPRINT_PLAN.md
- user_stories/RL-0008/RL-0008_RELEASE_NOTE.md
- user_stories/RL-0009/RL-0009_TASKS.md

Dependency and Blocker Status:

- RL-0009 depends on RL-0008.
- RL-0008 is Done in docs/EPIC_USER_STORY_TASKS.md.
- RL-0009 task file is present.
- No coordinator-stage blockers identified.

Selection Rationale:
RL-0009 was selected because RL-0008 is Done and the next product need is consistency recovery: handling missed weeks in a way that protects XP and levels, detects returns for local metrics, and keeps RepLog encouraging for returning users.

Next Agent:
Code Reviewer

Next Prompt:
/Users/jounghwapak/Developer/AI_Agents/prompts/review_code.md

## Dependency Validation

- PRODUCT_BRIEF.md: Present.
- PROJECT_CONTEXT.md: Present.
- ARCHITECTURE.md: Present.
- EPIC_USER_STORY_TASKS.md: Present.
- RL-0009 task file: Present.
- Story dependencies: RL-0008.
- Dependency status: RL-0008 is Done.
- MVP scope: Selected as EP-06 Consistency Recovery.
- Current blocker status: No coordinator-stage blocker identified.

## Execution Order

1. Select RL-0009 and create sprint plan.
2. Interpret missed-week, return-after-missed-week, and planned-rest-day behavior.
3. Design encouraging return-state language that avoids guilt or punishment.
4. Implement local return-after-missed-week detection for future MVP validation metrics.
5. Preserve XP totals and level progress when a workout week is missed.
6. Ensure planned rest days do not create failure states.
7. Test missed-week, return-week, planned-rest-day, XP preservation, and level preservation behavior.
8. Review consistency recovery behavior for product tone and data correctness.
9. Release Manager closes RL-0009 after validation and documentation updates.

## Assigned Agents

1. Coordinator
2. User Story Interpreter
3. UX Designer
4. Code Writer
5. Code Reviewer
6. QA Tester
7. Release Manager

## Required Deliverables

- RL-0009 sprint plan.
- Interpretation output.
- UX specification.
- Implementation notes.
- Code review report.
- QA report.
- Release note.

## Risks Or Blockers

- Missed-week and planned-rest-day definitions need interpretation before implementation.
- Recovery behavior must avoid penalties, XP loss, level loss, and streak scope.
- Return detection should remain local and small, not a full analytics system.

## Expected Outcome

- RL-0009 is interpreted, designed, implemented, reviewed, QAed, and closed as Done.
- RL-0010 becomes the likely next eligible story after RL-0009, subject to coordinator validation.

## Agent Handoff

Current Agent:

```text
Code Writer
```

Completed Output:

```text
docs/SPRINT_PLAN.md
docs/EPIC_USER_STORY_TASKS.md
user_stories/RL-0009/RL-0009_SPRINT_PLAN.md
user_stories/RL-0009/RL-0009_INTERPRETATION.md
user_stories/RL-0009/RL-0009_UX_SPEC.md
user_stories/RL-0009/RL-0009_IMPLEMENTATION_NOTES.md
```

Next Agent:

```text
Code Reviewer
```

Next Prompt:

```text
/Users/jounghwapak/Developer/AI_Agents/prompts/review_code.md
```

Required Input Files:

- docs/EPIC_USER_STORY_TASKS.md
- docs/PRODUCT_BRIEF.md
- docs/PROJECT_CONTEXT.md
- docs/ARCHITECTURE.md
- docs/SPRINT_PLAN.md
- user_stories/RL-0009/RL-0009_TASKS.md
- user_stories/RL-0009/RL-0009_SPRINT_PLAN.md
- user_stories/RL-0009/RL-0009_INTERPRETATION.md
- user_stories/RL-0009/RL-0009_UX_SPEC.md
- user_stories/RL-0009/RL-0009_IMPLEMENTATION_NOTES.md

Optional Input Files:

- user_stories/RL-0008/RL-0008_RELEASE_NOTE.md
- lib/data/services/weekly_goal_service.dart
- lib/data/services/storage_service.dart
- lib/features/home/screens/home_screen.dart
- DEVELOPMENT_LOG.md

Expected Output:

- user_stories/RL-0009/RL-0009_CODE_REVIEW.md

Blocking Conditions:

- None identified for Code Review stage.

Instructions:

- RL-0008 is complete and must remain Done.
- RL-0009 is selected and In Progress.
- RL-0009-T01 interpretation is complete.
- RL-0009-T02 UX design is complete.
- RL-0009-T03, RL-0009-T04, and RL-0009-T05 implementation tasks are complete.
- Complete RL-0009-T07 only.
- Preserve working onboarding, workout logging, completion, XP, levels, and weekly goal progress behavior.
- Do not add penalties, XP loss, level loss, streak systems, share cards, backend services, login, cloud sync, analytics SDK, social graph, or public ranking.
