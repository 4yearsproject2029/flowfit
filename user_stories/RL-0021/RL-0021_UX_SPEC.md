# RL-0021 UX Specification

## Document Metadata

Story ID:

```text
RL-0021
```

Epic:

```text
EP-15 Phase 2 UX Quality
```

Created Date:

```text
2026-07-17
```

Last Updated:

```text
2026-07-17
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

## Source Of Truth

Priority order when conflicts exist:

1. user_stories/RL-0021/RL-0021_SPRINT_PLAN.md
2. docs/PRODUCT_BRIEF.md
3. docs/PROJECT_CONTEXT.md
4. docs/EPIC_USER_STORY_TASKS.md

---

## Workflow Validation

Read:

```text
user_stories/RL-0021/RL-0021_SPRINT_PLAN.md
```

Locate:

```text
UX Required:
```

Allowed values:

* Yes
* No

Rules:

* If UX Required = No, stop immediately.
* Do not create UX documentation.

---

## UX Trigger Reason

Document why UX work is required.

Selected Reason:

```text
RL-0021 translates approved Phase 2 screen designs into implementation-ready guidance for primary workout-flow, planning, review, achievement, and QA stories.
```

---

## User Goal

Implementation agents need a practical handoff that preserves the approved visual direction without requiring developers to redesign screens during coding.

The value is reduced ambiguity for RL-0015 and downstream Phase 2 stories while keeping RepLog focused on guided workout flow, local-first behavior, privacy, and non-comparison motivation.

---

## User Flow

Format:

```text
Approved Phase 2 PNGs
→ UX handoff notes
→ Story-specific implementation
→ Review and QA checkpoints
→ Consistent Phase 2 screens
```

---

## Entry Points

* Coordinator starts RL-0021 after RL-0014 release closeout.
* UX Designer reviews `design/approved/*` and source-of-truth docs.
* Downstream implementation stories consume this handoff before screen work.

---

## Exit Points

* RL-0015 Current Workout foundation can start after RL-0021 release.
* Code Reviewer and QA Tester can validate future screens against shared checkpoints.
* Home follow-up guidance remains advisory and must not reopen RL-0014 without a significant UX issue.

---

## Screen Placement

Document information hierarchy.

1. Workout Flow screens: Home, Current Workout, Rest Timer, Workout Summary.
2. Planning and review screens: Week, planned Session Detail, History, completed Workout Detail.
3. Achievement screens: Dashboard preview and full Achievement hub.
4. Shared visual system: dark surface, cyan emphasis, compact cards, clear primary action, bottom navigation.
5. QA checkpoints: mobile fit, touch targets, contrast, text non-overlap, and responsibility boundaries.

---

## Components

| Component | Purpose | Priority |
| --------- | ------- | -------- |
| Dark app shell | Creates consistent Phase 2 visual foundation across approved screens. | Primary |
| Cyan primary action | Identifies the next action such as Resume Workout, Complete Set, Skip Rest, Plan Tomorrow, or Start Today. | Primary |
| Progress indicators | Show workout, weekly, rest, XP, achievement, or session progress without analytics pressure. | Primary |
| Compact content cards | Group screen-specific information while keeping the primary action visible. | Primary |
| Bottom navigation | Preserves predictable navigation between Home, Today, Week, Achievement, and History. | Primary |
| Local imagery placeholders | Support exercise/session identity where approved designs show photos, without requiring external asset services. | Secondary |
| Icon buttons | Support common secondary actions such as back, share, settings, close, adjust, pause, skip, and calendar. | Secondary |
| QA checklist rows | Give reviewers consistent acceptance checks per screen. | Secondary |

---

## Interaction Patterns

* Primary action buttons use one visually dominant cyan treatment per screen.
* Secondary controls use restrained dark buttons, icon buttons, or text actions.
* Bottom navigation changes screen responsibility but should not duplicate screen content across destinations.
* Current Workout owns active execution and should not become a workout editor.
* Rest Timer appears as an overlay/modal during active workout rest, dimming the Current Workout background.
* Workout Summary appears immediately after completion and should not be reopened from History.
* Week owns planning and may show planned-session entry points, but detailed Start Today behavior belongs to RL-0025.
* History owns read-only review and must not expose editing, Start Workout, or celebration states.
* Achievement language must avoid public ranking, percentile claims, penalties, and social comparison.

---

## Feedback Mechanisms

* Success: completion praise, achievement unlock card, progress completion state.
* Failure: no failure state is introduced by RL-0021; downstream stories should keep recovery language supportive.
* Progress: cyan bars, circular timer progress, workout step counts, weekly completion, and achievement progress.
* Achievements: reward language should recognize consistency and return behavior without ranking users against others.

---

## Empty States

| Scenario | Message | Action |
| -------- | ------- | ------ |
| No planned workout on Home | No workout planned for today. | View Week |
| No active workout | Start from today’s plan when ready. | Start Workout or View Week |
| No completed History records | Completed workouts will appear here. | Back to Home |
| No achievements unlocked | Keep showing up to unlock your first milestone. | Back to Home |

---

## Error States

| Scenario | Message | Recovery Action |
| -------- | ------- | --------------- |
| Approved design element conflicts with product rules | This visual detail needs a scoped product decision. | Return to Coordinator |
| External asset dependency would be required | Use a local asset or simplified placeholder. | Continue with local-first substitute |
| Text or controls do not fit common iPhone layout | Layout needs adjustment before release. | Fix in owning implementation story |

---

## Loading States

```text
Not required for RL-0021 because this story produces documentation only and introduces no runtime loading behavior.
```

---

## Accessibility Considerations

Verify:

* Font sizes are readable on common iPhone widths.
* Color contrast is sufficient between dark surfaces, gray labels, white text, and cyan emphasis.
* Touch targets are at least 44px.
* Labels are descriptive.
* Navigation is predictable.

Avoid:

* Color-only communication.
* Hidden interactions.
* Small touch targets.
* Text over imagery without a darkening strategy.
* Overlapping labels, badges, progress indicators, or bottom navigation.

---

## Analytics Recommendations

```text
Not required for Phase 2. Do not add external analytics SDKs.
```

---

## Approved Screen Handoff Notes

| Screen | Approved File | Owner Stories | Build Guidance | QA Checkpoints |
| ------ | ------------- | ------------- | -------------- | -------------- |
| Home Dashboard | `design/approved/01_home_screen.png` | RL-0014, advisory only | Keep released Home focused on greeting, XP signal, Today’s Focus, Weekly Progress, Next Achievement, and bottom nav. Do not reopen RL-0014 for cosmetic drift already accepted. | Home answers what to do today, excludes history/timer/editing/stat dashboards, preserves clear Start or Resume action. |
| Current Workout | `design/approved/02_current_workout.png` | RL-0015, RL-0022, RL-0023 | Establish dark execution screen with workout progress, active exercise, instruction text, target sets/reps, image area, and Complete Set placeholder. Use local image assets or placeholders only. | Primary action visible, execution separated from planning/history, pause/adjust/skip deferred unless story owns them. |
| Rest Timer Overlay | `design/approved/03_timer.png` | RL-0018, RL-0032 | Use modal overlay over Current Workout with dimmed background, circular countdown, close, Skip Rest, and Extend action. | Overlay remains connected to active workout, timer controls are touch-safe, cross-screen continuity waits for RL-0032. |
| Workout Summary | `design/approved/04_workkout_summary.png` | RL-0016, RL-0024 | Lead with celebration, then reward/progress, then private session details and return actions. Keep sharing user-initiated. | Summary appears only immediately after completion and cannot be reopened from History. Performance metrics stay private. |
| Week Planning | `design/approved/05_weekly_plan.png` | RL-0017, RL-0025 | Show week navigation, day chips, today’s plan, session preview, Start Today entry point, and lightweight suggestions. | Week owns planning, not history review. Planned detail/start handoff waits for RL-0025. |
| Achievement Hub | `design/approved/06_achievement.png` | RL-0019, RL-0028, RL-0029 | Use level/XP/rep-score style data, milestone cards, and reward states. Replace comparison claims such as percentiles with personal consistency language. | No rankings, public percentile, leaderboards, social comparison, penalties, or level loss. |
| History | `design/approved/07_history.png` | RL-0026 | Use grouped completed workout records with read-only navigation to detail. Treat active nav mismatch in image as a design note, not a product rule. | History is read-only and excludes Start Workout, rest timer, editing, and summary celebration. |
| Workout Detail | `design/approved/08_workout_detail.png` | RL-0025, RL-0027 | Split meaning by entry point: planned/session detail may start workout; completed History detail is read-only. | Planned detail can start today only in RL-0025. Completed detail must not grant rewards or reopen Summary. |

---

## Shared Visual Guidance

| Area | Guidance |
| ---- | -------- |
| Layout | Prefer vertically stacked, scroll-safe sections with stable spacing and no nested cards inside larger cards unless the owning screen already requires a repeated item. |
| Color | Use a dark app background, elevated dark surfaces, white primary text, muted gray secondary text, and cyan for primary action/progress only. |
| Typography | Use clear hierarchy with compact headings inside panels and avoid oversized text in constrained cards. |
| Icons | Prefer existing Flutter Material icons for build speed and consistency. Custom icons from mockups may be approximated when they are decorative. |
| Imagery | Do not fetch external images. Use local assets, existing app-safe placeholders, or simplified exercise blocks. |
| Spacing | Preserve generous touch zones around buttons and icon controls; avoid cramming action rows on compact devices. |
| Navigation | Bottom nav labels remain Home, Today, Week, Achievement, History unless a later approved story changes navigation language. |

---

## Out Of Scope

* App-code implementation.
* Reopening RL-0014.
* Redesigning approved Phase 2 flows.
* Backend, login, cloud sync, external asset services, external analytics SDKs, social graph, public ranking, or public profiles.
* New reward engines, configurable achievement systems, AI coaching, or advanced analytics.
* Implementing RL-0015, RL-0022, RL-0023, RL-0018, RL-0032, RL-0016, RL-0024, RL-0017, RL-0025, RL-0026, RL-0027, RL-0019, RL-0028, RL-0029, RL-0030, RL-0031, or RL-0020 inside this story.

---

## Open Questions

```text
None. No blocker file required.
```

---

## Related Documents

* docs/PRODUCT_BRIEF.md
* docs/PROJECT_CONTEXT.md
* docs/ARCHITECTURE.md
* docs/EPIC_USER_STORY_TASKS.md
* docs/USER_JOURNEY.md
* docs/SCREEN_STRUCTURE.md
* user_stories/RL-0021/RL-0021_SPRINT_PLAN.md

---

## Revision History

| Version | Date | Author | Summary |
| ------- | ---- | ------ | ------- |
| v1.0 | 2026-07-17 | UX Designer Agent | Initial approved Phase 2 design handoff. |

---

## Agent Handoff

Current Agent:

```text
UX Designer
```

Completed Output:

```text
user_stories/RL-0021/RL-0021_UX_SPEC.md
```

Next Agent:

```text
User Story Interpreter
```

Next Prompt:

```text
AI_Agents/prompts/interpret_user_story.md
```

Required Input Files:

- `docs/EPIC_USER_STORY_TASKS.md`
- `docs/PROJECT_CONTEXT.md`
- `docs/ARCHITECTURE.md`
- `user_stories/RL-0021/RL-0021_SPRINT_PLAN.md`
- `user_stories/RL-0021/RL-0021_UX_SPEC.md`

Optional Input Files:

- `docs/PRODUCT_BRIEF.md`
- `docs/USER_JOURNEY.md`
- `docs/SCREEN_STRUCTURE.md`

Expected Output:

- `user_stories/RL-0021/RL-0021_INTERPRETATION.md`

Blocking Conditions:

- Stop if the UX handoff is missing or contradicts acceptance criteria.
- Stop if downstream work would require new product requirements.

Instructions:

- Preserve approved Phase 2 direction.
- Do not reopen RL-0014.
- Do not implement app code.
