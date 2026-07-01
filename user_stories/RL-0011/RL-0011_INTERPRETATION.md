# RL-0011 Interpretation

## Document Metadata

Story ID:

```text
RL-0011
```

Epic:

```text
EP-08 Privacy
```

Created Date:

```text
2026-07-01
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

## Source Of Truth

When conflicts exist, follow this priority order:

1. user_stories/RL-0011/RL-0011_SPRINT_PLAN.md
2. docs/EPIC_USER_STORY_TASKS.md
3. docs/PRODUCT_BRIEF.md
4. docs/ARCHITECTURE.md
5. user_stories/RL-0010/RL-0010_RELEASE_NOTE.md

Do not expand scope.

---

## Story Summary

RL-0011 adds privacy controls to the released RL-0010 share-card experience. Users should continue seeing consistency-focused card content by default, and hidden performance metrics must remain hidden unless the user explicitly opts in. Supported preference choices should persist locally.

This story builds on RL-0010 only. It must not add public social features, automatic publishing, login, backend services, cloud sync, analytics SDKs, ranking, likes, comments, followers, or broad card customization.

---

## User Story

```text
As a user,
I want control over which metrics appear on share cards,
so that I can share progress comfortably.
```

---

## Acceptance Criteria

| AC ID | Description |
| ----- | ----------- |
| AC-01 | Share cards show consistency-focused metrics by default. |
| AC-02 | Users can preview cards before sharing. |
| AC-03 | Hidden performance metrics require explicit opt-in. |
| AC-04 | Share cards are never published automatically. |
| AC-05 | Share preferences persist locally. |

---

## Acceptance Criteria Mapping

| AC ID | Functional Requirement | Validation Method |
| ----- | ---------------------- | ----------------- |
| AC-01 | Existing workout, level, and weekly cards must keep privacy-safe defaults. | Service and widget tests |
| AC-02 | Users must see the card preview before generating confirmation. | Widget tests |
| AC-03 | Supported performance metrics must be hidden until the user toggles an explicit opt-in. | Service and widget tests |
| AC-04 | No workflow may auto-share, auto-publish, or open public posting behavior. | Code review and QA |
| AC-05 | Supported share preference choices must persist in local storage. | Storage/service test |

---

## Approved MVP Privacy Defaults

Default visible content:

* RepLog brand.
* Card title.
* Consistency-focused message.
* Workout name or generic workout label.
* Date label.
* Current level.
* XP progress label.
* Weekly goal completed count versus goal.

Hidden by default:

* Weight.
* Sets.
* Reps.
* Calories.
* PRs.
* Memo text.
* Any public comparison, ranking, or superiority language.

Supported RL-0011 opt-in:

```text
Show workout performance metrics
```

This preference may reveal sets, reps, and weight on workout completion cards only when those values exist. Calories and PRs are not supported by the current local model and must remain absent. Memo text remains hidden for RL-0011.

---

## Functional Requirements

* The system shall preserve RL-0010's three card types: workout, level, and weekly goal.
* The system shall keep all generated card content private by default.
* The system shall provide an explicit opt-in control before supported workout performance metrics appear.
* The system shall persist the supported opt-in choice locally.
* The system shall let users preview visible card information before Generate confirmation.
* The system shall never publish, share, upload, rank, or compare cards automatically.
* The system shall not add backend, login, cloud sync, analytics SDK, social graph, public ranking, likes, comments, followers, or public feed.

---

## Data Requirements

Existing source data:

| Source | Usage |
| ------ | ----- |
| WorkoutLog sets, reps, weight | Optional supported performance metrics for workout cards after opt-in. |
| Existing share-card service data | Card defaults and preview content. |
| Local primitive Hive settings | Persist supported opt-in choice. |

New persisted state:

```text
One local boolean preference for showing supported workout performance metrics on share cards.
```

Migration requirement:

```text
No adapter-backed migration required. Prefer an existing primitive settings box.
```

---

## UX Requirements

UX Required:

```text
Yes
```

Required UX decisions:

* Where the privacy control appears in the RL-0010 preview sheet.
* Exact label and helper text for the opt-in control.
* How the preview updates when the user toggles metric visibility.
* How persistence is communicated without adding instructional clutter.
* How unavailable metrics remain absent.

---

## Validation Rules

* Workout performance metrics are hidden when the opt-in preference is false or unset.
* Workout performance metrics may appear only after the user explicitly enables the supported opt-in.
* Level and weekly goal cards remain consistency-focused and do not expose workout performance metrics.
* Memo text remains hidden.
* Calories and PRs remain hidden because the current app does not support them as card data.
* The preference persists after app restart.
* Generate confirmation remains user-initiated and local.

---

## Out Of Scope

* Public feed.
* Likes, comments, followers, messaging, or social graph.
* Public rankings or leaderboards.
* Automatic publishing.
* Backend, login, cloud sync, analytics SDK, or remote storage.
* Native share-sheet export.
* Full card theme, template, avatar, or layout customization.
* Memo sharing.
* Calories or PR display.
* MVP validation dashboards.

---

## Task Interpretation

| Task ID | Interpretation | Status |
| ------- | -------------- | ------ |
| RL-0011-T01 | Define privacy defaults, explicit opt-in metrics, preview requirements, local persistence, and out-of-scope boundaries. | Complete |
| RL-0011-T02 | UX Designer should specify the preview-sheet control flow and copy. | Ready |
| RL-0011-T03 | Code Writer should update preview behavior after UX is complete. | Blocked until UX |
| RL-0011-T04 | Code Writer should implement the supported explicit opt-in after UX is complete. | Blocked until UX |
| RL-0011-T05 | Code Writer should persist the supported local preference after UX is complete. | Blocked until UX |
