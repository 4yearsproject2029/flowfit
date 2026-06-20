# Epic User Story Tasks

## Status Values

* Not Started
* In Progress
* Blocked
* On Hold
* Canceled
* Done

Default Status:

```text
Not Started
```

---

## Priority Values

* P0: Critical for MVP
* P1: Important for MVP
* P2: Post-MVP enhancement

---

## Effort Values

* XS: Less than 0.5 day
* S: 1 day
* M: 2–3 days
* L: 4–5 days
* XL: More than 1 week

---

## Epic IDs

| Epic ID | Epic                    |
| ------- | ----------------------- |
| EP-00   | Development Environment |
| EP-01   | Brand Readiness         |
| EP-02   | Onboarding              |
| EP-03   | Workout Logging         |
| EP-04   | Offline Experience      |
| EP-05   | Gamification            |
| EP-06   | Weekly Goals            |
| EP-07   | Share Cards             |
| EP-08   | Privacy                 |
| EP-09   | MVP Validation          |
| EP-10   | MVP Quality             |

---

## Development Order

```text
RL-0000
↓
RL-0001
↓
RL-0002
↓
RL-0003
↓
RL-0005
↓
RL-0004
↓
RL-0006
↓
RL-0007
↓
RL-0008
↓
RL-0009
↓
RL-0010
↓
RL-0011
↓
RL-0012
↓
RL-0013
```

---

## User Stories

