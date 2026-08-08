# RL-0029 Interpretation

## Story

As a user who earns recognition, I want recent unlock and share moments to be visible only when I choose, so that rewards feel celebratory and private.

## Acceptance Criteria Interpretation

1. Achievement must show recent unlock moments without requiring social posting.
2. Share actions must be user-initiated and preserve existing share-card privacy defaults.
3. Recent unlock language must reinforce consistency and return, not performance comparison.
4. Dashboard must remain limited to short-term preview and must not become the full Achievement hub.
5. Existing share-card generation tracking must remain local.
6. QA must cover unlock visibility, share entry point, and privacy-default preservation.

## Implementation Guidance

- Extend `lib/features/achievement/screens/achievement_screen.dart`.
- Add a small local recent-unlocks section derived from already available milestone/title state.
- Show an empty/supportive state when no local unlock is available.
- Add a user-initiated Achievement share entry for the strongest available local recognition moment.
- Reuse `ShareCardPreview`, `ShareCardData`, and `StorageService.recordShareCardGenerated()` rather than creating a new sharing system.
- Keep share-card workout metrics disabled by default and do not enable performance metrics from Achievement.
- Preserve existing Achievement navigation and Dashboard preview boundaries.
- Do not add Hive fields, adapters, migrations, backend, login, cloud sync, public profiles, rankings, percentile claims, penalties, level loss, automatic posting, notifications, or configurable reward rules.

## Exclusions

- No Dashboard share prompt.
- No automatic share card generation.
- No social network integration.
- No editable or dynamic unlock definitions.
- No new persisted achievement model.
- No public, comparison, penalty, or level-loss behavior.

## Suggested Verification

- `flutter test test/widget_test.dart --plain-name 'Achievement recent unlocks show earned recognition and optional share entry' -r expanded`
- `flutter test test/widget_test.dart --plain-name 'Achievement recent unlocks show private empty state before recognition' -r expanded`
- `flutter test test/widget_test.dart --plain-name 'Achievement share moment preserves privacy defaults' -r expanded`
- `flutter test test/widget_test.dart --plain-name 'Achievement share moments preserve Dashboard separation and no comparison copy' -r expanded`
- `flutter analyze`
- `git diff --check`

## Agent Handoff

Current Agent:
User Story Interpreter

Next Agent:
Code Writer

Expected Output:
user_stories/RL-0029/RL-0029_IMPLEMENTATION_NOTES.md
