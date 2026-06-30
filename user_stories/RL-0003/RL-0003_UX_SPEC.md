# RL-0003 UX Specification

## Document Metadata

Story ID:

```text
RL-0003
```

Epic:

```text
EP-03 Workout Logging
```

Created Date:

```text
2026-06-30
```

Last Updated:

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

## Source Of Truth

Priority order when conflicts exist:

1. user_stories/RL-0003/RL-0003_SPRINT_PLAN.md
2. docs/EPIC_USER_STORY_TASKS.md
3. docs/PROJECT_CONTEXT.md
4. docs/PRODUCT_BRIEF.md

---

## UX Trigger Reason

```text
RL-0003 requires a beginner-friendly workout logging flow with required and optional fields, a speed target, and immediate feedback in the selected date list.
```

---

## User Goal

```text
Beginner users need to record a workout with minimal friction so logging supports the workout habit instead of feeling like an extra chore.
```

---

## User Flow

```text
Home Screen on selected date
-> User opens Add Workout
-> User enters workout name
-> User optionally changes category or adds sets, reps, weight, or memo
-> User saves
-> Add flow closes
-> New workout appears in the selected date list
```

---

## Screen Placement

```text
1. Add Workout title
2. Required workout name field
3. Category selector with a default category
4. Optional sets and reps fields
5. Optional weight field
6. Optional memo field
7. Primary Save action
```

---

## Interaction Patterns

* Category may default to the first available category so a valid workout can be saved quickly.
* Workout name is required.
* Sets, reps, weight, and memo are optional and may be left blank.
* After opening the add flow, a valid workout can be saved with three taps or fewer: tap name, enter name, tap Save.
* Saving a valid workout closes the add flow and updates the selected date list immediately.
* Invalid save keeps the add flow open and shows validation feedback.

---

## Accessibility

* Fields should use visible labels.
* Save action should remain a standard button.
* The flow should remain usable on small iPhone-sized screens.
* Touch targets should follow existing Material defaults.

---

## Out Of Scope

* Workout templates.
* Recent workout suggestions.
* Completion toggle changes.
* XP, levels, streaks, badges, weekly progress, or share cards.
* Backend, login, sync, analytics, social graph, or public ranking.

---

## Agent Handoff

Current Agent:

```text
UX Designer
```

Completed Output:

```text
user_stories/RL-0003/RL-0003_UX_SPEC.md
```

Next Agent:

```text
User Story Interpreter
```
