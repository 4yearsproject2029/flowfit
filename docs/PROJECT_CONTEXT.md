# Project Context

## Product Vision

RepLog turns fitness consistency into a game.

The product helps beginner and returning fitness users build sustainable workout habits through fast workout logging, XP, levels, badges, weekly goals, and optional share cards. The MVP should celebrate showing up, not athletic superiority or public comparison.

## Technical Goals

- Preserve the existing Flutter workout tracker foundation where it supports RepLog's MVP.
- Keep the app offline-first and usable without account creation.
- Make workout logging fast enough to use during or immediately after exercise.
- Support local persistence for workouts, goals, XP, levels, and share-card events.
- Keep the architecture simple enough for a solo developer to maintain.
- Allow future cloud backup, multi-device sync, Android support, and richer gamification without requiring a full rewrite.

## Constraints

- MVP platform is iOS.
- MVP has no login requirement.
- MVP uses local storage only.
- MVP has no backend, cloud synchronization, social graph, messaging, or public ranking.
- Users may lose data if they uninstall the app or switch devices during the MVP phase.
- Existing codebase is a Flutter app currently named FlowFit in several files and app labels.
- Existing project structure should be reused where practical.
- Technical decisions should prioritize simple implementation, maintainability, low cost, and product validation speed.

## Supported Platforms

- MVP: iOS.
- Existing generated targets: Android, web, macOS, Windows, and Linux are present in the repository but are not part of the RepLog MVP release scope.
- Future: Android and web may be considered after MVP validation.
- Out of scope: Desktop platforms.

## Tech Stack

### State Management

Decision:

Use Riverpod.

Alternatives Considered:

- Provider
- Bloc
- GetX

Pros:

- Scalable architecture
- Testability
- Explicit dependency management
- Strong Flutter ecosystem support

Reason:

Riverpod balances simplicity and maintainability for a solo developer while supporting future feature growth.



### Frontend

Decision:

Use Flutter and Dart as the application frontend.

Alternatives Considered:

- Native iOS with Swift.
- React Native.
- Rebuilding from scratch in another mobile framework.

Pros:

- Existing codebase already uses Flutter.
- Supports fast iteration and a shared codebase for future Android or web expansion.
- Existing workout logging UI, calendar, timer, Hive setup, and tests can be reused.

Cons:

- The current package and UI still contain FlowFit naming that must be migrated to RepLog.
- Flutter adds cross-platform surface area even though MVP release scope is iOS only.

Reason:

Flutter is already working in the codebase and best supports validation speed while preserving future platform optionality.

### Backend

Decision:

Do not use a backend for the MVP.

Alternatives Considered:

- Firebase.
- Custom API.
- Serverless backend.

Pros:

- Eliminates account setup and backend maintenance.
- Reduces cost and implementation complexity.
- Keeps the MVP focused on habit validation.

Cons:

- No multi-device sync.
- No cloud backup.
- No centralized analytics pipeline.
- User data can be lost when the app is uninstalled or moved to another device.

Reason:

The product brief explicitly accepts local-only storage during MVP to reduce onboarding friction and accelerate product validation.

### Database

Decision:

Use Hive for local persistence during MVP.

Alternatives Considered:

- SQLite.
- SharedPreferences.
- Cloud-hosted database.

Pros:

- Existing codebase already initializes Hive and stores workout data in Hive boxes.
- Works offline and has low operational overhead.
- Fits the current object-oriented data model.

Cons:

- Requires careful adapter and migration management as models evolve.
- Local-only persistence creates data-loss risk on uninstall or device change.
- More complex querying may become harder if analytics grow significantly.

Reason:

Hive is already integrated and matches the MVP requirement for offline-first local storage.

### Analytics

Decision:

Use local event summaries for MVP validation metrics first; defer external analytics unless validation requires it.

Alternatives Considered:

- Firebase Analytics.
- Custom analytics backend.
- No analytics capture.

Pros:

- Supports core metrics such as weekly goal completion, average workouts per week, share-card generation, and return after missed workout week.
- Avoids adding account, network, privacy, and backend complexity.
- Can be evolved into external analytics later.

Cons:

- Metrics remain device-local unless exported or later synced.
- Product decisions may rely on smaller manual feedback loops.

Reason:

The MVP should validate behavior while preserving the no-backend, private-by-default product direction.

### CI/CD

Decision:

Use lightweight local validation commands for MVP, with CI/CD added when release cadence requires it.

Alternatives Considered:

- GitHub Actions.
- Codemagic.
- Manual-only validation.

Pros:

- Keeps setup small during early validation.
- Existing Flutter commands can validate analysis and tests.
- CI can be added later without changing architecture.

Cons:

- Manual validation can be inconsistent.
- Release confidence is lower without automated checks on every change.

Reason:

The app is still in MVP shaping. CI/CD should be introduced when the release process becomes repeatable.

## Architecture Principles

- Simple > Complex.
- Local First > Cloud First.
- Maintainability > Optimization.
- Evolutionary Architecture > Big Design Up Front.
- Preserve working code unless a change is required for RepLog's product direction.
- Keep features modular and product-facing.
- Keep data ownership clear: UI reads state, services/repositories manage persistence, models define persisted data.
- Avoid hidden social or cloud dependencies in the MVP.

## Folder Structure

Recommended structure, based on the existing codebase:

