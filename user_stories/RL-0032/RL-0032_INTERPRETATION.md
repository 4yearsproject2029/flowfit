# RL-0032 Interpretation

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

Created By:

```text
User Story Interpreter Agent
```

Status:

```text
Approved
```

---

## Source Of Truth

When conflicts exist, follow this priority order:

1. user_stories/RL-0032/RL-0032_SPRINT_PLAN.md
2. user_stories/RL-0032/RL-0032_UX_SPEC.md
3. docs/EPIC_USER_STORY_TASKS.md
4. docs/ARCHITECTURE.md
5. docs/PROJECT_CONTEXT.md

UX specifications are authoritative only when:

```text
UX Required: Yes
```

is defined in:

```text
user_stories/RL-0032/RL-0032_SPRINT_PLAN.md
```

Do not expand scope.

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

* UX Required = Yes.
* user_stories/RL-0032/RL-0032_UX_SPEC.md is present and applied.

---

## Story Summary

RL-0032 adds cross-screen rest timer continuity for an active workout. It builds on the RL-0018 Current Workout rest overlay and RL-0023 return-to-workout state recovery so that users can briefly navigate away during rest, still see or recover active rest state, and return to Current Workout without losing workout flow context.

The story is needed now because RL-0018 intentionally deferred global/floating continuity and RL-0034 reduced Current Workout structure risk before adding shared active-rest behavior.

---

## User Story

```text
As a user resting during an active workout,
I want the timer to survive navigation and give me a way back to the workout,
so that rest remains connected to the workout flow across screens.
```

---

## Acceptance Criteria

Copy acceptance criteria exactly from:

```text
docs/EPIC_USER_STORY_TASKS.md
```

Do not modify wording.

| AC ID | Description |
| ----- | ----------- |
| AC-01 | Builds on the Rest Timer overlay from `RL-0018`. |
| AC-02 | Timer survives allowed navigation during an active workout flow. |
| AC-03 | Global/floating timer state remains visible or recoverable where it supports active workout continuity. |
| AC-04 | Users have a clear return-to-workout entry point from active timer state. |
| AC-05 | Active timer state persists during the workout flow without introducing backend, login, cloud sync, or cross-device behavior. |
| AC-06 | Timer continuity remains scoped to active workout flow and is not a Dashboard feature, standalone timer mode, or background service outside the app. |
| AC-07 | QA covers navigation survival, active timer state, return-to-workout entry, and cleanup when rest/workout ends. |

---

## Acceptance Criteria Mapping

| AC ID | Functional Requirement | Validation Method |
| ----- | ---------------------- | ----------------- |
| AC-01 | Reuse and preserve the existing RL-0018 Rest Timer overlay behavior, including countdown, Skip Rest, Extend Rest, close, and return behavior. | Focused widget test and code review |
| AC-02 | Keep active rest timer state available when the user navigates away from Current Workout to allowed app screens during an active workout. | Widget test |
| AC-03 | Show or provide a recoverable compact active-rest affordance outside Current Workout while active rest is running or ready to continue. | Widget test and QA |
| AC-04 | Provide a clear Return to Workout action from active timer state that opens Current Workout at the active rest or next-step state. | Widget test |
| AC-05 | Keep timer continuity local to the app and active workout flow without backend, auth, sync, cross-device, or background service behavior. | Code review and QA |
| AC-06 | Avoid Dashboard-owned timer content, standalone timer mode, or timer controls on unrelated screens. | Code review and QA |
| AC-07 | Add focused QA coverage for navigation survival, active timer recovery, return-to-workout entry, and cleanup after rest/workout completion. | QA report |

---

## Functional Requirements

