# RepLog Codebase Audit

## Current State Summary

The current codebase is a small Flutter workout tracker still branded as FlowFit. It already has a useful offline-first foundation for RepLog: app startup initializes Hive, the home screen shows a weekly calendar, users can add date-based workout logs, workout logs can be marked complete or deleted, and a rest timer is available during the workout flow. The existing tests cover the home screen, a small iPhone-sized viewport, timer preset selection, and adding a workout log.

Existing FlowFit functionality that can be reused:

* Flutter app shell in `lib/main.dart`.
* Hive initialization in `lib/data/local/local_database.dart`.
* Local workout and workout-log persistence through Hive.
* Date-based workout logging UI in `lib/features/home/screens/home_screen.dart`.
* Weekly calendar widget in `lib/features/calendar/widgets/weekly_calendar.dart`.
* Workout list, item, and add button widgets in `lib/features/workout/widgets/`.
* Rest timer in `lib/features/timer/widgets/rest_timer.dart`.
* Existing widget tests in `test/widget_test.dart`.
* iOS Flutter target and generated platform scaffolding.

What already supports the RepLog MVP:

* Offline-first behavior is already present through Hive.
* No login, backend, cloud sync, social graph, public ranking, or analytics SDK is present.
* The workout log model already supports the core fields RepLog needs for fast workout logging: date, workout name, category, completion state, optional sets, reps, weight, memo, and created timestamp.
* Completion state is already persisted on workout logs.
* The existing feature-based folders roughly match the target RepLog architecture.
* The documentation in `docs/PROJECT_CONTEXT.md`, `docs/PRODUCT_BRIEF.md`, and `docs/ARCHITECTURE.md` is already RepLog-oriented.

What conflicts with the RepLog direction:

* Visible app branding is still FlowFit in `lib/main.dart`, `HomeScreen`, `README.md`, tests, `pubspec.yaml`, and iOS app labels.
* The current home screen is workout-tool oriented, not RepLog habit-progress oriented. It does not show XP, level, weekly goal progress, badges, streaks, or share-card moments.
* Several architecture placeholder files are empty, including repositories, providers, theme, constants, utilities, shared layout, and shared button files.
* `StorageService` is used directly from `HomeScreen`, so persistence and UI are coupled more tightly than the target architecture recommends.
* Riverpod is documented as the target state-management choice, but the app currently uses `StatefulWidget` plus direct Hive listenables.
* The current package name is `flowfit`, and changing it later may affect imports and tests.
* Generated non-iOS targets exist, but the RepLog MVP scope is iOS only. They should not drive near-term implementation decisions.

## Reusable Assets

Reusable code and screens:

* `lib/main.dart` - app shell, Hive initialization, `MaterialApp` setup.
* `lib/features/home/screens/home_screen.dart` - primary workout logging screen, date selection state, add-workout sheet.
* `lib/features/calendar/widgets/weekly_calendar.dart` - current-week selector.
* `lib/features/timer/widgets/rest_timer.dart` - rest timer component.
* `lib/features/workout/widgets/workout_list.dart` - sorted workout-log list.
* `lib/features/workout/widgets/workout_item.dart` - completion checkbox, workout details, delete action.
* `lib/features/workout/widgets/add_workout_button.dart` - add-workout action.

Reusable models and persistence:

* `lib/data/models/workout.dart` - reusable as a workout template or catalog model if RepLog later needs saved workout definitions.
* `lib/data/models/workout_log.dart` - directly reusable as the core workout logging record.
* `lib/data/models/workout_category.dart` - reusable as an initial category list, though labels may need friendlier capitalization.
* `lib/data/local/local_database.dart` - reusable Hive bootstrap and adapter registration pattern.
* `lib/data/services/storage_service.dart` - reusable as a short-term persistence access layer, though it should be split or wrapped when goals and gamification are added.

Reusable tests:

* `test/widget_test.dart` - reusable coverage for app startup, home screen rendering, timer preset selection, small iPhone layout, and add-workout behavior.

Reusable folders:

* `lib/features/home/`
* `lib/features/workout/`
* `lib/features/calendar/`
* `lib/features/timer/`
* `lib/data/local/`
* `lib/data/models/`
* `lib/data/services/`
* `test/`
* `docs/`
* `user_stories/`

Reusable documentation:

* `docs/PROJECT_CONTEXT.md`
* `docs/PRODUCT_BRIEF.md`
* `docs/ARCHITECTURE.md`
* `docs/EPIC_USER_STORY_TASKS.md`
* `docs/brainstorm/`

## Required Refactors

