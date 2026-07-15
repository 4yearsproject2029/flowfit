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
2026-07-13
```

Owner:

```text
Solution Architect Agent
```

Status:

```text
Active
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

UX journey decisions belong to:

```text
docs/USER_JOURNEY.md
```

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

When product or technical documents conflict with `docs/USER_JOURNEY.md`, the approved user journey controls UI/UX direction.

---

## Product Vision

Reference:

```text
docs/PRODUCT_BRIEF.md
docs/USER_JOURNEY.md
```

RepLog is a Workout Flow Assistant.

The product helps beginner and returning fitness users build sustainable workout habits by guiding them through today's workout, celebrating completion, rewarding consistency, and encouraging them to return.

RepLog prioritizes:

* Consistency over performance
* Reward and recognition over competition
* Simplicity over complexity
* Motivation over analytics

Core product loop:

```text
Guide -> Complete -> Celebrate -> Reward -> Come Back
```

---

## Current State

RepLog MVP is complete.

The current app is an offline-first Flutter iOS MVP with local Hive persistence and completed MVP systems for:

* RepLog visible product identity.
* First-run weekly goal onboarding.
* Workout creation and completion.
* Offline workout, goal, progress, and preference persistence.
* XP rewards for showing up.
* Level progress.
* Weekly goal progress.
* Consistency recovery and planned-rest handling.
* Optional share cards.
* Share-card privacy controls.
* Local MVP validation metrics.
* MVP quality and accessibility baseline.

The project is now in Phase 2: UI/UX Redesign & Product Refinement.

The key product refinement is to make the completed MVP feel like a Workout Flow Assistant rather than a workout logging app.

---

## Phase 2 Target State

Phase 2 should align the product with `docs/USER_JOURNEY.md`.

Approved visual design files live in:

```text
design/approved/
```

These PNGs are authoritative for Phase 2 screen layout and composition. Product behavior, local-first technical boundaries, persistence rules, privacy rules, and business constraints remain governed by the project documents listed in Source Of Truth.

Target user-facing responsibilities:

| Area | Responsibility |
| ---- | -------------- |
| Home Dashboard | Answer "What should I do today?" |
| Current Workout | Answer "What should I do next?" |
| Workout Summary | Celebrate completion immediately after a workout. |
| Week | Plan upcoming workouts. |
| History | Review completed workout records without editing history. |
| Achievement | Show long-term consistency, level, XP, and recognition. |
| Floating Rest Timer | Support the active workout flow across screens. |

Phase 2 should preserve completed MVP behavior while reshaping navigation, information hierarchy, and screen responsibilities around the approved journeys.

---

## Technical Goals

Project-specific goals:

* Preserve the offline-first MVP foundation.
* Preserve local data ownership and no-account usage.
* Preserve completed MVP systems unless they conflict with the approved UX source of truth.
* Make Home Dashboard a focused daily overview, not a catch-all surface.
* Make Current Workout the guided workout execution surface.
* Keep Workout Summary separate from History and show it only immediately after completion.
* Keep Week focused on lightweight planning.
* Keep History read-only.
* Keep Achievement focused on long-term motivation and recognition.
* Keep the floating Rest Timer tied to workout flow, not dashboard content.
* Avoid backend, login, cloud sync, social graph, public ranking, external analytics SDKs, and broad rewrites during Phase 2.
* Keep architecture simple, maintainable, low-cost, and suitable for a solo developer.

---

## Supported Platforms

* MVP and Phase 2 target: iOS.
* Existing generated targets in repository: Android, web, macOS, Windows, and Linux.
* Future possible platforms: Android and web after product validation.
* Out of scope for MVP and Phase 2: Desktop platforms.

Generated non-iOS platform folders should be preserved unless a later story explicitly changes platform scope.

---

## Tech Stack

### Frontend

| Technology | Purpose | Reason |
| ---------- | ------- | ------ |
| Flutter | Application frontend | Existing app uses Flutter and supports rapid UI/UX refinement. |
| Dart | Application language | Native language for Flutter and already used by the codebase. |
| Material 3 | UI foundation | Existing UI foundation and sufficient for Phase 2 iteration. |

### Backend

