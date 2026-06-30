# Product Owner Output - RL-0001 Story Selection

## Workflow Context

Workflow Specification:

```text
/Users/jounghwapak/Developer/AI_Agents/workflows/default_workflow_v3_final.md
```

Current Stage:

```text
Product Owner
```

Execution Boundary:

```text
Product-level story selection only. Do not continue to Coordinator or Solution Architect until this output is reviewed.
```

## Inputs Reviewed

Required inputs:

* `/Users/jounghwapak/Developer/AI_Agents/workflows/default_workflow_v3_final.md`
* `docs/PROJECT_CONTEXT.md`
* `docs/PRODUCT_BRIEF.md`
* `docs/REPLOG_CODEBASE_AUDIT.md`
* `docs/EPIC_USER_STORY_TASKS.md`

Supporting brainstorm inputs:

* `docs/brainstorm/vision.md`
* `docs/brainstorm/core_values.md`
* `docs/brainstorm/target_users.md`
* `docs/brainstorm/tech_constraints.md`
* `docs/brainstorm/competitors.md`

## Product Direction Validation

RepLog's current product direction is consistent across the Product Brief, Project Context, brainstorm notes, and codebase audit:

* RepLog is for beginner and returning fitness users.
* RepLog should help users build workout consistency rather than compete on performance.
* The MVP should preserve fast workout logging.
* The MVP is offline-first and iOS-focused.
* The MVP excludes login, backend, cloud sync, public ranking, social graph, and advanced analytics.
* Existing FlowFit workout logging functionality should be preserved where useful.
* Gamification, weekly goals, badges, and share cards are important RepLog outcomes, but should not be started before the app presents itself as RepLog and preserves the existing logging foundation.

## Selected Story ID

```text
RL-0001
```

## Story Title

```text
Brand Readiness - RepLog Naming Migration
```

## Story Selection Decision

RL-0001 is the correct first Product-level story.

## Product Rationale

RL-0001 is the lowest-risk story that moves the product from FlowFit toward RepLog without disrupting the working workout tracker foundation.

The codebase audit shows that the app already has reusable workout logging, weekly calendar, rest timer, Hive persistence, and widget tests. The biggest immediate product conflict is that the app still presents itself as FlowFit in visible UI, tests, README, package metadata, and iOS labels.

Before onboarding, weekly goals, XP, levels, badges, or share cards are introduced, users and downstream agents need a consistent product identity. Brand readiness establishes that trust while keeping the implementation surface small and reviewable.

## User Value

As a beginner or returning fitness user, consistent RepLog branding helps the app feel intentional, trustworthy, and aligned with the habit-building product promise.

This story does not yet add new motivation systems, but it removes product confusion and prepares the existing workout logging experience to become the RepLog MVP.

## Scope

Product-approved scope for RL-0001:

* Replace user-visible FlowFit naming with RepLog where the app presents its product identity.
* Update README and user-facing documentation references needed for brand consistency.
* Update app title and primary screen labels to RepLog.
* Update iOS display name to RepLog.
* Update affected tests that assert visible brand strings.
* Preserve existing workout logging, calendar, rest timer, local Hive persistence, completion toggle, and delete behavior.

## Out of Scope

The following are explicitly out of scope for RL-0001:

* Dart package rename from `flowfit` to `replog`.
* Bundle identifier changes.
* Android namespace changes.
* Generated platform project renames.
* App icon redesign.
* New onboarding flow.
* Weekly goals.
* XP, levels, badges, streaks, or reward rules.
* Share cards.
* Backend, login, cloud sync, analytics SDK, social graph, public ranking, messaging, or leaderboards.
* Broad architecture migration.
* Riverpod adoption unless a later story explicitly requires it.
* Hive model or box additions.
* Refactoring the workout logging flow beyond what is necessary for brand consistency.

## Acceptance Criteria

* All visible app names use RepLog instead of FlowFit.
* README and user-facing documentation refer to RepLog where they describe the current product identity.
* App title and primary screen labels use RepLog.
* iOS display name uses RepLog.
* Existing workout logging behavior still works after the naming update.
* Existing calendar, rest timer, completion toggle, delete action, and Hive-backed local persistence remain intact.
* Existing widget tests are updated for RepLog branding.
* No backend, login, sync, analytics SDK, XP, badges, goals, share cards, social features, or public ranking are added.
* Dart package name, bundle identifier, Android namespace, and generated project names remain unchanged unless explicitly approved in a later story.

## Risks

| Risk | Impact | Product Guidance |
| ---- | ------ | ---------------- |
| Brand migration expands into package, bundle, or platform project renaming. | Increases implementation risk and review size. | Keep RL-0001 to visible product identity only. Defer technical identity changes. |
| Tests fail because they assert FlowFit strings. | Expected test maintenance work. | Update tests only where they validate product-facing branding. |
| README rewrite becomes a broader product strategy rewrite. | Could duplicate or conflict with existing Product Brief and Project Context. | Keep README aligned but concise; do not redefine product strategy. |
| Developer starts XP, goals, or onboarding while touching product labels. | Scope creep and higher regression risk. | Defer feature systems until later stories. |
| Existing workout logging behavior regresses. | Damages the reusable FlowFit foundation. | Treat current logging behavior as protected behavior for this story. |

## Recommendation

Proceed with RL-0001 as the selected story for the next workflow stage.

Recommended Next Agent:

```text
Solution Architect
```

Recommended Next Prompt:

```text
/Users/jounghwapak/Developer/AI_Agents/prompts/create_project_context.md
```

Recommended Solution Architect focus:

* Confirm the technical boundary for a visible-branding-only migration.
* Identify exact files likely affected.
* Preserve package names, bundle identifiers, namespaces, generated project names, Hive boxes, and workout logging behavior.
* Do not introduce architecture changes.

## Agent Handoff

Current Agent:

```text
Product Owner
```

Completed Output:

```text
docs/PRODUCT_OWNER_RL-0001_SELECTION.md
```

Next Agent:

```text
Solution Architect
```

Next Prompt:

```text
/Users/jounghwapak/Developer/AI_Agents/prompts/create_project_context.md
```

Required Input Files:

* `/Users/jounghwapak/Developer/AI_Agents/workflows/default_workflow_v3_final.md`
* `docs/PROJECT_CONTEXT.md`
* `docs/PRODUCT_BRIEF.md`
* `docs/REPLOG_CODEBASE_AUDIT.md`
* `docs/EPIC_USER_STORY_TASKS.md`
* `docs/PRODUCT_OWNER_RL-0001_SELECTION.md`

Optional Input Files:

* `docs/brainstorm/`
* Existing Flutter source files relevant to visible product naming

Expected Output:

* Solution Architect output for RL-0001 technical boundary and implementation guidance.

Blocking Conditions:

* None identified.

Instructions:

* Use RL-0001 as the selected story.
* Do not change story status in Product Owner stage.
* Do not implement code.
* Do not continue past Solution Architect planning without stakeholder review.
* Preserve existing working workout logging behavior.
* Keep package name, bundle identifier, Android namespace, and generated project names unchanged unless explicitly approved later.
