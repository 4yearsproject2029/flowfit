# RL-0002 UX Specification

## Document Metadata

Story ID:

```text
RL-0002
```

Epic:

```text
EP-02 Onboarding
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
Approved
```

---

## Source Of Truth

Priority order when conflicts exist:

1. user_stories/RL-0002/RL-0002_SPRINT_PLAN.md
2. docs/PRODUCT_BRIEF.md
3. docs/PROJECT_CONTEXT.md
4. docs/EPIC_USER_STORY_TASKS.md

---

## Workflow Validation

Read:

```text
user_stories/RL-0002/RL-0002_SPRINT_PLAN.md
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

Document why UX work is required.

Examples:

* New screen introduced
* Navigation behavior changed
* Complex interaction flow
* Accessibility-sensitive workflow
* Explicit stakeholder request

Selected Reason:

```text
RL-0002 introduces a first-launch onboarding screen and changes the initial app entry flow before users reach the main experience.
```

---

## User Goal

Describe:

* User objective
* User motivation
* User value received

```text
Beginner users need a low-pressure way to choose how many workouts they want to aim for each week so RepLog can support a realistic consistency habit from the first launch.
```

---

## User Flow

Format:

```text
Entry Point
→ User Action
→ System Response
→ Success State
→ Exit Point
```

```text
First App Launch
→ User reviews weekly goal prompt
→ User selects 1, 2, 3, 4, or 5 workouts per week
→ Continue action becomes available
→ User confirms the selected goal
→ App saves the weekly goal and onboarding completion state
→ Home Screen opens
```

Returning user flow:

```text
App Launch
→ App detects saved weekly goal and completed onboarding
→ Home Screen opens
```

---

## Entry Points

* First launch when no saved weekly goal exists.
* First launch when onboarding completion has not been saved.
* App launch after local app data has been cleared.

---

## Exit Points

* Successful goal selection opens the existing HomeScreen.
* Returning users bypass onboarding and open the existing HomeScreen.

---

## Screen Placement

Document information hierarchy.

```text
1. RepLog onboarding title
2. Encouraging explanation that the goal can be realistic
3. Weekly workout goal choices from 1 through 5
4. Primary continue action
5. Short privacy/local-storage reassurance
```

---

## Components

| Component | Purpose | Priority |
| --------- | ------- | -------- |
| Onboarding title | Establish that the user is setting up RepLog. | Primary |
| Supportive description | Frame the goal as realistic and low pressure. | Primary |
| Weekly goal option selector | Let the user choose 1-5 workouts per week. | Primary |
| Continue button | Confirm and save the selected goal. | Primary |
| Local-storage note | Clarify that setup is saved on this device. | Secondary |

---

## Interaction Patterns

Document:

* Tap behavior
* Navigation behavior
* Gesture behavior
* State transitions

* Goal options are selectable by tap.
* Exactly one weekly goal option is selected at a time.
* A default selection may be shown to reduce friction, with 3 workouts per week preferred as a balanced default.
* Tapping Continue saves the selected goal and onboarding completion state.
* After save succeeds, the app navigates to the existing HomeScreen.
* Returning users should not see the onboarding screen if the saved goal and completion state are present.
* No back navigation is required before onboarding is completed.
* No edit-goal flow is required for RL-0002.

---

## Feedback Mechanisms

* Success: HomeScreen opens immediately after the goal is saved.
* Failure: Show a clear error if the app cannot save the goal.
* Progress: Continue button can show a short saving state while persistence completes.
* Achievements: Not required for RL-0002.

---

## Empty States

| Scenario | Message | Action |
| -------- | ------- | ------ |
| No saved onboarding state | "Set your weekly goal" | Choose a goal and continue. |

---

## Error States

| Scenario | Message | Recovery Action |
| -------- | ------- | --------------- |
| Goal cannot be saved | "We couldn't save your goal. Please try again." | Keep the user on onboarding and allow another Continue tap. |

---

## Loading States

Document:

* Loading indicators
* Disabled states
* Retry behavior

```text
Show a minimal startup loading state while local onboarding data is read. Disable the Continue action while the selected goal is being saved.
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

Implementation guidance:

* Each goal option should expose a descriptive label such as "3 workouts per week".
* The selected option should be communicated by text, icon, or control state, not color alone.
* Continue must be reachable by keyboard and screen reader traversal.

---

## Analytics Recommendations

Optional.

| Event | Trigger | Purpose |
| ----- | ------- | ------- |
| None | None | None |

If analytics are not required:

```text
Not required for MVP.
```

---

## Out Of Scope

Document explicitly excluded items.

* Future stories
* Advanced customization
* Unapproved navigation changes
* New gamification features
* Weekly goal progress tracking
* Editing the weekly goal after onboarding
* XP, levels, badges, streaks, share cards, analytics, backend, login, cloud sync, social graph, public ranking, or external services

---

## Open Questions

Questions requiring stakeholder input.

```text
None.
```

---

## Related Documents

* docs/PRODUCT_BRIEF.md
* docs/PROJECT_CONTEXT.md
* docs/ARCHITECTURE.md
* docs/EPIC_USER_STORY_TASKS.md
* user_stories/RL-0002/RL-0002_SPRINT_PLAN.md

---

## Revision History

| Version | Date | Author | Summary |
| ------- | ---- | ------ | ------- |
| v1.0 | 2026-06-30 | UX Designer Agent | Initial RL-0002 onboarding UX specification. |

---

## Agent Handoff

Current Agent:

```text
UX Designer
```

Completed Output:

```text
user_stories/RL-0002/RL-0002_UX_SPEC.md
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

- user_stories/RL-0002/RL-0002_SPRINT_PLAN.md
- user_stories/RL-0002/RL-0002_UX_SPEC.md
- docs/EPIC_USER_STORY_TASKS.md
- docs/PROJECT_CONTEXT.md
- docs/ARCHITECTURE.md

Optional Input Files:

- docs/PRODUCT_BRIEF.md
- user_stories/RL-0002/RL-0002_TASKS.md

Expected Output:

- user_stories/RL-0002/RL-0002_INTERPRETATION.md

Blocking Conditions:

- None.

Instructions:

- Interpret RL-0002 into implementation-ready scope.
- Preserve the UX decisions in this spec.
- Do not implement code during interpretation.
