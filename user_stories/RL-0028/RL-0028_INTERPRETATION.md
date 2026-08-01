# RL-0028 Interpretation

## Story

As a user checking long-term growth, I want a small set of predefined milestones and titles to show what I can unlock next, so that Achievement feels meaningful without becoming a complex achievement engine.

## Acceptance Criteria Interpretation

1. RL-0028 must build on the Achievement hub foundation from RL-0019.
2. Achievement must use a small predefined local milestone catalog.
3. Achievement must reuse existing XP and completion data where possible.
4. Achievement must display medals or achievements, milestone progress, and title/reward collection using simple local rules.
5. Achievement must not introduce generic rule engines, configurable achievements, dynamic achievement definitions, backend systems, public ranking, percentile claims, social comparison, public profiles, penalties, or level loss.
6. Unlock requirements must be clear, consistency-focused, and non-punitive.
7. QA must verify milestone and title states for locked, in-progress, and unlocked examples.

## Implementation Guidance

- Extend `lib/features/achievement/screens/achievement_screen.dart`.
- Replace the RL-0019 upcoming-recognition placeholder with real local `MILESTONES` and `TITLE COLLECTION` sections.
- Keep the catalog small and static in code; do not create a configurable rule engine or persisted achievement model.
- Use existing local data:
  - XP total for Rep Score and XP-based milestone/title progress.
  - `LevelService.calculateProgress()` for current level.
  - Completed workout logs grouped by date for completed-session progress.
- Use read-only rows with explicit state labels: `Unlocked`, `In progress`, `Locked`, and `Current title`.
- Preserve existing bottom navigation behavior from RL-0019.
- Do not add Hive fields, adapters, migrations, backend, login, cloud sync, public profiles, rankings, percentile claims, penalties, level loss, recent unlock feeds, share moments, or Today behavior.

## Exclusions

- No milestone detail screen.
- No editable achievement definitions.
- No dynamic unlock engine.
- No recent unlock feed or share moments.
- No social, public, comparison, penalty, or level-loss behavior.

## Suggested Verification

- `flutter test test/widget_test.dart --plain-name 'Achievement milestones show locked in-progress and unlocked states' -r expanded`
- `flutter test test/widget_test.dart --plain-name 'Achievement title collection marks current and locked titles' -r expanded`
- `flutter test test/widget_test.dart --plain-name 'Achievement milestones avoid comparison engine and sharing scope' -r expanded`
- `flutter analyze`
- `git diff --check`

## Agent Handoff

Current Agent:
User Story Interpreter

Next Agent:
Code Writer

Expected Output:
user_stories/RL-0028/RL-0028_IMPLEMENTATION_NOTES.md
