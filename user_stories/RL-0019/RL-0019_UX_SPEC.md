# RL-0019 UX Specification

## Story

Story ID:
RL-0019

Story Name:
Achievement Hub Foundation

Design Reference:
design/approved/06_achievement.png

## UX Goal

Achievement gives users a dedicated place to see long-term progress and recognition without turning progress into competition or performance judgment.

## Screen Responsibility

Achievement Owns:

- Current level.
- Local XP shown as the Rep Score concept.
- Current recognition state or title-style label.
- High-level progress toward the next level.
- Supportive consistency language.
- Bottom navigation selected state for Achievement.

Achievement Does Not Own:

- Detailed medal catalogs.
- Milestone unlock logic.
- Title collection management.
- Recent unlock feeds.
- Share moments.
- Rankings, leaderboards, public percentile claims, social comparison, public profiles, penalties, or level loss.

## Design Adaptation

The approved visual shows Total Medals, Rep Score, an active streak feature card, a milestone list, share icons, and public percentile copy. For RL-0019, keep the dark Achievement screen composition and recognition tone, but replace deferred or excluded elements with foundation-safe local content:

- Use XP total as Rep Score.
- Use level progress as the primary featured progress card.
- Use a simple current title/reward-state label derived from the existing level.
- Use preview rows for future milestones only as locked or upcoming placeholders without unlock logic.
- Omit share icons and public percentile language.

## Layout

- Header: back affordance when pushed, title `Achievements`, and a quiet settings-style icon with no new settings flow.
- Summary metrics: current level and Rep Score.
- Featured progress card: current recognition, supportive consistency copy, progress bar toward the next level, and XP remaining.
- Growth section: small local progress signals such as completed sessions and weekly goal context where available.
- Upcoming recognition section: preview rows that clearly defer detailed milestones and titles to later stories.
- Bottom navigation: Achievement selected, Home, Week, and History available, Today still inert until its approved story.

## Interaction Rules

- Tapping Achievement from Home, Week, or History opens Achievement directly.
- Re-selecting Achievement does not push duplicate routes.
- Tapping Home, Week, or History from Achievement navigates directly to those implemented tabs.
- Tapping Today does not navigate in this story.
- No Achievement element mutates local workout, XP, level, weekly goal, share-card, or history data.
- No element posts, shares, or exposes public progress.

## Feedback Mechanisms

- Progress is shown through level, XP, progress bar, and remaining XP copy.
- Empty or low-progress states remain encouraging and actionable.
- Recovery language must preserve the existing no-XP-loss and no-level-loss principle.

## Empty States

| Scenario | Message | Action |
| -------- | ------- | ------ |
| No XP yet | Start with one workout. Your first Rep Score points will appear here. | Go Home |
| No completed sessions yet | Completion history will shape this hub after workouts are finished. | Go Home |

## Error States

| Scenario | Message | Recovery Action |
| -------- | ------- | --------------- |
| Local progress unavailable | Progress is saved on this device and will refresh when local data is available. | Return Home |

## Loading States

Not required for MVP because Achievement reads local Hive-backed state already opened by the app shell.

## Accessibility And Layout

- Keep bottom navigation targets at least 44px high.
- Avoid color-only progress communication by pairing progress bars with text.
- Keep long recognition copy wrapped inside cards.
- Maintain high contrast on the dark background.
- Ensure placeholder milestone rows do not imply earned medals.

## QA Focus

- Achievement opens from Home, Week, and History bottom navigation.
- Achievement shows local level, Rep Score, current recognition, and next-level progress.
- Home still shows only the short Next Achievement preview.
- Today remains inert.
- Ranking, leaderboard, public percentile, social comparison, penalty, level-loss, and share-posting language/actions are absent.

## Agent Handoff

Current Agent:
UX Designer

Next Agent:
User Story Interpreter

Expected Output:
user_stories/RL-0019/RL-0019_INTERPRETATION.md
