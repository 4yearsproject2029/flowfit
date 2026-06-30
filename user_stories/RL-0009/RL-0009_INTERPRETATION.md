# RL-0009 Interpretation

## Document Metadata

Story ID:

```text
RL-0009
```

Epic:

```text
EP-06 Consistency Recovery
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
Ready for UX
```

---

## Source Of Truth

When conflicts exist, follow this priority order:

1. user_stories/RL-0009/RL-0009_SPRINT_PLAN.md
2. user_stories/RL-0009/RL-0009_UX_SPEC.md
3. docs/EPIC_USER_STORY_TASKS.md
4. docs/ARCHITECTURE.md
5. docs/PROJECT_CONTEXT.md

UX specifications are authoritative only after the UX Designer creates:

```text
user_stories/RL-0009/RL-0009_UX_SPEC.md
```

Do not expand scope.

---

## Workflow Validation

Read:

```text
user_stories/RL-0009/RL-0009_SPRINT_PLAN.md
```

Locate:

```text
UX Required:
```

Result:

```text
UX is required by docs/EPIC_USER_STORY_TASKS.md for RL-0009. UX specification is the next required workflow output before Code Writer implementation.
```

---

## Story Summary

RL-0009 defines consistency recovery behavior for users who miss a workout week and later return. It protects the user's existing XP and level progress, makes return-after-missed-week behavior detectable for local MVP metrics, and ensures RepLog encourages users without guilt or punishment.

This story is needed now because RL-0008 completed weekly goal progress. RepLog can now identify weekly goal gaps, but it must handle those gaps in a beginner-friendly way before adding share cards or broader validation metrics.

---

## User Story

```text
As a user,
I want RepLog to handle missed weeks without harsh punishment,
so that I feel encouraged to return.
```

---

## Acceptance Criteria

| AC ID | Description |
| ----- | ----------- |
| AC-01 | Missing a workout week does not remove XP. |
| AC-02 | Missing a workout week does not reduce levels. |
| AC-03 | Returning after a missed week is detectable for metrics. |
| AC-04 | The app displays encouraging language after returning. |
| AC-05 | Planned rest days do not count as failures. |

---

## Acceptance Criteria Mapping

| AC ID | Functional Requirement | Validation Method |
| ----- | ---------------------- | ----------------- |
| AC-01 | XP totals must remain additive and must not be decremented by missed-week detection. | Automated test and QA test |
| AC-02 | Level calculation must continue to derive from preserved XP and must not decrease because of missed weeks. | Automated test and QA test |
| AC-03 | The app must store or derive a local return-after-missed-week signal that can be reused by RL-0012 metrics. | Automated test |
| AC-04 | The home experience must show supportive return-state language after the app detects a return from a missed week. | UX review and QA test |
| AC-05 | MVP planned-rest handling must prevent planned rest from being treated as a failure state. | Automated test and QA test |

---

## Functional Requirements

* The system shall define a missed workout week as a completed Monday-Sunday week before the current week where completed workouts are below the selected weekly goal and the week is not marked as planned rest.
* The system shall use the existing local weekly goal value when evaluating missed-week behavior.
* The system shall use completed workout logs as the source for weekly completion counts.
* The system shall detect when a user completes a workout after at least one missed workout week.
* The system shall make return-after-missed-week detection available as local state or a local derived metric for future MVP validation.
* The system shall preserve the user's XP total when a missed week is detected.
* The system shall preserve the user's current level and level progress when a missed week is detected.
* The system shall display encouraging return language after a return-after-missed-week event is detected.
* The system shall treat planned rest as neutral, not as failure, penalty, or broken progress.
* The system shall avoid shame, punishment, failure labels, public comparison, or negative scoring.

---

## Non-Functional Requirements

