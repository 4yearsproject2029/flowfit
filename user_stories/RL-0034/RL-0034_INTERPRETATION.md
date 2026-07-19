# RL-0034 Interpretation

## Document Metadata

Story ID:

```text
RL-0034
```

Epic:

```text
EP-12 Current Workout Structural Refactor
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

1. user_stories/RL-0034/RL-0034_SPRINT_PLAN.md
2. user_stories/RL-0034/RL-0034_UX_SPEC.md
3. docs/EPIC_USER_STORY_TASKS.md
4. docs/ARCHITECTURE.md
5. docs/PROJECT_CONTEXT.md

UX specifications are authoritative only when:

```text
UX Required: Yes
```

is defined in:

```text
user_stories/RL-0034/RL-0034_SPRINT_PLAN.md
```

Do not expand scope.

---

## Workflow Validation

Read:

```text
user_stories/RL-0034/RL-0034_SPRINT_PLAN.md
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
user_stories/RL-0034/RL-0034_BLOCKERS.md
```

* If UX Required = No, ignore missing UX documents.

Validation result:

```text
UX Required = No. Missing UX_SPEC.md does not block execution.
```

---

## Story Summary

RL-0034 reduces technical debt in the Current Workout flow before additional workout-flow features are added. `CurrentWorkoutScreen` has grown to 1,584 lines and currently mixes route orchestration, workout state, rest timer overlay UI, adjustment UI, display cards, and helper behavior in one file.

The delivered value is lower regression risk and lower implementation cost for upcoming workout-flow stories. This is needed now because future stories, especially cross-screen rest timer continuity, would otherwise build on a large and fragile screen file.

---

## User Story

```text
As a development team,
I want Current Workout split into smaller behavior-preserving modules,
so that upcoming workout-flow features can be implemented with lower regression risk.
```

---

## Acceptance Criteria

| AC ID | Description |
| ----- | ----------- |
| AC-01 | `CurrentWorkoutScreen` remains the route-level screen entry point. |
| AC-02 | Rest timer overlay UI is extracted from `current_workout_screen.dart` into a focused widget/module without changing user-facing behavior. |
| AC-03 | Current-session adjustment UI is extracted from `current_workout_screen.dart` into a focused widget/module without changing user-facing behavior. |
| AC-04 | Current Workout display cards/widgets are extracted into focused widget files where doing so does not alter behavior. |
| AC-05 | Pure workout-progress calculations or state-transition helpers are extracted only when focused tests can preserve current behavior. |
| AC-06 | No UX redesign, new feature behavior, persistence schema change, new dependency, backend, login, cloud sync, or broad state-management migration is introduced. |
| AC-07 | Focused Current Workout widget tests, relevant service tests, `flutter analyze`, and diff hygiene pass or known harness limitations are documented. |

---

## Acceptance Criteria Mapping

| AC ID | Functional Requirement | Validation Method |
| ----- | ---------------------- | ----------------- |
| AC-01 | Keep `CurrentWorkoutScreen` in `lib/features/current_workout/screens/current_workout_screen.dart` as the public route-level widget used by existing navigation. | Code review, analyzer, focused navigation/widget tests |
| AC-02 | Move rest overlay presentation into a focused widget/module while preserving countdown display, skip rest, extend rest, close/dismiss, and return-to-workout behavior. | Focused widget tests, code review, QA report |
| AC-03 | Move current-session adjustment UI into a focused widget/module while preserving current-session-only reps and weight adjustment behavior. | Focused widget tests, code review, QA report |
| AC-04 | Move safe display-only Current Workout widgets into `lib/features/current_workout/widgets/` without changing copy, layout intent, actions, or state ownership. | Code review, analyzer, focused widget tests |
| AC-05 | Extract pure helper logic only where behavior can be covered by focused tests and where extraction does not introduce a new state-management layer. | Unit/service tests where applicable, code review |
| AC-06 | Preserve current behavior, persistence schema, dependency graph, app architecture, and local-first product boundaries. | Diff review, analyzer, code review |
| AC-07 | Record command-backed verification and any known harness limitation in story QA and release artifacts. | QA report, release note |

---

## Functional Requirements

* The system shall keep `CurrentWorkoutScreen` as the route-level Current Workout entry point.
* The system shall preserve existing workout start/resume, active exercise display, set progression, rest entry, rest completion, pause, resume, skip, adjustment, and summary handoff behavior.
* The system shall preserve existing Current Workout copy, user-facing labels, visual hierarchy, navigation targets, accessibility-relevant button semantics, and interaction flow.
* The system shall extract rest timer overlay presentation from the route-level screen into a focused widget or module.
* The system shall extract current-session adjustment presentation from the route-level screen into a focused widget or module.
* The system shall extract display-only Current Workout cards/widgets when the move is behavior-preserving and reduces `current_workout_screen.dart` responsibility.
* The system shall extract pure progress or state helper logic only when doing so is low risk and covered by focused validation.
* The system shall not alter Hive adapters, model fields, persistence keys, route names, or dependency declarations.

---

## Non-Functional Requirements

* Maintainability: `current_workout_screen.dart` should become smaller and easier to scan.
* Regression control: extraction must be incremental and behavior-preserving.
* Testability: extracted helpers and widgets should allow focused validation without broad harness-only dependence.
* Architecture fit: new files should follow the existing feature-first folder structure.
* Diff hygiene: generated code, unrelated cleanup, and broad formatting churn are not allowed.

---

## Data Requirements

### Existing Models Used

| Model | Usage |
| ----- | ----- |
| Existing workout/session models used by Current Workout | Continue driving active workout display, progression, adjustments, and completion handoff exactly as today. |
| Existing local persistence models/services | Continue storing and reading active workout and completion data without schema change. |

### New Fields Required

| Model | Field | Type | Default Value |
| ----- | ----- | ---- | ------------- |
| None | None | None | None |

```text
No data model changes required.
```

### Persistence Rules

* Existing persistence behavior must remain unchanged.
* No new Hive adapters, boxes, schema versions, or migration steps are allowed.
* Current-session adjustment behavior must remain scoped to the active session and must not modify weekly plans, templates, or history.

### Migration Requirements

* None

---

## UI Requirements

UX Required:

```text
No
```

Document only:

* UI elements affected: Current Workout route-level screen, rest timer overlay, current-session adjustment sheet, display cards/widgets inside the existing Current Workout flow.
* Existing patterns to reuse: current Material widgets, current spacing/copy/color behavior, current navigation behavior, current local feature-first folder organization.

Do not create new UX behavior.

---

## Validation Rules

* Adjusted reps and weight validation must remain exactly as currently implemented.
* Rest timer controls must remain available in the same resting states as currently implemented.
* Pause, resume, skip, and complete-set actions must remain valid only in the same states as currently implemented.
* Completion handoff must remain triggered only when the existing workout progression reaches completion.
* No additional validation rules.

---

## Edge Cases

| Scenario | Expected Behavior |
| -------- | ----------------- |
| Empty workout or missing active session | Existing Current Workout empty/start behavior remains unchanged. |
| Invalid adjustment input | Existing validation and fallback behavior remains unchanged. |
| Duplicate complete, skip, pause, or resume action | Existing state-transition behavior remains unchanged. |
| Offline usage | Existing local-only behavior remains unchanged. |
| Persistence failure | Existing failure or fallback behavior remains unchanged. |
| Timer reaches zero while overlay is extracted | Existing countdown completion and return behavior remains unchanged. |
| Navigation away and back | Existing return-to-workout behavior remains unchanged. |

---

## Dependencies

### Story Dependencies

| Story ID | Relationship |
| -------- | ------------ |
| RL-0016 | Depends On; completion summary handoff must be preserved. |
| RL-0018 | Depends On; rest overlay behavior must be preserved. |
| RL-0022 | Depends On; set progression and rest handoff must be preserved. |
| RL-0023 | Depends On; pause, resume, skip, adjust, and return state must be preserved. |

### Technical Dependencies

* `lib/features/current_workout/screens/current_workout_screen.dart`
* Existing Current Workout services, models, routes, and local persistence used by the screen.
* Existing Flutter and Dart SDK dependencies already present in the project.
* No external APIs.
* No new third-party libraries.

---

## In Scope

* Behavior-preserving extraction from `current_workout_screen.dart`.
* Focused widgets under `lib/features/current_workout/widgets/`.
* Rest timer overlay UI extraction.
* Current-session adjustment UI extraction.
* Display-card/widget extraction where safe.
* Pure helper extraction only when covered by focused validation.
* Import cleanup required by extraction.
* Focused analyzer and test evidence.

---

## Out Of Scope

Explicitly exclude:

* Future stories
* Nice-to-have improvements
* Refactoring unrelated code
* Architecture changes

Story-specific exclusions:

* UX redesign
* New user-facing behavior
* New copy or navigation flows
* Persistence schema changes
* New dependencies
* Backend, login, cloud sync, or cross-device behavior
* Riverpod or global state-management migration
* Cross-screen rest timer continuity from RL-0032
* Workout summary sharing/details from RL-0024
* Week, History, Achievement, or planned session work

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

Known risks to manage during implementation:

* Moving private widgets can break widget tests or imports.
* Extracting helper logic can accidentally alter progression, rest, pause, skip, adjust, or summary handoff behavior.
* Broad Hive-backed widget tests may expose known harness limitations; document limitations rather than changing production behavior solely for the harness.

---

## Recommendations

* Prefer extracting private widgets first before touching state-transition helpers.
* Keep constructor APIs explicit and small for extracted widgets.
* Leave state ownership in `CurrentWorkoutScreen` unless a pure helper extraction is clearly safer and testable.
* Keep extracted files under `lib/features/current_workout/widgets/` unless later stories approve shared ownership.
* Add or update focused tests around the extracted behavior before broad regression runs.

---

## Success Criteria For Moving To Code Writer

Implementation may begin only when:

* All acceptance criteria are covered.
* Dependencies are resolved.
* Scope boundaries are clear.
* Validation rules are documented.
* Edge cases are documented.
* UX decisions are available when required.

---

## Agent Handoff

Current Agent:

```text
User Story Interpreter
```

Completed Output:

```text
user_stories/RL-0034/RL-0034_INTERPRETATION.md
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

- docs/PROJECT_CONTEXT.md
- docs/ARCHITECTURE.md
- docs/EPIC_USER_STORY_TASKS.md
- user_stories/RL-0034/RL-0034_TASKS.md
- user_stories/RL-0034/RL-0034_SPRINT_PLAN.md
- user_stories/RL-0034/RL-0034_INTERPRETATION.md

Optional Input Files:

- user_stories/RL-0034/RL-0034_UX_SPEC.md

Expected Output:

- user_stories/RL-0034/RL-0034_IMPLEMENTATION_NOTES.md

Blocking Conditions:

- Stop if implementation requires UX redesign, new feature behavior, persistence schema changes, new dependencies, backend, login, cloud sync, or broad state-management migration.
- Stop if behavior cannot be preserved with focused extraction.

Instructions:

- Implement only the behavior-preserving Current Workout structural extraction.
- Preserve existing user-facing behavior and route entry points.
