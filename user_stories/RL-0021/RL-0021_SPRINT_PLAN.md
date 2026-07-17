# RL-0021 Sprint Plan

## Story

Story ID:
RL-0021

Epic:
EP-15 Phase 2 UX Quality

Status:
Done

User Story:
As an implementation team, I want approved Phase 2 designs translated into build-ready guidance, so that developers can implement the redesign consistently without redesigning it during coding.

## Acceptance Criteria

- Reviews all files in `design/approved/` and records screen-specific implementation notes without changing approved UX direction.
- Defines reusable layout, color, icon, typography, spacing, and asset-handling guidance compatible with existing Material 3 constraints.
- Identifies which approved visual elements can use existing Material widgets and which require local assets or simplified placeholders.
- Adds design QA checkpoints for each approved screen, including mobile layout, touch targets, contrast, and non-overlap expectations.
- Does not introduce backend, login, cloud sync, external asset services, new product scope, or redesigned flows.
- Because `RL-0014` is Done, the handoff may record Home follow-up guidance but must not reopen RL-0014 unless a significant UX issue is discovered later.
- Produces a handoff artifact usable by Code Writer, Code Reviewer, and QA agents.

## Dependencies

- RL-0013: Done.

## Scope

In scope:

- Translate approved Phase 2 PNGs into build-ready design guidance.
- Cover Home Dashboard, Current Workout, Rest Timer Overlay, Workout Summary, Week Planning, Achievement Hub, History, and Workout Detail.
- Record implementation notes for layout, typography, color, icons, spacing, visual assets, and responsive behavior.
- Define QA checkpoints for mobile layout, touch targets, contrast, navigation clarity, and non-overlap expectations.
- Preserve RL-0014 as Done while recording Home follow-up guidance only when useful for downstream stories.
- Keep the handoff compatible with existing Flutter, Material 3, local-first persistence, and completed MVP behavior.

Out of scope:

- Redesigning approved Phase 2 UX direction.
- Reopening RL-0014 or changing completed story state.
- Implementing Flutter code or modifying production behavior.
- Creating new requirements, architecture, backend systems, login, cloud sync, external asset services, external analytics SDKs, social graph, public ranking, or broad content systems.
- Combining RL-0015, RL-0022, RL-0023, RL-0018, RL-0032, RL-0016, RL-0024, RL-0017, RL-0025, RL-0026, RL-0027, RL-0019, RL-0028, RL-0029, RL-0030, RL-0031, or RL-0020 into one oversized delivery cycle.

## Execution Order

1. Confirm approved design inputs and Phase 2 source-of-truth hierarchy.
2. Interpret RL-0021 against `docs/USER_JOURNEY.md`, `docs/SCREEN_STRUCTURE.md`, `docs/PRODUCT_BRIEF.md`, `docs/PROJECT_CONTEXT.md`, `docs/ARCHITECTURE.md`, and `docs/EPIC_USER_STORY_TASKS.md`.
3. Produce implementation-ready design handoff notes for every approved Phase 2 screen.
4. Identify asset strategy, Material 3 reuse opportunities, simplified placeholder needs, and screen-specific build constraints.
5. Define QA checkpoints for layout, accessibility, contrast, touch targets, navigation responsibility, and non-overlap.
6. Review the handoff for consistency with approved PNGs, local-first constraints, scope boundaries, and downstream story ownership.
7. Validate that every approved screen has a clear implementation owner story and no missing design-to-build decision.
8. Close RL-0021 through Release Manager only after handoff, review, QA validation, and required user approval are complete.

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
RL-0021 is a Phase 2 design handoff story that translates approved screen designs into implementation-ready guidance for multiple primary workflows.

Next Agent:
UX Designer

Next Prompt:
AI_Agents/prompts/create_ux_spec.md

## User Approval Decision

User Approval Required:
Yes

Reason:
RL-0021 affects the primary Phase 2 user experience by defining the design guidance that downstream implementation stories will follow.

## Required Deliverables

- `user_stories/RL-0021/RL-0021_SPRINT_PLAN.md`
- `user_stories/RL-0021/RL-0021_UX_SPEC.md`
- RL-0021 interpretation notes if the next agent separates interpretation from the UX handoff.
- RL-0021 implementation notes documenting generated handoff artifacts and confirming no app code changes.
- RL-0021 code review report for the design handoff artifact.
- RL-0021 QA report validating screen ownership and design-to-build decision coverage.
- RL-0021 release note after approval and release closeout.

## Risks Or Blockers

- No current blockers.
- The design handoff must not redesign approved PNGs or reopen RL-0014.
- Exercise imagery, custom icons, and rich visual details may need a local asset strategy or simplified Material-compatible placeholders.
- Approved design details that conflict with non-comparison, privacy, or local-first rules must be documented as implementation constraints, not silently implemented.

## Expected Outcome

- RL-0021 is Done.
- Phase 2 approved designs are converted into build-ready handoff guidance.
- RL-0015 and downstream Phase 2 implementation stories can proceed with clearer layout, asset, QA, and scope boundaries.

## Agent Handoff

Current Agent:

```text
Release Manager
```

Next Agent:

```text
Coordinator
```

Next Prompt:

```text
Select the next eligible Phase 2 story. RL-0021 is Done; RL-0015 is the next eligible story in the current recommended order.
```

Required Input Files:

- `docs/EPIC_USER_STORY_TASKS.md`
- `docs/PRODUCT_BRIEF.md`
- `docs/PROJECT_CONTEXT.md`
- `docs/ARCHITECTURE.md`
- `docs/USER_JOURNEY.md`
- `docs/SCREEN_STRUCTURE.md`
- `user_stories/RL-0021/RL-0021_TASKS.md`
- `user_stories/RL-0021/RL-0021_SPRINT_PLAN.md`
- `design/approved/01_home_screen.png`
- `design/approved/02_current_workout.png`
- `design/approved/03_timer.png`
- `design/approved/04_workkout_summary.png`
- `design/approved/05_weekly_plan.png`
- `design/approved/06_achievement.png`
- `design/approved/07_history.png`
- `design/approved/08_workout_detail.png`

Optional Input Files:

- `docs/LOW-FI-WIREFRAME.md`
- `docs/IMPROVEMENT_BACKLOG.md`
- `user_stories/RL-0014/RL-0014_RELEASE_NOTE.md`
- `user_stories/RL-0014/RL-0014_QA_REPORT.md`
- Existing `user_stories/RL-0000` through `user_stories/RL-0014` artifacts for historical context only.

Expected Output:

- RL-0015 Coordinator sprint handoff.

Blocking Conditions:

- None.

Instructions:

- Preserve RL-0021 as Done.
- Continue with RL-0015 before downstream Current Workout split stories.
- Use `user_stories/RL-0021/RL-0021_UX_SPEC.md` as Phase 2 design handoff guidance.
