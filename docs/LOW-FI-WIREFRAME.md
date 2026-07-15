# LOW_FI_WIREFRAMES.md

Version: 1.0
Status: Draft (Phase 2)

---

# Purpose

This document defines:

* Low fidelity screen layouts
* Information hierarchy
* Primary actions
* State transitions

before visual design and implementation.

---

# Navigation

```text
Bottom Navigation

1. Home
2. Today
3. Week
4. Achievement
5. History
```

---

# 1. HOME

## Purpose

Answer:

> What should I do today?

Home is an overview screen.

It should provide:

* Clarity
* Motivation
* Direction

---

## Layout

```text
┌─────────────────────┐
│ Greeting            │
│ Level / Current Title
└─────────────────────┘

┌─────────────────────┐
│ TODAY'S WORKOUT     │
│ Push Day            │
│ ███████░ 60%        │
│ 3 / 5 Exercises     │
│                     │
│ [Start / Resume]    │
└─────────────────────┘

┌─────────────────────┐
│ WEEKLY PROGRESS     │
│ Goal: 4 / 5         │
│ ████████░░          │
│                     │
│ [View Week]         │
└─────────────────────┘

┌─────────────────────┐
│ ACHIEVEMENT         │
│ Lv.12               │
│ Next Achievement    │
│ Routine Slayer      │
│ 2 Workouts Left     │
│                     │
│ [View Details]      │
└─────────────────────┘
```

---

## Primary CTA

```text
Resume Workout
```

---

## Secondary CTAs

```text
View Week
View Achievement
```

---

## States

### No Workout Planned

```text
No workout planned today.

[Create Plan]
```

---

### Workout In Progress

```text
Resume Workout
Floating Timer Visible
```

---

---

# 2. CURRENT WORKOUT

## Purpose

Answer:

> What should I do next?

This is the primary execution experience.

---

## Layout

```text
┌─────────────────────┐
│ Push Day            │
│ 3 / 5 Completed     │
│ ██████░░░           │
└─────────────────────┘

CURRENT EXERCISE

┌─────────────────────┐
│ Bench Press         │
│                     │
│ Set 1 □             │
│ Set 2 □             │
│ Set 3 □             │
│ Set 4 □             │
│                     │
│ Weight : 80kg       │
│ Reps   : 10         │
│                     │
│ [Complete Exercise] │
└─────────────────────┘

UP NEXT

1. Incline Press
2. Cable Fly
```

---

## Primary CTA

```text
Complete Exercise
```

---

## Secondary Actions

```text
Edit Exercise
Skip Exercise
```

---

## Completion State

```text
✅ Bench Press Completed

Rest 90 seconds?

[Start Rest]
[Skip]
```

---

## Rest State

```text
┌─────────────────────┐
│ REST                │
│                     │
│ 01:30               │
│                     │
│ Next Exercise       │
│ Incline Press       │
│                     │
│ [Skip Rest]         │
└─────────────────────┘
```

---

## Floating Timer

Visible on:

* Home
* Week
* Achievement
* History

---

## Floating Timer Layout

```text
┌─────────────────┐
│ 01:12           │
│ Next: Incline → │
└─────────────────┘
```

Tap:

```text
Resume Workout
```

---

---

# 3. WORKOUT SUMMARY

## Purpose

Celebrate completion.

Reinforce motivation.

---

## Layout

```text
┌─────────────────────┐
│ 🎉 Workout Complete │
│ Push Day Completed  │
└─────────────────────┘

┌─────────────────────┐
│ Duration            │
│ 1h 14m              │
│ XP +120             │
└─────────────────────┘

┌─────────────────────┐
│ LEVEL UP            │
│ Lv.12 → Lv.13       │
└─────────────────────┘

┌─────────────────────┐
│ NEW ACHIEVEMENT     │
│ Routine Slayer I    │
└─────────────────────┘

┌─────────────────────┐
│ THIS WEEK           │
│ 5 / 6 Workouts      │
│ One Workout Left!   │
└─────────────────────┘

┌─────────────────────┐
│ [Share]             │
│ [Return Home]       │
└─────────────────────┘
```

---

## Primary CTA

```text
Return Home
```

---

## Secondary CTA

```text
Share
```

---

## States

### Level Up

Show celebration animation.

---

### Achievement Unlock

Display achievement card.

---

### Weekly Goal Completed

Display special reward state.

---

---

# 4. WEEK

## Purpose

Answer:

> What is my plan this week?

---

## Layout

```text
┌─────────────────────┐
│ Weekly Goal         │
│ 4 / 5 Completed     │
│ ███████░░           │
└─────────────────────┘

MON ✅
TUE ✅
WED ❌
THU ⏳
FRI -
SAT -
SUN -

──────────────────────

Thursday

Push Day

[Edit]
```

---

## Primary CTA

```text
Edit Weekly Plan
```

---

## States

### Empty Week

```text
No workouts planned.

[Create Weekly Plan]
```

---

### Workout In Progress

Display indicator.

---

---

# 5. ACHIEVEMENT

## Purpose

Answer:

> What have I earned?

---

## Layout

```text
┌─────────────────────┐
│ LEVEL 13            │
│ ███████░░           │
│ Current Title       │
└─────────────────────┘

Achievements

Consistency
Milestones
Streaks
Special Events

──────────────────────

Titles

🏆 Beginner
🏆 Consistent One
🔒 Routine Slayer
```

---

## Primary CTA

```text
Explore Achievements
```

---

## States

### New Unlock

Highlight recently unlocked reward.

---

---

# 6. HISTORY

## Purpose

Answer:

> What have I already done?

````

---

## Layout

```text
July 13

┌─────────────────────┐
│ Push Day            │
│ 1h 12m              │
└─────────────────────┘

July 11

┌─────────────────────┐
│ Leg Day             │
│ 58m                 │
└─────────────────────┘
````

Tap:

```text
Workout Detail
```

---

## Workout Detail

Displays:

* Exercises
* Sets
* Reps
* Weight
* Duration

---

## Excludes

History must not contain:

* Celebration
* XP rewards
* Achievement animations

Those belong only to Workout Summary.

---

# Global States

---

## Active Workout

Visible globally.

```text
Workout In Progress
↓
Floating Rest Timer
↓
Resume Workout
```

---

## Empty User State

All screens should support:

* First workout
* No plans
* No achievements
* No history

with motivational empty states.

---

# Screen Flow Summary

```text
Home
↓

Current Workout

↓

Rest

↓

Workout Complete

↓

Workout Summary

↓

Achievement Reward

↓

Home
```

This flow represents the core RepLog experience:

```text
Guide
↓

Complete
↓

Celebrate
↓

Reward
↓

Come Back
```
