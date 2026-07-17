# SCREEN_STRUCTURE.md

Version: 1.1
Status: Draft (Phase 2)

---

# Purpose

This document defines:

* Screen hierarchy
* Navigation relationships
* Screen responsibilities
* Information ownership

before wireframe and UI design.

---

# Product Flow

```text
Launch
↓

Home Dashboard
↓

Current Workout
↓

Workout Summary
↓

Achievement Reward
↓

Home Dashboard
```

---

# Navigation Structure

```text
Bottom Navigation

1. Home
2. Today
3. Week
4. Achievement
5. History
```

---

# Screen Hierarchy

```text
Home
├── Achievement Detail
├── Current Workout
└── Weekly Workout

Today
└── Current Workout

Week
├── Weekly Plan Editor
├── Daily Workout Preview
└── Workout Plan Builder
    └── Add Exercise Bottom Sheet

Achievement
├── Achievement Detail
├── Title Detail
└── Milestone Detail

History
├── Workout Session Detail
└── Share Result
```

---

# 1. HOME

## Purpose

Answer:

> What should I do today?

Home is an overview screen.

It should provide clarity and motivation.

It should never become a management screen.

---

## Information Structure

### Hero Area

Current Identity State

Displays:

* Level
* XP Progress
* Current Title

---

### Section 1

Today's Workout Card

Displays:

* Planned workout
* Workout progress
* Resume status

CTA:

```text
Start Workout
Resume Workout
Plan Workout
```

Destination:

```text
Current Workout
Workout Plan Builder
```

Rules:

* Start Workout and Resume Workout appear only when a valid daily session exists or an active workout can be resumed.
* Plan Workout appears when today has no saved daily session.
* Home may preview today's session, but it does not edit exercises.

---

### Section 2

Weekly Workout Card

Displays:

* Weekly completion
* Goal progress

CTA:

```text
View Week
```

Destination:

```text
Week
```

---

### Section 3

Achievement Preview Card

Displays:

* Recent unlock
* Next achievement
* Progress preview

CTA:

```text
View Achievements
```

Destination:

```text
Achievement
```

---

## Home Excludes

* Exercise editing
* Workout history
* Rest timer controls
* Detailed statistics
* Share cards
* Muscle maps

---

# 2. TODAY

## Purpose

Answer:

> What should I do next?

This is the core execution experience.

---

## Information Structure

### Header

Displays:

* Workout name
* Current progress
* Estimated remaining exercises

---

### Exercise Flow Area

Displays:

* Current exercise
* Sets
* Reps
* Weight
* Completion state

Actions:

```text
Complete Exercise
Skip Exercise
Edit Exercise
```

---

### Upcoming Exercises

Displays:

```text
Next:
Bench Press
↓

Incline Press
↓

Cable Fly
```

Purpose:

Reduce decision fatigue.

---

### Rest Flow

After completing an exercise:

```text
Exercise Complete
↓

Suggest Rest
↓

Start Timer
```

---

### Sticky Floating Timer

Available globally.

Can resume workout from anywhere.

---

# 3. WORKOUT SUMMARY

## Purpose

Celebrate completion.

This screen exists to reinforce habit formation.

---

## Information Structure

### Hero Celebration Area

Displays:

* Completion animation
* Congratulations message
* Workout duration
* XP gained

---

### Achievement Section

Displays:

* New achievements
* Level up
* New titles

---

### Personal Progress Section

Displays:

* Weekly streak
* Weekly completion
* Milestones reached

---

### Share Section

Actions:

```text
Share Summary
Share Achievement
```

---

### CTA

```text
Return Home
```

---

# 4. WEEK

## Purpose

Answer:

> What is my plan this week?

This screen manages workout planning.

---

## Information Structure

### Weekly Progress Header

Displays:

* Weekly goal
* Completion rate
* Remaining workouts

---

### Weekly Calendar

Displays:

```text
Mon
Tue
Wed
Thu
Fri
Sat
Sun
```

---

### Daily Workout Cards

Displays:

* Planned workout
* Completion state

Actions:

```text
Edit
View
```

Destinations:

```text
Workout Plan Builder
Planned Session Detail
```

---

### Weekly Workout List

Displays all planned sessions.

Purpose:

Provide visibility into upcoming workouts.

---

# 4A. WORKOUT PLAN BUILDER

## Purpose

Answer:

> What is today's workout made of?

This screen composes one daily workout session before execution.

