# RepLog User Journeys

Version: 2.1

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
📅 Week
      ↓
Weekly Workout Plan
      ↓

• Add Exercise
• Edit Exercise
• Delete Exercise
• Reorder Exercise
• Change Day

      ↓
Auto Save
      ↓
🏠 Home Dashboard
```

## Success Criteria

* Planning should take only a few minutes.
* Planning should feel lightweight rather than administrative.

## UX Principles

* Week focuses on planning.
* Auto Save only.
* Day-based layout.
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
