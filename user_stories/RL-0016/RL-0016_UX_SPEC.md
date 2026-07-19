# RL-0016 UX Specification

## Document Metadata

Story ID:

```text
RL-0016
```

Epic:

```text
EP-13 Completion Celebration
```

Created Date:

```text
2026-07-19
```

Last Updated:

```text
2026-07-19
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

1. user_stories/RL-0016/RL-0016_SPRINT_PLAN.md
2. docs/PRODUCT_BRIEF.md
3. docs/PROJECT_CONTEXT.md
4. docs/EPIC_USER_STORY_TASKS.md

---

## Workflow Validation

Read:

```text
user_stories/RL-0016/RL-0016_SPRINT_PLAN.md
```

Locate:

```text
UX Required:
```

Allowed values:

* Yes
* No

Rules:

* UX Required = Yes.
* UX documentation is required for this story.

---

## UX Trigger Reason

Selected Reason:

```text
RL-0016 introduces the Workout Summary screen and changes the primary Current Workout completion navigation.
```

---

## User Goal

Users want the moment after completing a workout to feel recognized, motivating, and finished before returning to the Dashboard.

---

## User Flow

```text
Current Workout
-> Final planned set completed
-> Workout completion persists through existing local completion behavior
-> Workout Summary opens immediately
-> User sees celebration headline and reward/progress signals
-> User returns to Dashboard
```

---

## Entry Points

* Completion of the final planned set from Current Workout.

---

## Exit Points

* Back to Dashboard.

---

## Screen Placement

1. Celebration headline and recognition copy.
2. Reward/progress card using locally available XP, level, weekly goal, or recovery information.
3. Session snapshot using non-private lightweight counts available from the completed session.
4. Back to Dashboard action.

---

## Components

| Component | Purpose | Priority |
| --------- | ------- | -------- |
| Celebration headline | Make completion feel meaningful immediately | Primary |
| Recognition copy | Reinforce consistency rather than performance | Primary |
| Reward card | Show XP/level/weekly-goal/recovery progress where local data makes it relevant | Primary |
| Session snapshot | Summarize completed exercise and set counts without adding private detail scope | Secondary |
| Back to Dashboard button | Return to the daily overview after recognition | Primary |

---

## Interaction Patterns

* Completing the final set automatically opens Workout Summary after existing completion persistence completes.
* The summary is pushed from Current Workout only; History must not expose a route back into this celebration state.
* Back navigation and the Back to Dashboard action both return users toward the existing app flow without creating a completed History detail.
* Summary controls remain simple; sharing, Plan Tomorrow, and detailed return actions are deferred to RL-0024.

---

## Feedback Mechanisms

* Success: a celebration headline confirms the workout is complete.
* Progress: level and weekly goal text reflect current local state.
* Achievements: the reward card uses existing XP and level data; new unlock logic is not introduced.
* Failure: no summary-specific failure state is required because completion persistence remains owned by existing Current Workout and storage behavior.

---

## Empty States

| Scenario | Message | Action |
| -------- | ------- | ------ |
| Summary receives no workout rows | Today's work is complete. | Back to Dashboard |

---

## Error States

| Scenario | Message | Action |
| -------- | ------- | ------ |
| Local reward details are unavailable | You showed up today. | Back to Dashboard |

---

## Accessibility Notes

* Primary button must use at least a 48 px touch target.
* Text should remain readable on compact iPhone widths.
* Summary content must scroll vertically when needed rather than overlap.
* Icons must supplement text rather than replace essential meaning.

---

## Agent Handoff

Current Agent:

```text
UX Designer
```

Completed Output:

```text
user_stories/RL-0016/RL-0016_UX_SPEC.md
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

- user_stories/RL-0016/RL-0016_SPRINT_PLAN.md
- user_stories/RL-0016/RL-0016_UX_SPEC.md
- docs/PROJECT_CONTEXT.md
- docs/ARCHITECTURE.md
- docs/EPIC_USER_STORY_TASKS.md

Expected Output:

- user_stories/RL-0016/RL-0016_INTERPRETATION.md

Blocking Conditions:

- Stop if the story tries to add private details, share generation, Plan Tomorrow, History detail reopening, or a new achievement engine.
