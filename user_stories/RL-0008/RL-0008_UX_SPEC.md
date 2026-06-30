# RL-0008 UX Specification

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
UX Designer Agent
```

Status:

```text
Ready for Implementation
```

---

## User Goal

```text
Users need a quick, encouraging way to see whether this week's completed workouts are on track with the goal they chose during onboarding.
```

---

## Screen Placement

```text
Home Screen
-> This Week
-> Weekly Calendar
-> Local data note
-> Rest Timer
-> Level and XP progress summary
-> Weekly goal progress summary
-> Selected-date workout list
```

The weekly goal display should be a compact home-screen summary near the existing level/XP summary. Do not create a separate goals screen, modal, edit-goal flow, reminder surface, or celebration surface for this story.

---

## Content Requirements

No completed workouts:

```text
Weekly Goal
0 / 3 workouts complete
Goal: 3 workouts this week
Complete workouts this week to reach your goal.
```

Partially complete:

```text
Weekly Goal
1 / 3 workouts complete
Goal: 3 workouts this week
2 workouts to go this week.
```

Goal reached:

```text
Weekly Goal Complete
3 / 3 workouts complete
Goal: 3 workouts this week
You reached your weekly goal.
```

Over goal:

```text
Weekly Goal Complete
4 / 3 workouts complete
Goal: 3 workouts this week
You reached your weekly goal.
```

---

## Layout Requirements

* Show a section title of `Weekly Goal` or `Weekly Goal Complete`.
* Show a horizontal progress indicator below the title.
* Show progress text using the format `X / Y workouts complete`.
* Show the selected weekly goal using the format `Goal: Y workouts this week`.
* Show a short status message below the goal text.
* Cap the progress indicator at 100%, even if completed workouts exceed the goal.
* Do not cap the completed count text; if users complete 4 workouts toward a goal of 3, show `4 / 3`.
* Use a full-width compact card treatment with an 8px border radius.
* Keep text readable on small iPhone widths without awkward wrapping.

---

## Interaction Patterns

* Completing a workout within the current Monday-Sunday week updates weekly goal progress immediately.
* Uncompleting a workout within the current week updates weekly goal progress immediately.
* Deleting a completed workout within the current week updates weekly goal progress immediately.
* Workouts outside the current week do not affect the current weekly goal summary.
* Restarting the app preserves the same goal progress because it derives from local weekly goal and workout completion data.

---

## Visual Behavior

* Use existing Material 3 theme colors.
* Use `LinearProgressIndicator` or an equivalent Material progress component.
* Use a calm success treatment when the goal is reached.
* Do not use celebratory overlays, sounds, badges, streak indicators, share prompts, or additional navigation.
* Do not introduce decorative gradients, illustrations, or extra nested cards.

---

## Accessibility Requirements

* Weekly goal title, progress text, selected goal, and status message must be visible as text.
* Progress must not rely on color alone; numeric text must communicate the same state.
* Touch targets in the surrounding home screen must remain unchanged.
* The progress summary must remain readable with larger system text sizes where practical.

---

## Out Of Scope

* Editing the weekly goal after onboarding.
* Streaks.
* Consistency recovery or missed-week encouragement.
* Additional XP awards for weekly goal completion.
* Badges.
* Share cards.
* Weekly history or summaries.
* New navigation.
* Backend, login, cloud sync, analytics SDK, social graph, public ranking, or external services.

---

## Implementation Handoff

Suggested home summary data:

| Field | Example |
| ----- | ------- |
| Title | `Weekly Goal` |
| Completed count | `1` |
| Weekly goal | `3` |
| Progress text | `1 / 3 workouts complete` |
| Goal text | `Goal: 3 workouts this week` |
| Progress value | `0.33` |
| Status message | `2 workouts to go this week.` |
| Complete state | `false` |

Recommended layout order:

1. Title.
2. Progress indicator.
3. Progress text.
4. Goal text.
5. Status message.

---

## Agent Handoff

Current Agent:

```text
UX Designer
```

Completed Output:

```text
user_stories/RL-0008/RL-0008_UX_SPEC.md
```

Next Agent:

```text
Code Writer
```

Next Prompt:

```text
/Users/jounghwapak/Developer/AI_Agents/prompts/code_writer.md
```

Required Input Files:

* docs/PRODUCT_BRIEF.md
* docs/PROJECT_CONTEXT.md
* docs/ARCHITECTURE.md
* docs/EPIC_USER_STORY_TASKS.md
* docs/SPRINT_PLAN.md
* user_stories/RL-0008/RL-0008_TASKS.md
* user_stories/RL-0008/RL-0008_SPRINT_PLAN.md
* user_stories/RL-0008/RL-0008_INTERPRETATION.md
* user_stories/RL-0008/RL-0008_UX_SPEC.md

Expected Output:

```text
user_stories/RL-0008/RL-0008_IMPLEMENTATION_NOTES.md
```

Instructions:

* Complete RL-0008-T03, RL-0008-T04, and RL-0008-T05.
* Implement weekly goal progress calculation and home-screen display only.
* Preserve existing onboarding, workout logging, completion, XP, and level behavior.
* Add focused tests for weekly goal calculation, visible progress, restart persistence, and toggle updates.