* Branding migration: Rename visible app strings from FlowFit to RepLog in `lib/main.dart`, `HomeScreen`, `README.md`, widget tests, and iOS app labels.
* Branding migration: Decide whether the Dart package name remains `flowfit` temporarily or migrates to `replog` in a separate, explicit package-rename story.
* Branding migration: Update iOS `CFBundleDisplayName`, `CFBundleName`, and bundle identifier references when app-store-facing identity is ready.
* Documentation gap: `README.md` still describes FlowFit as an MVP complete personal workout tracker and should be rewritten for the RepLog direction.
* Architecture cleanup: Empty placeholder files in `core/`, `providers/`, `repositories/`, and `shared/` create confusion. Fill them only when needed or remove them in a focused cleanup.
* Architecture cleanup: `HomeScreen` currently owns calendar state, workout form state, validation, persistence calls, and layout. Split gradually as RepLog features are implemented.
* Architecture cleanup: `StorageService` is a practical current layer, but it will become too broad once goals, XP, progress, badges, and share-card events are added.
* Architecture cleanup: Riverpod is documented but not installed or used. Introduce it only when a feature needs provider-based state, not as a standalone rewrite.
* Data model gap: There are no models for weekly goals, XP ledger entries, user progress, badges, app settings, onboarding state, or share-card events.
* Data model gap: `WorkoutLog` has `memo`, but the current add-workout UI does not expose it.
* Data model gap: Date keys use strings in `yyyy-MM-dd` format. Keep this convention or document a migration before changing it.
* Gamification gap: No XP award rules, XP ledger, level calculation, badge unlock logic, or celebration state exists.
* Gamification gap: Completion toggles are not idempotently connected to rewards yet, so XP should not be added without a duplicate-prevention design.
* Goal tracking gap: No weekly goal model, onboarding selection, goal progress calculation, or weekly completion history exists.
* Persistence gap: Hive currently opens only `workoutBox` and `workoutLogBox`; RepLog MVP will need additional local boxes for goals, progress, XP, badges, settings, and share-card events.
* Persistence gap: No migration strategy exists for future Hive adapter changes.
* UI/UX gap: The app experience is still a workout tracker, not a habit-building RepLog dashboard.
* UI/UX gap: Current copy is functional but not beginner-focused or celebration-oriented.
* UI/UX gap: The add-workout flow requires several fields to be considered by the user, even though only workout name is technically required.
* UI/UX gap: Share cards, privacy defaults for shareable metrics, and optional export flows do not exist.
* Test gap: Tests assert FlowFit strings and must change during brand migration.
* Test gap: There are no unit tests for persistence sorting, completion toggle persistence after restart, goal calculation, XP idempotency, level progress, or Hive adapter compatibility.
* Test gap: There is no iOS manual QA script for the RepLog MVP flows.
* Documentation gap: Existing docs define RepLog direction, but there is no codebase-specific migration audit until this file.

## Recommended First User Story

Story ID: RL-0001

Title: Brand Readiness - RepLog Naming Migration

User Story:

As a beginner fitness user, I want the app to consistently present itself as RepLog, so that I trust I am using the intended habit-building product.

Acceptance Criteria:

* All visible app names use RepLog instead of FlowFit.
* README and user-facing documentation refer to RepLog.
* App title and primary screen labels use RepLog.
* iOS display name uses RepLog.
* Existing workout logging behavior still works after the naming update.
* Existing widget tests are updated to expect RepLog branding.
* No backend, login, sync, analytics SDK, social graph, or public ranking is added.

Files likely affected:

* `lib/main.dart`
* `lib/features/home/screens/home_screen.dart`
* `test/widget_test.dart`
* `README.md`
* `ios/Runner/Info.plist`
* Possibly `docs/SPRINT_PLAN.md` and story artifacts if the story workflow requires status updates

Risks:

* Renaming the Dart package from `flowfit` to `replog` could create a larger import and platform-configuration change than needed for the first story.
* iOS bundle identifier changes can affect installed-app identity and should be handled deliberately.
* Tests that assert exact text will fail until updated.
* Over-expanding the story into package renaming, app icons, onboarding, XP, or goals would increase risk without improving the first conversion step.

Definition of Done:

* User-visible FlowFit strings in the app shell, primary screen, README, tests, and iOS display label are migrated to RepLog.
* Existing workout logging, completion toggle, delete action, calendar selection, and rest timer behavior are preserved.
* `flutter analyze` passes.
* `flutter test` passes.
* No new feature systems are introduced.
* The change remains small enough for a focused review.

## Do Not Change Yet

* Do not rewrite the app from scratch.
* Do not rename the Dart package, bundle identifiers, Android namespace, or generated platform project names unless a dedicated story explicitly includes that scope.
* Do not add login, accounts, backend services, cloud sync, Firebase, Supabase, analytics SDKs, social graph, public ranking, messaging, comments, followers, or leaderboards.
* Do not implement XP, levels, badges, streaks, or reward rules until the workout completion and idempotency design is ready.
* Do not implement weekly goals before onboarding and local goal persistence are scoped.
* Do not implement share cards before core progress and privacy defaults exist.
* Do not add Riverpod as a broad migration. Introduce it incrementally when a story needs it.
* Do not replace Hive or redesign persistence without a specific migration reason.
* Do not remove working workout logging behavior.
* Do not prioritize Android, web, desktop, Apple Watch, push notifications, or cloud backup for the iOS MVP.
* Do not add large architecture layers, code generators, or dependency-heavy frameworks before they directly support a RepLog MVP story.
