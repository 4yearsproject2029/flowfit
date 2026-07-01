# RL-0010 UX Specification

## Document Metadata

Story ID:

```text
RL-0010
```

Epic:

```text
EP-07 Share Cards
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

1. user_stories/RL-0010/RL-0010_SPRINT_PLAN.md
2. user_stories/RL-0010/RL-0010_INTERPRETATION.md
3. docs/EPIC_USER_STORY_TASKS.md
4. docs/PRODUCT_BRIEF.md
5. docs/ARCHITECTURE.md

---

## Workflow Validation

Read:

```text
user_stories/RL-0010/RL-0010_INTERPRETATION.md
```

Locate:

```text
UX Required:
```

Result:

```text
UX is required by docs/EPIC_USER_STORY_TASKS.md for RL-0010 and by the current sprint handoff.
```

---

## UX Trigger Reason

Selected Reason:

```text
RL-0010 introduces new user-facing share-card preview and generation surfaces. UX is required to keep the cards celebratory, private by default, optional, and visually clear on mobile.
```

---

## User Goal

Users want a simple way to celebrate consistency without showing numbers that may feel embarrassing. Share cards should make small wins feel worth posting while keeping control in the user's hands.

---

## User Flow

Workout completion card:

```text
Home Screen
→ User has at least one completed workout on the selected date
→ Share cards section shows Workout card action
→ User taps Workout
→ Preview sheet opens
→ User reviews privacy-safe card
→ User taps Generate
→ Generated confirmation appears in the sheet
```

Level card:

```text
Home Screen
→ User has a current level from XP progress
→ Share cards section shows Level card action
→ User taps Level
→ Preview sheet opens
→ User reviews card with level and habit-growth copy
→ User taps Generate
```

Weekly goal card:

```text
Home Screen
→ Current weekly goal is complete
→ Share cards section shows Weekly goal action
→ User taps Weekly
→ Preview sheet opens
→ User reviews card with goal completion copy
→ User taps Generate
```

---

## Entry Points

* Home screen after weekly goal summary.
* Home screen after XP and level summary.
* Home screen after selecting a date with completed workouts.

Do not add a new tab, separate dashboard, onboarding step, notification, or automatic post-completion modal.

---

## Exit Points

* User closes the preview sheet.
* User taps Generate and sees confirmation.
* User returns to normal home-screen logging.

---

## Screen Placement

Information hierarchy:

```text
1. This Week and weekly calendar
2. Local data note
3. Rest Timer
4. Level and XP progress summary
5. Weekly goal progress summary
6. Consistency recovery summary when eligible
7. Share cards section
8. Selected-date workout list
```

The share cards section should sit below progress/recovery summaries and above the selected-date workout list. It should be compact and skippable so it does not compete with logging.

---

## Components

| Component | Purpose | Priority |
| --------- | ------- | -------- |
| Share cards section | Groups the three optional card actions. | Primary |
| Card type segmented/action row | Lets users choose Workout, Level, or Weekly card. | Primary |
| Share card preview sheet | Shows the generated card before final generation. | Primary |
| Share card visual | Displays the privacy-safe card content. | Primary |
| Generate button | Confirms user-initiated card generation. | Primary |
| Unavailable state | Explains why a card type is not currently available. | Secondary |

---

## Interaction Patterns

* All card actions must require a tap.
* Card actions should be secondary outlined buttons or compact chips.
* Unavailable card types should not trigger generation.
* The preview sheet must include an obvious close affordance.
* Generate is the only primary action in the preview sheet.
* Generating a card must not award XP, alter level, complete workouts, complete goals, or publish anything.
* No card should open automatically after workout completion or goal completion.

---

## Card Availability Rules

| Card Type | Available When | Unavailable Text |
| --------- | -------------- | ---------------- |
| Workout | Selected date has at least one completed workout. | Complete a workout on this date to make a card. |
| Level | User has a valid level calculation. | Level card will be ready after XP is loaded. |
| Weekly | Current weekly goal progress is complete. | Reach your weekly goal to make this card. |

---

## Card Content

Workout card:

```text
RepLog
Workout Complete
Showed up today.
Workout: {{workoutName}}
{{dateLabel}}
```

Level card:

```text
RepLog
Level {{currentLevel}}
Building the habit.
{{progressLabel}}
```

Weekly goal card:

```text
RepLog
Weekly Goal Complete
Consistency unlocked.
{{completedWorkouts}} / {{weeklyGoal}} workouts this week
```

Privacy rule:

```text
Never show weight, sets, reps, calories, PRs, or memo text on RL-0010 cards by default.
```

---

## Visual Design

Share cards section:

* Full-width unframed section, not a nested card.
* Section title: `Share cards`
* Short supporting text: `Make a private-by-default card when you want to celebrate.`
* Three compact actions: `Workout`, `Level`, `Weekly`
* Keep text sizes consistent with existing compact home-screen panels.

Card preview:

* Aspect ratio: 4:5.
* Max width: fill sheet width with horizontal padding.
* Border radius: 8px.
* Background: use `primaryContainer` for workout, `secondaryContainer` for level, and `tertiaryContainer` or `surfaceContainerHighest` for weekly goal if available.
* Text hierarchy: small brand label, strong card title, medium message, compact detail line.
* No decorative orbs, complex gradients, ranking visuals, or social counters.

---

## Empty States

| Scenario | UX |
| -------- | -- |
| No completed workout on selected date | Workout action appears disabled or opens an unavailable message. |
| Weekly goal incomplete | Weekly action appears disabled or opens an unavailable message. |
| No XP yet | Level card may show Level 1 if XP is loaded; do not call it a level-up. |
| No weekly goal found | Hide Weekly action or show unavailable state. |

---

## Error States

| Scenario | Message | Recovery Action |
| -------- | ------- | --------------- |
| Card data cannot be prepared | `Card is not ready yet.` | Keep the user on the home screen. |
| Generated preview cannot be shown | `Preview could not be created.` | Let the user close the sheet. |

No network error state is required because RL-0010 is local-only.

---

## Loading States

```text
Not required for MVP.
```

---

## Accessibility Requirements

* All card actions must have readable button labels.
* Card text must not overlap on small iPhone-sized screens.
* Preview sheet content must be scrollable if vertical space is constrained.
* Buttons must use existing Material touch targets.
* Color may support card distinction, but text labels must carry meaning.

---

## Implementation Handoff

### Recommended Placement

Create share-card UI under:

```text
lib/features/share_cards/
```

Recommended files:

```text
lib/features/share_cards/models/share_card_data.dart
lib/features/share_cards/services/share_card_service.dart
lib/features/share_cards/widgets/share_card_preview.dart
lib/features/share_cards/widgets/share_cards_section.dart
```

Home screen should compose the new section instead of owning all card rendering logic inline.

### Data Preparation

The UI needs:

* First completed workout for selected date, or a deterministic selected-date completed workout.
* Current level from `LevelService`.
* Current weekly goal progress from `WeeklyGoalService`.
* Selected date label.

### Generation Definition

For RL-0010, generation means:

```text
The user taps Generate in the preview sheet and receives a generated confirmation for the selected card.
```

Native system share-sheet export is not required by the acceptance criteria and should not be added unless implementation can do so without expanding scope.

---

## QA Checklist

* Workout card is available only when selected date has a completed workout.
* Level card can be generated from current level data.
* Weekly card is available only when current weekly goal is complete.
* Cards hide weight, sets, reps, calories, PRs, and memo by default.
* Cards are generated only after the user taps a card action and then Generate.
* No backend, login, cloud sync, analytics SDK, social feed, public ranking, automatic publishing, likes, comments, or followers are introduced.

---

## Agent Handoff

Current Agent:

```text
UX Designer
```

Completed Output:

```text
user_stories/RL-0010/RL-0010_UX_SPEC.md
```

Next Agent:

```text
Code Writer
```

Next Prompt:

```text
/Users/jounghwapak/Developer/AI_Agents/prompts/generate_code.md
```

Required Input Files:

* docs/EPIC_USER_STORY_TASKS.md
* docs/PRODUCT_BRIEF.md
* docs/PROJECT_CONTEXT.md
* docs/ARCHITECTURE.md
* docs/SPRINT_PLAN.md
* user_stories/RL-0010/RL-0010_TASKS.md
* user_stories/RL-0010/RL-0010_SPRINT_PLAN.md
* user_stories/RL-0010/RL-0010_INTERPRETATION.md
* user_stories/RL-0010/RL-0010_UX_SPEC.md

Expected Output:

```text
user_stories/RL-0010/RL-0010_IMPLEMENTATION_NOTES.md
```

Blocking Conditions:

* None for Code Writer handoff.

Instructions:

* Complete RL-0010-T03, RL-0010-T04, and RL-0010-T05 only.
* Keep card generation optional and user-initiated.
* Hide performance metrics by default.
* Do not add backend, login, cloud sync, analytics SDK, social graph, public ranking, automatic publishing, public feed, likes, comments, followers, or native sharing dependency unless required.
