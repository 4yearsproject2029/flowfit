# Architecture

## High-Level Design

RepLog uses a local-first Flutter architecture organized around the approved user journeys in `docs/USER_JOURNEY.md`.

RepLog is not a workout logging app. It is a Workout Flow Assistant.

Architectural direction:

```text
Home Dashboard -> Current Workout -> Workout Summary -> Achievement / Return Motivation
```

The architecture should strengthen the core product loop:

```text
Guide -> Complete -> Celebrate -> Reward -> Come Back
```

Decision:

Use a feature-based, local-first architecture with clear screen responsibilities, shared local data services, and gradual extraction from existing MVP surfaces.

Reason:

The MVP is complete and functional. Phase 2 should refine UI/UX, navigation, and feature boundaries without rewriting working local persistence or completed MVP behavior.

---

## Journey-Aligned Components

| Component | Responsibility | Journey |
| --------- | -------------- | ------- |
| `App Shell` | Initializes Flutter, Hive, app theme, routing, and root navigation. | Shared |
| `Home Feature` | Daily overview and entry point. Answers "What should I do today?" | Workout Flow |
| `Current Workout Feature` | Guided workout execution. Answers "What should I do next?" | Workout Flow |
| `Workout Summary Feature` | Immediate post-completion celebration, XP/reward explanation, and optional share-card entry point. | Workout Flow / Achievement & Growth |
| `Week Feature` | Lightweight weekly workout planning. | Workout Planning |
| `History Feature` | Read-only review of completed workout records. | Workout Review |
| `Achievement Feature` | Level, XP, achievements, milestones, and long-term recognition. | Achievement & Growth |
| `Floating Rest Timer` | Global workout-flow overlay that remains available while navigating. | Workout Flow |
| `Onboarding Feature` | First-run weekly goal setup and simple starting preference collection. | Shared |
| `Goals Feature` | Weekly target, progress calculation, completion recognition, and recovery state. | Workout Planning / Achievement & Growth |
| `Gamification Feature` | XP rewards, level progression, achievement unlocks, and celebration state. | Achievement & Growth |
| `Share Cards Feature` | User-initiated card preview, privacy controls, and local generation events. | Achievement & Growth |
| `Data Layer` | Hive models, local database initialization, repositories, and local services. | Shared |
| `Shared UI` | Reusable widgets, layouts, empty states, overlays, and common controls. | Shared |
| `Core` | Constants, theme, utilities, and app-wide configuration. | Shared |

---

## Screen Responsibility Rules

### Home Dashboard

Home Dashboard answers:

```text
What should I do today?
```

Home may show:

* Achievement card.
* Today's workout card.
* Weekly workout card.
* Start or resume workout action.

Home must not become:

* Workout history.
* Exercise editor.
* Rest timer screen.
* Muscle map.
* Share-card gallery.
* Detailed statistics or analytics dashboard.

### Current Workout

Current Workout answers:

```text
What should I do next?
```

Current Workout owns:

* Active workout steps.
* Exercise-to-rest-to-next-exercise flow.
* Completion action.
* Active rest timer entry points.
* Resume state for an interrupted workout.

Current Workout should not become a historical record editor or analytics surface.

### Workout Summary

Workout Summary appears immediately after completion.

It owns:

* Completion celebration.
* XP/reward explanation.
* Weekly goal progress update.
* Level or achievement recognition.
* Optional share-card entry point.

Workout Summary cannot be reopened from History. History reviews completed records; Summary celebrates the just-completed workout.

### Week

Week owns planning:

* Weekly workout plan.
* Add, edit, delete, reorder, and change-day planning actions.
* Auto-save planning behavior.

Workout execution belongs to Current Workout.

### History

History owns read-only review:

* Completed workout record list.
* Completed workout detail.

History should avoid editing historical records unless a later story explicitly expands the review journey.

### Achievement

Achievement owns long-term recognition:

* Level.
* XP.
* Achievements.
* Milestones.
* Rewards.

Achievement should reinforce motivation and consistency, not competition.

---

## State Management

Decision:

Use the simplest state management that preserves completed MVP behavior while allowing journey-aligned extraction.

Current rule:

* Preserve existing local state and service patterns where they work.
* Introduce or expand Riverpod gradually only when a Phase 2 story needs shared reactive state across Home, Current Workout, Summary, Week, History, Achievement, or the floating Rest Timer.
* Do not perform a standalone state-management rewrite.

Target shared state areas:

* Active workout session.
* Floating rest timer.
* Workout records.
* Weekly goal progress.
* XP and level progress.
* Achievement unlocks.
* Share-card preferences and events.

---

## Data Flow

### Guided Workout Flow

```text
Home Dashboard
-> Start / Resume Workout
-> Current Workout loads today's plan or selected workout
-> User completes exercise step
-> Rest Timer starts when relevant
-> Current Workout advances to next step
-> User completes workout
-> Workout record is saved locally
-> Rewards and weekly progress are evaluated
-> Workout Summary celebrates completion
-> User returns to Home with updated daily and weekly state
```

### Reward Flow

```text
Workout completion
-> Idempotent XP evaluation
-> Weekly goal progress evaluation
-> Level and achievement evaluation
-> Local persistence update
-> Workout Summary and Achievement state refresh
```

