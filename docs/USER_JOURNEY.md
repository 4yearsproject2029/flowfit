# RepLog User Journeys

Version: 2.2

Status: Approved (Phase 2 UX Source of Truth)

---

# Product Philosophy

RepLog is not a workout logging application.

RepLog is a **Workout Flow Assistant**.

Its purpose is to guide users through every workout, celebrate completion, reward consistency, and encourage them to come back again.

RepLog rewards consistency rather than athletic performance.

The entire product is organized around four user journeys.

```text
Primary Journey

1. Workout Flow

Secondary Journeys

2. Workout Planning

3. Workout Review

4. Achievement & Growth
```

Every feature in RepLog must belong to one of these journeys.

---

# Journey Overview

| Journey              | User Goal                | Product Role                                                     |
| -------------------- | ------------------------ | ---------------------------------------------------------------- |
| Workout Flow         | Complete today's workout | Guide users through the workout session and celebrate completion |
| Workout Planning     | Plan upcoming workouts   | Help users prepare a realistic weekly workout plan               |
| Workout Review       | Review previous workouts | Help users reflect on completed workout records                  |
| Achievement & Growth | See long-term growth     | Reward consistency and reinforce motivation                      |

---

# Primary Journey

# Workout Flow

## User Goal

> 오늘 운동을 시작하고 완료하고 싶다.

## System Responsibility

Guide the user through today's workout from start to finish with as little friction as possible.

RepLog should always make it obvious what the user should do next.

## User Flow

```text
🚀 App Launch
      ↓
🏠 Home Dashboard
      ↓
▶ Start / Resume Workout
      ↓
💪 Current Workout
      ↓
Exercise → Rest → Next Exercise
            (Repeat)
      ↓
🎉 Workout Complete
      ↓
📊 Workout Summary
      ↓
🏆 XP / Achievement Rewards
      ↓
🏠 Home Dashboard
```

## Success Criteria

The user should:

* Know what to do immediately.
* Complete today's workout with minimal friction.
* Feel rewarded after completion.
* Want to come back tomorrow.

## UX Principles

* Dashboard starts the workout.
* Current Workout manages the workout flow.
* Workout Summary appears only immediately after workout completion.
* Workout Summary celebrates completion.
* Achievement rewards reinforce consistency.
* Rest Timer is part of the workout flow.

---

# Secondary Journey #1

# Workout Planning

## User Goal

> 이번 주 운동 계획을 만들거나 수정하고 싶다.

## System Responsibility

Help users prepare their weekly workout schedule without unnecessary complexity.

## User Flow

```text
🏠 Home Dashboard
      ↓
Today's Workout Card
      ↓
No saved daily session
      ↓
🧱 Workout Plan Builder
      ↓
Add Exercise Bottom Sheet
      ↓
Save Workout
      ↓
🏠 Home Dashboard
      ↓
Start / Resume Workout
      ↓
💪 Current Workout
```

When a daily session already exists:

```text
🏠 Home Dashboard
      ↓
📅 Week
      ↓
Daily Workout Preview
      ↓
🧱 Workout Plan Builder
      ↓
Edit / Add / Delete Exercise
      ↓
Save Workout
      ↓
🏠 Home Dashboard
```

## Workout Plan Builder

The Workout Plan Builder creates or edits one daily workout session.

It is part of Workout Planning, not Workout Flow execution.

Responsibilities:

* Create a session title for the selected day.
* Show a summary of exercise count, estimated duration, and intensity where locally available.
* Display the ordered exercise list.
* Add exercises through the Add Exercise bottom sheet.
* Open an existing exercise for editing.
* Delete exercises from the planned session.
* Preserve exercise order by insertion order.
* Save the daily session locally.
* Hand the saved session back to Dashboard and Current Workout.

The Workout Plan Builder does not:

* Execute sets.
* Start or manage rest timers.
* Award XP.
* Create templates.
* Support multiple sessions for the same day.
* Edit completed History records.

## Add Exercise Bottom Sheet

The Add Exercise bottom sheet is the focused editor for a single planned exercise.

Responsibilities:

* Capture exercise name.
* Select category.
* Set sets and reps.
* Optionally capture weight.
* Optionally set rest time.
* Optionally capture a short memo.
* Add the exercise to the end of the current session when creating.
* Save changes in place when editing an existing exercise.

The bottom sheet should close only after a valid add, save, cancel, or dismiss action.

## Empty States

If no daily session exists:

* Dashboard should show that today's workout still needs a plan.
* The primary planning action should open Workout Plan Builder.
* Current Workout should not start an empty workout.

If the Workout Plan Builder has no exercises:

* Show the session shell.
* Provide a clear Add Exercise action.
* Disable or block Save Workout until at least one valid exercise exists.

## Editing Flow

Users can edit a daily session before starting the workout.

Editing includes:

* Session title.
* Existing exercise fields.
* Exercise deletion.
* Adding more exercises.

