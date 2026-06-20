# Architecture

## High-Level Design

RepLog uses a local-first Flutter architecture built around feature modules, Riverpod state management, and Hive persistence.

The existing FlowFit app already has a workable foundation:

* Flutter and Dart application shell
* Feature folders for home, workout, calendar, and timer
* Hive initialization in `LocalDatabase`
* Hive-backed workout and workout-log models
* `StorageService` as the current persistence access layer
* Offline-first behavior without authentication or backend services

RepLog should evolve from the existing codebase instead of being redesigned from scratch.

Decision:

Use a feature-based, local-first architecture with shared data, service, repository, and provider layers.

Reason:

This keeps MVP development simple while allowing RepLog-specific modules such as goals, gamification, onboarding, and share cards to grow independently.

---

## Components

* `App Shell`: initializes Flutter, Hive, app theme, routing, and root screen.
* `Onboarding Feature`: first-run flow for weekly goal setup and basic user preference selection.
* `Home Feature`: dashboard for level, XP progress, weekly goal, selected date, workout list, and quick actions.
* `Workout Feature`: workout creation, completion, deletion, and workout-list display.
* `Calendar Feature`: week navigation and date selection.
* `Timer Feature`: rest timer support.
* `Goals Feature`: weekly workout target, progress calculation, and weekly completion history.
* `Gamification Feature`: XP rewards, level progression, badges, streaks, and celebration state.
* `Share Cards Feature`: share-card preview, visible metrics, privacy defaults, and platform export.
* `Data Layer`: Hive models, local database initialization, repositories, and local services.
* `Shared UI`: reusable widgets, layouts, empty states, and common components.
* `Core`: constants, theme, utilities, and app-wide configuration.

---

## State Management

Decision:

Use Riverpod for state management.

Alternatives Considered:

* Provider
* Bloc
* StatefulWidget-only state
* GetX

Pros:

* Good balance between simplicity and scalability
* Explicit dependency management
* Easier testing of providers and services
* Suitable for feature-based architecture
* Supports future modular growth

Cons:

* Requires additional learning and structure
* Existing stateful logic may need gradual migration

Reason:

RepLog will need reactive updates for workout completion, XP, level progress, weekly goals, badges, and share-card events. Riverpod provides enough structure without forcing heavy architecture.

Migration rule:

Do not refactor all existing screens at once. Introduce Riverpod gradually when implementing new RepLog features.

---

## Data Flow

Primary workout completion flow:

```text
User selects date
→ User logs or completes workout
→ Workout feature validates input
→ Repository/service writes WorkoutLog to Hive
→ Gamification service evaluates XP, weekly goal, level, and badge changes
→ XP ledger and progress records are written to Hive
→ Riverpod providers notify UI
→ User sees updated workout list, XP bar, and progress
→ User may generate a share card
→ Share-card event is stored locally
```

Weekly goal flow:

```text
Workout logs for current week
→ WeeklyGoal target
→ Goal progress calculation
→ Weekly goal completion event
→ XP ledger entry
→ UserProgress update
→ Optional share card moment
```

Onboarding flow:

```text
First app launch
→ User selects weekly workout target
→ App creates WeeklyGoal
→ App initializes UserProgress
→ User lands on Home screen
```

Share card flow:

```text
Workout / Level / Goal event
→ Share card data prepared
→ Flutter widget rendered as image
→ User previews card
→ User exports or shares through native share sheet
→ ShareCardEvent stored locally
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
      xp_ledger_entry.dart
      user_progress.dart
      badge.dart
      share_card_event.dart
      app_settings.dart
    repositories/
      workout_repository.dart
      progress_repository.dart
      goal_repository.dart
      share_card_repository.dart
    services/
      storage_service.dart
      xp_service.dart
      level_service.dart
      metrics_service.dart
  features/
    onboarding/
    home/
    workout/
    calendar/
    timer/
    goals/
    gamification/
    share_cards/
  shared/
    layouts/
    widgets/
test/
docs/
user_stories/
```

