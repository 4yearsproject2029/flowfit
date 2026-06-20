# RepLog XP System

## Design Principles

RepLog rewards consistency, not performance.

Users should earn XP by building healthy workout habits.

XP should reinforce:

* Showing up
* Following routines
* Returning after breaks
* Celebrating milestones

XP should not reinforce:

* Heavy weights
* Long workout sessions
* Comparing performance with others

---

## XP Reward Rules

All rewards are cumulative.

Multiple rewards can be earned from a single workout.

Example:

A user completes a Monday leg workout and achieves their weekly goal.

They receive all applicable rewards.

---

## Base Rewards

| Action              | XP     |
| ------------------- | ------ |
| Complete workout    | +50 XP |
| First workout ever  | +50 XP |
| Create weekly plan  | +50 XP |
| Generate share card | +10 XP |

---

## Routine Rewards

| Action                | XP     |
| --------------------- | ------ |
| Monday workout        | +10 XP |
| Leg workout completed | +20 XP |

---

## Consistency Rewards

### Weekly Goal Success

Definition:

Complete the user-defined weekly workout target.

Examples:

* Goal: 3 workouts/week
* Goal: 5 workouts/week

Reward:

| Achievement          | XP      |
| -------------------- | ------- |
| Weekly goal achieved | +100 XP |

---

### Consecutive Weekly Success

Definition:

Achieve the weekly goal for multiple consecutive weeks.

Rest days are allowed.

Missing planned rest days does not break the streak.

| Consecutive Weeks | XP      |
| ----------------- | ------- |
| 3 weeks           | +70 XP  |
| 7 weeks           | +150 XP |
| 12 weeks          | +300 XP |
| 24 weeks          | +700 XP |

---

## Healthy Rest Policy

RepLog encourages recovery.

Users are not rewarded for exercising every day.

A successful week is defined as:

* Completing the planned number of workouts
* Respecting planned rest days

Example:

Goal:

```text id="bgs0az"
5 workout days
2 rest days
```

Result:

```text id="k4mn4m"
Success
```

The user receives weekly rewards.

---

## Anti-Abuse Rules

XP should be earned fairly.

Rules:

* A workout can only grant completion XP once.
* Editing a completed workout does not grant additional XP.
* Repeated share card generation does not grant XP.
* Deleting and recreating workouts does not reset rewards.

---

## XP Sources Summary

| Category                   | Max Frequency    |
| -------------------------- | ---------------- |
| Workout completion         | Per workout      |
| Weekly goal                | Once per week    |
| Consecutive weekly success | Milestone based  |
| First workout              | Once per account |
| Share card                 | Once per day     |

---

## Example Weekly XP

Scenario:

* Weekly goal: 5 workouts
* Includes one leg day
* Monday workout completed
* Weekly goal achieved

XP earned:

| Reward                      | XP     |
| --------------------------- | ------ |
| Workout completion (5 × 50) | 250 XP |
| Monday workout              | 10 XP  |
| Leg workout                 | 20 XP  |
| Weekly goal achieved        | 100 XP |

Total:

```text id="7w62qs"
380 XP
```

Additional milestone rewards are applied separately.

---

## Progression Philosophy

Users should feel progress every week.

XP gains should be:

* Predictable
* Fair
* Understandable

Users should always know:

* Why XP was awarded
* How to earn more XP
* What their next goal is

---

## Future XP Opportunities

Potential future rewards:

* Morning workout
* New personal record
* Workout variety bonus
* Seasonal challenges
* Event participation

These features are out of scope for MVP.

---

## Open Questions

* Should missed weeks reset consecutive milestones?
* Should users be able to customize XP values?
* Should premium users receive cosmetic-only rewards?

These questions will be revisited after MVP validation.
