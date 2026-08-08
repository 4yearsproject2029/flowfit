# RL-0020 UX Specification

## Story

Story ID:
RL-0020

Story Name:
Phase 2 Final Journey QA

## UX Objective

Confirm that the Phase 2 screen and journey evidence supports a release-ready Workout Flow Assistant experience without rerunning every prior screen test.

Primary loop:

```text
Guide -> Complete -> Celebrate -> Reward -> Come Back
```

## Evidence Sources

- `user_stories/RL-0030/RL-0030_QA_REPORT.md`
- `user_stories/RL-0031/RL-0031_QA_REPORT.md`
- `docs/USER_JOURNEY.md`
- `docs/PRODUCT_BRIEF.md`
- `docs/ARCHITECTURE.md`

## Readiness Criteria

Guide:

- Home answers "What should I do today?"
- Today navigation can route into today's Current Workout when possible.
- Week and planned session detail can hand off to Current Workout.

Complete:

- Current Workout owns workout execution.
- Rest state and Rest Timer remain part of workout flow.
- Active rest is recoverable from allowed navigation paths.

Celebrate:

- Workout Summary appears after completion.
- History does not reopen Summary as a review screen.

Reward:

- Achievement and share moments reinforce consistency.
- Share defaults remain privacy-safe.
- Recognition avoids comparison language.

Come Back:

- Plan Tomorrow and Dashboard return paths remain available.
- Weekly progress and achievement previews remain supporting signals.

## Accepted Limitations To Consider

- Manual simulator/device QA was not run in this agent environment.
- Full `flutter test -r expanded` stalled in the Flutter widget-test harness during RL-0031 and is documented there.
- Existing skipped Hive-backed callback tests remain harness limitations.
- Add Exercise bottom-sheet visual QA remains manual-only, with persistence and source behavior covered by tests/source inspection.

## UX Decision

Phase 2 is release-ready from an evidence-review perspective if RL-0030 and RL-0031 evidence remains complete and no new product blockers are found during final review.

## Agent Handoff

Current Agent:
UX Designer

Next Agent:
User Story Interpreter

Expected Output:
user_stories/RL-0020/RL-0020_INTERPRETATION.md
