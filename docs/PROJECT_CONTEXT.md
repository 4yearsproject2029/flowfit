# Project Context

## Document Metadata

Project Name:

```text
RepLog
```

Project Code Prefix:

```text
RL
```

Created Date:

```text
2026-06-20
```

Last Updated:

```text
2026-06-29
```

Owner:

```text
Solution Architect Agent
```

Status:

```text
Draft
```

---

## Source Of Truth

This document is the authoritative source for:

* Technical goals
* Platform constraints
* Supported environments
* Technology stack
* Integration boundaries
* Security requirements
* Data ownership

Product decisions belong to:

```text
docs/PRODUCT_BRIEF.md
```

Architecture decisions belong to:

```text
docs/ARCHITECTURE.md
```

Backlog decisions belong to:

```text
docs/EPIC_USER_STORY_TASKS.md
```

---

## Product Vision

Reference:

```text
docs/PRODUCT_BRIEF.md
```

RepLog turns fitness consistency into a game.

The product helps beginner and returning fitness users build sustainable workout habits through fast workout logging, XP, levels, badges, weekly goals, and optional share cards. Users should feel proud that they showed up, even before they see major physical results.

Users choose RepLog because it emphasizes consistency, encouragement, and low-pressure progress instead of athletic superiority, public comparison, or advanced performance analytics.

---

## Current State

RepLog is evolving from an existing Flutter workout tracker currently named FlowFit in code, UI strings, package metadata, app labels, tests, and README content.

The current implementation already includes:

* Flutter and Dart application shell.
* A home screen with weekly calendar, date selection, workout list, add-workout bottom sheet, and rest timer.
* Hive initialization through `LocalDatabase`.
* Hive-backed `Workout` and `WorkoutLog` models.
* Local `workoutBox` and `workoutLogBox` persistence.
* `StorageService` as the current local persistence access layer.
* Widget tests covering home-screen rendering, small iPhone layout, rest timer preset selection, and adding a workout log.
* Generated platform targets for iOS, Android, web, macOS, Windows, and Linux.

Existing limitations:

* Visible app identity remains FlowFit instead of RepLog.
* MVP scope is iOS, but generated non-iOS targets remain in the repository.
* No onboarding, weekly goal, XP, level, badge, share-card, or local validation metric system exists yet.
* Several placeholder files exist under `core/`, provider, repository, shared layout, and shared widget folders.
* `HomeScreen` currently owns UI state, form validation, and direct persistence calls.
* Riverpod is documented as the target state-management direction but is not installed or used yet.

---

## Target State

After MVP completion, RepLog should be a local-first Flutter iOS app that preserves useful FlowFit workout logging behavior while presenting a consistent RepLog experience.

Target technical state:

* iOS MVP app with fast, beginner-friendly workout logging.
* Offline-first usage with local Hive persistence.
* No login, backend, cloud sync, social graph, messaging, public ranking, or public profile requirement.
* Local data ownership for workouts, goals, XP/progress, badges, app settings, and share-card events.
* Optional, user-initiated share-card export using platform-native sharing when that feature is implemented.
* Simple architecture suitable for a solo developer.
* Future-compatible path for optional Android, web, cloud backup, multi-device sync, Apple Sign In, external analytics, Apple Watch, and push notifications without requiring a full rewrite.

Deep feature flows, component boundaries, model expansion, persistence boxes, XP ledger rules, testing strategy, and future dependency choices are maintained in:

```text
docs/ARCHITECTURE.md
```

---

## Technical Goals

Project-specific goals:

* Preserve the existing Flutter workout tracker foundation where it supports RepLog's MVP.
* Keep the app offline-first and usable without account creation.
* Make workout logging fast enough to use during or immediately after exercise.
* Support local persistence for workouts, goals, XP, levels, badges, app settings, and share-card events.
* Keep architecture simple, maintainable, low-cost, and suitable for a solo developer.
* Avoid unnecessary rewrites, broad refactors, or new infrastructure before product validation requires them.
* Allow future cloud backup, multi-device sync, Android support, and richer gamification without forcing an MVP rewrite.

---

## Supported Platforms

* MVP: iOS.
* Existing generated targets in repository: Android, web, macOS, Windows, and Linux.
* Future possible platforms: Android and web after MVP validation.
* Out of scope for MVP: Desktop platforms.

