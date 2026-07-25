# RL-0036 Interpretation

## Bug

Expected behavior:
Users should be able to navigate directly from one implemented bottom tab to another, such as History to Week.

Experienced behavior:
Some tab paths are inert, such as History to Week, forcing users to return Home before selecting Week.

## Root Cause

Home, Week, and History each define separate custom bottom navigation widgets. Home wires Week and History. Week wires Home and History. History wires Home only, leaving Week without an `onTap`. This creates inconsistent tab behavior.

## Acceptance Criteria

1. Home -> Week works.
2. Home -> History works.
3. Week -> Home works.
4. Week -> History works.
5. History -> Home works.
6. History -> Week works.
7. Re-tapping the current implemented tab does not push duplicate routes.
8. Today and Achievement remain placeholders and are not implemented by this hotfix.
9. Existing History, completed Workout Detail, Week planning, and planned Session Detail behavior still works.

## Implementation Guidance

- Prefer a shared bottom navigation widget for implemented Home, Week, and History behavior.
- Keep route ownership simple and avoid introducing a broad router migration.
- Use existing `StorageService` injection when opening Week or History.
- Use root pop behavior for Home.
- Avoid modifying data models or completed story behavior outside tab routing.

## Suggested Verification

- `flutter test test/widget_test.dart --plain-name 'bottom navigation switches directly between implemented tabs' -r expanded`
- `flutter test test/widget_test.dart --plain-name 'completed Workout Detail still returns to History after bottom nav fix' -r expanded`
- `flutter analyze`
- `git diff --check`

## Agent Handoff

Current Agent:
User Story Interpreter

Next Agent:
Code Writer

Expected Output:
user_stories/RL-0036/RL-0036_IMPLEMENTATION_NOTES.md