* Recovery rules should be isolated enough to test without rendering the full home screen.
* Return detection should use local data only.
* The implementation should preserve existing onboarding, workout logging, workout completion, XP, levels, weekly goal progress, calendar, and timer behavior.
* The implementation should avoid new dependencies unless directly required for the MVP recovery behavior.
* Recovery messaging should remain readable on common iPhone screen sizes.

---

## Data Requirements

### Existing Models Used

| Model | Usage |
| ----- | ----- |
| WorkoutLog | Source for completed workouts and workout dates. |
| Weekly goal value | Source for the user's target workouts per week. |
| XP total | Must remain unchanged by missed-week detection. |
| Level progress | Must continue to derive from preserved XP. |

### New Fields Required

| Model | Field | Type | Default Value |
| ----- | ----- | ---- | ------------- |
| Local recovery state or metrics storage | returnAfterMissedWeekDetected | bool | false |
| Local recovery state or metrics storage | lastDetectedMissedWeekStartDate | String? | null |
| Local recovery state or metrics storage | lastReturnWeekStartDate | String? | null |
| Local recovery state or settings storage | plannedRestWeekStartDates | List<String> or equivalent local representation | empty |

Field names are implementation guidance, not fixed API names. Code Writer may choose a compact Hive-backed representation that fits existing `StorageService` patterns.

### Persistence Rules

* Return-after-missed-week state must persist locally after app restart.
* Planned rest state, if persisted for MVP, must remain local and offline-first.
* XP totals must not be rewritten downward by recovery evaluation.
* Level progress must not be rewritten downward by recovery evaluation.

### Migration Requirements

* No adapter migration is required if recovery state is stored in primitive Hive boxes.
* Migration may be required only if Code Writer chooses to add fields to existing Hive adapter-backed models.

---

## UI Requirements

UX Required:

```text
Yes
```

Reference:

```text
user_stories/RL-0009/RL-0009_UX_SPEC.md
```

The UX specification does not exist yet and is the next workflow output.

Required UX decisions:

* Where return encouragement appears in the existing home experience.
* Exact encouraging return-state copy.
* How planned rest is represented without creating a full scheduling system.
* How long return encouragement remains visible.
* How to avoid visual conflict with weekly goal progress, XP, and level summaries.

---

## Validation Rules

* A week uses the existing Monday-Sunday boundary established by RL-0008.
* Current in-progress weeks must not be treated as missed weeks.
* A week with planned rest must not trigger failure, penalty, or missed-week encouragement.
* Missing a week must never subtract XP.
* Missing a week must never reduce level.
* Return detection must be local and private.
* Return detection must not require login, backend, cloud sync, analytics SDK, or network access.

---

## Edge Cases

| Scenario | Expected Behavior |
| -------- | ----------------- |
| First-time user has no prior completed week | Do not show return-after-missed-week encouragement. |
| Current week has no completed workouts yet | Do not treat the current week as missed until the week has ended. |
| User misses one past week, then completes a workout this week | Detect return-after-missed-week and make supportive messaging eligible. |
| User misses multiple past weeks, then returns | Detect a single return event for the return week; do not stack repeated guilt messages. |
| User has a planned rest week | Treat that week as neutral and do not count it as a failure. |
| User toggles completion off | Recalculate recovery state without subtracting XP or decreasing level. |
| User deletes a completed workout from a previous week | Recalculate metrics if needed, but do not punish with XP loss or level loss. |
| App restarts after return detection | Persist or rederive the return signal consistently from local data. |
| Invalid or unparsable workout date | Ignore the invalid log for weekly recovery calculations. |
| Offline usage | All recovery behavior continues using local Hive-backed data. |

---

## Dependencies

### Story Dependencies

| Story ID | Relationship |
| -------- | ------------ |
| RL-0008 | Depends On |

### Technical Dependencies

* Existing `StorageService` for workout logs, weekly goal, XP total, and local primitive persistence patterns.
* Existing `WeeklyGoalService` Monday-Sunday week boundary behavior.
* Existing workout completion persistence from RL-0005.
* Existing XP and level behavior from RL-0006 and RL-0007.
* Existing home-screen display patterns from RL-0008.
* Hive local persistence.
* No external APIs or third-party services.

