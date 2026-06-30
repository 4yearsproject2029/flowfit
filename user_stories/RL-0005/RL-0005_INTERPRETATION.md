# RL-0005 Interpretation

## Document Metadata

Story ID:

```text
RL-0005
```

Epic:

```text
EP-03 Workout Completion
```

Created Date:

```text
2026-06-30
```

Created By:

```text
User Story Interpreter Agent
```

Status:

```text
Approved
```

---

## Story Summary

RL-0005 enables users to mark workout logs as complete from the workout list. Completion must be reversible, visually clear, immediately reflected in the current list, and persisted locally after restart.

---

## Acceptance Criteria

| AC ID | Description |
| ----- | ----------- |
| AC-01 | Workouts can be marked complete from the list. |
| AC-02 | Completed workouts are visually distinguishable. |
| AC-03 | Completion can be toggled without deleting the workout. |
| AC-04 | Completion updates immediately. |
| AC-05 | Completion state persists after app restart. |

---

## Functional Requirements

* The system shall display a completion control for each workout list item.
* The system shall toggle `WorkoutLog.isCompleted` for the selected workout log.
* The system shall keep the workout log record when completion changes.
* The system shall persist the updated workout log in the existing Hive workout log box.
* The system shall refresh the visible selected-date workout list immediately after completion changes.
* The system shall show completed workouts with distinct styling.
* The system shall preserve existing add, delete, onboarding, timer, and local persistence behavior.

---

## Data Requirements

Existing fields used:

| Model | Field | Usage |
| ----- | ----- | ----- |
| WorkoutLog | isCompleted | Stores whether the workout log is complete. |

New fields required:

```text
None.
```

Persistence rules:

* Use the existing workout log Hive box.
* Do not change Hive adapter IDs.
* Do not change Hive adapter read/write order.
* Do not add migrations.

---

## Task Mapping

| Task ID | Owner | Output |
| ------- | ----- | ------ |
| RL-0005-T01 | User Story Interpreter | Completion behavior and toggle rules defined. |
| RL-0005-T02 | UX Designer | Completed and incomplete states confirmed. |
| RL-0005-T03 | Code Writer | Existing workout-list checkbox toggle verified. |
| RL-0005-T04 | Code Writer | Existing Hive persistence and immediate refresh verified. |
| RL-0005-T05 | QA Tester | Completion, uncompletion, restart persistence, and delete interaction tested. |
| RL-0005-T06 | Code Reviewer | Completion handling reviewed for correctness and side effects. |

---

## Out Of Scope

* XP, levels, streaks, badges, weekly goal progress, or share cards.
* Editing workout logs.
* Networked or account-based persistence.
* Storage architecture redesign.
* Revisiting the documented Hive widget-test callback issue.

---

## Agent Handoff

Current Agent:

```text
User Story Interpreter
```

Completed Output:

```text
user_stories/RL-0005/RL-0005_INTERPRETATION.md
```

Next Agent:

```text
Code Writer
```
