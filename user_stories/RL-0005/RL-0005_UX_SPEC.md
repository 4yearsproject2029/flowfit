# RL-0005 UX Specification

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
UX Designer Agent
```

Status:

```text
Approved
```

---

## User Goal

```text
Users need to mark a workout as complete quickly from the workout list and recognize completed workouts at a glance.
```

---

## User Flow

```text
Home Screen
-> User views workouts for the selected date
-> User taps the checkbox on a workout row
-> Workout completion state changes immediately
-> Completed workout becomes visually distinct
-> User can tap the checkbox again to return it to incomplete
```

---

## Interaction Patterns

* Completion uses the existing checkbox on each workout list item.
* Tapping the checkbox toggles completion without opening another screen.
* Toggling completion does not delete the workout.
* Completed workouts remain visible in the list.
* Incomplete workouts appear before completed workouts for easier scanning.

---

## Visual States

| State | Visual Treatment |
| ----- | ---------------- |
| Incomplete | Normal title color, normal title text, standard light row background. |
| Completed | Checked checkbox, softer text color, line-through title text, lighter row background. |

---

## Accessibility

* Checkbox uses the standard Material control.
* Workout name remains visible in both states.
* Delete remains a separate icon action from completion.
* No gesture-only completion behavior is introduced.

---

## Out Of Scope

* XP awarding.
* Weekly goal progress.
* Streaks, levels, badges, or share cards.
* Editing workout logs.
* Backend, login, sync, analytics, social graph, or public ranking.

---

## Agent Handoff

Current Agent:

```text
UX Designer
```

Completed Output:

```text
user_stories/RL-0005/RL-0005_UX_SPEC.md
```

Next Agent:

```text
User Story Interpreter
```
