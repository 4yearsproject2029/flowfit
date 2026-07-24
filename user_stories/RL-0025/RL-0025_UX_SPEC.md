# RL-0025 UX Specification

## Document Metadata

Story ID:

```text
RL-0025
```

Epic:

```text
EP-14 Planned Session Detail And Start Today
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

1. user_stories/RL-0025/RL-0025_SPRINT_PLAN.md
2. docs/PRODUCT_BRIEF.md
3. docs/PROJECT_CONTEXT.md
4. docs/EPIC_USER_STORY_TASKS.md

---

## Workflow Validation

Read:

```text
user_stories/RL-0025/RL-0025_SPRINT_PLAN.md
```

Locate:

```text
UX Required: Yes
```

Rules:

* UX Required is Yes, so this UX specification is required before interpretation and code.

---

## UX Trigger Reason

Selected Reason:

```text
RL-0025 introduces planned-session detail navigation from Week and a Start Today handoff into Current Workout using design/approved/08_workout_detail.png.
```

---

## User Goal

Users want to inspect a planned session before starting it, confirm the exercises and targets, and then enter Current Workout without turning the planned detail view into History review or an editing surface.

---

## User Flow

```text
Week
-> Tap saved planned session preview
-> Planned Session Detail opens
-> Review session title, date, exercises, sets/reps/weight, and notes
-> Tap Start Today or Start Workout
-> Current Workout opens with the saved local session
-> Back navigation can return to planned detail and Week
```

---

## Entry Points

* Saved session preview card on Week.

---

## Exit Points

* Back returns to Week.
* Start Today or Start Workout opens Current Workout for the planned session.

---

## Screen Placement

```text
1. Back affordance and Session Detail title
2. Session summary card with plan context and selected date
3. Lightweight session metrics
4. Movement list with saved exercises and local targets
5. Primary Start Today or Start Workout action
```

---

## Components

| Component | Purpose | Priority |
| --------- | ------- | -------- |
| Detail header | Names the planned detail screen and provides back navigation. | Primary |
| Session summary card | Shows session title, selected date, and planning context. | Primary |
| Metrics row | Shows duration estimate, exercise count, and focus level from local data. | Secondary |
| Movement list | Shows saved exercises, sets, reps, weight, and notes. | Primary |
| Start action | Hands off the saved plan to Current Workout. | Primary |

---

## Interaction Patterns

* Tapping a saved Week session preview opens Planned Session Detail.
* Tapping back returns to Week without changing local data.
* Tapping Start Today or Start Workout opens Current Workout using the existing saved workout logs.
* Detail rows are read-only in RL-0025.
* No completed History detail route is introduced.

---

## Feedback Mechanisms

* Success: Current Workout opens and displays the planned session.
* Failure: if detail is opened without exercises, show an empty message and no start action.
* Progress: exercise count and duration estimate set expectations before starting.
* Achievements: not required for this story.

---

## Empty States

| Scenario | Message | Action |
| -------- | ------- | ------ |
| Planned detail receives no exercises | No exercises planned | Return to Week |

---

## Error States

| Scenario | Message | Recovery Action |
| -------- | ------- | --------------- |
| Planned session data unavailable | No exercises planned | Return to Week |

---

## Loading States

```text
Not required for MVP.
```

---

## Accessibility Considerations

* Back and Start controls must be at least 44px tall.
* Movement rows must keep exercise names readable on common iPhone widths.
* Start action label must be descriptive.
* The screen must not rely on color alone for key state.

---

## Analytics Recommendations

```text
Not required for MVP.
```

---

## Out Of Scope

* Completed History detail.
* History list.
* Editing exercises inside planned detail.
* Creating duplicate completed records.
* Share cards, rewards, summary behavior, templates, recurring planning, backend, login, cloud sync, or external integrations.

---

## Open Questions

```text
No blocker questions. RL-0026 and RL-0027 own History and completed Workout Detail behavior.
```

---

## Related Documents

* docs/PRODUCT_BRIEF.md
* docs/PROJECT_CONTEXT.md
* docs/ARCHITECTURE.md
* docs/EPIC_USER_STORY_TASKS.md
* user_stories/RL-0025/RL-0025_SPRINT_PLAN.md
* design/approved/08_workout_detail.png

---

## Revision History

| Version | Date | Author | Summary |
| ------- | ---- | ------ | ------- |
| v1.0 | 2026-07-24 | UX Designer Agent | Initial approved UX spec for planned session detail and Start Today. |

---

## Agent Handoff

Current Agent:

```text
UX Designer Agent
```

Completed Output:

```text
user_stories/RL-0025/RL-0025_UX_SPEC.md
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
- user_stories/RL-0025/RL-0025_SPRINT_PLAN.md

Optional Input Files:

- user_stories/RL-0025/RL-0025_TASKS.md
- user_stories/RL-0025/RL-0025_UX_SPEC.md

Expected Output:

- user_stories/RL-0025/RL-0025_INTERPRETATION.md

Blocking Conditions:

- Stop if UX Required is Yes and this UX spec is missing.

Instructions:

- Interpret planned-session detail and Start Today without adding completed History detail behavior.