It belongs to Workout Planning and hands off to Dashboard and Current Workout after save.

---

## Information Structure

### Header

Displays:

* Back action
* Plan Workout title
* Supporting text for today's build context

---

### Session Summary Card

Displays:

* Session title
* Exercise count
* Estimated duration where locally available
* Intensity label where locally available

Actions:

```text
Edit Session Title
```

---

### Ordered Exercise List

Displays each exercise in insertion order:

* Position number
* Exercise name
* Category or muscle group
* Sets
* Reps
* Optional weight
* Optional rest time
* More actions affordance

Actions:

```text
Open Exercise
Delete Exercise
```

Ordering rules:

* Exercises are ordered by insertion order.
* New exercises append to the end of the list.
* Deleted exercises are removed and remaining item numbers close the gap.
* Editing an exercise does not move it.
* Drag-and-drop sorting is out of scope.

The approved design may show a Reorder affordance, but manual sorting is deferred until a later approved story.

---

### Add Exercise Entry

Action:

```text
Add Exercise
```

Destination:

```text
Add Exercise Bottom Sheet
```

---

### Save Action

Action:

```text
Save Workout
```

Behavior:

* Saves one daily session locally.
* Returns the user to the prior planning or Dashboard context.
* Makes the session available to Dashboard Today's Workout and Current Workout.
* Is disabled or blocked until the session contains at least one valid exercise.

---

## Empty State

When the session has no exercises:

* Keep the session shell visible.
* Show the Add Exercise entry as the primary body action.
* Do not allow starting Current Workout.
* Do not save an empty session as today's executable workout.

---

## Workout Plan Builder Excludes

* Workout execution
* Set completion
* Rest timer countdown
* XP or reward granting
* Templates
* Multiple sessions per day
* Drag-and-drop sorting
* Completed History editing

---

# 4B. ADD EXERCISE BOTTOM SHEET

## Purpose

Add or edit one planned exercise without leaving Workout Plan Builder.

---

## Information Structure

### Form Fields

Displays:

* Exercise name
* Category
* Sets
* Reps
* Weight optional
* Rest time optional
* Memo optional

---

### Actions

```text
Add Exercise
Save Changes
Cancel
Dismiss
```

Behavior:

* Add Exercise appends the new exercise to the end of the session.
* Save Changes updates the selected exercise in place.
* Cancel and Dismiss return to the builder without saving form changes.
* Invalid required fields keep the user in the sheet with clear validation state.

---

## Add Exercise Bottom Sheet Excludes

* Session execution
* Workout templates
* Workout completion
* History editing
* Cloud exercise libraries
* AI exercise suggestions

---

# 5. ACHIEVEMENT

## Purpose

Reward and recognition.

This is one of RepLog's identity pillars.

---

## Information Structure

### Hero Profile

Displays:

* Level
* XP
* Current Title

---

### Achievement Progress

Displays:

* Total unlocked
* Completion %
* Next unlock

---

### Achievement Categories

Examples:

```text
Consistency
Milestones
Streaks
Workout Volume
Special Events
```

---

### Title Collection

Displays:

* Current title
* Locked titles
* Unlock requirements

---

### Share Moments

Displays:

* Recent unlock cards
* Share CTA

---

# 6. HISTORY

## Purpose

Answer:

> What have I already done?

This is a review screen.

---

## Information Structure

### Session List

Displays:

* Date
* Workout name
* Duration

---

### Workout Detail

Displays:

* Exercises performed
* Sets
* Reps
* Weight
* Notes

---

## History Excludes

* Celebration
* Achievement animations
* Reward flow

Those belong only to Workout Summary.

---

# Global Components

---

## Floating Rest Timer

Ownership:

```text
Workout Flow System
```

Visible On:

* Home
* Week
* Achievement
* History

Behavior:

```text
Tap
↓

Resume Workout
```

---

## Workout State

Workout session should persist globally.

User can freely navigate without losing progress.

---

# Screen Responsibility Matrix

| Screen          | Primary Question                 |
| --------------- | -------------------------------- |
| Home            | What should I do today?          |
| Today           | What should I do next?           |
| Week            | What is my plan this week?       |
| Workout Plan Builder | What is today's workout made of? |
| Add Exercise Bottom Sheet | What exercise should be added or changed? |
| Achievement     | What have I earned?              |
| History         | What have I done?                |
| Workout Summary | Why should I come back tomorrow? |
