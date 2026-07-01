# RL-0012 Interpretation

## Story Summary

RL-0012 adds local MVP validation metrics so RepLog can evaluate consistency outcomes from on-device data. The story is not a reporting dashboard, analytics integration, or account feature.

## Metric Rules

Week boundaries:

- Weeks start on Monday and end on Sunday, matching `WeeklyGoalService.startOfWeek`.
- Calculations use date-only values.
- Invalid workout or event dates are ignored.

Measured week range:

- The measured range starts at the earliest valid completed workout date or share-card generation date.
- The measured range ends in the week containing the supplied `today` value.
- If there is no valid local history, averages and rates return zero.

Weekly goal completion rate:

- Count completed workouts only.
- A week is complete when completed workouts in that week are greater than or equal to the saved weekly goal.
- Planned-rest weeks are excluded from the denominator for this metric.
- If no eligible measured weeks remain, the completion rate is zero.

Average workouts per week:

- Count completed workouts only.
- Divide by all measured weeks in the local history range.
- Planned-rest weeks remain in this denominator because the metric describes observed workout frequency, not goal success.

Average share cards generated:

- Count locally recorded user-initiated share-card generation events.
- Divide by all measured weeks in the local history range.
- Recording an event must not publish, upload, sync, or share anything automatically.

Return after missed workout week:

- Reuse `ConsistencyRecoveryService.calculateStatus`.
- Planned-rest weeks remain neutral.
- The metric is true only when existing recovery rules detect a completed current-week return after a prior missed week.

## Source Data

- Workout completion logs from local Hive storage.
- Weekly goal from local Hive storage.
- Planned rest dates from local Hive storage.
- Share-card generation event counts from local Hive storage.

## Boundaries

- No backend.
- No login.
- No cloud sync.
- No external analytics SDK.
- No public feed, social graph, ranking, or automatic sharing.
- No new user-facing dashboard is required for RL-0012.

## Acceptance Criteria Traceability

- Weekly goal completion rate: calculated by the local MVP metrics service from completed workout logs and weekly goal.
- Average workouts per week: calculated by the local MVP metrics service from completed workout logs.
- Average share cards generated: calculated from local share-card generation event counts.
- Return detection: delegated to existing consistency recovery logic.
- No login or backend: all data sources remain local Hive boxes and in-memory service calculations.
