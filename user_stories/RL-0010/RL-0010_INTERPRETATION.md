# RL-0010 Interpretation

## Document Metadata

Story ID:

```text
RL-0010
```

Epic:

```text
EP-07 Share Cards
```

Created Date:

```text
2026-07-01
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

1. user_stories/RL-0010/RL-0010_SPRINT_PLAN.md
2. docs/EPIC_USER_STORY_TASKS.md
3. docs/PRODUCT_BRIEF.md
4. docs/ARCHITECTURE.md
5. docs/PROJECT_CONTEXT.md

UX specifications are authoritative only after the UX Designer creates:

```text
user_stories/RL-0010/RL-0010_UX_SPEC.md
```

Do not expand scope.

---

## Workflow Validation

Read:

```text
user_stories/RL-0010/RL-0010_SPRINT_PLAN.md
```

Locate:

```text
UX Required:
```

Result:

```text
UX is required by docs/EPIC_USER_STORY_TASKS.md for RL-0010. UX specification is the next required workflow output before Code Writer implementation.
```

---

## Story Summary

RL-0010 defines the MVP share-card experience for RepLog. Users should be able to create optional cards for workout completion, level-up, and weekly goal completion moments. Cards should celebrate consistency and identity without exposing beginner-sensitive performance numbers by default.

This story is possible now because RL-0006 added XP, RL-0007 added levels, and RL-0008 added weekly goal progress. RL-0010 should use those existing local signals; it should not introduce public social systems, accounts, cloud sync, analytics SDKs, rankings, or automatic publishing.

---

## User Story

```text
As a user,
I want to create a share card for workout completion, level-up, or weekly goal completion,
so that I can celebrate progress without exposing embarrassing numbers.
```

---

## Acceptance Criteria

| AC ID | Description |
| ----- | ----------- |
| AC-01 | Users can generate workout completion cards. |
| AC-02 | Users can generate level-up cards. |
| AC-03 | Users can generate weekly goal cards. |
| AC-04 | Weight, sets, reps, calories, and PRs are hidden by default. |
| AC-05 | Share card generation is optional and user-initiated. |

---

## Acceptance Criteria Mapping

| AC ID | Functional Requirement | Validation Method |
| ----- | ---------------------- | ----------------- |
| AC-01 | The app must provide a user-initiated way to preview or generate a workout completion card for a completed workout. | Widget/service test and QA test |
| AC-02 | The app must provide a user-initiated way to preview or generate a level-up card when current XP indicates level progress. | Widget/service test and QA test |
| AC-03 | The app must provide a user-initiated way to preview or generate a weekly goal card when the current weekly goal is complete. | Widget/service test and QA test |
| AC-04 | Generated card content must omit weight, sets, reps, calories, PRs, and other performance metrics by default. | Service/widget assertions and QA review |
| AC-05 | The app must not auto-create, auto-open, auto-share, or auto-publish cards. The user must choose generation. | Code review and QA test |

---

## Approved MVP Card Types

| Card Type | Trigger Moment | Required Source Data | Required Default Content |
| --------- | -------------- | -------------------- | ------------------------ |
| Workout Completion | A completed workout log exists. | Workout name, workout date, completion state. | RepLog brand, completion celebration, workout name or generic workout label, date, consistency-focused message. |
| Level-Up / Level Progress | Current XP produces a visible level state. | XP total and `LevelService` level calculation. | RepLog brand, current level, habit-growth message. |
| Weekly Goal | Current week completed workouts meet or exceed selected weekly goal. | Weekly goal and `WeeklyGoalService` current-week progress. | RepLog brand, weekly goal completion message, completed count versus goal. |

Implementation may call the second type `Level Card` if exact level-up event history is not available yet. It must still satisfy the user goal by celebrating level progress without exposing performance numbers.

---

## Functional Requirements

* The system shall provide exactly three MVP share-card types: workout completion, level progress, and weekly goal completion.
* The system shall keep card creation optional and user-initiated.
* The system shall use existing local data from workout logs, XP total, level progress, and weekly goal progress.
* The system shall generate card content on device.
* The system shall provide a preview before or as part of generation.
* The system shall not require network access, login, backend services, analytics SDK, cloud sync, or public social features.
* The system shall hide weight, sets, reps, calories, PRs, and performance metrics by default.
* The system shall favor consistency language such as showing up, completing workouts, reaching a weekly goal, and growing a level.
* The system shall avoid public comparison language, rankings, leaderboards, or claims of athletic superiority.

---

## Non-Functional Requirements

* Share-card logic should be isolated enough to test without rendering the full app.
* Share-card UI should remain readable on common iPhone screen sizes.
* Card generation should preserve existing home-screen performance and avoid blocking workout logging.
* The implementation should avoid new dependencies unless Code Writer determines one is necessary for MVP generation.
* If native sharing/export is not implemented in RL-0010, the story may still pass if users can generate and preview the card on device and no acceptance criterion requires system share-sheet export.

---

## Data Requirements

### Existing Models And Services Used

| Source | Usage |
| ------ | ----- |
| WorkoutLog | Source for workout completion card availability and workout label/date. |
| StorageService XP total | Source for level card content. |
| LevelService | Source for current level calculation. |
| WeeklyGoalService | Source for weekly goal completion state. |
| Weekly goal value | Source for weekly goal card content. |

### New Fields Required

```text
None required for MVP if cards are generated on demand.
```

### Optional Local State

Implementation may store local share-card generation events only if needed for later MVP validation, but RL-0010 does not require a new persisted analytics model. Do not add backend or analytics SDK event tracking.

### Migration Requirements

```text
No Hive adapter migration is required unless Code Writer chooses to persist a new adapter-backed share-card event model. Prefer no migration for RL-0010 unless implementation clearly requires it.
```

---

## UI Requirements

UX Required:

```text
Yes
```

Reference:

```text
user_stories/RL-0010/RL-0010_UX_SPEC.md
```

The UX specification does not exist yet and is the next workflow output.

Required UX decisions:

* Where card generation actions appear in the existing app.
* Exact card copy for workout completion, level progress, and weekly goal completion.
* Card dimensions and layout for mobile preview.
* Visual treatment that feels celebratory without exposing private performance data.
* Empty and unavailable states for card types that cannot currently be generated.

---

## Validation Rules

* Workout completion cards require a completed workout log.
* Weekly goal cards require the current weekly goal to be complete.
* Level cards require a valid current XP total and calculated level.
* Card generation must require a direct user action.
* Card generation must not happen automatically after completing a workout, reaching a level, or completing a weekly goal.
* Cards must hide weight, sets, reps, calories, and PRs by default.
* Cards must not publish anywhere automatically.
* Cards must not include public rankings, comparison, social feed, comments, likes, or followers.

---

## Edge Cases

| Scenario | Expected Behavior |
| -------- | ----------------- |
| No completed workout exists for the selected date | Do not offer a workout completion card for that date, or show a disabled/unavailable state. |
| Weekly goal is not complete | Do not offer a weekly goal completion card, or show a disabled/unavailable state. |
| XP total is zero | A level card may still show Level 1 if UX approves, but must not imply a level-up event happened. |
| Workout contains sets, reps, weight, or memo | Card hides performance metrics by default. |
| User closes preview | No card is generated or shared. |
| User generates multiple previews | No duplicate rewards or XP are granted. |

---

## Out Of Scope

* Public feed.
* Likes, comments, followers, messaging, or social graph.
* Public rankings or leaderboards.
* Automatic publishing.
* Backend, login, cloud sync, analytics SDK, or remote storage.
* Metric customization beyond the default hidden-metric policy.
* Share preferences persistence, which belongs to RL-0011.
* MVP validation dashboards, which belong to RL-0012.

---

## Task Interpretation

| Task ID | Interpretation | Status |
| ------- | -------------- | ------ |
| RL-0010-T01 | Define the three approved MVP card types, trigger moments, privacy defaults, validation rules, and scope boundaries. | Complete |
| RL-0010-T02 | UX Designer should create layouts and interaction placement for the three approved card types. | Ready |
| RL-0010-T03 | Code Writer should prepare card data from existing local services only after UX is complete. | Blocked until UX |
| RL-0010-T04 | Code Writer should implement on-device preview/generation after UX is complete. | Blocked until UX |
| RL-0010-T05 | Code Writer should enforce hidden default performance metrics. | Blocked until UX |
| RL-0010-T06 | QA Tester should validate card availability, privacy defaults, optional generation, and generated output. | Pending |
| RL-0010-T07 | Code Reviewer should review privacy, MVP scope, and platform behavior. | Pending |

---

## Risks And Mitigations

| Risk | Mitigation |
| ---- | ---------- |
| Native sharing dependency expands scope. | Allow on-device preview/generation to satisfy MVP unless UX/code identifies a direct need. |
| Cards expose sensitive performance numbers. | Explicitly hide weight, sets, reps, calories, and PRs by default. |
| Users feel pressured to share. | Keep actions secondary and user-initiated. |
| Story drifts into social product. | Exclude feed, followers, likes, comments, ranking, and auto-publishing. |

---

## Success Criteria

* Three MVP card types are defined.
* Trigger moments are defined.
* Privacy defaults are explicit.
* User-initiated generation is required.
* UX has enough direction to create layouts.
* Code Writer remains blocked until UX specification exists.

---

## Agent Handoff

Current Agent:

```text
User Story Interpreter
```

Completed Output:

```text
user_stories/RL-0010/RL-0010_INTERPRETATION.md
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

* docs/EPIC_USER_STORY_TASKS.md
* docs/PRODUCT_BRIEF.md
* docs/PROJECT_CONTEXT.md
* docs/ARCHITECTURE.md
* docs/SPRINT_PLAN.md
* user_stories/RL-0010/RL-0010_TASKS.md
* user_stories/RL-0010/RL-0010_SPRINT_PLAN.md
* user_stories/RL-0010/RL-0010_INTERPRETATION.md

Expected Output:

```text
user_stories/RL-0010/RL-0010_UX_SPEC.md
```

Blocking Conditions:

* Do not proceed to Code Writer until `user_stories/RL-0010/RL-0010_UX_SPEC.md` exists.
* Do not add backend, login, cloud sync, analytics SDK, public ranking, social graph, automatic publishing, or performance metrics visible by default.

Instructions:

* Complete RL-0010-T02 only.
* Preserve RL-0010 privacy defaults.
* Keep card generation optional and user-initiated.
* Keep all completed story states unchanged.