Generated non-iOS platform folders should be preserved unless a later story explicitly changes platform scope.

---

## Tech Stack

### Frontend

| Technology | Purpose | Reason |
| ---------- | ------- | ------ |
| Flutter | Application frontend | Existing app already uses Flutter and can support rapid iteration plus future Android/web optionality. |
| Dart | Application language | Native language for Flutter and already used by the codebase. |
| Material 3 | UI foundation | Already used by the app and sufficient for MVP UI iteration. |

### Backend

| Technology | Purpose | Reason |
| ---------- | ------- | ------ |
| None | Not required for MVP | RepLog MVP excludes backend, login, cloud sync, social graph, messaging, and public ranking. |

### Database / Persistence

| Technology | Purpose | Reason |
| ---------- | ------- | ------ |
| Hive | Local object persistence | Already integrated, offline-capable, and aligned with local-first MVP requirements. |
| Hive Flutter | Flutter integration for Hive | Already used for app-local persistence and listenable updates. |

### Analytics

| Technology | Purpose | Reason |
| ---------- | ------- | ------ |
| Local event summaries | MVP validation metrics | Supports private, device-local validation without network, account, or analytics SDK complexity. |

External analytics SDKs are not required for MVP.

### CI/CD

| Technology | Purpose | Reason |
| ---------- | ------- | ------ |
| Local Flutter validation commands | MVP validation | `flutter analyze` and `flutter test` are sufficient for early MVP development. |

Full CI/CD is not required until release cadence or team workflow requires it.

---

## Architecture Principles

Prioritize:

* Simple > Complex
* Local First > Cloud First
* Maintainability > Optimization
* Evolutionary Architecture > Big Design Up Front
* User Value > Technical Elegance

Project-specific principles:

* Preserve working code unless a change is required for RepLog's product direction.
* Reuse existing FlowFit workout logging, calendar, timer, Hive setup, and tests where practical.
* Keep data ownership clear: UI reads state, services/repositories manage persistence, models define persisted data.
* Introduce Riverpod gradually when feature complexity requires it; do not perform a standalone state-management rewrite.
* Add dependencies only when they directly support MVP user value.
* Avoid hidden cloud, social, or analytics dependencies in MVP.

---

## Existing Codebase Rules

* Reuse existing patterns where they support RepLog.
* Preserve working workout logging behavior.
* Extend before replacing.
* Avoid broad rewrites and unrelated refactors.
* Keep generated non-iOS platform folders unless platform scope is explicitly changed.
* Do not rename the Dart package, bundle identifiers, Android namespace, or generated project names unless a dedicated story requires it.
* Keep existing Hive adapter read/write order stable unless a migration plan is documented.
* Document migration requirements before changing persisted model structure.
* Treat implementation as the technical source of truth when documentation conflicts with working code.

---

## Folder Structure

Current and target folders should remain feature-oriented.

```text
flowfit/
├── docs/
├── user_stories/
├── lib/
│   ├── core/
│   ├── data/
│   ├── features/
│   └── shared/
├── test/
├── ios/
├── android/
├── web/
├── macos/
├── windows/
└── linux/
```

| Folder | Purpose |
| ------ | ------- |
| `docs/` | Product, project, architecture, audit, and workflow documentation. |
| `user_stories/` | Story-level task and workflow artifacts. |
| `lib/` | Flutter application source. |
| `lib/core/` | App-wide constants, theme, utilities, and configuration when needed. |
| `lib/data/` | Local database setup, models, repositories, and services. |
| `lib/features/` | Product-facing feature modules such as home, workout, calendar, timer, onboarding, goals, gamification, and share cards. |
| `lib/shared/` | Reusable layouts and widgets when genuinely shared. |
| `test/` | Flutter widget and future unit tests. |
| `ios/` | MVP platform target. |
| `android/`, `web/`, `macos/`, `windows/`, `linux/` | Generated platform targets present in the repository but not part of MVP release scope. |

Detailed target component structure belongs to:

```text
docs/ARCHITECTURE.md
```

---

## Data Models

