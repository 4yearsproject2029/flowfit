# RL-0015 Sprint Plan

## Story

Story ID:
RL-0015

Epic:
EP-12 Guided Workout Flow

Status:
Done

User Story:
As a user starting today's workout, I want a Current Workout screen foundation that clearly shows the active exercise and next action, so that workout execution has a focused home separate from Dashboard and planning.

## Acceptance Criteria

- Uses `design/approved/02_current_workout.png` for approved Current Workout layout and screen composition.
- Current Workout displays workout title, active exercise, instruction text, sets/reps target, progress indicator, and one primary Complete Set action placeholder.
- Current Workout is reachable from Dashboard Start/Resume or an existing local workout entry without adding backend, login, cloud sync, or broad content systems.
- Workout execution is visually and functionally separated from Dashboard, Week planning, and History review.
- Existing workout log data and local persistence remain intact.
- Pause, adjust, skip, multi-set progression, rest handoff, resume state, and completion navigation are deferred to dependent stories.

## Dependencies

- RL-0014: Done.
- RL-0021: Done.

## Scope

In scope:

- Establish a Current Workout screen foundation aligned with `design/approved/02_current_workout.png`.
- Add a reachable Current Workout route or navigation path from Dashboard Start/Resume or an existing local workout entry.
- Display workout title, active exercise, instruction text, sets/reps target, progress indicator, and one primary Complete Set placeholder.
- Reuse existing local workout data where available and provide a safe foundation state when local workout data is sparse.
- Keep the feature visually and functionally separate from Dashboard, Week planning, and History.
- Preserve existing workout logs, XP, goals, share cards, metrics, and local persistence behavior.

Out of scope:

- Pause, adjust, skip, multi-set progression, rest handoff, resume state, and completion navigation.
- Rest Timer overlay or cross-screen timer continuity.
- Workout Summary, private details, sharing, Week planning, History, Achievement hub, and completed detail behavior.
- Backend, login, cloud sync, external asset services, external analytics SDKs, social graph, public ranking, broad content systems, new planning engine, or rewritten persistence.
- Redesigning Home Dashboard or reopening RL-0014.

## Execution Order

1. Confirm dependencies and source-of-truth hierarchy.
2. Produce Current Workout foundation UX specification.
3. Interpret RL-0015 into story-scoped functional requirements and deferrals.
4. Implement the Current Workout foundation using existing Flutter patterns and local data.
5. Add or update focused tests for navigation and screen content where practical.
6. Run static analysis and relevant tests.
7. Complete Code Review and QA.
8. Release RL-0015 after QA passes and user approval is satisfied by the instruction to proceed through release.

## Agent Assignments

1. Coordinator
2. UX Designer
3. User Story Interpreter
4. Code Writer
5. Code Reviewer
6. QA Tester
7. Release Manager

## UX Routing Decision

UX Required:
Yes

Reason:
RL-0015 introduces the Current Workout screen foundation and primary workout execution surface, changing a primary user workflow.

Next Agent:
UX Designer

Next Prompt:
AI_Agents/prompts/create_ux_spec.md

## User Approval Decision

User Approval Required:
Yes

Reason:
RL-0015 changes the primary workout execution experience and introduces the Current Workout screen foundation.

## Required Deliverables

- `user_stories/RL-0015/RL-0015_SPRINT_PLAN.md`
- `user_stories/RL-0015/RL-0015_UX_SPEC.md`
- `user_stories/RL-0015/RL-0015_INTERPRETATION.md`
- `user_stories/RL-0015/RL-0015_IMPLEMENTATION_NOTES.md`
- `user_stories/RL-0015/RL-0015_CODE_REVIEW.md`
- `user_stories/RL-0015/RL-0015_QA_REPORT.md`
- `user_stories/RL-0015/RL-0015_RELEASE_NOTE.md`

## Risks Or Blockers

- No current blockers.
- Current Workout must not absorb deferred RL-0022/RL-0023 control, progression, rest, or completion behavior.
- Approved design imagery should use local assets or simplified placeholders only.
- Dashboard behavior must remain stable after adding the Current Workout entry point.

## Expected Outcome

- RL-0015 is Done and establishes the Current Workout foundation.
- Dashboard Start/Resume can reach Current Workout.
- Downstream stories RL-0022 and RL-0023 can build progression and controls on top of the foundation.

## Agent Handoff

Current Agent:

```text
Release Manager
```

Completed Output:

```text
docs/EPIC_USER_STORY_TASKS.md
docs/SPRINT_PLAN.md
user_stories/RL-0015/RL-0015_SPRINT_PLAN.md
user_stories/RL-0015/RL-0015_UX_SPEC.md
user_stories/RL-0015/RL-0015_INTERPRETATION.md
user_stories/RL-0015/RL-0015_IMPLEMENTATION_NOTES.md
user_stories/RL-0015/RL-0015_CODE_REVIEW.md
user_stories/RL-0015/RL-0015_QA_REPORT.md
user_stories/RL-0015/RL-0015_RELEASE_NOTE.md
```

Next Agent:

```text
Coordinator
```

Next Prompt:

```text
Select the next eligible Phase 2 story. RL-0015 is Done; RL-0022 is the next eligible story in the current recommended order.
```

Required Input Files:

- `docs/EPIC_USER_STORY_TASKS.md`
- `docs/PRODUCT_BRIEF.md`
- `docs/PROJECT_CONTEXT.md`
- `docs/ARCHITECTURE.md`
- `docs/USER_JOURNEY.md`
- `docs/SCREEN_STRUCTURE.md`
- `user_stories/RL-0015/RL-0015_TASKS.md`
- `user_stories/RL-0015/RL-0015_SPRINT_PLAN.md`
- `user_stories/RL-0021/RL-0021_UX_SPEC.md`
- `design/approved/02_current_workout.png`

Optional Input Files:

- `docs/LOW-FI-WIREFRAME.md`
- `user_stories/RL-0014/RL-0014_RELEASE_NOTE.md`
- Existing completed story artifacts for historical context only.

Expected Output:

- RL-0022 Coordinator sprint handoff.

Blocking Conditions:

- None.

Instructions:

- Preserve RL-0015 as Done.
- Continue with RL-0022 before RL-0023.
- Use the RL-0015 Current Workout foundation as the implementation base.
