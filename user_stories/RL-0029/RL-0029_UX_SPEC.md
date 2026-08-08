# RL-0029 UX Specification

## Story

Story ID:
RL-0029

Story Name:
Achievement Unlock And Share Moments

Design Reference:
design/approved/06_achievement.png

## UX Goal

Achievement should make newly earned recognition feel visible and celebratory while keeping sharing private, optional, and fully user-initiated.

## Screen Responsibility

Achievement Unlock And Share Moments Owns:

- Recent unlock visibility inside Achievement.
- A compact share entry tied to earned recognition.
- Privacy-preserving copy for optional sharing.
- Clear separation between Achievement detail and Dashboard preview.

Achievement Unlock And Share Moments Does Not Own:

- Automatic social posting.
- Public profiles, rankings, or percentile claims.
- Social pressure or comparison copy.
- Notification delivery.
- Backend, login, cloud sync, or cross-device share state.
- Configurable reward rules or dynamic unlock engines.

## Design Adaptation

The approved Achievement visual may support celebratory recognition rows, but any public-status or comparison implication is excluded. RL-0029 should add a small `RECENT UNLOCKS` section and an optional share action without changing the overall Achievement hierarchy from RL-0019 and RL-0028.

## Layout

- Keep the released Achievement header, level summary, progress, milestones, and title collection.
- Add `RECENT UNLOCKS` after the title/milestone recognition content.
- Show only local, earned recognition moments.
- Recent unlock rows show a short label, supportive description, and state text.
- Provide one compact `Share moment` action only when a shareable recognition exists.
- Keep Dashboard limited to its existing short-term Achievement preview.

## Interaction Rules

- Viewing recent unlocks does not mutate local reward data.
- Sharing is never automatic.
- Share preview opens only after the user taps the Achievement share entry.
- Existing share-card preview behavior and privacy defaults are reused.
- Workout performance metric visibility remains opt-in and must not become enabled by default.
- No share prompt appears on Dashboard for RL-0029.

## Feedback Mechanisms

- Recent unlock copy celebrates showing up, finishing sessions, or reaching a local title.
- Locked or future rewards are not presented as missed opportunities.
- The share entry uses low-pressure copy and can be ignored without consequence.

## Empty States

| Scenario | Message | Action |
| -------- | ------- | ------ |
| No earned unlock yet | Complete a workout to make your first recognition moment. | Go Home |
| Local share card unavailable | Keep building consistency; share moments appear when recognition is ready. | None |

## Error States

| Scenario | Message | Recovery Action |
| -------- | ------- | --------------- |
| Local progress unavailable | Local recognition will refresh when this device data is available. | Return Home |

## Loading States

Not required for MVP because Achievement reads local state already available in the app.

## Accessibility And Layout

- Recent unlock rows must wrap long copy without overflow.
- Share entry must meet the existing app touch target standard.
- Share availability must be communicated with text, not color alone.
- Share preview must keep existing modal dismissal behavior.

## QA Focus

- Recent unlock visibility appears for earned recognition.
- Empty recent-unlock state appears before recognition exists.
- Share entry opens only after user action.
- Existing share-card privacy defaults remain preserved.
- Dashboard does not become the full Achievement hub.
- No public comparison, ranking, percentile, public profile, penalty, level-loss, or automatic posting language appears.

## Agent Handoff

Current Agent:
UX Designer

Next Agent:
User Story Interpreter

Expected Output:
user_stories/RL-0029/RL-0029_INTERPRETATION.md