* The system shall preserve the existing Current Workout rest state and RL-0018 Rest Timer overlay behavior.
* The system shall keep active rest timer state alive while a workout is active and the user navigates to allowed app screens.
* The system shall provide a compact active-rest affordance outside Current Workout when active rest is running or ready to continue.
* The system shall show remaining rest time when it is available and rest is still running.
* The system shall show a clear rest-complete or return-ready state when the timer reaches zero away from Current Workout.
* The system shall provide a Return to Workout action from active timer state.
* The system shall route Return to Workout back to Current Workout with enough active-session context to continue the workout.
* The system shall clear the active timer affordance when rest is skipped, rest completes and the workout advances, or the workout finishes.
* The system shall not make Home, Week, History, Achievement, or Workout Summary own full timer controls.
* The system shall not add standalone timer mode, backend, login, cloud sync, cross-device sync, or background service behavior.

---

## Non-Functional Requirements

* Timer affordance must remain readable and touch-safe on compact iPhone layouts.
* Timer continuity must remain local-first and must not require network.
* Timer updates should be lightweight and avoid unnecessary screen rebuilds.
* State cleanup must be reliable enough that stale rest timers do not remain visible after workout flow ends.
* Existing Current Workout pause, resume, skip, adjust, rest overlay, and Summary handoff behavior must not regress.
* Implementation should reuse existing Flutter/Dart patterns and avoid new dependencies unless required by codebase constraints.

---

## Data Requirements

### Existing Models Used

| Model | Usage |
| ----- | ----- |
| Existing active workout/session state | Source for whether a workout is active and where Return to Workout should land. |
| Existing rest state model or runtime rest fields | Source for rest duration, remaining time, completed exercise context, next exercise context, and return target. |
| WorkoutLog / planned session data | Existing source for workout context and progression. |

### New Fields Required

```text
No Hive data model changes required unless implementation proves existing runtime state cannot represent active rest continuity.
```

If implementation requires new runtime-only state, it should be non-persisted or locally scoped to active workout flow.

### Persistence Rules

* Active rest timer continuity may persist during in-app navigation.
* App-restart or background-service timer persistence is out of scope unless already available through existing active workout state.
* No backend, login, cloud sync, cross-device sync, or external persistence is allowed.
* No Hive schema migration should be introduced unless Code Writer identifies a hard blocker and returns to Coordinator.

### Migration Requirements

* None

---

## UI Requirements

UX Required:

```text
Yes
```

Reference:

```text
user_stories/RL-0032/RL-0032_UX_SPEC.md
```

Summarize:

* Existing Rest Timer overlay remains the full-control timer surface.
* A compact active timer affordance may appear or remain recoverable across allowed screens.
* The affordance must provide Return to Workout as the primary action.
* Remaining time or rest-complete state must be readable.
* Full Skip Rest and Extend Rest controls remain in Current Workout or the existing overlay.
* Home must not gain a Rest Timer card, section, or standalone timer feature.
* Timer affordance must clear when rest or workout ends.

---

## Validation Rules

* Active timer affordance appears only when there is an active workout and active rest state.
* Active timer affordance does not appear when no workout is active.
* Active timer affordance clears when rest is skipped.
* Active timer affordance clears when workout completion reaches Workout Summary.
* Return to Workout does not create duplicate workout logs or restart the workout.
* Timer state does not require network, backend, auth, or sync.
* Full timer controls are not duplicated onto Home, Week, History, Achievement, or Summary.

---

## Edge Cases

| Scenario | Expected Behavior |
| -------- | ----------------- |
| No active workout | No timer affordance is shown. |
| Active workout without active rest | No rest timer affordance is shown. |
| User navigates away during active rest | Compact timer affordance remains visible or recoverable. |
| Timer reaches zero while away | Affordance changes to a rest-complete or return-ready state. |
| User taps Return to Workout | Current Workout opens at active rest or next-step state without losing progress. |
| User skips rest | Timer overlay and compact affordance clear and workout advances. |
| Workout completes | Timer state clears before or as Workout Summary appears. |
| Invalid or missing timer value | User receives a calm recovery path back to Current Workout. |
| Offline usage | Timer continuity works locally without network. |
| Persistence failure | Existing active workout data is preserved; timer recovery falls back to Current Workout where possible. |

---

## Dependencies

### Story Dependencies