| Model | Purpose | Owner |
| ----- | ------- | ----- |
| `Workout` | Existing reusable workout/template-like entity. | Data layer |
| `WorkoutLog` | Existing date-specific workout log with completion state and optional workout details. | Data layer |
| `WeeklyGoal` | Future local weekly workout target. | Goals feature / Data layer |
| `XpLedgerEntry` | Future immutable XP history record. | Gamification feature / Data layer |
| `UserProgress` | Future derived or stored user level and XP progress state. | Gamification feature / Data layer |
| `Badge` | Future local badge unlock state. | Gamification feature / Data layer |
| `ShareCardEvent` | Future local record of generated or shared cards. | Share cards feature / Data layer |
| `AppSettings` | Future local app settings, privacy defaults, and onboarding completion state. | Core/Data layer |

Persistence rules:

* Existing MVP foundation uses Hive boxes for workouts and workout logs.
* Future persisted models should use stable IDs, timestamps, and explicit Hive adapter management.
* Date keys should remain consistent with the existing `yyyy-MM-dd` pattern unless a migration is documented.
* XP and share-card event history should use immutable event records when implemented.
* Detailed model relationships, box names, and migration rules belong in `docs/ARCHITECTURE.md`.

---

## Security Strategy

* No account credentials are required for MVP.
* Do not collect unnecessary personal data.
* Avoid location, contacts, camera, health, and notification permissions unless a future feature explicitly requires them.
* Keep user data private by default on the device.
* Do not store secrets in the repository or app bundle.
* Treat share cards as explicit user-initiated exports.
* Clearly communicate the local-only data-loss trade-off when that becomes user-facing.

---

## Integration Strategy

MVP external integrations:

```text
None
```

MVP integration boundaries:

* No authentication provider.
* No backend API.
* No cloud sync.
* No external analytics SDK.
* No social graph.
* No public ranking.
* No wearable integration.

Future optional integrations may include platform share sheets, cloud backup, Apple Sign In, Google Sign In, external analytics, push notifications, Apple Watch, Android, or web support. Future integrations must be optional and must not break offline-first core logging.

---

## Error Handling Strategy

* Validate required workout fields before saving.
* Treat local storage failures as user-visible issues, not silent failures.
* Preserve workout data if later gamification or progress recalculation fails.
* Keep future XP and reward operations idempotent.
* Use non-alarming recovery messages for local storage or share-card failures.
* Log local debug information during development without collecting private user data.
* Avoid retry or sync logic for MVP because there is no backend or network dependency.

---

## Technical Decisions

Decision:

```text
Use Flutter and Dart as the application frontend.
```

Alternatives Considered:

```text
Native iOS, React Native, rebuilding from scratch.
```

Reason:

```text
The existing codebase is already a working Flutter app, and preserving it supports faster MVP validation.
```

Decision:

```text
Use Hive for local persistence during MVP.
```

Alternatives Considered:

```text
SQLite, SharedPreferences, cloud-hosted storage.
```

Reason:

```text
Hive is already integrated, works offline, and fits the current object-oriented local model.
```

Decision:

```text
Do not use a backend for MVP.
```

Alternatives Considered:

```text
Firebase, custom API, serverless backend.
```

Reason:

```text
The MVP prioritizes low friction, low cost, offline use, and fast validation.
```

Decision:

```text
Use Riverpod as the target state-management direction, introduced gradually.
```

Alternatives Considered:

```text
Provider, Bloc, GetX, StatefulWidget-only state.
```

Reason:

```text
Riverpod can support future goals, gamification, progress, and share-card state without forcing a broad immediate rewrite.
```

Decision:

```text
Keep analytics local-first during MVP.
```

Alternatives Considered:

```text
Firebase Analytics, custom analytics backend, no metrics capture.
```

Reason:

```text
Local summaries can support MVP validation without account, network, privacy, or backend complexity.
```

Decision:

```text
Preserve existing FlowFit functionality where useful.
```

Alternatives Considered:

```text
Rewrite from scratch, broad architecture migration before feature work.
```

Reason:

```text
The current app already provides offline workout logging, Hive setup, calendar, timer, and tests that support RepLog's MVP direction.
```

---

## Risks

