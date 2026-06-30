# RL-0008 Sprint Plan

## Document Metadata

Story ID:

```text
RL-0008
```

Epic:

```text
EP-06 Weekly Goals
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
RL-0008
```

Selection Reason:

```text
RL-0008 is the next eligible P0 story after RL-0007. Its dependencies, RL-0002 and RL-0005, are Done, and weekly goal progress can now build on the selected weekly goal and persisted workout completion state.
```

Previous Story State:

```text
Not Started
```

New Story State:

```text
Done
```

---

## Acceptance Criteria

* The app displays the selected weekly goal.
* The app displays completed workouts for the current week.
* Progress updates immediately.
* Goal completion is recognized when the target is reached.
* Goal progress persists after app restart.

---

## Dependency Validation

Dependencies:

```text
RL-0002, RL-0005
```

Validation Result:

```text
RL-0002 is Done and persists the selected weekly goal. RL-0005 is Done and persists workout completion state.
```

---

## Execution Order

1. Select RL-0008 and create sprint plan.
2. Define weekly goal progress rules, current-week boundaries, and completion state.
3. Design weekly goal progress display for the existing home experience.
4. Implement weekly goal progress calculation from completed workouts.
5. Display selected weekly goal, completed count, and goal completion state.
6. Update weekly progress immediately when workouts are completed or uncompleted.
7. Test weekly calculation, completion threshold, restart persistence, and toggle updates.
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
| Current-week boundary rules could be unclear. | Different agents may count different workouts. | Interpreter must define week start, inclusive dates, and date-key behavior before implementation. |
| Goal progress could drift into streaks or recovery behavior. | Scope creep into RL-0009 or later stories. | Limit RL-0008 to selected goal, current-week completed count, and target reached state. |
| Goal completion could accidentally award XP or badges. | Scope creep into future gamification stories. | Do not add new XP awards, badges, streaks, share cards, or celebrations in RL-0008. |
| Toggle updates could lag behind completion changes. | Acceptance criteria failure. | Reuse existing workout log listenable/update path where practical. |

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

## Release Summary

RL-0008 released MVP weekly goal progress. Selected weekly goal, current-week completed workout count, progress, and goal completion state now appear in the home experience, derived from persisted local data.

---

## Scope Boundaries

In scope:

* Selected weekly goal display.
* Current-week completed workout count.
* Progress toward the selected weekly goal.
* Goal completion recognition when target is reached.
* Immediate updates after workout completion toggles.
* Restart persistence through existing local goal and workout completion state.

Out of scope:

* Streaks.
* Consistency recovery or missed-week encouragement.
* Additional XP awards for goal completion.
* Badges.
* Share cards.
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
user_stories/RL-0008/RL-0008_SPRINT_PLAN.md
user_stories/RL-0008/RL-0008_INTERPRETATION.md
user_stories/RL-0008/RL-0008_UX_SPEC.md
user_stories/RL-0008/RL-0008_IMPLEMENTATION_NOTES.md
user_stories/RL-0008/RL-0008_CODE_REVIEW.md
user_stories/RL-0008/RL-0008_QA_REPORT.md
user_stories/RL-0008/RL-0008_RELEASE_NOTE.md
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
* user_stories/RL-0008/RL-0008_TASKS.md
* user_stories/RL-0008/RL-0008_SPRINT_PLAN.md
* user_stories/RL-0008/RL-0008_INTERPRETATION.md
* user_stories/RL-0008/RL-0008_UX_SPEC.md
* user_stories/RL-0008/RL-0008_IMPLEMENTATION_NOTES.md
* user_stories/RL-0008/RL-0008_CODE_REVIEW.md
* user_stories/RL-0008/RL-0008_RELEASE_NOTE.md

Optional Input Files:

* user_stories/RL-0007/RL-0007_RELEASE_NOTE.md
* DEVELOPMENT_LOG.md

Expected Output:

```text
Coordinator story selection and sprint plan for the next eligible story.
```

Blocking Conditions:

* If RL-0002 or RL-0005 is no longer Done.
* If current-week boundary rules require product approval.
* If implementation would require backend, login, cloud sync, analytics SDK, public ranking, or a broad app rewrite.

Instructions:

* RL-0008-T01 interpretation is complete.
* RL-0008-T02 UX design is complete.
* RL-0008-T03, RL-0008-T04, and RL-0008-T05 implementation tasks are complete.
* RL-0008-T07 code review is complete.
* RL-0008 is complete and must remain Done.
* Recommended next story is RL-0009.
* Preserve working onboarding, workout logging, completion, XP, and level behavior.
* Keep weekly goal progress beginner-friendly and consistency-focused.
