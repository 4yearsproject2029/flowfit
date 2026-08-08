# RL-0037 Interpretation

## Story

As a user with a workout planned for today, I want the Today bottom navigation item to take me directly into today's current workout flow, so that the visible Today tab is accessible and supports the core workout journey.

## Acceptance Criteria Interpretation

1. The Today bottom nav item must be actionable from Home, Week, Achievement, and History.
2. When today has a saved runnable workout session, tapping Today must open `CurrentWorkoutScreen` for today's local session.
3. When an active rest timer exists, tapping Today must return to the active Current Workout/rest context rather than creating a duplicate route.
4. When no runnable workout exists for today, tapping Today must route to a safe today-focused fallback such as Home's Today's Focus or the workout planning entry point.
5. Re-tapping Today while already in the current workout flow must not stack duplicate Current Workout routes.
6. Existing Home, Week, Achievement, History, planned Session Detail, completed Workout Detail, and bottom-nav direct switching behavior must remain intact.
7. No backend, login, cloud sync, external routing package, broad navigation rewrite, or new persisted data model may be introduced.
8. QA must cover Today from each implemented tab, runnable-session behavior, no-session fallback, active-rest behavior, and duplicate-route prevention.

## Implementation Guidance

- Extend `Phase2BottomNavigation` with a Today action and any selected-state support required by the route.
- Prefer shared routing/helper behavior over duplicating Today navigation logic across Home, Week, Achievement, and History.
- Reuse existing `StorageService.getWorkoutLogsByDate()` and the existing date-key convention to find today's runnable workout rows.
- Reuse existing `CurrentWorkoutScreen` instead of creating a Today screen.
- Reuse existing active-rest continuity state where applicable.
- For no-session fallback, keep the user in a today-focused path and avoid opening an empty Current Workout screen.
- Avoid a router migration or broad navigation rewrite.

## Exclusions

- No standalone Today screen.
- No changes to workout data schema.
- No changes to Week planning or History completed detail behavior.
- No changes to Achievement rewards or share moments.
- No backend, login, cloud sync, analytics, or external routing package.

## Suggested Verification

- `flutter test test/widget_test.dart --plain-name 'Today nav opens Current Workout from Home when today has a saved session' -r expanded`
- `flutter test test/widget_test.dart --plain-name 'Today nav opens Current Workout from Week Achievement and History' -r expanded`
- `flutter test test/widget_test.dart --plain-name 'Today nav uses safe fallback when no workout is planned' -r expanded`
- `flutter test test/widget_test.dart --plain-name 'Today nav does not stack duplicate Current Workout routes' -r expanded`
- `flutter analyze`
- `git diff --check`

## Agent Handoff

Current Agent:
User Story Interpreter

Next Agent:
Code Writer

Expected Output:
user_stories/RL-0037/RL-0037_IMPLEMENTATION_NOTES.md