| Risk | Impact | Mitigation |
| ---- | ------ | ---------- |
| FlowFit naming remains in visible UI, README, tests, package metadata, and app labels. | Product identity is inconsistent and may reduce user trust. | Handle visible RepLog brand migration in a focused story before larger feature work. |
| Existing `HomeScreen` owns substantial UI and persistence logic. | Future goals/gamification additions may make the screen hard to maintain. | Split responsibilities gradually when feature stories require it. |
| Empty placeholder files create uncertainty about ownership. | Agents may infer architecture that does not exist yet. | Fill placeholders only when needed or remove them in a focused cleanup. |
| Hive model changes can break local data. | Users may lose persisted workout data. | Keep adapter discipline and document migrations before persisted model changes. |
| Local-only storage can be lost on uninstall or device change. | Users may lose MVP data. | Treat this as an accepted MVP trade-off and communicate it when user-facing. |
| Share-card export may introduce platform-specific complexity. | Scope and testing surface may grow quickly. | Defer share cards until core progress and privacy defaults exist. |
| External analytics or social features may creep into MVP. | Product may violate privacy and offline-first constraints. | Keep validation local unless explicitly approved later. |

---

## Assumptions

* Local Hive persistence is sufficient for MVP validation.
* iOS is the only MVP release platform.
* Users will accept local-only data-loss trade-offs during MVP if the app is clear about them.
* Existing FlowFit workout logging behavior is worth preserving while the product migrates to RepLog.
* Beginner and returning fitness users benefit more from fast logging and positive reinforcement than advanced analytics.
* Future cloud sync, login, Android/web support, and external analytics can be added later without changing MVP direction.

---

## Open Questions

* Should existing FlowFit workout data be migrated, preserved as-is, or discarded when the app is rebranded as RepLog?
* What exact fields are required for the first RepLog-optimized workout logging flow?
* Which MVP badges are required, if any?
* Should level-up celebrations be skippable?
* How much share-card customization is necessary for users to feel comfortable sharing?
* What minimum local validation export, if any, is needed without a backend?

If these questions block an architecture decision, create:

```text
docs/ARCHITECTURE_BLOCKERS.md
```

---

## Related Documents

* `docs/PRODUCT_BRIEF.md`
* `docs/ARCHITECTURE.md`
* `docs/EPIC_USER_STORY_TASKS.md`
* `docs/REPLOG_CODEBASE_AUDIT.md`
* `docs/PRODUCT_OWNER_RL-0001_SELECTION.md`

---

## Revision History

| Version | Date       | Author                   | Summary |
| ------- | ---------- | ------------------------ | ------- |
| v1.0    | 2026-06-20 | Solution Architect Agent | Initial RepLog project context captured from FlowFit migration planning. |
| v1.1    | 2026-06-29 | Solution Architect Agent | Restructured for ADF v3 Generated Document compliance and added Agent Handoff. |

---

## Blocking Conditions

Create:

```text
docs/ARCHITECTURE_BLOCKERS.md
```

when:

* Product requirements are incomplete.
* Platform requirements are unknown.
* Security requirements are unclear.
* Existing implementation cannot be understood.
* Architecture decisions require stakeholder approval.

Current blocking conditions:

```text
None.
```

---

## Agent Handoff

Current Agent:

```text
Solution Architect
```

Completed Output:

```text
docs/PROJECT_CONTEXT.md
```

Next Agent:

```text
Business Analyst
```

Next Prompt:

```text
/Users/jounghwapak/Developer/AI_Agents/prompts/create_epic_user_stories.md
```

Required Input Files:

* `/Users/jounghwapak/Developer/AI_Agents/workflows/default_workflow_v3_final.md`
* `/Users/jounghwapak/Developer/AI_Agents/templates/PROJECT_CONTEXT_TEMPLATE.md`
* `docs/PRODUCT_BRIEF.md`
* `docs/PROJECT_CONTEXT.md`
* `docs/ARCHITECTURE.md`
* `docs/EPIC_USER_STORY_TASKS.md`
* `docs/REPLOG_CODEBASE_AUDIT.md`

Optional Input Files:

* `docs/PRODUCT_OWNER_RL-0001_SELECTION.md`
* `docs/brainstorm/`
* Existing Flutter source files as needed for source-of-truth verification

Expected Output:

* Business Analyst review or update of story/backlog artifacts if required by the next workflow step.

Blocking Conditions:

* None.

Instructions:

* Preserve approved RepLog product direction.
* Preserve existing working workout logging behavior.
* Keep MVP scope iOS and offline-first.
* Do not add backend, login, cloud sync, social graph, public ranking, analytics SDK, XP, badges, goals, share cards, or code implementation as part of this document cleanup.
* Keep deep architecture details in `docs/ARCHITECTURE.md`.
