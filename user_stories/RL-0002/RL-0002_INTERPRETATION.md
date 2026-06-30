# RL-0002 Interpretation

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

1. user_stories/RL-0002/RL-0002_SPRINT_PLAN.md
2. user_stories/RL-0002/RL-0002_UX_SPEC.md
3. docs/EPIC_USER_STORY_TASKS.md
4. docs/ARCHITECTURE.md
5. docs/PROJECT_CONTEXT.md

UX specifications are authoritative only when:

```text
UX Required: Yes
```

is defined in:

```text
user_stories/RL-0002/RL-0002_SPRINT_PLAN.md
```

Do not expand scope.

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

* If UX Required = Yes, load and apply UX_SPEC.md.
* If UX Required = Yes and UX_SPEC.md is missing, stop immediately.
* Create:

```text
user_stories/RL-0002/RL-0002_BLOCKERS.md
```

* If UX Required = No, ignore missing UX documents.

---

## Story Summary

RL-0002 introduces the first RepLog onboarding step. First-time users must choose a realistic weekly workout goal before reaching the main experience so the product can later track consistency against the user's own target. The story is needed now because weekly goals are foundational for later offline persistence, goal progress, XP, and MVP quality stories.

---

## User Story

```text
As a beginner fitness user,
I want to choose my weekly workout goal on first launch,
so that RepLog can track consistency against a realistic target.
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
| AC-01 | First-time users choose a weekly goal before reaching the main experience. |
| AC-02 | Goal options include at least 1-5 workouts per week. |
| AC-03 | The selected goal is saved locally. |
| AC-04 | Returning users skip onboarding. |
| AC-05 | The goal persists after app restart. |

---

## Acceptance Criteria Mapping

Map every acceptance criterion to implementation requirements.

| AC ID | Functional Requirement | Validation Method |
| ----- | ---------------------- | ----------------- |
| AC-01 | The app shall show onboarding before HomeScreen when no completed onboarding state and saved weekly goal exist. | Widget test and QA test |
| AC-02 | The onboarding screen shall offer selectable weekly goal values from 1 through 5 workouts per week. | Widget test and QA test |
| AC-03 | Confirming onboarding shall persist the selected weekly goal to local storage. | Widget test and persistence inspection |
| AC-04 | The app shall open HomeScreen directly when onboarding completion and weekly goal are already saved. | Widget test and QA test |
| AC-05 | The saved weekly goal shall remain available after app restart. | Widget test and QA test |

---

## Functional Requirements

Describe required system behavior.

Use measurable statements.

* The system shall read local onboarding state during app startup.
* The system shall show onboarding when no valid weekly goal has been saved.
* The system shall show onboarding when onboarding completion has not been saved.
* The system shall provide goal options for 1, 2, 3, 4, and 5 workouts per week.
* The system shall allow exactly one weekly goal option to be selected.
* The system shall save the selected weekly goal locally when the user continues.
* The system shall save onboarding completion locally after a goal is selected.
* The system shall route to HomeScreen after onboarding is saved.
* The system shall skip onboarding for returning users with a saved weekly goal and completed onboarding state.
* The system shall preserve existing workout logging, calendar, rest timer, completion toggle, and delete behavior.

Rules:

* Describe behavior.
* Do not describe implementation.

---

## Non-Functional Requirements

Document quality expectations.

* Onboarding must work offline with local device storage only.
* App startup must not require login, backend, network access, analytics SDK, or external service calls.
* The onboarding UI must use readable text, predictable navigation, and touch targets suitable for beginner mobile users.
* Saving the goal should provide immediate feedback by navigating to HomeScreen when complete.
* Persistence errors should keep the user on onboarding and allow retry.

---

## Data Requirements

Document required data changes.

### Existing Models Used

| Model | Usage |
| ----- | ----- |
| None | RL-0002 does not need existing workout models for goal selection. |

### New Fields Required

| Model | Field | Type | Default Value |
| ----- | ----- | ---- | ------------- |
| WeeklyGoal | workoutsPerWeek | int | None |
| AppSettings | onboardingCompleted | bool | false |

### Persistence Rules

* The selected weekly goal must be stored locally.
* Onboarding completion must be stored locally.
* A valid saved weekly goal is an integer from 1 through 5.
* Returning-user skip requires both onboarding completion and a valid saved weekly goal.

### Migration Requirements

* None. New local persistence records may be added without changing existing workout or workout-log adapter fields.

---

## UI Requirements

UX Required:

```text
Yes
```

If UX Required = Yes:

Reference:

```text
user_stories/RL-0002/RL-0002_UX_SPEC.md
```

Summarize:

* Add a first-launch onboarding screen before HomeScreen.
* Show RepLog onboarding title and supportive beginner-friendly explanation.
* Provide weekly goal options from 1 through 5 workouts per week.
* Allow one selected option at a time.
* Provide a primary Continue action.
* Show a minimal startup loading state while onboarding data is read.
* Disable Continue while saving.
* Show an error message if the goal cannot be saved.

If UX Required = No:

Document only:

* Not applicable.

Do not create new UX behavior.

---

## Validation Rules

Document business constraints.

* Weekly goal must be an integer.
* Weekly goal must be between 1 and 5 inclusive.
* Onboarding cannot complete without saving a valid weekly goal.
* Returning-user skip must not occur when the saved goal is missing or invalid.

---

## Edge Cases

Document expected behavior.

| Scenario | Expected Behavior |
| -------- | ----------------- |
| Empty state | App shows onboarding when no saved goal or onboarding completion exists. |
| Invalid input | Invalid persisted goals outside 1-5 are treated as incomplete onboarding. |
| Duplicate action | Continue is disabled while saving to avoid duplicate writes. |
| Offline usage | Onboarding works fully offline using local storage. |
| Persistence failure | User remains on onboarding and sees a retryable error message. |
| Returning launch | App skips onboarding when completion and a valid goal are saved. |

Include only relevant cases.

---

## Dependencies

### Story Dependencies

| Story ID | Relationship |
| -------- | ------------ |
| RL-0001 | Depends On |

### Technical Dependencies

* Existing Flutter app shell.
* Existing Hive initialization through `LocalDatabase`.
* Existing local persistence approach.
* No external APIs or new third-party services.

Document only dependencies required for this story.

---

## In Scope

* First-launch onboarding gate.
* Weekly goal selection options from 1 to 5 workouts per week.
* Local persistence of selected weekly goal.
* Local persistence of onboarding completion.
* Returning-user onboarding skip.
* Widget tests for onboarding display, goal selection, persistence, and skip behavior.

---

## Out Of Scope

Explicitly exclude:

* Future stories
* Nice-to-have improvements
* Refactoring unrelated code
* Architecture changes

Story-specific exclusions:

* Editing weekly goal after onboarding.
* Weekly goal progress calculations.
* XP, levels, badges, streaks, rewards, share cards, analytics, backend, login, sync, social graph, public ranking, or external services.
* Package rename, bundle identifier changes, Android namespace changes, or platform project renames.

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

## Agent Handoff

Current Agent:

```text
User Story Interpreter
```

Completed Output:

```text
user_stories/RL-0002/RL-0002_INTERPRETATION.md
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

- user_stories/RL-0002/RL-0002_SPRINT_PLAN.md
- user_stories/RL-0002/RL-0002_UX_SPEC.md
- user_stories/RL-0002/RL-0002_INTERPRETATION.md
- docs/ARCHITECTURE.md

Optional Input Files:

- user_stories/RL-0002/RL-0002_TASKS.md
- Existing Flutter source files

Expected Output:

- user_stories/RL-0002/RL-0002_IMPLEMENTATION_NOTES.md

Blocking Conditions:

- None.

Instructions:

- Implement only RL-0002.
- Preserve existing workout logging behavior.
- Do not add backend, login, sync, analytics, XP, levels, badges, streaks, weekly progress tracking, share cards, social graph, or public ranking.
