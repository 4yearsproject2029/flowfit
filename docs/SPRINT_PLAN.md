# Sprint Plan

## Current Story

Story ID:
RL-0010

Status:
Done

Reason:
RL-0010 released MVP share cards after implementation, Code Review approval, QA pass, `flutter analyze`, and the full automated test suite. Share cards remain optional, user-initiated, local, and private by default.

## Routing Decision Traceability

Decision Point:
Coordinator Story Selection

Selected Story:
RL-0010

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
- user_stories/RL-0009/RL-0009_RELEASE_NOTE.md
- user_stories/RL-0010/RL-0010_TASKS.md

Dependency and Blocker Status:

- RL-0010 depends on RL-0006, RL-0007, and RL-0008.
- RL-0006, RL-0007, and RL-0008 are Done in docs/EPIC_USER_STORY_TASKS.md.
- RL-0010 task file is present.
- No coordinator-stage blockers identified.

Selection Rationale:
RL-0010 was selected because the app now has completion, XP, levels, and weekly goal progress available locally. The next product need is optional, privacy-conscious share cards for celebrating workout completion, level-up, and weekly goal completion without exposing embarrassing numbers.

Next Agent:
Coordinator

Next Prompt:
/Users/jounghwapak/Developer/AI_Agents/prompts/create_sprint_plan.md

## Dependency Validation

- PRODUCT_BRIEF.md: Present.
- PROJECT_CONTEXT.md: Present.
- ARCHITECTURE.md: Present.
- EPIC_USER_STORY_TASKS.md: Present.
- RL-0010 task file: Present.
- Story dependencies: RL-0006, RL-0007, RL-0008.
- Dependency status: RL-0006, RL-0007, and RL-0008 are Done.
- MVP scope: Selected as EP-07 Share Cards.
- Current blocker status: No coordinator-stage blocker identified.

## Execution Order

1. Select RL-0010 and create sprint plan.
2. Define required MVP share-card types and trigger moments.
3. Design workout completion, level-up, and weekly goal completion share-card layouts.
4. Implement share-card data preparation for the three card types.
5. Implement on-device share-card preview and generation.
6. Ensure weight, sets, reps, calories, and PRs are hidden by default.
7. Test card availability, hidden default metrics, optional generation, and generated card output.
8. Review share-card implementation for privacy, MVP scope, and platform behavior.
9. Release Manager closes RL-0010 after validation and documentation updates.

## Assigned Agents

1. Coordinator
2. User Story Interpreter
3. UX Designer
4. Code Writer
5. Code Reviewer
6. QA Tester
7. Release Manager

## Required Deliverables

- RL-0010 sprint plan.
- Interpretation output.
- UX specification.
- Implementation notes.
- Code review report.
- QA report.
- Release note.

## Risks Or Blockers

- Share-card scope could drift into public social features.
- Hidden default metrics must be preserved to avoid embarrassing users.
- Platform sharing dependencies should not be added unless needed for MVP value.
- Card generation should remain optional and user-initiated.

## Expected Outcome

- RL-0010 is interpreted, designed, implemented, reviewed, QAed, and closed as Done.
- RL-0011 becomes the likely next eligible story after RL-0010, subject to coordinator validation.

## Agent Handoff

Current Agent:

```text
Release Manager
```

Completed Output:

```text
docs/SPRINT_PLAN.md
docs/EPIC_USER_STORY_TASKS.md
user_stories/RL-0010/RL-0010_SPRINT_PLAN.md
user_stories/RL-0010/RL-0010_INTERPRETATION.md
user_stories/RL-0010/RL-0010_UX_SPEC.md
user_stories/RL-0010/RL-0010_IMPLEMENTATION_NOTES.md
user_stories/RL-0010/RL-0010_CODE_REVIEW.md
user_stories/RL-0010/RL-0010_QA_REPORT.md
user_stories/RL-0010/RL-0010_RELEASE_NOTE.md
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
- docs/PRODUCT_BRIEF.md
- docs/PROJECT_CONTEXT.md
- docs/ARCHITECTURE.md
- docs/SPRINT_PLAN.md
- user_stories/RL-0010/RL-0010_RELEASE_NOTE.md

Optional Input Files:

- user_stories/RL-0006/RL-0006_RELEASE_NOTE.md
- user_stories/RL-0007/RL-0007_RELEASE_NOTE.md
- user_stories/RL-0008/RL-0008_RELEASE_NOTE.md
- lib/data/services/storage_service.dart
- lib/data/services/level_service.dart
- lib/data/services/weekly_goal_service.dart
- lib/features/home/screens/home_screen.dart

Expected Output:

- Coordinator story selection and sprint plan for the next eligible story.

Blocking Conditions:

- If RL-0006, RL-0007, or RL-0008 is no longer Done.
- If implementation would require backend, login, cloud sync, analytics SDK, public ranking, social graph, or automatic publishing.

Instructions:

- RL-0006, RL-0007, and RL-0008 are complete and must remain Done.
- RL-0010 is Done.
- RL-0010-T01 interpretation is complete.
- RL-0010-T02 UX design is complete.
- Select the next eligible story only after validating dependencies and preserving completed story state.
- Preserve working onboarding, workout logging, completion, XP, levels, weekly goal progress, and consistency recovery behavior.
- Do not add backend services, login, cloud sync, analytics SDK, social graph, public ranking, automatic publishing, public feed, likes, comments, followers, or performance metrics visible by default.
