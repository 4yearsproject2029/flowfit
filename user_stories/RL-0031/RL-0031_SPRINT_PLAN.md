# RL-0031 Sprint Plan

## Story

Story ID:
RL-0031

Story Name:
Phase 2 Journey Regression QA

Epic:
EP-15 Phase 2 Screen QA

Status:
Done

## Coordinator Decision

Selected Story:
RL-0031

Reason:
RL-0037 is Done and removed the visible Today navigation defect that blocked a clean journey regression pass. RL-0031 is the next eligible story in the Phase 2 sequence and produces the integration evidence required by RL-0020.

## Inputs Considered

- User instruction to proceed with the workflow.
- /Users/jounghwapak/Developer/AI_Agents/system/coordinator.md
- docs/EPIC_USER_STORY_TASKS.md
- docs/SPRINT_PLAN.md
- docs/ARCHITECTURE.md
- docs/DEVELOPMENT_LOG.md
- user_stories/RL-0030/RL-0030_QA_REPORT.md
- user_stories/RL-0037/RL-0037_RELEASE_NOTE.md
- test/widget_test.dart
- Approved Phase 2 designs in `design/approved/`.

## Dependency Validation

- RL-0030 is Done and provides screen-level QA evidence.
- RL-0037 is Done and fixes Today navigation before journey regression.
- RL-0024, RL-0027, RL-0029, RL-0032, and RL-0033 are Done and provide the cross-screen features under validation.
- No unresolved dependency blocks RL-0031.

## Scope

In Scope:

- Validate Dashboard -> Workout Plan Builder -> Add Exercise -> Save Workout -> Dashboard -> Current Workout handoff.
- Validate Dashboard -> Current Workout -> Rest -> Completion -> Summary -> Achievement/Reward -> Dashboard flow.
- Validate Week -> Planned Session Detail -> Start Today -> Current Workout handoff.
- Validate History -> Completed Workout Detail review without reopening Summary.
- Validate Rest Timer continuity across allowed navigation paths.
- Validate Achievement rewards and share moments preserve privacy and non-comparison boundaries.
- Run regression automation or document known harness limitations.

Out Of Scope:

- New feature implementation.
- Visual redesign.
- Persistence schema changes.
- Backend, login, cloud sync, social graph, public ranking, or external analytics.
- Repeating all RL-0030 independent screen QA unless needed for journey evidence.

## UX Routing Decision

UX Required:
Yes

Reason:
The story validates primary cross-screen user journeys and navigation responsibilities against approved Phase 2 UX.

## User Approval Decision

User Approval Required:
Yes

Reason:
The story validates release-facing journey readiness and was explicitly resumed by user workflow instruction.

## Execution Order

1. Coordinator selects RL-0031 and updates active workflow state.
2. UX Designer records the cross-screen QA scope and expected journey boundaries.
3. User Story Interpreter maps acceptance criteria to executable evidence.
4. QA Tester runs integration/regression evidence.
5. Release Manager closes the story if QA passes and synchronizes release artifacts.

## Required Deliverables

- user_stories/RL-0031/RL-0031_SPRINT_PLAN.md
- user_stories/RL-0031/RL-0031_UX_SPEC.md
- user_stories/RL-0031/RL-0031_INTERPRETATION.md
- user_stories/RL-0031/RL-0031_QA_REPORT.md
- user_stories/RL-0031/RL-0031_CODE_REVIEW.md
- user_stories/RL-0031/RL-0031_RELEASE_NOTE.md
- docs/EPIC_USER_STORY_TASKS.md
- docs/SPRINT_PLAN.md
- docs/DEVELOPMENT_LOG.md

## Agent Handoff

Current Agent:
Coordinator

Next Agent:
UX Designer

Expected Output:
user_stories/RL-0031/RL-0031_RELEASE_NOTE.md

## Release Closeout

Result:
Released

Completed Artifacts:

- user_stories/RL-0031/RL-0031_UX_SPEC.md
- user_stories/RL-0031/RL-0031_INTERPRETATION.md
- user_stories/RL-0031/RL-0031_QA_REPORT.md
- user_stories/RL-0031/RL-0031_CODE_REVIEW.md
- user_stories/RL-0031/RL-0031_RELEASE_NOTE.md

Verification:

- `flutter test test/widget_test.dart --plain-name 'opens Current Workout and advances through rest handoff' -r expanded`
- `flutter test test/widget_test.dart --plain-name 'opens planned session detail and starts Current Workout' -r expanded`
- `flutter test test/widget_test.dart --plain-name 'opens completed Workout Detail from History as read-only review' -r expanded`
- `flutter test test/widget_test.dart --plain-name 'recovers active rest timer after navigating to dashboard' -r expanded`
- `flutter test test/widget_test.dart --plain-name 'Achievement share moment preserves privacy defaults' -r expanded`
- `flutter test test/widget_test.dart --plain-name 'Today nav' -r expanded`
- `flutter analyze`
- `git diff --check`

Known Limitation:
Full `flutter test -r expanded` stalled in the widget harness and was interrupted; see `RL-0031_QA_REPORT.md`.

Next Recommended Story:
RL-0020
