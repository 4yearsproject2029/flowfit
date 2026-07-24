# RL-0017 UX Specification

## Document Metadata

Story ID:

```text
RL-0017
```

Epic:

```text
EP-14 Week Planning
```

Created Date:

```text
2026-07-24
```

Last Updated:

```text
2026-07-24
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

1. user_stories/RL-0017/RL-0017_SPRINT_PLAN.md
2. docs/PRODUCT_BRIEF.md
3. docs/PROJECT_CONTEXT.md
4. docs/EPIC_USER_STORY_TASKS.md

---

## Workflow Validation

Read:

```text
user_stories/RL-0017/RL-0017_SPRINT_PLAN.md
```

Locate:

```text
UX Required: Yes
```

Allowed values:

* Yes
* No

Rules:

* UX Required is Yes, so this UX specification is required before interpretation and code.

---

## UX Trigger Reason

Selected Reason:

```text
RL-0017 introduces the Week screen, day navigation, planned-session preview hierarchy, and bottom-navigation destination behavior using design/approved/05_weekly_plan.png.
```

---

## User Goal

Users want a planning-first view of the current week so they can see which day they are planning, what local workout is scheduled for that day, and whether they need to add a plan without confusing Week with Dashboard or History.

---

## User Flow

```text
Home bottom navigation
-> Week tab
-> Select day in current week
-> View planned session, planned rest, or empty state
-> Open existing planning flow only when planning or adjustment is needed
-> Return to Week with refreshed local data
```

---

## Entry Points

* Bottom navigation Week item from Home.
* Return from the existing Workout Plan Builder after saving or canceling.

---

## Exit Points

* Home bottom navigation item returns to Dashboard.
* Plan or Reschedule action opens the existing Workout Plan Builder for the selected date.
* Future session preview entry can later route to RL-0025 Planned Session Detail.

---

## Screen Placement

```text
1. Header with Week identity and current week range
2. Horizontal day selector for the active local week
3. Selected-day plan section
4. Planned session preview or empty/rest state
5. Existing planning action
6. Lightweight suggestions
7. Bottom navigation with Week selected
```

---

## Components

| Component | Purpose | Priority |
| --------- | ------- | -------- |
| Week header | Names the destination and week range. | Primary |
| Day selector | Allows local current-week day navigation. | Primary |
| Plan card | Shows selected-day planned session title, duration estimate, exercise count, and preview rows. | Primary |
| Plan action | Opens existing planning behavior for the selected date. | Primary |
| Empty state | Explains when no workout is planned and offers planning action. | Primary |
| Planned rest state | Shows selected day as recovery without treating it as history. | Secondary |
| Suggestions row | Provides static recovery/mobility suggestions without persistence or advanced planning behavior. | Secondary |
| Bottom navigation | Preserves primary app navigation with Week selected. | Primary |

---

## Interaction Patterns

* Tapping a day updates the selected date and refreshes local planned session data.
* Tapping Plan Workout on an empty day opens the existing Workout Plan Builder for the selected date.
* Tapping Reschedule or Adjust Plan on a day with a saved session reuses the existing Workout Plan Builder for the selected date.
* Tapping the session preview does not open detail in RL-0017; RL-0025 owns planned/session detail and Start Today.
* Week bottom navigation is visually selected; Home returns to Dashboard.
* History and Achievement items may remain disabled placeholders until their owning stories implement them.

---

## Feedback Mechanisms

* Success: returning from Workout Plan Builder refreshes the selected-day plan.
* Failure: if no local plan exists, Week shows a clear empty state.
* Progress: planned session preview shows exercise count and estimated duration from available local data.
* Achievements: not required for this story.

---

## Empty States

| Scenario | Message | Action |
| -------- | ------- | ------ |
| No session for selected day | No workout planned | Plan Workout |
| Selected day marked planned rest | Planned rest day | Adjust Plan |

---

## Error States

| Scenario | Message | Recovery Action |
| -------- | ------- | --------------- |
| Local session data unavailable | No workout planned | Plan Workout |

---

## Loading States

```text
Not required for MVP.
```

---

## Accessibility Considerations

* Day selector controls must be at least 44px tall.
* Selected day must use text, contrast, and shape, not color alone.
* Action buttons must use descriptive labels.
* Preview rows must avoid truncating exercise names on common iPhone widths.
* Navigation behavior must be predictable and reversible.

---

## Analytics Recommendations

```text
Not required for MVP.
```

---

## Out Of Scope

* Planned Session Detail and Start Today behavior.
* History list and completed Workout Detail.
* Inline editing inside Week.
* Drag-and-drop sorting, rescheduling systems, templates, recurring plans, new autosave behavior, backend, login, cloud sync, and external integrations.
* New achievement, reward, or share behavior.

---

## Open Questions

```text
No blocker questions. RL-0025, RL-0026, and RL-0027 own deferred detail/history behavior.
```

---

## Related Documents

* docs/PRODUCT_BRIEF.md
* docs/PROJECT_CONTEXT.md
* docs/ARCHITECTURE.md
* docs/EPIC_USER_STORY_TASKS.md
* user_stories/RL-0017/RL-0017_SPRINT_PLAN.md
* design/approved/05_weekly_plan.png

---

## Revision History

| Version | Date | Author | Summary |
| ------- | ---- | ------ | ------- |
| v1.0 | 2026-07-24 | UX Designer Agent | Initial approved UX spec for Week planning. |

---

## Agent Handoff

Current Agent:

```text
UX Designer Agent
```

Completed Output:

```text
user_stories/RL-0017/RL-0017_UX_SPEC.md
```

Next Agent:

```text
User Story Interpreter
```

Next Prompt:

```text
/Users/jounghwapak/Developer/AI_Agents/prompts/interpret_user_story.md
```

Required Input Files:

- docs/PROJECT_CONTEXT.md
- docs/ARCHITECTURE.md
- docs/EPIC_USER_STORY_TASKS.md
- user_stories/RL-0017/RL-0017_SPRINT_PLAN.md

Optional Input Files:

- user_stories/RL-0017/RL-0017_TASKS.md
- user_stories/RL-0017/RL-0017_UX_SPEC.md

Expected Output:

- user_stories/RL-0017/RL-0017_INTERPRETATION.md

Blocking Conditions:

- Stop if UX Required is Yes and this UX spec is missing.

Instructions:

- Interpret RL-0017 without expanding Week into planned detail, Start Today, History, or completed Workout Detail behavior.
