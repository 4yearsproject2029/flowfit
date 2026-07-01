# RL-0011 UX Specification

## Document Metadata

Story ID:

```text
RL-0011
```

Epic:

```text
EP-08 Privacy
```

Created Date:

```text
2026-07-01
```

Last Updated:

```text
2026-07-01
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

## Source Of Truth

Priority order when conflicts exist:

1. user_stories/RL-0011/RL-0011_SPRINT_PLAN.md
2. user_stories/RL-0011/RL-0011_INTERPRETATION.md
3. docs/EPIC_USER_STORY_TASKS.md
4. docs/PRODUCT_BRIEF.md
5. user_stories/RL-0010/RL-0010_UX_SPEC.md

---

## UX Trigger Reason

Selected Reason:

```text
RL-0011 changes user-facing share-card privacy controls and requires explicit opt-in behavior in the preview flow.
```

---

## User Goal

Users want confidence that a share card will not expose embarrassing workout numbers unless they deliberately choose to show supported performance metrics.

---

## User Flow

Default workout card:

```text
Home Screen
→ User taps Workout in Share cards
→ Preview sheet opens
→ Card shows privacy-safe default content
→ Performance metrics are hidden
→ User taps Generate
→ Generated confirmation appears
```

Opt-in workout card:

```text
Home Screen
→ User taps Workout in Share cards
→ Preview sheet opens
→ User enables Show workout metrics
→ Preview updates to include supported sets, reps, or weight when available
→ Preference saves locally
→ User taps Generate
```

Level and weekly cards:

```text
Home Screen
→ User taps Level or Weekly
→ Preview sheet opens
→ Card remains consistency-focused
→ No workout performance toggle appears
→ User taps Generate
```

---

## Screen Placement

Keep RL-0010 placement:

```text
Share cards section remains below progress/recovery summaries and above the selected-date workout list.
```

Do not add a new screen, tab, dashboard, onboarding step, or settings page for RL-0011.

---

## Components

| Component | Purpose | Priority |
| --------- | ------- | -------- |
| Share card preview sheet | Existing preview and Generate surface. | Primary |
| Metric opt-in checkbox | Lets users explicitly show supported workout metrics. | Primary |
| Privacy helper text | Explains hidden-by-default behavior compactly. | Secondary |
| Updated card preview | Reflects selected visibility before Generate. | Primary |

---

## Interaction Patterns

* The opt-in control appears only for workout cards.
* The control uses a checkbox with the label `Show workout metrics`.
* Default state is unchecked unless a saved local preference exists.
* Checking the box immediately updates the visible preview.
* Unchecking the box immediately hides supported metrics again.
* Generate remains the only primary action.
* Close remains available through the existing close icon.
* No card opens, generates, shares, or publishes automatically.

---

## Copy

Privacy helper text:

```text
Performance numbers are hidden by default.
```

Opt-in checkbox label:

```text
Show workout metrics
```

Opt-in helper text:

```text
Adds sets, reps, or weight when available.
```

Generated confirmation:

```text
Use the existing RL-0010 confirmation labels.
```

---

## Card Content Rules

Default workout card:

```text
RepLog
Workout Complete
Showed up today.
{{workoutName}} - {{dateLabel}}
```

Opt-in workout card may add:

```text
{{sets}} sets
{{reps}} reps
{{weight}} kg
```

Level card remains:

```text
RepLog
Level {{currentLevel}}
Building the habit.
{{progressLabel}}
```

Weekly goal card remains:

```text
RepLog
Weekly Goal Complete
Consistency unlocked.
{{completedWorkouts}} / {{weeklyGoal}} workouts this week
```

Never show in RL-0011:

* Memo text.
* Calories.
* PRs.
* Rankings.
* Public comparison language.

---

## Empty And Edge States

| Scenario | UX |
| -------- | -- |
| Workout has no sets, reps, or weight | The checkbox may remain available, but the card adds no extra metric line. |
| User disables saved opt-in | The preview removes supported metrics and saves the off preference. |
| Level or weekly card opens | No metric checkbox appears. |
| User closes preview without generating | Preference changes may persist, but no card is generated or shared. |

---

## Visual Design

* Keep the existing RL-0010 4:5 card preview.
* Keep the privacy control in the preview sheet, below the card and privacy helper text, above Generate.
* Use a standard checkbox list tile or compact checkbox row.
* Keep the layout compact enough for small iPhone-sized screens and scrollable inside the existing bottom sheet.
* Do not use decorative cards, social counters, ranking badges, or public sharing affordances.

---

## Accessibility

* Checkbox label must be text-visible.
* Tap target should remain comfortably tappable.
* Preview sheet remains scrollable.
* Text should not overlap card content or controls on small phone viewports.

---

## Out Of Scope

* Native share-sheet export.
* New settings screen.
* Theme, template, layout, avatar, or seasonal customization.
* Public feed, likes, comments, followers, ranking, or social graph.
* Backend, login, cloud sync, analytics SDK, or remote storage.
