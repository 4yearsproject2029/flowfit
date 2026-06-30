# RL-0006 UX Specification

## Document Metadata

Story ID:

```text
RL-0006
```

Epic:

```text
EP-05 Gamification - XP
```

Created Date:

```text
2026-06-30
```

Created By:

```text
UX Designer Agent
```

Status:

```text
Approved
```

---

## User Goal

```text
Users need a lightweight reward when they complete a workout, plus a clear explanation of why XP changed.
```

---

## Screen Placement

```text
Home Screen
-> This Week
-> Weekly Calendar
-> Local data note
-> Rest Timer
-> XP summary
-> Selected-date workout list
```

---

## XP Summary Content

Before XP is awarded:

```text
0 XP
Complete a workout to earn 10 XP. XP is awarded once per workout.
```

After XP is awarded:

```text
10 XP
Earned +10 XP for completing Squat.
```

---

## Interaction Patterns

* XP is awarded when a workout moves from incomplete to complete.
* The home screen XP total updates immediately after the award.
* The explanation names the completed workout.
* Toggling a completed workout back to incomplete does not remove XP.
* Completing the same workout identity again does not award duplicate XP.

---

## Out Of Scope

* Levels.
* XP progress bars.
* Badges, streaks, weekly goal progress, or share cards.
* XP history screens.
* Backend, login, sync, analytics, social graph, or public ranking.

---

## Agent Handoff

Current Agent:

```text
UX Designer
```

Completed Output:

```text
user_stories/RL-0006/RL-0006_UX_SPEC.md
```

Next Agent:

```text
User Story Interpreter
```