```text
lib/
  main.dart
  core/
    constants/
    theme/
    utils/
  data/
    local/
    models/
    repositories/
    services/
  features/
    onboarding/
    calendar/
      providers/
      widgets/
    gamification/
      models/
      services/
      widgets/
    goals/
      models/
      services/
      widgets/
    home/
      screens/
    share_cards/
      models/
      services/
      widgets/
    timer/
      providers/
      widgets/
    workout/
      providers/
      widgets/
  shared/
    layouts/
    widgets/
test/
docs/
```

Existing folders already align with this direction. Empty placeholder files should either be filled when their layer is needed or removed in a focused cleanup to avoid confusion.

## Data Models

Existing models:

- `Workout`: reusable workout or template-like entity with `id`, `name`, `category`, optional description, default sets, and default reps.
- `WorkoutLog`: date-specific workout record with `id`, `date`, workout name, category, completion state, optional sets/reps/weight/memo, and creation timestamp.

Recommended RepLog MVP models:

- `WeeklyGoal`: user-defined weekly workout target, active week, created timestamp, and updated timestamp.
- `XpLedgerEntry`: immutable record of XP earned, source, amount, related workout or goal, and created timestamp.
- `UserProgress`: current level, total XP, current streak or consistency state, and last recalculated timestamp.
- `Badge`: badge identifier, name, unlock condition, unlock state, and unlocked timestamp.
- `ShareCardEvent`: generated card type, related achievement, visible metrics, and created timestamp.
- `AppSettings`: brand settings, privacy defaults, metric visibility preferences, and onboarding completion state.

Persistence decisions:

Decision:

Store workout, goal, gamification, and share-card event data locally in separate Hive boxes.

Alternatives Considered:

- One combined app state box.
- SQLite tables.
- Remote data storage.

Pros:

- Keeps data ownership clear.
- Allows feature-specific migrations.
- Supports offline-first behavior.

Cons:

- More boxes and adapters require naming discipline.
- Cross-feature calculations need careful consistency rules.

Reason:

Separate boxes fit the current architecture and make future features easier to evolve without a backend.

## Security Strategy

- Do not require account credentials for MVP.
- Do not collect unnecessary personal data.
- Avoid location, contacts, camera, and health permissions unless a future feature explicitly requires them.
- Keep data private by default on the device.
- Do not store secrets in the repository or app bundle.
- Treat share cards as explicit user-initiated exports.
- Clearly communicate MVP data-loss trade-off if local-only storage remains user-visible.

Decision:

Use local-only app data without authentication for MVP.

Alternatives Considered:

- Apple Sign In.
- Google Sign In.
- Anonymous backend accounts.

Pros:

- Lowest onboarding friction.
- Minimal sensitive account data.
- Aligns with private-by-default MVP.

Cons:

- No account recovery.
- No cross-device access.
- No cloud restore after uninstall.

Reason:

The product brief prioritizes fast validation and explicitly excludes authentication and cloud sync from MVP.

## Integration Strategy

- MVP external integrations: none required.
- Share cards should use platform-native sharing/export surfaces when implemented.
- Analytics should remain local unless an external analytics tool is deliberately introduced later.
- Future integrations may include optional cloud backup, Apple Sign In, Google Sign In, Apple Watch, push notifications, or external analytics.
- Future integrations must be optional and should not break offline-first core logging.

Decision:

Keep integrations minimal and user-initiated during MVP.

Alternatives Considered:

- Early cloud sync.
- Early social features.
- Early wearable integrations.

Pros:

- Reduces complexity.
- Protects privacy.
- Keeps attention on workout consistency validation.

Cons:

- Limits virality and retention features that depend on networked experiences.
- Limits backup and recovery.

Reason:

The MVP needs to validate consistency and sharing behavior before adding infrastructure-heavy integrations.

### Share Card Generation

Decision:

Generate share cards entirely on-device.

Approach:

- Render Flutter widgets as images
- Export as PNG
- Use platform-native share sheets

Reason:

Maintains offline-first behavior and avoids backend complexity.

## Feature Flags

Support optional feature toggles for:

- Share cards
- Badges
- Seasonal events
- Analytics

Reason:

Allows incremental rollout without architectural changes.



## Risks

- FlowFit naming remains in code, README, package identifiers, and app UI; migration is required for RepLog brand consistency.
- Existing `HomeScreen` owns substantial UI and form logic; future gamification may make this screen too large unless responsibilities are split gradually.
- Existing repository/provider placeholder files are empty; implementation should clarify whether services, repositories, or providers own state changes.
- Hive model changes require adapter discipline to avoid breaking existing local data.
- Local-only storage creates accepted data-loss risk on uninstall or device change.
- Share-card generation may introduce platform-specific complexity if image export or native share APIs are added too early.
- Metrics may be hard to evaluate across users without backend analytics.

## Open Questions

- Should existing FlowFit workout data be migrated or discarded when the app is rebranded as RepLog?
- What exact fields are required for the first RepLog workout logging flow?
- Should XP and level calculations be stored as ledger events, derived from workout logs, or both?
Decision:

Use immutable XP ledger entries and derive user progress from the ledger.

Reason:
  - Easy auditing
  - Supports future badges and achievements
  - Prevents duplicate rewards
  - Enables recalculation when reward rules change


- Which MVP badges are required, if any?
- Should share card images be generated entirely on-device in MVP?
- What minimum analytics export, if any, is needed for validation without a backend?
