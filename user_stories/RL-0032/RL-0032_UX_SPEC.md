# RL-0032 UX Specification

## Document Metadata

Story ID:

```text
RL-0032
```

Epic:

```text
EP-14 Cross-Screen Rest Timer Continuity
```

Created Date:

```text
2026-07-20
```

Last Updated:

```text
2026-07-20
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

1. user_stories/RL-0032/RL-0032_SPRINT_PLAN.md
2. docs/PRODUCT_BRIEF.md
3. docs/PROJECT_CONTEXT.md
4. docs/EPIC_USER_STORY_TASKS.md

---

## Workflow Validation

Read:

```text
user_stories/RL-0032/RL-0032_SPRINT_PLAN.md
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

Validation result:

```text
UX Required = Yes. UX specification is required and created.
```

---

## UX Trigger Reason

Selected Reason:

```text
RL-0032 changes cross-screen navigation behavior, active rest timer recovery, return-to-workout affordances, and cleanup behavior inside the primary workout flow.
```

---

## User Goal

Users want rest to stay connected to the active workout even if they briefly move away from Current Workout. They should be able to see or recover the active rest state, return to the workout quickly, and trust that the timer will disappear when rest or the workout is finished.

---

## User Flow

```text
Current Workout
→ Rest Starts
→ Rest Timer Overlay Available
→ User Navigates To Home / Week / History / Achievement
→ Active Rest Timer Affordance Remains Visible Or Recoverable
→ User Taps Return To Workout
→ Current Workout Opens At Active Rest State
→ User Skips Rest Or Timer Ends
→ Timer Affordance Clears
→ Workout Flow Continues
```

---

## Entry Points

* Current Workout enters rest state after a completed set or exercise transition.
* User opens the existing RL-0018 Rest Timer overlay from Current Workout.
* User navigates away from Current Workout while active rest is still running.
* User returns from Home, Week, History, or Achievement while active rest is still running.

---

## Exit Points

* User taps the active timer affordance and returns to Current Workout.
* User taps Skip Rest from the timer overlay or active rest state.
* Timer reaches zero and Current Workout becomes ready for the next step.
* Workout completes and transitions to Workout Summary.
* User ends or clears the active workout state through existing workout-flow behavior.

---

## Screen Placement

Information hierarchy for cross-screen timer continuity:

1. Active rest timer status
2. Return to Workout action
3. Remaining time
4. Current or next exercise context when locally available
5. Secondary timer controls only after returning to Current Workout or opening the existing overlay

Placement rules:

* The active timer affordance may appear over other screens, but it must read as workout-flow state, not as that screen's content.
* Home must not gain a Rest Timer section or card.
* Week, History, and Achievement must not become timer-management screens.
* Full timer controls remain in the existing Rest Timer overlay or Current Workout rest state.

---

## Components

| Component | Purpose | Priority |
| --------- | ------- | -------- |
| Active Rest Timer Affordance | Show that rest is still active after navigation and provide quick recovery. | Primary |
| Return to Workout Action | Take the user back to Current Workout at the active rest state. | Primary |
| Remaining Time Label | Communicate timer progress at a glance. | Primary |
| Exercise Context Label | Remind the user what the rest belongs to when locally available. | Secondary |
| Existing Rest Timer Overlay | Preserve RL-0018 countdown, Skip Rest, Extend Rest, close, and return behavior. | Primary |
| Cleanup Feedback | Remove the active affordance when rest or workout ends. | Primary |

---

## Interaction Patterns

* When rest starts, the existing Current Workout rest state remains the source of truth.
* If the user stays in Current Workout, the RL-0018 overlay behavior remains unchanged.
* If the user navigates away during active rest, a compact active timer affordance remains visible or recoverable.
* Tapping the active timer affordance returns to Current Workout at the active rest state.
* The compact affordance should not expose all timer controls if doing so would turn other screens into timer surfaces.
* Skip Rest and Extend Rest remain anchored to Current Workout or the existing Rest Timer overlay.
* If the timer reaches zero away from Current Workout, the affordance should change from countdown urgency to a clear Return to Workout state.
* If rest is skipped, completed, or the workout finishes, the active timer affordance must clear.
* Closing or dismissing the overlay should not end the active rest unless the user explicitly skips or completes rest.
* Navigation should remain predictable: Back behavior should not trap users in a timer state or reopen unrelated screens.

---

## Feedback Mechanisms

* Success: Returning to Current Workout lands on the active rest or next-step state without losing progress.
* Progress: Remaining time is visible or recoverable while the user is away from Current Workout.
* Completion: When rest ends, the affordance indicates the user can return and continue, then clears when the active workout state advances.
* Cleanup: When the workout completes, no timer affordance remains on Workout Summary, History, Week, Dashboard, or Achievement.
* Failure: If active workout state cannot be recovered, show a calm return/recovery message and send the user to the safest available Current Workout state.

