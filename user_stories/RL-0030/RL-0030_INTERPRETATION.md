# RL-0030 Interpretation

## Story

As a QA reviewer, I want each approved Phase 2 screen validated independently, so that screen-level layout and accessibility issues are caught before integration testing.

## Acceptance Criteria Interpretation

1. RL-0030 must validate Home, Workout Plan Builder, Add Exercise bottom sheet, Current Workout, Rest Timer, Workout Summary, Week, Achievement, History, and Workout Detail independently against `design/approved/` responsibilities.
2. QA must check common iPhone layouts for readable text, touch targets, contrast, navigation predictability, and non-overlapping content where agent evidence is practical.
3. QA must confirm each screen owns only its intended responsibility.
4. RL-0030 must not validate full cross-screen journeys, navigation survival, or end-to-end regression flows except where needed to enter the screen under test.
5. QA must run `flutter analyze`.
6. QA must run focused widget or service tests relevant to changed screens where available.
7. QA must document skipped tests or manual-only checks without changing production behavior just for the harness.

## QA Guidance

- Treat RL-0030 as a screen-readiness checkpoint, not a feature-building story.
- Use approved designs and released story artifacts as the visual/behavior baseline.
- Prefer focused automated tests that already exist for each screen surface.
- Use source inspection for screen responsibility checks where direct device screenshots are unavailable in this agent environment.
- Do not change production code to make broad widget-harness execution pass.
- If a clear product blocker is found, document it in QA and return control to Coordinator instead of silently widening RL-0030.

## Exclusions

- No new UI implementation.
- No new screen behavior.
- No broad journey regression.
- No cross-screen timer survival validation beyond existing RL-0032 evidence.
- No backend, login, cloud sync, external services, analytics SDK, public profile, ranking, or social comparison behavior.

## Suggested Verification

- `flutter analyze`
- Focused widget tests for Home, Current Workout, Workout Summary, Week, Achievement, History, Workout Detail, Workout Plan Builder, and share/timer surfaces where available.
- Focused service tests where screen state depends on local services.
- `git diff --check`

## Agent Handoff

Current Agent:
User Story Interpreter

Next Agent:
QA Tester

Expected Output:
user_stories/RL-0030/RL-0030_QA_REPORT.md
