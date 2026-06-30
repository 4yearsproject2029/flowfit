# RL-0004 Interpretation

## Document Metadata

Story ID:

```text
RL-0004
```

Epic:

```text
EP-04 Offline Experience
```

Created Date:

```text
2026-06-30
```

Created By:

```text
User Story Interpreter Agent
```

Status:

```text
Approved
```

---

## Story Summary

RL-0004 confirms the offline-first MVP persistence baseline. Workout logs, completion state, weekly goals, and onboarding state must persist locally without login, network, backend, or cloud sync. Users must also be informed that uninstalling the app or switching devices may cause data loss.

---

## Acceptance Criteria

| AC ID | Description |
| ----- | ----------- |
| AC-01 | Workout logs persist after app restart. |
| AC-02 | Completion state persists after restart. |
| AC-03 | Weekly goals and onboarding state persist after restart. |
| AC-04 | No login or network connection is required. |
| AC-05 | Users are informed that uninstalling the app or changing devices may result in data loss. |

---

## MVP Data Inventory

| Data | Existing Storage | Persistence Rule |
| ---- | ---------------- | ---------------- |
| Workout logs | Hive `workoutLogBox` | Persist locally by workout log ID. |
| Completion state | `WorkoutLog.isCompleted` in Hive `workoutLogBox` | Persist as part of each workout log. |
| Weekly goal | Hive `weeklyGoalBox` | Persist selected 1-5 workouts-per-week value. |
| Onboarding state | Hive `appSettingsBox` and valid weekly goal | Persist whether the user can skip onboarding. |

---

## Functional Requirements

* The system shall preserve existing Hive boxes and adapter IDs.
* The system shall keep workout logs available after Hive reopens.
* The system shall keep completion state available after Hive reopens.
* The system shall keep weekly goal and onboarding completion state available after Hive reopens.
* The system shall not require login, network access, backend services, cloud sync, or analytics SDKs for MVP flows.
* The system shall show user-facing copy warning that uninstalling RepLog or switching devices may result in data loss.

---

## Out Of Scope

* Storage architecture redesign.
* New Hive boxes or migrations.
* Cloud sync, account login, backup, or export.
* XP, levels, weekly goal progress, share cards, or validation metrics.
* Revisiting the documented Hive widget-test callback issue.

---

## Agent Handoff

Current Agent:

```text
User Story Interpreter
```

Completed Output:

```text
user_stories/RL-0004/RL-0004_INTERPRETATION.md
```

Next Agent:

```text
Code Writer
```