---

## In Scope

* Defining missed-week behavior for MVP.
* Detecting return after at least one missed workout week.
* Preserving XP totals after missed weeks.
* Preserving level progress after missed weeks.
* Local return-after-missed-week state or derived metric support.
* Encouraging return-state language.
* MVP planned-rest handling that prevents rest from counting as failure.

---

## Out Of Scope

Explicitly exclude:

* Streak systems.
* XP penalties, XP decay, or XP subtraction.
* Level penalties, level decay, or level reduction.
* Full analytics dashboards.
* Share cards.
* Badges.
* Notifications or reminders.
* A full calendar planning system.
* Backend, login, cloud sync, analytics SDK, social graph, public ranking, or external services.
* Broad state-management rewrites.
* Dart package rename, bundle identifier changes, Android namespace changes, or generated project renames.

Story-specific exclusions:

* Do not change how XP is awarded for workout completion.
* Do not add weekly goal completion rewards.
* Do not require users to explain why they missed a week.
* Do not label users as failed, behind, broken, or inactive.

---

## Execution Order Validation

Verify:

* Dependencies are resolved.
* Acceptance criteria are testable.
* Required inputs exist.
* UX decisions are required before implementation.

Result:

```text
Valid for UX handoff. Code Writer remains blocked until RL-0009_UX_SPEC.md exists.
```

---

## Risks Or Blockers

```text
None for UX handoff. Implementation must wait for UX specification because RL-0009 is marked UX Required.
```

---

## Recommendations

* Reuse the Monday-Sunday week boundary from `WeeklyGoalService`.
* Prefer a small recovery or metrics service with unit tests over embedding recovery calculations directly in the home screen.
* Prefer primitive Hive boxes for recovery state if persistence is needed, avoiding adapter migrations for this small story.
* Keep all copy supportive, neutral, and private.
* Let RL-0012 consume the local return-after-missed-week signal later instead of building a metrics dashboard now.

---

## Success Criteria For Moving To Code Writer

Implementation may begin only when:

* All acceptance criteria are covered.
* Dependencies are resolved.
* Scope boundaries are clear.
* Validation rules are documented.
* Edge cases are documented.
* UX decisions are available in `user_stories/RL-0009/RL-0009_UX_SPEC.md`.

---

## Agent Handoff

Current Agent:

```text
User Story Interpreter
```

Completed Output:

```text
user_stories/RL-0009/RL-0009_INTERPRETATION.md
```

Next Agent:

```text
UX Designer
```

Next Prompt:

```text
/Users/jounghwapak/Developer/AI_Agents/prompts/create_ux_spec.md
```

Required Input Files:

- docs/PRODUCT_BRIEF.md
- docs/PROJECT_CONTEXT.md
- docs/ARCHITECTURE.md
- docs/EPIC_USER_STORY_TASKS.md
- docs/SPRINT_PLAN.md
- user_stories/RL-0009/RL-0009_TASKS.md
- user_stories/RL-0009/RL-0009_SPRINT_PLAN.md
- user_stories/RL-0009/RL-0009_INTERPRETATION.md

Optional Input Files:

- user_stories/RL-0008/RL-0008_RELEASE_NOTE.md
- lib/data/services/weekly_goal_service.dart
- lib/data/services/storage_service.dart
- lib/features/home/screens/home_screen.dart

Expected Output:

- user_stories/RL-0009/RL-0009_UX_SPEC.md

Blocking Conditions:

- UX specification is required before Code Writer implementation.
- Do not proceed to Code Writer until `user_stories/RL-0009/RL-0009_UX_SPEC.md` exists.

Instructions:

- Complete RL-0009-T02 only.
- Define encouraging return-state copy and placement.
- Keep recovery language beginner-friendly, private, and non-punitive.
- Do not implement code during the UX stage.
