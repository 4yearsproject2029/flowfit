# RL-0035 Interpretation

## Story Summary

Weekly Progress currently treats each completed `WorkoutLog` as one completed workout. After Workout Session Composition, one daily session can contain multiple exercise logs on the same date, so completing six exercises can show as six completed workouts.

The corrected behavior is session-based: one completed daily session counts once for weekly goal progress.

## Acceptance Mapping

| Acceptance Criteria | Interpretation |
| ------------------- | -------------- |
| Weekly Progress counts completed daily workout sessions, not completed exercise rows. | Count unique completed session dates in the active Monday-to-Sunday week. |
| Completing one daily session increases Weekly Progress by exactly 1 regardless of exercise count. | Multiple completed logs sharing the same session date contribute one count. |
| The same completed session is not counted more than once. | De-duplicate completed logs by normalized `yyyy-mm-dd` date. |
| Existing Monday-to-Sunday weekly boundary behavior remains unchanged. | Keep `startOfWeek` and week-end logic intact. |
| Incomplete exercises do not count. | Filter out incomplete logs before adding the date to the completed-session set. |

## Dependency Check

* RL-0008 is Done and owns Weekly Goals.
* RL-0033 is Done and introduced one daily session with multiple ordered exercise logs.
* No blocking dependency is present.

## Code Writer Handoff

Update `WeeklyGoalService.calculateProgress` so it calculates completed workout sessions as unique completed dates inside the current week. Add focused regression coverage where six completed exercise logs on the same date produce `1 / 5 workouts complete`.

Do not change the `WorkoutLog` Hive schema, Home Dashboard layout, Workout Summary layout, XP award logic, or Current Workout state machine.