### Planning Flow

```text
Week
-> User edits weekly plan
-> Plan auto-saves locally
-> Home Dashboard updates today's workout preview
-> Current Workout uses plan as execution input
```

### Review Flow

```text
History
-> Completed workout list
-> Workout detail
-> Read-only record display
-> Return to History or Home
```

### Share Card Flow

```text
Completion / Level / Goal event
-> Share card data prepared
-> User previews card
-> Hidden performance metrics remain hidden unless opted in
-> User exports or dismisses
-> ShareCardEvent stored locally
```

---

## Folder Structure

Target folder structure:

```text
lib/
  main.dart
  core/
    constants/
    theme/
    utils/
  data/
    local/
      local_database.dart
    models/
      workout.dart
      workout_log.dart
      weekly_goal.dart
      workout_plan.dart
      workout_session.dart
      xp_ledger_entry.dart
      user_progress.dart
      achievement.dart
      share_card_event.dart
      app_settings.dart
    repositories/
      workout_repository.dart
      plan_repository.dart
      progress_repository.dart
      goal_repository.dart
      achievement_repository.dart
      share_card_repository.dart
    services/
      storage_service.dart
      workout_flow_service.dart
      rest_timer_service.dart
      xp_service.dart
      level_service.dart
      achievement_service.dart
      metrics_service.dart
  features/
    onboarding/
    home/
    current_workout/
    workout_summary/
    week/
    history/
    achievement/
    goals/
    gamification/
    share_cards/
  shared/
    layouts/
    widgets/
    overlays/
test/
docs/
user_stories/
```

Existing files should be moved only when a Phase 2 story needs the new boundary. Do not move files for cosmetic architecture alignment alone.

---

## Persistence Strategy

RepLog persists data locally with Hive.

Existing and completed MVP storage covers:

* Workouts and workout logs.
* Weekly goal and onboarding state.
* XP and progress state.
* Planned rest and recovery state.
* Share-card preferences and events.
* Local validation metrics.

Potential Phase 2 additions:

* Workout plan records.
* Active workout session state.
* Workout summary event state.
* Achievement unlock records if distinct from existing level/progress state.
* Floating rest timer state if it must survive navigation or app lifecycle transitions.

Model rules:

* Use stable IDs for persisted records.
* Keep reward and share-card events idempotent.
* Version adapters carefully.
* Avoid changing Hive read/write order without a migration plan.
* Keep date keys consistent with the existing `yyyy-MM-dd` pattern unless a migration is documented.

---

## XP, Achievement, And Recognition Strategy

Decision:

Reward consistency and completion, not athletic superiority.

Rules:

* Workout completion XP must be idempotent.
* Levels never decrease.
* Missed weeks do not remove XP or levels.
* Planned rest should not feel like failure.
* Achievement language should recognize showing up, returning, finishing, and maintaining consistency.
* Performance metrics should not drive the primary reward experience.

Reward surfaces:

* Workout Summary for immediate completion recognition.
* Home Dashboard for short-term progress and next action.
* Achievement for long-term growth.
* Share Cards for optional private-by-default celebration.

---

## Rest Timer Strategy

The Rest Timer belongs to Workout Flow.

It should behave as a global floating overlay while a workout is active.

Target behavior:

```text
Current Workout
-> Rest Started
-> User navigates Home / Week / History / Achievement
-> Floating Rest Timer remains available
-> User resumes Current Workout
```

The timer should not be presented as Dashboard content.

---

## External Dependencies

Current dependency policy:

* Add dependencies only when they directly support Phase 2 user value.
* Avoid dependencies that introduce backend, login, cloud sync, social graph, public ranking, or external analytics SDK requirements.

Existing dependencies:

* Flutter SDK
* Dart
* `hive`
* `hive_flutter`
* `cupertino_icons`
* `flutter_lints`
* `flutter_test`

Potential additions should be story-driven and reviewed against the approved user journey.

---

## Authentication

RepLog MVP and Phase 2 have no authentication.

Decision:

Do not implement login, account creation, or anonymous remote identity.

Reason:

Authentication adds friction before the core guided workout loop is validated.

---

## Error Handling Strategy

* Validate required workout and planning fields before saving.
* Treat storage failures as user-visible errors, not silent failures.
* Preserve completed workout records if reward calculation fails, then allow progress recalculation.
* Keep XP award operations idempotent.
* Show non-alarming recovery messages for local storage, timer, or share failures.
* Log local debug information during development without collecting private user data.

---

## Testing Strategy

Testing should focus on behavior that can break user trust or interrupt the core loop.

Priority test areas:

* Dashboard next-action state.
* Current Workout step progression.
* Workout completion and Summary display.
* Rest Timer continuity across navigation.
* Workout planning auto-save.
* History read-only review behavior.
* XP and level idempotency.
* Weekly goal calculation.
* Achievement and reward display.
* Share-card privacy defaults.
* Local persistence after app restart.
* Common iPhone layouts and accessibility touch targets.

Recommended validation:

* Unit tests for services and calculations.
* Widget tests for screen responsibility and primary flows.
* Manual QA scripts for full journey validation.
* `flutter analyze`.
* `flutter test`.
