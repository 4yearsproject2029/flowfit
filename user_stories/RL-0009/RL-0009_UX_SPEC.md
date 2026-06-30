# RL-0009 UX Specification

## Document Metadata

Story ID:

```text
RL-0009
```

Epic:

```text
EP-06 Consistency Recovery
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
Ready for Implementation
```

---

## Source Of Truth

Priority order when conflicts exist:

1. user_stories/RL-0009/RL-0009_SPRINT_PLAN.md
2. docs/PRODUCT_BRIEF.md
3. docs/PROJECT_CONTEXT.md
4. docs/EPIC_USER_STORY_TASKS.md

---

## Workflow Validation

Read:

```text
user_stories/RL-0009/RL-0009_SPRINT_PLAN.md
```

Locate:

```text
UX Required:
```

Result:

```text
UX is required by docs/EPIC_USER_STORY_TASKS.md for RL-0009 and by the current sprint handoff.
```

---

## UX Trigger Reason

Selected Reason:

```text
RL-0009 introduces new recovery messaging and planned-rest behavior in the home experience. UX is required to keep the language encouraging, private, and non-punitive.
```

---

## User Goal

Users want to return after missing workouts without feeling judged. They need reassurance that RepLog still recognizes their previous effort, preserves XP and levels, and treats planned rest as a normal part of sustainable consistency.

---

## User Flow

```text
Home Screen
→ User returns after a missed completed week
→ Recovery summary appears near progress summaries
→ User sees encouraging message and preserved-progress reassurance
→ User logs or completes a workout
→ Recovery state remains supportive and private
```

Planned rest flow:

```text
Home Screen
→ User marks the current selected date as planned rest
→ App confirms rest is planned
→ Planned rest does not count as a failure state
→ User can continue normal logging later
```

---

## Entry Points

* Home screen after opening the app.
* Home screen after completing a workout during a return week.
* Home screen after selecting a date in the weekly calendar.

---

## Exit Points

