# RL-0024 UX Specification

## Document Metadata

Story ID:

```text id="w3f9zk"
RL-0024
```

Epic:

```text id="n7q2mp"
EP-13 Workout Summary Private Details And Sharing
```

Created Date:

```text id="a8v4tc"
2026-07-20
```

Last Updated:

```text id="r5m2v8"
2026-07-20
```

Created By:

```text id="f6m1qw"
UX Designer Agent
```

Status:

```text id="x4q8n6"
Approved
```

---

## Source Of Truth

Priority order when conflicts exist:

1. user_stories/RL-0024/RL-0024_SPRINT_PLAN.md
2. docs/PRODUCT_BRIEF.md
3. docs/PROJECT_CONTEXT.md
4. docs/EPIC_USER_STORY_TASKS.md


---

## Workflow Validation

Read:

```text id="c8v3p1"
user_stories/RL-0024/RL-0024_SPRINT_PLAN.md
```

Locate:

```text id="m7q5r2"
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

Document why UX work is required.

Examples:

* New screen introduced
* Navigation behavior changed
* Complex interaction flow
* Accessibility-sensitive workflow
* Explicit stakeholder request

Selected Reason:

```text id="j4x7m9"
RL-0024 changes Workout Summary interactions, privacy-sensitive detail placement, optional share-card entry behavior, Plan Tomorrow navigation, Back to Dashboard behavior, and Summary/History separation.
```

---

## User Goal

Describe:

* User objective
* User motivation
* User value received

Example:

```text id="r9p6xy"
Users want the just-completed workout to feel meaningful, reviewable, and optionally shareable without exposing performance details unexpectedly.
```

---

## User Flow

Format:

```text id="y5d8kn"
Current Workout
→ Final set completed
→ Workout Summary opens immediately
→ User sees celebration and reward progress
→ User reviews private session details
→ User optionally opens a share-card preview
→ User chooses Plan Tomorrow or Back to Dashboard
```

Example:

```text id="x1v7mh"
Current Workout
→ Complete final planned set
→ Workout Summary
→ Private session details remain on device
→ Optional share preview hides performance metrics by default
→ Plan Tomorrow opens planning flow or Back to Dashboard returns home
```

---

## Entry Points

* Completion of the final planned set from Current Workout.

---

## Exit Points

* Plan Tomorrow.
* Back to Dashboard.
* Back navigation toward the active completion flow.

---

## Screen Placement

Document information hierarchy.

Example:

```text id="u2m8cr"
1. Celebration headline and recognition copy
2. Reward or achievement card with optional share affordance
3. Private session snapshot
4. Moment of the day or notable session detail when locally available
5. Plan Tomorrow primary action
6. Back to Dashboard secondary action
```

---

## Components

| Component | Purpose | Priority            |
| --------- | ------- | ------------------- |
| Celebration headline | Preserve the immediate emotional reward created by RL-0016. | Primary |
| Reward or achievement card | Show XP, level, weekly goal, or achievement progress using local data. | Primary |
| Optional share entry | Let users open a share-card preview only when they choose to celebrate. | Secondary |
| Private session snapshot | Show locally available private details such as duration, volume, calories, sets, or moment of day. | Secondary |
| Moment of the day | Highlight one meaningful local detail when available without creating public ranking or pressure. | Secondary |
| Plan Tomorrow button | Move from completion celebration into lightweight planning. | Primary |
| Back to Dashboard button | Return users to the daily overview after completion. | Primary |

---

## Interaction Patterns

Document:

* Tap behavior
* Navigation behavior
* Gesture behavior
* State transitions

Examples:

* Tapping the optional share entry opens a preview; it must not publish, export, or record a generated card until the user explicitly confirms generation.
* Share preview keeps existing privacy defaults: performance metrics stay hidden unless the user explicitly opts in through the existing control.
* Tapping Plan Tomorrow exits the completion celebration and opens the planning path for the next appropriate workout date where existing app flow supports it.
* Tapping Back to Dashboard returns to Home Dashboard and must not reopen Summary from History.
* History must not expose a route to this celebration Summary state.
* Private details remain visible only inside the immediate completion summary.

---

## Feedback Mechanisms


* Success: completion headline and reward card confirm the workout is finished.
* Progress: weekly goal, XP, level, or achievement progress uses existing local data where available.
* Achievements: achievement language should celebrate consistency, not performance comparison.
* Sharing: share-card preview confirms privacy defaults before generation.
* Navigation: Plan Tomorrow and Back to Dashboard should feel like deliberate completion exits, not accidental dismissal.

---

## Empty States

| Scenario | Message | Action |
| -------- | ------- | ------ |
| No private session detail is locally available | You showed up today. | Keep celebration, reward progress, Plan Tomorrow, and Back to Dashboard visible. |
| No share card can be generated | Share cards are available after a completed workout. | Keep private details and return actions visible. |
| Planning date cannot be inferred | Plan your next workout from the Dashboard. | Back to Dashboard. |

---

## Error States

| Scenario | Message | Recovery Action |
| -------- | ------- | --------------- |
| Share preview cannot be opened | Share preview is not available right now. | Keep the user on Workout Summary. |
| Plan Tomorrow cannot open planning flow | You can plan from the Dashboard. | Return to Dashboard. |
| Reward details are unavailable | You showed up today. | Continue showing completion and return actions. |

---

## Loading States

Document:

* Loading indicators
* Disabled states
* Retry behavior

If not required:

```text id="m4q8zu"
Not required for MVP. The summary should use locally available data and avoid network-dependent loading.
```

---

## Accessibility Considerations

Verify:

* Font sizes are readable.
* Color contrast is sufficient.
* Touch targets are at least 44px.
* Labels are descriptive.
* Navigation is predictable.

Avoid:

* Color-only communication
* Hidden interactions
* Small touch targets

Additional RL-0024 checks:

* Plan Tomorrow and Back to Dashboard must have clear text labels.
* Share entry must be labeled as optional and user-initiated.
* Private detail tiles must remain readable on compact iPhone widths.
* The screen must scroll rather than overlap when private details and share preview entry are present.

---

## Analytics Recommendations

Optional.

| Event | Trigger | Purpose |
| ----- | ------- | ------- |
| Not required | Not required | Not required for MVP. |

If analytics are not required:

```text id="h9r5xp"
Not required for MVP.
```

---

## Out Of Scope

Document explicitly excluded items.

Examples:

* Future stories
* Advanced customization
* Unapproved navigation changes
* New gamification features

RL-0024 exclusions:

* Reopening Workout Summary from History.
* Publishing share cards automatically.
* Changing existing share-card privacy defaults.
* New backend, login, cloud sync, social graph, public profiles, leaderboards, or ranking.
* New achievement engine or milestone catalog.
* Editing completed history records.
* Broad redesign of Workout Summary beyond the approved `design/approved/04_workkout_summary.png` responsibility.

---

## Open Questions

Questions requiring stakeholder input.


```text id="f2x6r9"
None. Continue to User Story Interpreter.
```

---

## Related Documents

* docs/PRODUCT_BRIEF.md
* docs/PROJECT_CONTEXT.md
* docs/ARCHITECTURE.md
* docs/EPIC_USER_STORY_TASKS.md
* docs/USER_JOURNEY.md
* user_stories/RL-0024/RL-0024_SPRINT_PLAN.md
* user_stories/RL-0024/RL-0024_TASKS.md
* user_stories/RL-0016/RL-0016_UX_SPEC.md
* design/approved/04_workkout_summary.png

---

## Revision History

| Version | Date       | Author            | Summary       |
| ------- | ---------- | ----------------- | ------------- |
| v1.0    | 2026-07-20 | UX Designer Agent | Initial approved UX spec for Workout Summary private details and sharing. |

---

## Agent Handoff

Current Agent:

```text
UX Designer
```

Completed Output:

```text
user_stories/RL-0024/RL-0024_UX_SPEC.md
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

- docs/PRODUCT_BRIEF.md
- docs/PROJECT_CONTEXT.md
- docs/ARCHITECTURE.md
- docs/EPIC_USER_STORY_TASKS.md
- docs/USER_JOURNEY.md
- user_stories/RL-0024/RL-0024_TASKS.md
- user_stories/RL-0024/RL-0024_SPRINT_PLAN.md
- user_stories/RL-0024/RL-0024_UX_SPEC.md
- user_stories/RL-0016/RL-0016_UX_SPEC.md
- design/approved/04_workkout_summary.png

Optional Input Files:

- Existing Workout Summary implementation files.
- Existing share-card implementation files.

Expected Output:

- user_stories/RL-0024/RL-0024_INTERPRETATION.md

Blocking Conditions:

- Stop if requirements conflict with Summary-only availability.
- Stop if implementation interpretation would require changing share-card privacy defaults.

Instructions:

- Interpret RL-0024 without expanding scope beyond the accepted backlog criteria.
- Preserve the rule that History cannot reopen the celebration Summary state.
- Preserve user-initiated sharing and hidden-by-default performance metrics.
