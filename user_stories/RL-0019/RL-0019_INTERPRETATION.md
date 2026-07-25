# RL-0019 Interpretation

## Story

As a consistency-focused user, I want an Achievement hub that shows my level and long-term growth without comparison, so that progress feels motivating rather than judgmental.

## Acceptance Criteria Interpretation

1. Achievement must use `design/approved/06_achievement.png` for approved hub layout and screen composition while adapting deferred or excluded elements safely.
2. Achievement must display current level, local XP as the Rep Score concept, current title or reward state, and high-level progress using existing local XP/level data where possible.
3. Achievement copy must prioritize consistency, return, and recognition over performance.
4. Home must continue to show only a short-term achievement preview instead of duplicating the full Achievement hub.
5. Achievement must not introduce rankings, leaderboards, public percentile claims, social comparison, public profiles, penalties, or level loss.
6. Detailed medals, milestone lists, title collection, recent unlocks, and share moments remain deferred to RL-0028 and RL-0029.

## Implementation Guidance

- Add an Achievement feature screen under `lib/features/achievement/screens/`.
- Reuse `StorageService.getXpTotal()`, `StorageService.xpTotalListenable`, and `LevelService.calculateProgress()` for level and progress display.
- Use local completed workout logs only for broad progress signals, such as completed-session count, without adding new metrics storage.
- Extend `Phase2BottomNavigation` so Achievement is an implemented tab while Today remains a placeholder.
- Wire Home, Week, History, and Achievement so implemented tabs can switch directly without pushing duplicate routes when the current tab is selected.
- Keep Dashboard achievement content limited to `_NextAchievementSection` or equivalent short preview.
- Do not add Hive fields, migrations, backend, login, cloud sync, external analytics, share posting, ranking, or a new achievement rule engine.

## Exclusions

- No detailed medal list, real milestone catalog, unlock engine, title collection, recent unlock feed, share moments, or share-card generation from Achievement.
- No public percentile copy such as `Top 5% of users`.
- No ranking, leaderboard, social comparison, public profile, penalties, XP removal, or level loss.
- No Today tab implementation.

## Suggested Verification

- `flutter test test/widget_test.dart --plain-name 'opens Achievement tab from Home with local level progress' -r expanded`
- `flutter test test/widget_test.dart --plain-name 'Achievement bottom navigation switches directly to implemented tabs' -r expanded`
- `flutter test test/widget_test.dart --plain-name 'Achievement hub avoids comparison and sharing language' -r expanded`
- `flutter analyze`
- `git diff --check`

## Agent Handoff

Current Agent:
User Story Interpreter

Next Agent:
Code Writer

Expected Output:
user_stories/RL-0019/RL-0019_IMPLEMENTATION_NOTES.md
