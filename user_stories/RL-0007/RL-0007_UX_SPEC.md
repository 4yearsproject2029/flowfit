# RL-0007 UX Specification

## Document Metadata

Story ID:

```text
RL-0007
```

Epic:

```text
EP-05 Gamification - Levels
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
Users need to see that completed workouts are building visible long-term progress, not just increasing a raw XP number.
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
-> Selected-date workout list
```

The level display should extend the existing XP summary area. Do not create a separate level screen, modal, onboarding step, navigation item, or celebration surface for this story.

---

## Content Requirements

Before XP is awarded:

```text
Level 1
0 / 100 XP to Level 2
0 XP
Complete a workout to earn 10 XP. XP is awarded once per workout.
```

After one completed workout:

```text
Level 1
10 / 100 XP to Level 2
10 XP
Earned +10 XP for completing Squat.
```

At a level boundary:

```text
Level 2
0 / 100 XP to Level 3
100 XP
Earned +10 XP for completing Squat.
```

---

## Layout Requirements

* Show the current level as the strongest text in the summary.
* Show a horizontal progress indicator below the level label.
* Show progress text near the indicator using the format `X / 100 XP to Level N`.
* Keep total XP visible in the same summary, but secondary to the level.
* Keep the latest XP explanation visible below the progress and total XP.
* Keep the summary full-width with the existing compact card treatment.
* Preserve the existing 8px card radius used by the XP summary.
* Keep text readable on small iPhone widths without awkward wrapping.

---

## Interaction Patterns

* Completing a workout that earns XP updates the level summary immediately.
* Toggling a completed workout back to incomplete does not reduce the level display.
* Deleting a completed workout does not reduce the level display.
* Recreating the same workout identity does not duplicate XP or inflate level progress.
* Restarting the app preserves the same level and progress because it derives from local XP.

---

## Visual Behavior

* Use existing Material 3 theme colors from the current XP summary.
* Use `LinearProgressIndicator` or an equivalent Material progress component.
* Avoid animation requirements for MVP; default Material progress animation is acceptable if present.
* Do not use celebratory overlays, sounds, badges, or share prompts in this story.
* Do not introduce decorative gradients, illustrations, or additional cards.

---

## Accessibility Requirements

* Current level, progress text, total XP, and explanation must be visible as text.
* Progress must not rely on color alone; numeric text must communicate the same state.
* Touch targets in the surrounding home screen must remain unchanged.
* The progress summary must remain readable with larger system text sizes where practical.

---

## Out Of Scope

* Badges.
* Streaks.
* Weekly goal progress.
* Level-up celebration screens or animations.
* Share-card prompts.
* XP history screens.
* New navigation.
* Backend, login, cloud sync, analytics SDK, social graph, public ranking, or external services.

---

## Implementation Handoff

Suggested home summary data:

| Field | Example |
| ----- | ------- |
| Current level | `Level 1` |
| Progress text | `10 / 100 XP to Level 2` |
| Progress value | `0.10` |
| Total XP | `10 XP` |
| Explanation | `Earned +10 XP for completing Squat.` |

Recommended layout order:

1. Current level.
2. Progress indicator.
3. Progress text.
4. Total XP.
5. Latest XP explanation.

---

## Agent Handoff

Current Agent:

```text
UX Designer
```

Completed Output:

```text
user_stories/RL-0007/RL-0007_UX_SPEC.md
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
* user_stories/RL-0007/RL-0007_TASKS.md
* user_stories/RL-0007/RL-0007_SPRINT_PLAN.md
* user_stories/RL-0007/RL-0007_INTERPRETATION.md
* user_stories/RL-0007/RL-0007_UX_SPEC.md

Expected Output:

```text
user_stories/RL-0007/RL-0007_IMPLEMENTATION_NOTES.md
```

Instructions:

* Complete RL-0007-T03, RL-0007-T04, and RL-0007-T05.
* Implement level calculation and home-screen display only.
* Preserve existing workout logging and XP behavior.
* Add focused tests for level calculation, visible progress, and non-decreasing behavior.
