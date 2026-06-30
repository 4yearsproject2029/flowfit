# RL-0006 Sprint Plan

## Document Metadata

Story ID:

```text
RL-0006
```

Epic:

```text
EP-05 Gamification - XP
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
RL-0006
```

Selection Reason:

```text
RL-0006 is the next eligible P0 story after RL-0004. Its dependency, RL-0005, is Done, and XP can now build on persisted workout completion.
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

* Completing a workout grants XP once.
* XP updates immediately.
* XP persists after app restart.
* Toggling, editing, deleting, or recreating workouts does not duplicate XP.
* Users can see why XP was awarded.

---

## Dependency Validation

Dependencies:

```text
RL-0005
```

Validation Result:

```text
RL-0005 is Done in docs/EPIC_USER_STORY_TASKS.md.
```

---

## Execution Order

1. Select RL-0006 and create sprint plan.
2. Define MVP XP award and duplicate-prevention rules.
3. Design simple XP total and reason feedback.
4. Implement XP award behavior on workout completion.
5. Persist XP total, award ledger, and explanation locally.
6. Add tests for award once, duplicate prevention, restart persistence, and visible explanation.
7. Complete code review, QA, release note, backlog sync, and development log update.

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
| XP story could drift into levels or weekly goal progress. | Scope creep into RL-0007 or RL-0008. | Only display XP total and reason; do not add levels, progress bars, weekly goal status, streaks, badges, or share cards. |
| Duplicate prevention could be tied only to transient row IDs. | Delete and recreate could duplicate XP. | Use a stable MVP award key based on date, normalized workout name, and category. |
| Widget callback-write tests remain skipped. | Automated tapped-save coverage remains limited. | Use service-level Hive tests for XP idempotency and persistence. |

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

RL-0006 released MVP XP rewards. Completing a workout grants 10 XP once per selected-date workout identity, updates the home screen immediately, persists locally, and explains why XP was awarded.

Verification passed with `flutter analyze` and `flutter test -r expanded`.

---

## Agent Handoff

Current Agent:

```text
Coordinator
```

Completed Output:

```text
user_stories/RL-0006/RL-0006_SPRINT_PLAN.md
```

Next Agent:

```text
Release Manager
```
