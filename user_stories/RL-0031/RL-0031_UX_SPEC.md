# RL-0031 UX Specification

## Story

Story ID:
RL-0031

Story Name:
Phase 2 Journey Regression QA

## UX Objective

Validate that the approved Phase 2 screens work together as one product journey:

```text
Guide -> Complete -> Celebrate -> Reward -> Come Back
```

## Journey Responsibilities

Dashboard:

- Presents today's focus and routes into planning or Current Workout.
- Shows short-term progress and achievement preview without becoming the full Achievement hub.

Workout Plan Builder:

- Creates a local daily session with a title and ordered exercises.
- Returns the user to the dashboard/week planning context without creating duplicate workout records.

Current Workout:

- Guides the active exercise flow.
- Preserves exercise, rest, pause, adjust, skip, and completion state.
- Hands off to Workout Summary after completion.

Rest Timer:

- Remains attached to the active workout flow.
- Lets the user return to Current Workout from allowed navigation paths.

Workout Summary:

- Celebrates the just-completed workout.
- Shows reward/progress context and optional privacy-safe sharing.
- Must not behave like a historical detail screen.

Week:

- Supports planning review and the planned-session detail handoff into Current Workout.

History:

- Provides read-only completed workout review.
- Must not reopen Workout Summary celebration state.

Achievement:

- Shows recognition, milestones, and share moments without comparison language or public/social pressure.

## UX Acceptance Focus

- Cross-screen entry points are discoverable and complete the intended navigation handoff.
- Navigation does not strand the user in a blank or unrelated screen.
- Today navigation from RL-0037 participates in the core workout route.
- Privacy defaults remain intact for share moments.
- History remains review-only.
- Achievement remains non-comparative.
- No screen takes on another screen's responsibility.

## Manual QA Guidance

- Manual device QA may be documented as not run if the agent environment cannot open a simulator.
- Automated widget evidence should be preferred for repeatable journey coverage.

## Agent Handoff

Current Agent:
UX Designer

Next Agent:
User Story Interpreter

Expected Output:
user_stories/RL-0031/RL-0031_INTERPRETATION.md