| Story ID | Relationship |
| -------- | ------------ |
| RL-0018 | Depends On; provides the Rest Timer overlay and controls that RL-0032 must preserve. |
| RL-0023 | Depends On; provides Current Workout pause, adjust, skip, and return-to-workout state behavior that RL-0032 must preserve. |
| RL-0034 | Depends On; provides the extracted Current Workout widget structure that lowers implementation risk. |

### Technical Dependencies

* Existing Current Workout route and active workout state.
* Existing rest timer overlay widget and rest state models.
* Existing Home, Week, History, Achievement, and Summary navigation surfaces.
* Existing local storage services where active workout state is already represented.
* No external APIs.
* No new third-party libraries required by this interpretation.

---

## In Scope

* Active rest timer continuity during allowed in-app navigation.
* Compact active-rest affordance outside Current Workout.
* Return-to-workout behavior from active timer state.
* Rest-complete or return-ready state when timer reaches zero away from Current Workout.
* Cleanup when rest is skipped, rest finishes, or workout completes.
* Focused tests for continuity, return, privacy of screen responsibilities, and cleanup.

---

## Out Of Scope

Explicitly exclude:

* Future stories
* Nice-to-have improvements
* Refactoring unrelated code
* Architecture changes

Story-specific exclusions:

* Standalone timer mode.
* Dashboard-owned timer section or card.
* Full timer controls on Home, Week, History, Achievement, or Summary.
* App-background timer service.
* App-restart persistence unless already supported by current local active-workout state.
* Backend, login, cloud sync, cross-device sync, or external analytics.
* New Achievement, Week, History, Summary, or planning behavior.
* Broad Current Workout state-management rewrite.

---

## Execution Order Validation

Verify:

* Dependencies are resolved.
* Acceptance criteria are testable.
* Required inputs exist.
* UX decisions are available when required.

Result:

```text
Valid
```

---

## Risks Or Blockers

```text
None
```

---

## Implementation Guidance

* Prefer a minimal shared active-rest controller/state surface if existing route-local state cannot survive navigation.
* Keep Current Workout as the owner of workout execution and full timer controls.
* Keep cross-screen UI compact and action-oriented: status plus Return to Workout.
* Avoid changing persistence schemas unless a blocker is documented and returned to Coordinator.
* Add focused widget tests rather than relying only on a broad Hive-backed harness.

---

## Agent Handoff

Current Agent:

```text
User Story Interpreter
```

Completed Output:

```text
user_stories/RL-0032/RL-0032_INTERPRETATION.md
```

Next Agent:

```text
Code Writer
```

Next Prompt:

```text
/Users/jounghwapak/Developer/AI_Agents/prompts/write_code.md
```

Required Input Files:

- docs/PROJECT_CONTEXT.md
- docs/ARCHITECTURE.md
- docs/EPIC_USER_STORY_TASKS.md
- user_stories/RL-0032/RL-0032_SPRINT_PLAN.md
- user_stories/RL-0032/RL-0032_UX_SPEC.md
- user_stories/RL-0032/RL-0032_INTERPRETATION.md

Optional Input Files:

- user_stories/RL-0032/RL-0032_TASKS.md
- user_stories/RL-0018/RL-0018_IMPLEMENTATION_NOTES.md
- user_stories/RL-0023/RL-0023_IMPLEMENTATION_NOTES.md
- user_stories/RL-0034/RL-0034_IMPLEMENTATION_NOTES.md

Expected Output:

- user_stories/RL-0032/RL-0032_IMPLEMENTATION_NOTES.md

Blocking Conditions:

- Stop if implementation requires backend, login, cloud sync, cross-device sync, or background service behavior.
- Stop if implementation requires a Hive schema migration that cannot be avoided.
- Stop if implementation would make Dashboard own full Rest Timer controls.

Instructions:

- Implement only RL-0032.
- Preserve RL-0018 overlay behavior and RL-0023 Current Workout controls.
- Add focused verification for navigation survival, return-to-workout, and timer cleanup.