---

## Empty States

| Scenario | Message | Action |
| -------- | ------- | ------ |
| No active workout | No timer affordance is shown. | None |
| Active workout without active rest | No rest timer affordance is shown. | Continue normal screen behavior |
| Timer already completed while away | Rest is ready. | Return to Workout |

---

## Error States

| Scenario | Message | Recovery Action |
| -------- | ------- | --------------- |
| Active rest state cannot be recovered | Rest timer needs a refresh. | Return to Current Workout |
| Workout state has ended while timer affordance is visible | Workout is no longer active. | Clear timer affordance and stay on current screen |
| Timer value is unavailable | Return to your workout to continue. | Return to Current Workout |

---

## Loading States

```text
Not required for MVP.
```

The timer affordance should appear, update, or clear without a separate loading screen.

---

## Accessibility Considerations

* Remaining time must be readable on compact iPhone layouts.
* The return-to-workout control must have at least a 44 px touch target.
* The active timer affordance must include text, not only color or animation.
* The affordance must not cover primary navigation controls or primary actions on Home, Week, History, or Achievement.
* Labels should be descriptive: `Rest timer`, `Return to Workout`, `Rest complete`.
* Countdown updates should not create excessive screen-reader noise.
* The visual style should remain consistent with the approved dark Rest Timer overlay and cyan primary action direction.

---

## Analytics Recommendations

```text
Not required for MVP.
```

No external analytics SDK, network event, backend tracking, login, or cloud sync should be introduced.

---

## Out Of Scope

* Standalone timer mode.
* Dashboard Rest Timer card or Dashboard timer section.
* Full timer controls on Week, History, Achievement, or Dashboard.
* Background timer service outside the app.
* App-restart timer persistence unless already supported by existing local active-workout state.
* Cross-device timer sync.
* Backend, login, cloud sync, or external analytics.
* Broad Current Workout state-management rewrite.
* Workout planning edits, History edits, Achievement changes, or Summary changes.
* Phase 2 screen QA and full journey regression QA.

---

## Open Questions

```text
None. No blocker is required.
```

---

## Related Documents

* docs/PRODUCT_BRIEF.md
* docs/PROJECT_CONTEXT.md
* docs/ARCHITECTURE.md
* docs/USER_JOURNEY.md
* docs/EPIC_USER_STORY_TASKS.md
* user_stories/RL-0032/RL-0032_SPRINT_PLAN.md
* user_stories/RL-0032/RL-0032_TASKS.md
* user_stories/RL-0018/RL-0018_UX_SPEC.md
* user_stories/RL-0018/RL-0018_RELEASE_NOTE.md
* user_stories/RL-0023/RL-0023_RELEASE_NOTE.md
* user_stories/RL-0034/RL-0034_RELEASE_NOTE.md
* design/approved/03_timer.png

---

## Revision History

| Version | Date | Author | Summary |
| ------- | ---- | ------ | ------- |
| v1.0 | 2026-07-20 | UX Designer Agent | Initial approved UX spec for cross-screen Rest Timer continuity. |

---

## Agent Handoff

Current Agent:

```text
UX Designer
```

Completed Output:

```text
user_stories/RL-0032/RL-0032_UX_SPEC.md
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
- docs/USER_JOURNEY.md
- docs/EPIC_USER_STORY_TASKS.md
- user_stories/RL-0032/RL-0032_TASKS.md
- user_stories/RL-0032/RL-0032_SPRINT_PLAN.md
- user_stories/RL-0032/RL-0032_UX_SPEC.md

Optional Input Files:

- user_stories/RL-0018/RL-0018_UX_SPEC.md
- user_stories/RL-0018/RL-0018_RELEASE_NOTE.md
- user_stories/RL-0023/RL-0023_RELEASE_NOTE.md
- user_stories/RL-0034/RL-0034_RELEASE_NOTE.md

Expected Output:

- user_stories/RL-0032/RL-0032_INTERPRETATION.md

Blocking Conditions:

- Stop if interpretation expands RL-0032 into a standalone timer mode.
- Stop if interpretation makes Dashboard own Rest Timer content.
- Stop if interpretation introduces backend, login, cloud sync, cross-device behavior, or background service behavior.

Instructions:

- Interpret RL-0032 using the sprint plan, backlog acceptance criteria, architecture, user journey, and this UX spec.
- Keep timer continuity scoped to active workout flow.
- Preserve existing RL-0018 Rest Timer overlay controls and RL-0023 Current Workout control behavior.
