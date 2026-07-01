# RL-0010 Sprint Plan

## Document Metadata

Story ID:

```text
RL-0010
```

Epic:

```text
EP-07 Share Cards
```

Created Date:

```text
2026-07-01
```

Created By:

```text
Coordinator Agent
```

Status:

```text
In Progress
```

---

## Story Selection

Selected Story:

```text
RL-0010
```

Selection Reason:

```text
RL-0010 is the next eligible story after RL-0009. Its dependencies, RL-0006, RL-0007, and RL-0008, are Done, and share cards can now use local completion, level, and weekly goal data while preserving privacy defaults.
```

Previous Story State:

```text
Not Started
```

New Story State:

```text
In Progress
```

---

## Acceptance Criteria

* Users can generate workout completion cards.
* Users can generate level-up cards.
* Users can generate weekly goal cards.
* Weight, sets, reps, calories, and PRs are hidden by default.
* Share card generation is optional and user-initiated.

---

## Dependency Validation

Dependencies:

```text
RL-0006, RL-0007, RL-0008
```

Validation Result:

```text
RL-0006, RL-0007, and RL-0008 are Done in docs/EPIC_USER_STORY_TASKS.md. RL-0010 can build on completed workout completion XP, level progress, and weekly goal progress.
```

---

## Execution Order

1. Select RL-0010 and create sprint plan.
2. Define required MVP share-card types and trigger moments.
3. Design workout completion, level-up, and weekly goal completion card layouts.
4. Implement share-card data preparation for the three approved card types.
5. Implement on-device preview and generation.
6. Hide weight, sets, reps, calories, and PRs by default.
7. Test card availability, privacy defaults, optional generation, and generated output.
8. Review implementation for privacy, MVP scope, and platform behavior.
9. Complete QA, release note, backlog sync, and development log update.

---

## Assigned Agents

1. Coordinator
2. User Story Interpreter
3. UX Designer
4. Code Writer
5. Code Reviewer
6. QA Tester
7. Release Manager

---

## Risks

| Risk | Impact | Mitigation |
| ---- | ------ | ---------- |
| Share cards could drift into public social features. | Scope creep into feed, followers, likes, comments, or ranking. | Keep generation optional, local, and user-initiated. |
| Performance metrics could appear by default. | Users may feel embarrassed or exposed. | UX and Code Writer must explicitly hide weight, sets, reps, calories, and PRs by default. |
| Platform export could require a new dependency. | Dependency risk and larger implementation surface. | Interpreter must define MVP generation expectations before dependency decisions. |
| Card triggers could be ambiguous. | Agents may generate cards at the wrong moments. | Interpreter must define the approved trigger moments before UX and implementation. |

---

## Definition Of Done

* Acceptance criteria passed.
* Interpretation completed.
* UX feedback completed.
* Implementation completed.
* Code review approved.
* QA passed.
* Release note created.
* Story status synchronized to Done.

---

## Scope Boundaries

In scope:

* Workout completion share-card generation.
* Level-up share-card generation.
* Weekly goal completion share-card generation.
* On-device preview and generation.
* Private-by-default card content.
* Optional, user-initiated card creation.

Out of scope:

* Public feed.
* Likes, comments, followers, messaging, or social graph.
* Public ranking or leaderboards.
* Automatic publishing.
* Backend, login, cloud sync, analytics SDK, or remote storage.
* Showing weight, sets, reps, calories, PRs, or other performance metrics by default.
* Custom privacy controls beyond the RL-0010 defaults.

---

## Agent Handoff

Current Agent:

```text
UX Designer
```

Completed Output:

```text
docs/SPRINT_PLAN.md
docs/EPIC_USER_STORY_TASKS.md
user_stories/RL-0010/RL-0010_SPRINT_PLAN.md
user_stories/RL-0010/RL-0010_INTERPRETATION.md
user_stories/RL-0010/RL-0010_UX_SPEC.md
```

Next Agent:

```text
Code Writer
```

Next Prompt:

```text
/Users/jounghwapak/Developer/AI_Agents/prompts/generate_code.md
```

Required Input Files:

* docs/EPIC_USER_STORY_TASKS.md
* docs/PRODUCT_BRIEF.md
* docs/PROJECT_CONTEXT.md
* docs/ARCHITECTURE.md
* docs/SPRINT_PLAN.md
* user_stories/RL-0010/RL-0010_TASKS.md
* user_stories/RL-0010/RL-0010_SPRINT_PLAN.md
* user_stories/RL-0010/RL-0010_INTERPRETATION.md
* user_stories/RL-0010/RL-0010_UX_SPEC.md

Optional Input Files:

* user_stories/RL-0006/RL-0006_RELEASE_NOTE.md
* user_stories/RL-0007/RL-0007_RELEASE_NOTE.md
* user_stories/RL-0008/RL-0008_RELEASE_NOTE.md
* lib/data/services/storage_service.dart
* lib/data/services/level_service.dart
* lib/data/services/weekly_goal_service.dart
* lib/features/home/screens/home_screen.dart

Expected Output:

```text
user_stories/RL-0010/RL-0010_IMPLEMENTATION_NOTES.md
```

Blocking Conditions:

* If RL-0006, RL-0007, or RL-0008 is no longer Done.
* If implementation would require backend, login, cloud sync, analytics SDK, public ranking, social graph, or automatic publishing.

Instructions:

* RL-0006, RL-0007, and RL-0008 are complete and must remain Done.
* RL-0010 is selected and In Progress.
* RL-0010-T01 interpretation is complete.
* RL-0010-T02 UX design is complete.
* Complete RL-0010-T03, RL-0010-T04, and RL-0010-T05 only.
* Preserve working onboarding, workout logging, completion, XP, levels, weekly goal progress, and consistency recovery behavior.
* Do not add backend services, login, cloud sync, analytics SDK, social graph, public ranking, automatic publishing, public feed, likes, comments, followers, or performance metrics visible by default.