* User continues to the selected-date workout list.
* User adds or completes a workout.
* User marks the selected date as planned rest.
* User dismisses no additional screen because recovery appears inline.

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
7. Selected-date workout list
```

The recovery summary should appear below the weekly goal progress summary and above the selected-date workout list. Do not create a new recovery screen, modal, tab, onboarding step, notification, or dashboard.

---

## Components

| Component | Purpose | Priority |
| --------- | ------- | -------- |
| Recovery summary card | Shows encouragement when the user returns after a missed week. | Primary |
| Preserved-progress reassurance text | Confirms XP and level are still safe. | Primary |
| Planned rest action | Lets the user mark selected rest without treating it as failure. | Secondary |
| Planned rest state text | Shows that planned rest is neutral and private. | Secondary |

---

## Interaction Patterns

* Recovery messaging appears automatically only when return-after-missed-week is detected.
* Recovery messaging is inline and non-blocking.
* The recovery card does not require dismissal to continue logging.
* The planned-rest action applies to the selected date from the weekly calendar.
* The planned-rest action should be a secondary text or outlined button, not a primary call to action.
* Marking planned rest updates the selected date's recovery state immediately.
* Planned rest can be shown as a neutral selected-date state without adding a full scheduling flow.
* The primary workout logging flow remains unchanged.

---

## Feedback Mechanisms

Success:

* Return message title: `Welcome back`
* Return body: `Your XP and level are still here. Pick up with one workout when you are ready.`
* Planned rest confirmation: `Planned rest saved for this day. Rest counts as part of staying consistent.`

Progress:

* Continue using the existing XP, level, and weekly goal summaries.
* Do not add a streak counter or recovery score.

Achievements:

* No new achievement animation, badge, share prompt, or XP reward is introduced in this story.

Failure:

* Do not display failure language for missed weeks or planned rest.

---

## Empty States

| Scenario | Message | Action |
| -------- | ------- | ------ |
| No missed-week return detected | No recovery summary is shown. | None |
| Selected date has no workouts and no planned rest | Keep existing selected-date empty state. | User may add workout or mark planned rest. |
| Selected date is planned rest | `Planned rest day` and `Rest counts as part of staying consistent.` | User may add a workout later if plans change. |

---

## Error States

| Scenario | Message | Recovery Action |
| -------- | ------- | --------------- |
| Planned rest cannot be saved locally | `Planned rest could not be saved. Try again.` | Keep the planned-rest action available. |
| Recovery state cannot be read | Do not show recovery summary. | Preserve normal home screen behavior. |
| Workout date is invalid for recovery calculation | Do not show an error to the user. | Ignore invalid log for recovery calculation. |

---

## Loading States

```text
Not required for MVP.
```

Recovery state is local and should resolve with the existing home-screen data load.

---

## Accessibility Considerations

* Recovery title, reassurance text, planned-rest state, and planned-rest action must be visible as text.
* Do not communicate recovery or planned rest with color alone.
* Planned-rest action must preserve a minimum 44px touch target.
* Recovery card text should use existing Material text styles and remain readable on common iPhone widths.
* The recovery card must not interrupt screen-reader navigation with modal behavior.
* Avoid shame-oriented phrasing such as `failed`, `missed again`, `behind`, `lost`, or `broken streak`.

---

## Analytics Recommendations

| Event | Trigger | Purpose |
| ----- | ------- | ------- |
| return_after_missed_week_detected | Local recovery logic detects a return week. | Support RL-0012 local MVP validation metrics. |
| planned_rest_saved | User marks selected date as planned rest. | Exclude planned rest from failure-style recovery logic. |

These are local metric signals only. Do not add an analytics SDK, backend event, login, cloud sync, or network dependency.

---

## Out Of Scope

* Streak counters.
* Recovery scores.
* XP penalties, XP decay, or XP subtraction.
* Level penalties, level decay, or level reduction.
* Badges.
* Share cards.
* Notifications or reminders.
* A full rest-day planning calendar.
* A recovery dashboard or analytics screen.
* Backend, login, cloud sync, analytics SDK, social graph, public ranking, or external services.
* Any redesign of the existing home screen, workout list, weekly calendar, XP summary, or weekly goal summary.

---

## Open Questions

```text
None.
```

---

## Related Documents

* docs/PRODUCT_BRIEF.md
* docs/PROJECT_CONTEXT.md
* docs/ARCHITECTURE.md
* docs/EPIC_USER_STORY_TASKS.md
* user_stories/RL-0009/RL-0009_SPRINT_PLAN.md
* user_stories/RL-0009/RL-0009_INTERPRETATION.md

---

## Revision History

| Version | Date | Author | Summary |
| ------- | ---- | ------ | ------- |
| v1.0 | 2026-06-30 | UX Designer Agent | Initial recovery messaging and planned-rest UX specification. |

---

## Agent Handoff

Current Agent:

```text
UX Designer
```

Completed Output:

```text
user_stories/RL-0009/RL-0009_UX_SPEC.md
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

- docs/PRODUCT_BRIEF.md
- docs/PROJECT_CONTEXT.md
- docs/ARCHITECTURE.md
- docs/EPIC_USER_STORY_TASKS.md
- docs/SPRINT_PLAN.md
- user_stories/RL-0009/RL-0009_TASKS.md
- user_stories/RL-0009/RL-0009_SPRINT_PLAN.md
- user_stories/RL-0009/RL-0009_INTERPRETATION.md
- user_stories/RL-0009/RL-0009_UX_SPEC.md

Optional Input Files:

- user_stories/RL-0008/RL-0008_RELEASE_NOTE.md
- lib/data/services/weekly_goal_service.dart
- lib/data/services/storage_service.dart
- lib/features/home/screens/home_screen.dart
- test/weekly_goal_service_test.dart
- test/storage_service_test.dart
- test/widget_test.dart

Expected Output:

- user_stories/RL-0009/RL-0009_IMPLEMENTATION_NOTES.md

Blocking Conditions:

- If implementation would require backend, login, cloud sync, analytics SDK, public ranking, or a broad app rewrite.
- If planned rest cannot be implemented locally within the existing home-screen patterns.

Instructions:

- Complete RL-0009-T03, RL-0009-T04, and RL-0009-T05 only.
- Preserve existing onboarding, workout logging, completion, XP, levels, and weekly goal progress behavior.
- Keep recovery behavior local, private, and non-punitive.
- Do not add streak systems, share cards, badges, analytics SDKs, backend services, login, cloud sync, social graph, or public ranking.
