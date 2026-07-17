# RL-0015 UX Specification

## Document Metadata

Story ID:

```text
RL-0015
```

Epic:

```text
EP-12 Guided Workout Flow
```

Created Date:

```text
2026-07-17
```

Last Updated:

```text
2026-07-17
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

1. user_stories/RL-0015/RL-0015_SPRINT_PLAN.md
2. docs/PRODUCT_BRIEF.md
3. docs/PROJECT_CONTEXT.md
4. docs/EPIC_USER_STORY_TASKS.md

---

## Workflow Validation

Read:

```text
user_stories/RL-0015/RL-0015_SPRINT_PLAN.md
```

Locate:

```text
UX Required:
```

Allowed values:

* Yes
* No

Rules:

* If UX Required = No, stop immediately.
* Do not create UX documentation.

---

## UX Trigger Reason

Selected Reason:

```text
RL-0015 introduces the Current Workout screen foundation, a primary workout execution surface that changes the core Workout Flow journey.
```

---

## User Goal

Users starting or resuming today’s workout need a focused execution screen that answers:

```text
What should I do next?
```

RL-0015 should make the active exercise visible, show simple target information, and provide a clear Complete Set placeholder without turning this story into progression, rest, controls, or completion flow.

---

## User Flow

```text
Home Dashboard
→ Start Workout / Resume Workout
→ Current Workout
→ View active exercise, instructions, targets, and progress
→ Tap Complete Set placeholder
→ Stay on Current Workout with lightweight "coming next" feedback
```

---

## Entry Points

* Home Dashboard Today’s Focus primary action.
* Existing local workout log selected from today’s incomplete workout list.

---

## Exit Points

* Back returns to Home Dashboard.
* Complete Set placeholder remains on Current Workout and does not advance progress in RL-0015.

---

## Screen Placement

1. Header with back action and optional session time chip.
2. Screen label: Current Workout.
3. Workout progress title and percent indicator.
4. Progress bar.
5. Active exercise card with local visual placeholder.
6. Exercise name and instruction text.
7. Sets and reps target tiles.
8. One primary Complete Set placeholder action.
9. Deferred controls such as Pause, Adjust, and Skip must not appear in RL-0015.

---

## Components

| Component | Purpose | Priority |
| --------- | ------- | -------- |
| Back action | Returns to Dashboard without changing workout state. | Primary |
| Progress summary | Shows exercise count and percentage based on existing completed logs. | Primary |
| Active exercise card | Shows selected workout name, category, and safe local placeholder visual. | Primary |
| Instruction text | Gives lightweight guidance derived from available local data. | Primary |
| Sets/reps target tiles | Shows existing set and rep targets where available, fallback to not set. | Primary |
| Complete Set placeholder | Establishes the primary action location for RL-0022 without mutating progress. | Primary |

---

## Interaction Patterns

* Tapping Start/Resume on Dashboard navigates to Current Workout.
* Current Workout loads the first incomplete workout log for today; if all are complete, it can show the last workout as the active context.
* Tapping Complete Set shows lightweight feedback that set progression arrives in a later story.
* Back navigation returns to Dashboard.
* No workout completion toggle occurs from Dashboard Start/Resume in RL-0015.

---

## Feedback Mechanisms

* Progress: Current exercise count, percent pill, and progress bar.
* Success: Navigation to Current Workout confirms the workout flow has started.
* Placeholder feedback: Complete Set can show a brief non-blocking message without changing persistence.
* Achievements: Not required for this story.

---

## Empty States

| Scenario | Message | Action |
| -------- | ------- | ------ |
| Current Workout opened without local workout data | No workout is ready yet. | Back to Dashboard |
| Sets or reps are missing | Not set | Continue viewing exercise |

---

## Error States

| Scenario | Message | Recovery Action |
| -------- | ------- | --------------- |
| Workout log no longer exists | This workout is no longer available. | Back to Dashboard |

---

## Loading States

```text
Not required. Current Workout uses already-local Hive data and no network calls.
```

---

## Accessibility Considerations

* Back, Complete Set, and primary navigation controls need touch targets of at least 44px.
* Progress must use text and a bar, not color alone.
* Text should remain readable on common iPhone widths.
* Exercise visual placeholder must not be required for understanding.
* Complete Set placeholder feedback should be visible as text, not only haptic or color.

---

## Analytics Recommendations

```text
Not required for Phase 2. Do not add analytics SDKs.
```

---

## Out Of Scope

* Pause, adjust, skip, multi-set progression, rest handoff, resume state, and completion navigation.
* Rest Timer overlay or cross-screen timer continuity.
* Workout Summary, private sharing, Week planning, History, or Achievement implementation.
* New backend, login, cloud sync, external asset service, external analytics SDK, social graph, public ranking, or broad content system.
* Reopening RL-0014 or redesigning Dashboard.

---

## Open Questions

```text
None. No blocker file required.
```

---

## Related Documents

* docs/PRODUCT_BRIEF.md
* docs/PROJECT_CONTEXT.md
* docs/ARCHITECTURE.md
* docs/EPIC_USER_STORY_TASKS.md
* docs/USER_JOURNEY.md
* docs/SCREEN_STRUCTURE.md
* user_stories/RL-0015/RL-0015_SPRINT_PLAN.md
* user_stories/RL-0021/RL-0021_UX_SPEC.md

---

## Revision History

| Version | Date | Author | Summary |
| ------- | ---- | ------ | ------- |
| v1.0 | 2026-07-17 | UX Designer Agent | Initial Current Workout foundation UX spec. |

---

## Agent Handoff

Current Agent:

```text
UX Designer
```

Completed Output:

```text
user_stories/RL-0015/RL-0015_UX_SPEC.md
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

- `user_stories/RL-0015/RL-0015_SPRINT_PLAN.md`
- `user_stories/RL-0015/RL-0015_UX_SPEC.md`
- `docs/EPIC_USER_STORY_TASKS.md`
- `docs/ARCHITECTURE.md`
- `docs/PROJECT_CONTEXT.md`

Optional Input Files:

- `docs/PRODUCT_BRIEF.md`
- `docs/USER_JOURNEY.md`
- `docs/SCREEN_STRUCTURE.md`
- `user_stories/RL-0021/RL-0021_UX_SPEC.md`

Expected Output:

- `user_stories/RL-0015/RL-0015_INTERPRETATION.md`

Blocking Conditions:

- Stop if Current Workout cannot remain foundation-only.

Instructions:

- Keep RL-0015 separate from RL-0022 and RL-0023.
- Do not implement deferred workout progression or controls.
