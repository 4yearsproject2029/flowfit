# RL-0031 Interpretation

## Story

Story ID:
RL-0031

Story Name:
Phase 2 Journey Regression QA

## Interpreted Objective

Execute a cross-screen integration and regression QA pass over the completed Phase 2 journey. RL-0031 should not implement new product behavior; it should gather evidence that the existing screens work together after RL-0037 fixed Today navigation.

## Acceptance Criteria Mapping

| Acceptance Criterion | Evidence Strategy |
| -------------------- | ----------------- |
| Dashboard -> Workout Plan Builder -> Add Exercise -> Save Workout -> Dashboard -> Current Workout handoff. | Run focused widget coverage for saved daily sessions and start handoff; document any harness-only skipped callback tests. |
| Dashboard -> Current Workout -> Rest -> Completion -> Summary -> Achievement/Reward -> Dashboard flow. | Run Current Workout progression, rest, summary, share/reward, and achievement widget coverage. |
| Week -> Planned Session Detail -> Start Today -> Current Workout handoff. | Run planned session detail Start Today widget coverage. |
| History -> Completed Workout Detail review without reopening Summary. | Run History and completed detail widget coverage. |
| Rest Timer continuity behavior from RL-0032 across allowed navigation paths. | Run active rest continuity widget coverage, including navigation away and return. |
| Achievement rewards and share moments preserve privacy and non-comparison rules. | Run Achievement unlock/share moment and privacy-default widget coverage. |
| Runs `flutter test` or documents skipped tests as known limitations. | Run full `flutter test` where possible; document known skipped tests from the existing harness. |
| Produces final integration evidence for RL-0020 readiness. | Create QA report and release note summarizing readiness, risks, and remaining manual-device limitation. |

## Required Commands

- `flutter test -r expanded`
- `flutter analyze`
- `git diff --check`

## Known Harness Risks

- Existing Hive-backed callback tests may be intentionally skipped in `test/widget_test.dart`.
- Manual simulator QA may remain unavailable in this agent environment.

## Stop Conditions

- Stop and document blockers if full regression automation reveals a product behavior failure.
- Stop and document limitations if the test harness hangs or cannot run for environment reasons.

## Agent Handoff

Current Agent:
User Story Interpreter

Next Agent:
QA Tester

Expected Output:
user_stories/RL-0031/RL-0031_QA_REPORT.md
