# RL-0009 Sprint Plan

## Document Metadata

Story ID:

```text
RL-0009
```

Epic:

```text
EP-06 Consistency Recovery
```

Created Date:

```text
2026-06-30
```

Created By:

```text
Coordinator Agent
```

Status:

```text
Done
```

---

## Story Selection

Selected Story:

```text
RL-0009
```

Selection Reason:

```text
RL-0009 is the next eligible story after RL-0008. Its only dependency, RL-0008, is Done, and consistency recovery can now build on weekly goal progress without adding punishment, XP loss, level loss, backend services, or public comparison.
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

* Missing a workout week does not remove XP.
* Missing a workout week does not reduce levels.
* Returning after a missed week is detectable for metrics.
* The app displays encouraging language after returning.
* Planned rest days do not count as failures.

---

## Dependency Validation

Dependencies:

```text
RL-0008
```

Validation Result:

```text
RL-0008 is Done in docs/EPIC_USER_STORY_TASKS.md and released persisted weekly goal progress. RL-0009 can use the completed weekly goal foundation to define missed-week and return-after-missed-week behavior.
```

---

## Execution Order

1. Select RL-0009 and create sprint plan.
2. Define missed-week, return-after-missed-week, and planned-rest-day rules for MVP.
3. Design encouraging return-state language that avoids guilt, penalties, or shame.
4. Implement local return-after-missed-week detection for future MVP validation metrics.
5. Preserve XP totals and level progress when a week is missed.
6. Ensure planned rest days do not create failure states.
7. Test missed-week, return-week, planned-rest-day, XP preservation, and level preservation behavior.
8. Complete code review, QA, release note, backlog sync, and development log update.

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
| Missed-week rules could become punitive or confusing. | The story could undermine RepLog's low-pressure product promise. | Interpreter must define neutral recovery rules before implementation, and UX must use encouraging copy. |
| Return detection could drift into a full analytics system. | Scope creep into RL-0012 or external analytics. | Track only local return-after-missed-week state needed by the acceptance criteria. |
| Planned rest days could require a larger scheduling feature. | Scope could expand beyond a small recovery story. | Define MVP rest-day handling narrowly and avoid calendar planning systems unless required by interpretation. |
| XP or level recalculation could accidentally punish missed weeks. | Acceptance criteria failure and user trust risk. | Code Writer and QA must explicitly verify XP totals and levels are preserved. |

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

## Release Summary

RL-0009 released MVP consistency recovery. The app now detects return-after-missed-week behavior locally, preserves XP and level progress, records local recovery metric dates, treats planned rest as neutral, and shows encouraging private recovery language on the home screen.

---

## Scope Boundaries

In scope:

* Missed-week behavior that preserves XP.
* Missed-week behavior that preserves levels.
* Local detection of returning after a missed week.
* Encouraging return-state language.
* MVP planned-rest-day handling so rest days do not count as failures.

Out of scope:

* Streaks.
* Penalties, XP decay, level reduction, or harsh failure states.
* Full analytics dashboards.
* Share cards.
* Badges.
* Backend, login, cloud sync, analytics SDK, social graph, public ranking, or external services.

---

## Agent Handoff

Current Agent:

```text
Release Manager
```

Completed Output:

```text
docs/SPRINT_PLAN.md
docs/EPIC_USER_STORY_TASKS.md
user_stories/RL-0009/RL-0009_SPRINT_PLAN.md
user_stories/RL-0009/RL-0009_INTERPRETATION.md
user_stories/RL-0009/RL-0009_UX_SPEC.md
user_stories/RL-0009/RL-0009_IMPLEMENTATION_NOTES.md
user_stories/RL-0009/RL-0009_CODE_REVIEW.md
user_stories/RL-0009/RL-0009_QA_REPORT.md
user_stories/RL-0009/RL-0009_RELEASE_NOTE.md
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

* docs/EPIC_USER_STORY_TASKS.md
* docs/PRODUCT_BRIEF.md
* docs/PROJECT_CONTEXT.md
* docs/ARCHITECTURE.md
* docs/SPRINT_PLAN.md
* user_stories/RL-0009/RL-0009_TASKS.md
* user_stories/RL-0009/RL-0009_SPRINT_PLAN.md
* user_stories/RL-0009/RL-0009_INTERPRETATION.md
* user_stories/RL-0009/RL-0009_UX_SPEC.md
* user_stories/RL-0009/RL-0009_RELEASE_NOTE.md

Optional Input Files:

* user_stories/RL-0008/RL-0008_RELEASE_NOTE.md
* lib/data/services/weekly_goal_service.dart
* lib/data/services/storage_service.dart
* lib/features/home/screens/home_screen.dart
* DEVELOPMENT_LOG.md

Expected Output:

```text
Coordinator story selection and sprint plan for the next eligible story.
```

Blocking Conditions:

* If RL-0008 is no longer Done.
* If UX cannot define planned-rest-day handling within MVP recovery behavior.
* If implementation would require backend, login, cloud sync, analytics SDK, public ranking, or a broad app rewrite.

Instructions:

* RL-0009-T01 interpretation is complete.
* RL-0009-T02 UX design is complete.
* RL-0009 release is complete.
* Stop before selecting RL-0010 unless the Coordinator workflow is explicitly resumed.
* RL-0008 is complete and must remain Done.
* Preserve working onboarding, workout logging, completion, XP, levels, and weekly goal progress behavior.
* Do not add penalties, XP loss, level loss, streak systems, share cards, backend services, login, cloud sync, analytics SDK, social graph, or public ranking.