| Status      | Story ID | Epic ID | Epic                    | Priority | Effort | Depends On                                  | User Story                                                                                                                                                                    | Acceptance Criteria                                                                                                                                                                                                                                                                                         |
| ----------- | -------- | ------- | ----------------------- | -------- | ------ | ------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Done        | RL-0000  | EP-00   | Development Environment | P0       | XS     | -                                           | As a developer, I want to prepare the RepLog development environment, so that future stories can be implemented consistently.                                                 | - Flutter app runs locally.<br>- Hive initialization works.<br>- Existing tests pass.<br>- PRODUCT_BRIEF.md exists.<br>- PROJECT_CONTEXT.md exists.<br>- ARCHITECTURE.md exists.                                                                                                                            |
| Not Started | RL-0001  | EP-01   | Brand Readiness         | P0       | S      | RL-0000                                     | As a beginner fitness user, I want the app to consistently present itself as RepLog, so that I trust I am using the intended habit-building product.                          | - All visible app names use RepLog instead of FlowFit.<br>- README and user-facing documentation refer to RepLog.<br>- App title and primary screen labels use RepLog.<br>- Existing workout logging behavior still works after the naming update.                                                          |
| Not Started | RL-0002  | EP-02   | Onboarding              | P0       | M      | RL-0001                                     | As a beginner fitness user, I want to choose my weekly workout goal on first launch, so that RepLog can track consistency against a realistic target.                         | - First-time users choose a weekly goal before reaching the main experience.<br>- Goal options include at least 1–5 workouts per week.<br>- The selected goal is saved locally.<br>- Returning users skip onboarding.<br>- The goal persists after app restart.                                             |
| Not Started | RL-0003  | EP-03   | Workout Logging         | P0       | M      | RL-0001                                     | As a beginner fitness user, I want to log a workout quickly, so that recording exercise does not feel like extra work.                                                        | - Users can create a workout log for the selected date.<br>- Workout name and category are required.<br>- Sets, reps, weight, and memo are optional.<br>- A valid workout can be saved in three taps or fewer after opening the add flow.<br>- New workouts appear immediately in the selected date's list. |
| Not Started | RL-0005  | EP-03   | Workout Completion      | P0       | S      | RL-0003                                     | As a user, I want to mark a workout as complete, so that RepLog can recognize that I showed up.                                                                               | - Workouts can be marked complete from the list.<br>- Completed workouts are visually distinguishable.<br>- Completion can be toggled without deleting the workout.<br>- Completion updates immediately.<br>- Completion state persists after app restart.                                                  |
| Not Started | RL-0004  | EP-04   | Offline Experience      | P0       | S      | RL-0005                                     | As a user, I want my workouts to persist offline, so that I can use RepLog without an internet connection.                                                                    | - Workout logs persist after app restart.<br>- Completion state persists after restart.<br>- Weekly goals and onboarding state persist after restart.<br>- No login or network connection is required.<br>- Users are informed that uninstalling the app or changing devices may result in data loss.       |
| Not Started | RL-0006  | EP-05   | Gamification - XP       | P0       | L      | RL-0005                                     | As a user, I want to earn XP when I complete a workout, so that I feel motivated to stay consistent.                                                                          | - Completing a workout grants XP once.<br>- XP updates immediately.<br>- XP persists after app restart.<br>- Toggling, editing, deleting, or recreating workouts does not duplicate XP.<br>- Users can see why XP was awarded.                                                                              |
| Not Started | RL-0007  | EP-05   | Gamification - Levels   | P0       | M      | RL-0006                                     | As a user, I want to see my level and progress toward the next level, so that my consistency feels visible.                                                                   | - The home screen displays current level.<br>- The app displays XP progress toward the next level.<br>- Progress updates immediately after XP changes.<br>- Levels never decrease.<br>- Level progress persists after app restart.                                                                          |
| Not Started | RL-0008  | EP-06   | Weekly Goals            | P0       | M      | RL-0002, RL-0005                            | As a user, I want to see progress toward my weekly workout goal, so that I know whether I am staying consistent.                                                              | - The app displays the selected weekly goal.<br>- The app displays completed workouts for the current week.<br>- Progress updates immediately.<br>- Goal completion is recognized when the target is reached.<br>- Goal progress persists after app restart.                                                |
| Not Started | RL-0009  | EP-06   | Consistency Recovery    | P1       | S      | RL-0008                                     | As a user, I want RepLog to handle missed weeks without harsh punishment, so that I feel encouraged to return.                                                                | - Missing a workout week does not remove XP.<br>- Missing a workout week does not reduce levels.<br>- Returning after a missed week is detectable for metrics.<br>- The app displays encouraging language after returning.<br>- Planned rest days do not count as failures.                                 |
| Not Started | RL-0010  | EP-07   | Share Cards             | P1       | L      | RL-0006, RL-0007, RL-0008                   | As a user, I want to create a share card for workout completion, level-up, or weekly goal completion, so that I can celebrate progress without exposing embarrassing numbers. | - Users can generate workout completion cards.<br>- Users can generate level-up cards.<br>- Users can generate weekly goal cards.<br>- Weight, sets, reps, calories, and PRs are hidden by default.<br>- Share card generation is optional and user-initiated.                                              |
| Not Started | RL-0011  | EP-08   | Privacy                 | P1       | M      | RL-0010                                     | As a user, I want control over which metrics appear on share cards, so that I can share progress comfortably.                                                                 | - Share cards show consistency-focused metrics by default.<br>- Users can preview cards before sharing.<br>- Hidden performance metrics require explicit opt-in.<br>- Share cards are never published automatically.<br>- Share preferences persist locally.                                                |
| Not Started | RL-0012  | EP-09   | MVP Validation          | P1       | M      | RL-0004, RL-0008, RL-0010                   | As a product stakeholder, I want local MVP validation metrics, so that I can evaluate whether RepLog improves consistency.                                                    | - The app calculates weekly goal completion rate locally.<br>- The app calculates average workouts per week locally.<br>- The app calculates average share cards generated locally.<br>- The app detects returns after missed weeks.<br>- Metrics require no login or backend.                              |
| Not Started | RL-0013  | EP-10   | MVP Quality             | P1       | S      | RL-0001, RL-0004, RL-0006, RL-0008, RL-0010 | As a beginner fitness user, I want the MVP experience to be accessible and reliable, so that I can use RepLog comfortably during workouts.                                    | - Core screens use readable text and large touch targets.<br>- Primary flows work on common iPhone screen sizes.<br>- Offline logging, XP, goals, and share cards pass manual QA.<br>- `flutter analyze` passes.<br>- `flutter test` passes.                                                                |

---

## Coordinator Rules

* The Coordinator updates story status automatically.
* Only one P0 story should be `In Progress` at a time.
* Stories cannot start until dependencies are `Done`.
* Release Manager changes completed stories to `Done`.
* Blocked stories require a blocker note.
* On Hold stories require a resume condition.
* Canceled stories must include a reason.

---

## Definition of Done

A story is considered `Done` only when:

* Acceptance criteria are satisfied.
* Code review is approved.
* QA test script passes.
* `flutter analyze` passes.
* `flutter test` passes.
* Documentation is updated.
* `DEVELOPMENT_LOG.md` is updated.
* Release Manager marks the story as `Done`.
