# RL-0035 Tasks

Bug source:

```text
Weekly Progress counts completed exercise rows instead of completed daily workout sessions.
```

| Status | Task ID | Description | Owner Agent |
| ------ | ------- | ----------- | ----------- |
| Done | RL-0035-T01 | Consult Solution Architect and Business Analyst to confirm the counting boundary and create the bug-fix story. | Business Analyst |
| Done | RL-0035-T02 | Interpret Weekly Progress session-counting requirements against existing weekly goal and daily session behavior. | User Story Interpreter |
| Done | RL-0035-T03 | Update weekly goal progress calculation so one completed daily session counts once even when it contains multiple completed exercises. | Code Writer |
| Done | RL-0035-T04 | Review the implementation for scope, duplicate prevention, date handling, and regression coverage. | Code Reviewer |
| Done | RL-0035-T05 | Execute focused QA for weekly progress service behavior and analyzer validation. | QA Tester |
| Done | RL-0035-T06 | Close the bug-fix story and sync release artifacts. | Release Manager |

Notes:

* RL-0035 is a bug-fix story.
* UX Designer is not required because the visible UI layout, navigation, and copy do not change.
* The fix must not add backend, login, cloud sync, schema migration, or broad workout-history redesign.