After a workout has started, exercise changes belong only to Current Workout control states and must remain current-session-only. Planning edits must not mutate completed History records.

## Exercise Ordering

Exercise order is insertion order.

Rules:

* The first added exercise appears as item 1.
* New exercises are appended to the end.
* Deleting an exercise closes the numbering gap.
* Editing an exercise does not change its order.
* Drag-and-drop sorting is out of scope.
* The visible Reorder affordance may be present in approved design, but full manual sorting requires a later approved story.

## Success Criteria

* Planning should take only a few minutes.
* Planning should feel lightweight rather than administrative.
* A user can create one daily session with multiple ordered exercises.
* Dashboard and Current Workout can use the saved daily session without asking the user to rebuild it.

## UX Principles

* Week focuses on planning.
* Workout Plan Builder composes one daily workout session.
* Add Exercise bottom sheet edits one exercise at a time.
* Save Workout commits the planned session locally.
* Day-based layout.
* Dashboard can prompt planning when today has no saved session.
* Workout execution belongs to Current Workout.

---

# Secondary Journey #2

# Workout Review

## User Goal

> 이전 운동 기록을 확인하고 싶다.

## System Responsibility

Allow users to review completed workouts without changing historical records.

## User Flow

```text
🏠 Home Dashboard
      ↓
📖 History
      ↓
Workout Record List
      ↓
Workout Detail
      ↓
🏠 Home Dashboard
```

## Success Criteria

Users can quickly review completed workouts without accidentally modifying history.

## UX Principles

* History is read-only.
* Workout Detail reviews completed workouts.
* Workout Summary and Workout Detail use the same WorkoutRecord.
* Workout Summary cannot be reopened from History.

---

# Secondary Journey #3

# Achievement & Growth

## User Goal

> 내가 얼마나 성장했는지 확인하고 싶다.

## System Responsibility

Reward consistency through visible long-term progression rather than performance comparison.

## User Flow

```text
🏠 Home Dashboard
      ↓
🏆 Achievement
      ↓
Level / XP / Achievements
      ↓
Milestones & Rewards
      ↓
🏠 Home Dashboard
```

## Success Criteria

Users should feel recognized for maintaining their workout habit.

## UX Principles

* Achievement focuses on long-term motivation.
* Dashboard displays short-term progress.
* Achievement displays long-term growth.
* Growth should remain simple and rewarding.
* Recognition is more important than competition.

---

# Home Dashboard

The Home Dashboard is an overview screen.

It answers:

> **"What should I do today?"**

The Dashboard contains only three sections.

## 1. Achievement Card

Displays:

* Current Level
* XP Progress
* Achievement Preview

↓

Achievement

---

## 2. Today's Workout Card

Displays:

* Today's Workout Progress
* Today's Plan Preview
* Start / Resume Workout
* Plan Workout when today's session is missing

↓

Current Workout

---

## 3. Weekly Workout Card

Displays:

* Weekly Progress
* Weekly Goal

↓

Week

The Dashboard intentionally excludes:

* Recent Workouts
* Workout History
* Rest Timer
* Muscle Map
* Share Cards
* Exercise Editing
* Detailed Statistics

The Dashboard should remain a clean daily overview.

---

# Floating Rest Timer

The Rest Timer belongs to the Workout Flow.

It is not part of the Dashboard.

The timer should remain alive while navigating between screens.

```text
Current Workout
      ↓
Rest Started
      ↓
Home
      ↓
Week
      ↓
History
      ↓
Achievement
      ↓
Floating Rest Timer
      ↓
Resume Workout
```

The Rest Timer behaves as a global floating overlay.

---

# Journey Responsibilities

| Journey              | Responsibility                                  |
| -------------------- | ----------------------------------------------- |
| Workout Flow         | Guide today's workout from start to finish      |
| Workout Planning     | Plan upcoming workouts                          |
| Workout Review       | Review completed workout records                |
| Achievement & Growth | Reinforce long-term consistency through rewards |

---

# Screen Responsibilities

| Screen          | Purpose                           |
| --------------- | --------------------------------- |
| Home            | Daily overview and entry point    |
| Current Workout | Workout execution                 |
| Workout Summary | Celebrate workout completion      |
| Week            | Weekly workout planning           |
| Workout Plan Builder | Compose one daily workout session |
| Add Exercise Bottom Sheet | Add or edit one planned exercise |
| History         | Workout history review            |
| Achievement     | Long-term progression and rewards |

---

# Core UX Principles

Dashboard:

> What should I do today?

Current Workout:

> What should I do next?

These responsibilities must never overlap.

---

# Product Loop

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

Every future feature should strengthen this loop.

---

# UX Ownership Rules

When future decisions conflict:

1. Workout Flow has priority.
2. Dashboard simplicity has priority.
3. Reward & Recognition have priority.
4. Complexity should be reduced whenever possible.
