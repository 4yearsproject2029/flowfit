# RL-0007 Interpretation

## Document Metadata

Story ID:

```text
RL-0007
```

Epic:

```text
EP-05 Gamification - Levels
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
Ready for UX
```

---

## Story Summary

RL-0007 makes XP progress visible as level progress. The home screen should show the user's current level and progress toward the next level so that consistency feels concrete after workouts are completed.

This story builds directly on RL-0006. It should reuse the persisted local XP total and duplicate-safe XP award behavior already released there. It should not add badges, streaks, weekly goals, share cards, backend services, login, cloud sync, analytics SDKs, public rankings, or broad app rewrites.

---

## Acceptance Mapping

| AC ID | Acceptance Criteria | Interpretation |
| ----- | ------------------- | -------------- |
| AC-01 | The home screen displays current level. | Add a visible level label or summary to the home experience. |
| AC-02 | The app displays XP progress toward the next level. | Show current progress within the active level and the XP target for the next level. |
| AC-03 | Progress updates immediately after XP changes. | Level progress must update in the same user flow that updates XP after completing a workout. |
| AC-04 | Levels never decrease. | Level calculation must not be based on editable or deletable workout-log counts. It should derive from non-decreasing XP progress. |
| AC-05 | Level progress persists after app restart. | Restarting the app must preserve current level and next-level progress through local XP persistence. |

---

## MVP Level Rules

| Rule | Decision |
| ---- | -------- |
| Starting level | Level 1 at 0 XP. |
| Level interval | 100 XP per level for MVP. |
| Level formula | `currentLevel = floor(totalXp / 100) + 1`. |
| XP into current level | `totalXp % 100`. |
| XP needed for next level | `100 - (totalXp % 100)`, except exact level boundaries show `0 / 100 XP` progress into the new level. |
| Progress percent | `(totalXp % 100) / 100`. |
| Level decrease behavior | Levels do not decrease because RL-0006 XP does not decrease when workouts are toggled, edited, deleted, or recreated. |
| Persistence source | Persisted local XP total from RL-0006. No separate persisted level record is required for MVP unless implementation discovers a reliability issue. |

Examples:

| Total XP | Current Level | Progress Text |
| -------- | ------------- | ------------- |
| 0 | Level 1 | 0 / 100 XP |
| 10 | Level 1 | 10 / 100 XP |
| 90 | Level 1 | 90 / 100 XP |
| 100 | Level 2 | 0 / 100 XP |
| 250 | Level 3 | 50 / 100 XP |

---

## Functional Requirements

* The system shall calculate current level from the persisted XP total.
* The system shall calculate progress toward the next level from the persisted XP total.
* The system shall display current level on the home screen.
* The system shall display XP progress toward the next level on the home screen.
* The system shall update current level and progress immediately after XP changes.
* The system shall preserve level progress after app restart.
* The system shall ensure levels never decrease due to missed workouts, completion toggles, edited logs, deleted logs, or recreated logs.
* The system shall keep level language beginner-friendly and focused on consistency.

---

## Non-Functional Requirements

* Level calculation should be isolated enough to unit test without rendering the full home screen.
* The home-screen UI should remain readable on common iPhone screen sizes.
* The implementation should preserve existing workout logging, completion, XP award, onboarding, calendar, and timer behavior.
* The implementation should avoid new dependencies unless directly required for the MVP level display.
* The implementation should avoid changing Hive adapter read/write order or persisted workout model structure.

---

## Out Of Scope

* Badges.
* Streaks.
* Weekly goal progress.
* Level-up animations, modals, sounds, or celebration screens.
* Share cards.
* XP history list.
* XP decay, XP removal, penalties, or missed-week punishment.
* Backend, login, cloud sync, analytics SDK, social graph, public ranking, or external services.
* Dart package rename, bundle identifier changes, Android namespace changes, or generated project renames.

---

## Task Interpretation

| Task ID | Interpretation |
| ------- | -------------- |
| RL-0007-T01 | Define the MVP level rules, display requirements, acceptance mapping, and scope boundaries in this interpretation. |
| RL-0007-T02 | UX Designer should specify how current level and next-level XP progress appear in the existing home experience without crowding workout logging. |
| RL-0007-T03 | Code Writer should implement level calculation from persisted XP, preferably in a focused helper or service with direct tests. |
| RL-0007-T04 | Code Writer should display current level and next-level progress on the home screen using the existing XP update path where practical. |
| RL-0007-T05 | Code Writer should ensure level behavior remains non-decreasing across toggle, edit, delete, and recreate scenarios. |
| RL-0007-T06 | QA Tester should validate level display, immediate progress updates, persistence after restart, and non-decreasing behavior. |
| RL-0007-T07 | Code Reviewer should review level math, UI scope, persistence assumptions, and absence of out-of-scope systems. |

---

## Execution Order Validation

1. RL-0006 is Done and released local XP persistence.
2. RL-0007-T01 is complete with this interpretation.
3. UX should define the home-screen presentation before implementation.
4. Code Writer should implement level calculation before wiring the home-screen display.
5. QA and Code Review should verify both math and user-facing behavior before release closeout.

---

## Risks And Mitigations

| Risk | Mitigation |
| ---- | ---------- |
| Level thresholds feel arbitrary. | Use a simple 100 XP interval for MVP and keep the calculation isolated so it can be tuned later. |
| Level display crowds the home screen. | UX should integrate level progress into the existing XP summary area rather than adding a large new surface. |
| Progress does not update immediately after XP changes. | Reuse or extend the existing XP listenable path from RL-0006. |
| Levels decrease after data changes. | Derive from non-decreasing XP total, not current workout-log count. |
| Scope drifts into other gamification systems. | Keep badges, streaks, weekly goals, share cards, and celebrations out of this story. |

---

## Success Criteria

* The home screen shows current level.
* The home screen shows progress toward the next level.
* Completing a workout that awards XP updates level progress immediately.
* Restarting the app preserves level progress.
* Toggling, deleting, or recreating workouts does not reduce level.
* Existing workout logging and XP behavior continue to pass validation.
* No out-of-scope systems are introduced.

---

## Agent Handoff

Current Agent:

```text
User Story Interpreter
```

Completed Output:

```text
user_stories/RL-0007/RL-0007_INTERPRETATION.md
```

Next Agent:

```text
UX Designer
```

Next Prompt:

```text
/Users/jounghwapak/Developer/AI_Agents/prompts/ux_designer.md
```

Required Input Files:

* docs/PRODUCT_BRIEF.md
* docs/PROJECT_CONTEXT.md
* docs/ARCHITECTURE.md
* docs/EPIC_USER_STORY_TASKS.md
* docs/SPRINT_PLAN.md
* user_stories/RL-0007/RL-0007_TASKS.md
* user_stories/RL-0007/RL-0007_SPRINT_PLAN.md
* user_stories/RL-0007/RL-0007_INTERPRETATION.md

Expected Output:

```text
user_stories/RL-0007/RL-0007_UX_SPEC.md
```

Instructions:

* Complete RL-0007-T02 only.
* Design the level and next-level progress presentation for the existing home experience.
* Keep the design beginner-friendly and consistency-focused.
* Do not implement code during the UX stage.
