# RL-0002 Sprint Plan

## Document Metadata

Story ID:

```text
RL-0002
```

Project Name:

```text
RepLog
```

Project Prefix:

```text
RL
```

Created Date:

```text
2026-06-30
```

Coordinator:

```text
Coordinator Agent
```

Status:

```text
Done
```

---

## Source Of Truth

Priority order when conflicts exist:

1. docs/EPIC_USER_STORY_TASKS.md
2. docs/PROJECT_CONTEXT.md
3. docs/ARCHITECTURE.md
4. docs/PRODUCT_BRIEF.md

---

## Story Selection Reason

Decision Point:

```text
Release Closeout
```

Inputs Considered:

* docs/EPIC_USER_STORY_TASKS.md
* docs/PRODUCT_BRIEF.md
* docs/PROJECT_CONTEXT.md
* docs/ARCHITECTURE.md
* docs/SPRINT_PLAN.md
* DEVELOPMENT_LOG.md
* user_stories/RL-0002/RL-0002_TASKS.md
* user_stories/RL-0002/RL-0002_UX_SPEC.md
* user_stories/RL-0002/RL-0002_INTERPRETATION.md
* user_stories/RL-0002/RL-0002_IMPLEMENTATION_NOTES.md
* user_stories/RL-0002/RL-0002_CODE_REVIEW.md
* user_stories/RL-0002/RL-0002_QA_REPORT.md
* user_stories/RL-0002/RL-0002_RELEASE_NOTE.md
* User manual testing confirmation

Selection Summary:

```text
RL-0002 was selected because RL-0000 and RL-0001 were Done, RL-0002 was the next eligible P0 Must Have story in the recommended implementation order, and its only dependency RL-0001 was complete.
```

Previous Story State:

```text
In Progress
```

New Story State:

```text
Done
```

---

## Story Snapshot

| Field | Value |
| ----- | ----- |
| Story ID | RL-0002 |
| Epic | EP-02 Onboarding |
| Priority | P0 |
| MVP | Must Have |
| Depends On | RL-0001 |
| UX Required | Yes |
| User Approval Required | No |

---

## User Story

```text
As a beginner fitness user,
I want to choose my weekly workout goal on first launch,
so that RepLog can track consistency against a realistic target.
```

---

## Acceptance Criteria

* First-time users choose a weekly goal before reaching the main experience.
* Goal options include at least 1-5 workouts per week.
* The selected goal is saved locally.
* Returning users skip onboarding.
* The goal persists after app restart.

---

## Release Summary

RL-0002 added first-launch onboarding for selecting a weekly workout goal from 1 through 5 workouts per week. The selected goal and onboarding completion state are saved locally in Hive, and returning users skip onboarding.

Manual QA confirmed the onboarding and persistence behavior. The final widget-test cleanup preserved production code and `flutter test test/widget_test.dart -r expanded` passes with 4 passing tests, 2 skipped tests, and no hang.

---

## Dependency Validation

Dependencies:

```text
RL-0001
```

Validation Result:

```text
All dependencies are complete. RL-0001 is Done in docs/EPIC_USER_STORY_TASKS.md and has an approved release note.
```

---

## Required Document Checklist

| Document | Status |
| -------- | ------ |
| docs/PRODUCT_BRIEF.md | Present |
| docs/PROJECT_CONTEXT.md | Present |
| docs/ARCHITECTURE.md | Present |
| docs/EPIC_USER_STORY_TASKS.md | Present |
| user_stories/RL-0002/RL-0002_TASKS.md | Present |
| user_stories/RL-0002/RL-0002_UX_SPEC.md | Present |
| user_stories/RL-0002/RL-0002_INTERPRETATION.md | Present |
| user_stories/RL-0002/RL-0002_IMPLEMENTATION_NOTES.md | Present |
| user_stories/RL-0002/RL-0002_CODE_REVIEW.md | Present |
| user_stories/RL-0002/RL-0002_QA_REPORT.md | Present |
| user_stories/RL-0002/RL-0002_RELEASE_NOTE.md | Present |

---

## UX Routing Decision

UX Required:

```text
Yes
```

Result:

```text
Completed
```

---

## User Approval Decision

User Approval Required:

```text
No
```

Approval Status:

```text
Not Required
```

---

## Risks

| Risk | Impact | Mitigation |
| ---- | ------ | ---------- |
| Widget tests that depend on Hive writes inside tapped button callbacks remain unreliable in `testWidgets`. | Automated coverage is reduced for onboarding Continue save and add workout Save. | Skip those callback-write tests, keep manual coverage, and run reliable widget tests with direct Hive setup through `tester.runAsync`. |
| Scope could expand into weekly goal progress tracking. | RL-0002 would overlap future weekly goals stories. | Deferred weekly progress and goal editing to future stories. |

---

## Definition Of Done

* Acceptance criteria passed.
* UX spec completed.
* Implementation completed.
* Code Review approved.
* QA passed.
* User approval was not required.
* Release note created.
* Backlog, sprint plan, task file, and development log updated.

---

## Agent Handoff

Current Agent:

```text
Release Manager
```

Completed Output:

```text
user_stories/RL-0002/RL-0002_SPRINT_PLAN.md
user_stories/RL-0002/RL-0002_RELEASE_NOTE.md
```

Next Agent:

```text
Coordinator
```

Next Prompt:

```text
/Users/jounghwapak/Developer/AI_Agents/prompts/create_sprint_plan.md
```

Required Input Files:

- docs/EPIC_USER_STORY_TASKS.md
- docs/PRODUCT_BRIEF.md
- docs/PROJECT_CONTEXT.md
- docs/ARCHITECTURE.md
- user_stories/RL-0002/RL-0002_RELEASE_NOTE.md

Optional Input Files:

- user_stories/
- DEVELOPMENT_LOG.md

Expected Output:

- Coordinator story selection and sprint plan for the next eligible story.

Blocking Conditions:

- None identified.

Instructions:

- Return control to Coordinator.
- RL-0002 is Done and must not be modified except through a future approved story.
- Recommended next story is RL-0003.
- Do not implement code from this handoff.