Existing files should be moved only when there is a product reason or clear maintainability benefit.

---

## External Dependencies

Current dependencies:

* Flutter SDK
* Dart
* `hive`
* `hive_flutter`
* `cupertino_icons`
* `flutter_lints`
* `flutter_test`

Recommended MVP additions:

* `flutter_riverpod` for state management
* `share_plus` for native sharing when share cards are implemented

Optional later additions:

* `path_provider`
* `screenshot` or equivalent widget-to-image package
* `confetti`
* `lottie`

Dependency policy:

Add dependencies only when they directly support MVP user value.

---

## Authentication

RepLog MVP has no authentication.

Decision:

Do not implement login, account creation, or anonymous remote identity for MVP.

Reason:

Authentication is explicitly out of MVP scope and would add friction before the core habit loop is validated.

---

## Persistence Strategy

RepLog persists MVP data locally with Hive boxes.

Existing boxes:

* `workoutBox`
* `workoutLogBox`

Recommended new boxes:

* `weeklyGoalBox`
* `xpLedgerBox`
* `userProgressBox`
* `badgeBox`
* `shareCardEventBox`
* `appSettingsBox`

Model rules:

* Use stable IDs for persisted records.
* Keep immutable ledger entries for XP and share-card events.
* Version adapters carefully.
* Avoid changing Hive read/write order without a migration plan.
* Keep date keys consistent with the existing `yyyy-MM-dd` pattern unless a migration is documented.

---

## XP and Progress Strategy

Decision:

Use immutable XP ledger entries and derive `UserProgress` from the ledger.

Flow:

```text
Rewardable action
→ Create XpLedgerEntry
→ Recalculate UserProgress
→ Update UI
```

Reasons:

* Prevents duplicate XP rewards
* Makes XP history auditable
* Supports future badges and achievements
* Allows recalculation if reward rules change later

Important rule:

Workout completion XP must be idempotent. Toggling, editing, deleting, or recreating workouts must not create duplicate XP rewards.

---

## Error Handling Strategy

* Validate required workout fields before saving.
* Treat storage failures as user-visible errors, not silent failures.
* Keep XP award operations idempotent.
* If gamification update fails after workout save, preserve the workout and allow progress recalculation.
* Show non-alarming recovery messages for local storage or share failures.
* Log local debug information during development without collecting private user data.

---

## Testing Strategy

Testing should focus on behavior that can easily break user trust.

Priority test areas:

* Workout creation and persistence
* Workout completion toggle behavior
* Duplicate XP prevention
* Weekly goal calculation
* XP ledger creation
* UserProgress recalculation
* Hive adapter compatibility
* App restart persistence
* Existing FlowFit features after RepLog additions

Recommended test types:

* Unit tests for `xp_service.dart`
* Unit tests for `level_service.dart`
* Unit tests for weekly goal calculation
* Widget tests for XP bar and goal progress display
* Manual QA scripts for full user flows

Minimum before release:

* `flutter analyze`
* `flutter test`
* Manual test on real iPhone

---

## Scalability Considerations

MVP scale is single-user, single-device, local-first.

Expected local data volume is low:

* Workout logs
* Weekly goals
* XP ledger entries
* Badge unlock records
* Share-card events
* App settings

Architecture should support future growth by:

* Keeping persistence behind repositories/services
* Avoiding direct Hive usage throughout UI widgets
* Maintaining stable model IDs and timestamps
* Separating derived summaries from source records
* Keeping future cloud sync optional

---

## Future Considerations

* RepLog brand migration from FlowFit package names, app labels, README content, and UI strings
* Optional cloud backup and synchronization
* Authentication through Apple Sign In or Google Sign In if cloud sync is introduced
* Android and web support after MVP validation
* Share-card image export and native platform sharing
* External analytics if local validation is insufficient
* Apple Watch integration
* Push notifications for habit reminders
* Seasonal challenges and cosmetic rewards
* Data migration from local-only Hive boxes to synced storage
* Accessibility review for all core logging, progress, and sharing flows
