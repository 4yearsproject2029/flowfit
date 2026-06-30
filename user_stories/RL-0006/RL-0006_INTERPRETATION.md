# RL-0006 Interpretation

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
User Story Interpreter Agent
```

Status:

```text
Approved
```

---

## Story Summary

RL-0006 adds the first MVP gamification reward. Completing a workout grants XP once, persists the XP total locally, prevents duplicate XP for the same selected-date workout identity, and shows users why XP was awarded.

---

## Acceptance Criteria

| AC ID | Description |
| ----- | ----------- |
| AC-01 | Completing a workout grants XP once. |
| AC-02 | XP updates immediately. |
| AC-03 | XP persists after app restart. |
| AC-04 | Toggling, editing, deleting, or recreating workouts does not duplicate XP. |
| AC-05 | Users can see why XP was awarded. |

---

## XP Rules

| Rule | Decision |
| ---- | -------- |
| Award amount | 10 XP per eligible completed workout. |
| Award trigger | Workout changes from incomplete to complete. |
| Duplicate key | Selected date + normalized workout name + category. |
| Toggle behavior | Uncompleting does not remove XP; recompleting the same identity does not award XP again. |
| Delete behavior | Deleting a workout does not remove XP or its award ledger entry. |
| Recreate behavior | Recreating the same date/name/category workout does not award duplicate XP. |
| Persistence | XP total, award ledger, and last explanation persist locally through Hive. |

---

## Functional Requirements

* The system shall award 10 XP when a workout becomes complete for the first time.
* The system shall store the XP total locally.
* The system shall store award ledger entries locally.
* The system shall store the latest XP explanation locally.
* The system shall immediately update the visible XP total after an award.
* The system shall show the user why XP was awarded.
* The system shall not add levels, badges, streaks, weekly goal progress, share cards, backend, login, sync, analytics, social graph, or public ranking.

---

## Out Of Scope

* Level calculation or level display.
* XP decay or XP removal.
* XP history list.
* Editing workout logs.
* Cloud sync, account login, backup, or export.

---

## Agent Handoff

Current Agent:

```text
User Story Interpreter
```

Completed Output:

```text
user_stories/RL-0006/RL-0006_INTERPRETATION.md
```

Next Agent:

```text
Code Writer
```