| Technology | Purpose | Reason |
| ---------- | ------- | ------ |
| None | Not required | RepLog excludes backend, login, cloud sync, social graph, messaging, and public ranking for MVP and Phase 2. |

### Database / Persistence

| Technology | Purpose | Reason |
| ---------- | ------- | ------ |
| Hive | Local object persistence | Already integrated, offline-capable, and aligned with local-first requirements. |
| Hive Flutter | Flutter integration for Hive | Already used for app-local persistence and listenable updates. |

### Analytics

| Technology | Purpose | Reason |
| ---------- | ------- | ------ |
| Local event summaries | Product validation | Supports private, device-local validation without network, account, or analytics SDK complexity. |

External analytics SDKs are not required for MVP or Phase 2.

### CI/CD

| Technology | Purpose | Reason |
| ---------- | ------- | ------ |
| Local Flutter validation commands | Validation | `flutter analyze` and `flutter test` remain sufficient for this stage. |

---

## Architecture Principles

Prioritize:

* Simple > Complex
* Local First > Cloud First
* Maintainability > Optimization
* Evolutionary Architecture > Big Design Up Front
* User Value > Technical Elegance

Product-specific principles:

* Workout Flow has priority.
* Dashboard simplicity has priority.
* Reward and recognition have priority.
* Complexity should be reduced whenever possible.
* Preserve working code unless a change is required for RepLog's approved product direction.
* Reuse existing workout logging, calendar, timer, Hive setup, and tests where practical.
* Keep data ownership clear: UI reads state, services/repositories manage persistence, models define persisted data.
* Add dependencies only when they directly support user value.
* Avoid hidden cloud, social, or analytics dependencies.

---

## Existing Codebase Rules

* Preserve completed MVP behavior unless Phase 2 explicitly changes the user flow.
* Extend before replacing.
* Avoid broad rewrites and unrelated refactors.
* Keep generated non-iOS platform folders unless platform scope is explicitly changed.
* Do not rename the Dart package, bundle identifiers, Android namespace, or generated project names unless a dedicated story requires it.
* Keep existing Hive adapter read/write order stable unless a migration plan is documented.
* Document migration requirements before changing persisted model structure.
* Treat implementation as the technical source of truth when documentation conflicts with working code.
* Treat `docs/USER_JOURNEY.md` as the UX source of truth when product documents conflict about screen responsibility or journey ownership.

---

## Folder Structure

Current and target folders remain feature-oriented.

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
| `docs/` | Product, journey, project, architecture, audit, and workflow documentation. |
| `user_stories/` | Story-level task and workflow artifacts. |
| `lib/` | Flutter application source. |
| `lib/core/` | App-wide constants, theme, utilities, and configuration when needed. |
| `lib/data/` | Local database setup, models, repositories, and services. |
| `lib/features/` | Product-facing feature modules such as home, current workout, summary, week, history, achievement, timer, onboarding, goals, gamification, and share cards. |
| `lib/shared/` | Reusable layouts and widgets when genuinely shared. |
| `test/` | Flutter widget and unit tests. |
| `ios/` | MVP and Phase 2 platform target. |
| `android/`, `web/`, `macos/`, `windows/`, `linux/` | Generated platform targets present in the repository but not part of MVP or Phase 2 release scope. |

Detailed target component structure belongs to:

```text
docs/ARCHITECTURE.md
```

---

## Data Ownership

RepLog remains local-first.

Local data may include:

* Workout plans.
* Workout records.
* Completion state.
* Weekly goal settings.
* XP ledger entries.
* Level and progress state.
* Achievement state.
* Planned-rest and recovery state.
* Share-card preferences and generation events.
* App settings and onboarding state.
* Local validation summaries.

Persistence rules:

* Existing data remains local by default.
* No login, backend, cloud sync, or external analytics SDK is required.
* Date keys should remain consistent with the existing `yyyy-MM-dd` pattern unless a migration is documented.
* Model and adapter changes require explicit migration consideration.

---

## Security And Privacy

MVP and Phase 2 privacy boundaries:

* No account required.
* No backend storage.
* No cloud sync.
* No social graph.
* No public profile.
* No public rankings.
* No automatic posting.
* Share-card generation is optional and user-initiated.
* Performance metrics remain hidden from share cards unless the user explicitly opts in.
* Local validation metrics remain on device.
