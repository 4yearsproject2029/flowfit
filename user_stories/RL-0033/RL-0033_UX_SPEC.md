# RL-0033 UX Specification

## Document Metadata

Story ID:

```text
RL-0033
```

Epic:

```text
EP-12 Workout Session Composition
```

Created Date:

```text
2026-07-18
```

Last Updated:

```text
2026-07-18
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

1. user_stories/RL-0033/RL-0033_SPRINT_PLAN.md
2. docs/USER_JOURNEY.md
3. docs/SCREEN_STRUCTURE.md
4. docs/EPIC_USER_STORY_TASKS.md
5. docs/PROJECT_CONTEXT.md
6. docs/PRODUCT_BRIEF.md

---

## Workflow Validation

Read:

```text
user_stories/RL-0033/RL-0033_SPRINT_PLAN.md
```

Locate:

```text
UX Required:
```

Allowed values:

* Yes
* No

Result:

```text
UX Required: Yes
```

---

## UX Trigger Reason

Selected Reason:

```text
RL-0033 introduces a new Workout Plan Builder screen, an Add Exercise bottom sheet, Dashboard navigation into planning, and a saved-session handoff into Current Workout.
```

---

## User Goal

Users need a simple way to prepare today's workout before starting the guided workout flow.

The experience should help users answer:

```text
What am I doing today?
```

and then hand the saved session back to Dashboard and Current Workout without turning planning into execution, history review, templates, or performance analytics.

---

## User Flow

No saved daily session:

```text
Home Dashboard
→ Plan Workout
→ Workout Plan Builder
→ Add Exercise
→ Save Workout
→ Home Dashboard
→ Start Workout
→ Current Workout
```

Existing daily session:

```text
Home Dashboard
→ Saved session preview
→ Workout Plan Builder
→ Edit / Add / Delete Exercise
→ Save Workout
→ Home Dashboard
```

---

## Entry Points

* Home Dashboard Today's Focus card when no daily session exists.
* Home Dashboard saved-session area when a daily session already exists.
* Future Week entry points may reuse the builder, but Week implementation is out of scope for RL-0033.

---

## Exit Points

* Save Workout returns to Home Dashboard with the saved session visible.
* Back navigation returns to Home Dashboard without starting Current Workout.
* Add Exercise closes only after valid add, valid save, cancel, or dismiss.
* Start Workout from Dashboard opens Current Workout using the saved session.

---

## Screen Placement

Workout Plan Builder hierarchy:

1. Header with back action and selected date.
2. Session title.
3. Session summary: exercise count and total planned sets.
4. Ordered exercise list.
5. Add Exercise action.
6. Save Workout action.

Add Exercise bottom sheet hierarchy:

1. Sheet title and close action.
2. Exercise name.
3. Category.
4. Sets and reps.
5. Optional weight.
6. Optional rest time or memo where locally available.
7. Add Exercise or Save Exercise action.

---

## Components

| Component | Purpose | Priority |
| --------- | ------- | -------- |
| Workout Plan Builder screen | Create or edit one daily session for the selected date. | Primary |
| Session title field | Names the daily session shown on Dashboard and used as workout handoff context. | Primary |
| Exercise list | Shows planned exercises in insertion order with visible numbering. | Primary |
| Add Exercise bottom sheet | Adds or edits one planned exercise without leaving the builder. | Primary |
| Save Workout button | Persists only valid sessions with at least one exercise. | Primary |
| Empty exercise state | Explains that a saved session needs at least one valid exercise. | Secondary |
| Edit exercise action | Opens the bottom sheet with existing exercise values and preserves order. | Secondary |
| Delete exercise action | Removes the exercise and closes the visible numbering gap. | Secondary |
| Local icon/image placeholder | Supports approved visual composition without external assets. | Secondary |

---

## Interaction Patterns

* Plan Workout opens the Workout Plan Builder from Dashboard.
* Add opens the Add Exercise bottom sheet.
* Adding a valid exercise appends it to the end of the list.
* Editing an exercise updates its fields without changing its visible number or stored order.
* Deleting an exercise removes it and renumbers the remaining visible list from 1.
* Save Workout is disabled or blocked until at least one valid exercise exists.
* Saving persists the session title and exercises locally, then returns to Dashboard.
* Dashboard Start Workout appears only when the selected date has a valid saved session.
* Current Workout receives the saved exercise list and must not create duplicate completed records.
* Reorder affordance from approved design is deferred; insertion order is the RL-0033 rule.

---

## Feedback Mechanisms

Success:

* The saved session appears on Dashboard after saving.
* The exercise list updates immediately after add, edit, or delete.

Failure:

* Empty exercise name shows validation feedback.
* Save is disabled or blocked when there are no exercises.

Progress:

* Exercise count and total set count update as exercises change.
* Ordered numbering communicates the saved execution order.

Achievements:

* Not applicable. RL-0033 must not award XP or unlock achievements.

---

## Empty States

| Scenario | Message | Action |
| -------- | ------- | ------ |
| No daily session on Dashboard | No workout planned. | Plan Workout |
| Builder has no exercises | Add at least one exercise. | Add Exercise |
| Invalid exercise name | Enter an exercise name. | Correct field |

---

## Error States

| Scenario | Message | Recovery Action |
| -------- | ------- | --------------- |
| Save attempted without exercises | Add at least one exercise before saving. | Add Exercise |
| Exercise name missing | Enter an exercise name. | Fill required field |
| Existing local records are unavailable | No workout planned. | Plan Workout |

---

## Loading States

```text
No loading state is required because RL-0033 uses local Hive persistence only.
```

---

## Accessibility Considerations

* Primary actions must use touch targets at least 44px high.
* Add, edit, delete, close, and back actions need readable labels or tooltips.
* Exercise numbering must not rely on color alone.
* Text must fit common iPhone widths without overlap.
* Bottom sheet fields must remain reachable when the keyboard is open.
* Disabled Save state must have visible contrast and clear context from the empty state.

---

## Analytics Recommendations

```text
Not required. Do not add external analytics SDKs.
```

---

## Approved Design Application

| Approved File | RL-0033 Usage | Notes |
| ------------- | ------------- | ----- |
| `design/approved/09_workout_plan_builder.png` | Workout Plan Builder screen composition. | Implement as a local-first dark planning screen with title, summary, ordered list, add action, and save action. |
| `design/approved/10_add_exercise.png` | Add Exercise bottom sheet composition. | Implement focused exercise creation/editing fields and a primary action. |

Visual guidance:

* Use existing dark Phase 2 colors and Material widgets from Home and Current Workout.
* Use Material icons or local placeholders rather than external assets.
* Keep cards compact and scroll-safe.
* Avoid nested management UI that makes Home or Current Workout into editors.

---

## Scope Boundaries

Included:

* One daily session for the selected date.
* Session title.
* Multiple ordered planned exercises.
* Add, edit, and delete exercise.
* Dashboard and Current Workout handoff.

Excluded:

* Templates.
* Drag-and-drop sorting.
* Multiple sessions per day.
* Week screen implementation.
* Planned Session Detail.
* Current Workout set progression.
* Timer flow.
* XP, levels, achievements, share cards, backend, login, cloud sync, and social features.

---

## Agent Handoff

Current Agent:

```text
UX Designer
```

Completed Output:

```text
user_stories/RL-0033/RL-0033_UX_SPEC.md
```

Next Agent:

```text
User Story Interpreter
```

Next Prompt:

```text
AI_Agents/prompts/interpret_user_story.md
```

Required Input Files:

* `user_stories/RL-0033/RL-0033_SPRINT_PLAN.md`
* `user_stories/RL-0033/RL-0033_UX_SPEC.md`
* `docs/PROJECT_CONTEXT.md`
* `docs/ARCHITECTURE.md`
* `docs/EPIC_USER_STORY_TASKS.md`
* `user_stories/RL-0033/RL-0033_TASKS.md`

Expected Output:

* `user_stories/RL-0033/RL-0033_INTERPRETATION.md`

Blocking Conditions:

* Stop if the interpreter cannot preserve RL-0033 scope boundaries or if required documents are missing.
