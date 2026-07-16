# Product Brief

## Vision

RepLog is a Workout Flow Assistant.

RepLog helps beginner and returning fitness users build sustainable workout habits by guiding them through what to do today, what to do next during a workout, and why coming back matters. The product does not optimize athletic performance. It reinforces consistency through simple guidance, completion, celebration, reward, and return motivation.

Core product loop:

```text
Guide -> Complete -> Celebrate -> Reward -> Come Back
```

Users should feel proud that they showed up, even before physical results are obvious.

## Product Philosophy

RepLog is not a workout logging app.

Logging is supporting infrastructure. The user-facing product is the guided workout flow:

* Dashboard answers: "What should I do today?"
* Current Workout answers: "What should I do next?"
* Workout Summary celebrates completion.
* Achievement reinforces long-term consistency.

Product priorities:

* Consistency over performance
* Reward and recognition over competition
* Simplicity over complexity
* Motivation over analytics

## Problem Statement

Many workout apps focus on performance tracking, detailed analytics, public comparison, and training optimization. These products can work well for experienced fitness users, but they often create friction and pressure for beginners.

Beginner users may stop exercising because motivation fades, routines break after missed days, logging feels like work, and progress feels too small or embarrassing to share. RepLog solves this by shifting the experience from "How strong are you?" to "Did you show up, finish, and feel recognized enough to return?"

## Target Users

### Primary Users

Beginner fitness users who started working out recently and want motivation more than analytics.

They typically:

* Exercise 1 to 4 times per week.
* Want to build a sustainable workout habit.
* Feel intimidated by traditional fitness apps.
* Need clear guidance during workouts.
* Enjoy simple progress and recognition systems.
* Value encouragement, simplicity, and low-pressure self-expression.

### Secondary Users

Returning and intermediate fitness users who already exercise or have exercised before but want a lighter, more motivating way to stay consistent.

They may already use workout trackers, notes, spreadsheets, or social posts, but want a product that makes consistency feel rewarding without pushing them into advanced analytics or comparison.

## User Pain Points

* Existing workout apps feel too complicated, technical, or serious.
* Users are unsure what to do today.
* Users are unsure what to do next during a workout.
* Recording workouts can feel like extra work instead of support.
* Users lose motivation after missing a few workouts.
* Progress feels invisible when physical results are slow.
* Users feel embarrassed to share low weights, reps, or beginner-level numbers.
* Social fitness products can create comparison pressure.
* Users want encouragement without being judged, ranked, or publicly evaluated.

## Core Value Proposition

RepLog helps users complete workouts consistently by turning each session into a guided and rewarding flow.

Unlike performance-heavy fitness apps, RepLog makes today's next action clear, helps the user finish, celebrates completion, rewards consistency, and encourages the user to come back. XP, levels, achievements, weekly goals, recovery support, and optional share cards exist to strengthen that loop.

## Core User Journeys

The approved UX source of truth is:

```text
docs/USER_JOURNEY.md
```

RepLog is organized around four journeys:

| Journey | User Goal | Product Role |
| ------- | --------- | ------------ |
| Workout Flow | Complete today's workout | Guide users through the workout session and celebrate completion. |
| Workout Planning | Plan upcoming workouts | Help users prepare a realistic weekly workout plan. |
| Workout Review | Review previous workouts | Help users reflect on completed workout records. |
| Achievement & Growth | See long-term growth | Reward consistency and reinforce motivation. |

Workout Flow is the primary journey.

## Screen Responsibilities

| Screen | Responsibility |
| ------ | -------------- |
| Home Dashboard | Daily overview and entry point. Answers "What should I do today?" |
| Current Workout | Workout execution. Answers "What should I do next?" |
| Workout Summary | Immediate post-workout celebration and completion recognition. |
| Week | Weekly workout planning. |
| History | Read-only review of completed workout records. |
| Achievement | Long-term progression and rewards. |

The Dashboard should remain a clean daily overview. It should not become a history screen, analytics dashboard, exercise editor, rest-timer screen, muscle map, or share-card gallery.

## Success Metrics

Success metrics should evaluate consistency and return motivation before performance.

Primary metrics:

* Percentage of users completing a first workout after onboarding.
* Weekly active users.
* Average completed workouts per user per week.
* Weekly goal completion rate.
* Percentage of users who return after missing a workout week.
* 30-day retention rate.

Supporting metrics:

* Average share cards generated per user per week.
* Workout completion rate after starting a workout.
* Percentage of workouts completed through the Current Workout flow.
* Celebration or reward moments viewed after completion.
* Percentage of Phase 2 approved screens with completed design handoff notes before implementation.
* Percentage of Phase 2 stories completed in independently testable S/M-sized slices.

## Phase 2 Scope

Phase 2 is UI/UX Redesign & Product Refinement.

Phase 2 must align the completed MVP with the approved user journey by making RepLog feel like a Workout Flow Assistant instead of a workout tracker.

Approved Phase 2 visual design source:

```text
design/approved/
```

The approved PNGs define visual layout and screen composition for Home Dashboard, Current Workout, Rest Timer overlay, Workout Summary, Week Planning, Achievement Hub, History, and Workout Detail. Existing product documents continue to define behavior, business rules, privacy boundaries, and offline-first constraints.

Phase 2 implementation should proceed through small, independently testable stories. Approved designs should be translated into implementation handoff notes, asset decisions, and QA checkpoints before remaining screen work is implemented; this handoff must not redesign the approved UX.

### Must Have

* Phase 2 design handoff that translates approved PNGs into build-ready notes without changing the approved UX.
* Home Dashboard focused on "What should I do today?"
* Current Workout flow focused on "What should I do next?"
* Workout Summary shown immediately after completion.
* Clear separation between Dashboard, Current Workout, Summary, Week, History, and Achievement responsibilities.
* Rest Timer moved into the workout flow as an overlay/modal first, not a dashboard section.
* Cross-screen Rest Timer continuity handled as a separate story after the overlay exists.
* Achievement, XP, levels, weekly goals, and share cards positioned as recognition systems that support consistency.
* Beginner-friendly language that celebrates showing up and completion.
* Offline-first local data behavior preserved.
* Existing completed MVP behavior preserved unless it conflicts with the approved user journey.
* Story slices that keep UI foundation, navigation, state progression, persistence, rewards, sharing, timer continuity, and QA concerns independently testable where practical.

### Should Have

* Lightweight planning flow in Week.
* Read-only History for completed workout records.
* Achievement screen for long-term growth and rewards.
* Improved return-after-missed-week encouragement.
* Consistent navigation between Home, Current Workout, Week, History, and Achievement.
* Accessibility support through clear typography, large touch targets, high contrast, and predictable navigation.

### Could Have

* Additional celebration animations.
* More share-card themes.
* Cosmetic achievement rewards.
* Monthly recap cards.
* Optional cloud backup or multi-device support after product validation.
* Android or web support after product validation.

### Won't Have

* Public rankings.
* Leaderboards.
* Social feed.
* Friend system.
* Messaging.
* In-app comments, likes, or followers.
* Professional coaching tools.
* Advanced analytics dashboards.
* AI coaching or AI workout suggestions.
* Nutrition tracking.
* Video workout content.
* Wearable integrations for MVP or Phase 2.
* Desktop support.
* Authentication for MVP or Phase 2.
* Cloud synchronization for MVP or Phase 2.
* Pay-to-win mechanics, XP multipliers, or performance advantages.

## Risks

* The product may drift back into workout logging instead of guided workout flow.
* Dashboard scope may expand until users no longer know what to do today.
* Current Workout may become an editor instead of a flow assistant.
* Rewards may feel shallow if they are disconnected from completion and return motivation.
* Too many progression systems could make the product feel complex instead of simple.
* Streak mechanics could create guilt if they punish missed workouts too strongly.
* Share cards may not create value if users still feel embarrassed by fitness progress.
* The product may drift toward analytics or social comparison if scope is not actively managed.
* Users may lose their data if they uninstall the app or switch devices. This trade-off remains accepted during MVP and Phase 2 to reduce onboarding friction, eliminate backend complexity, and validate the core loop first.

## Open Questions

* What is the minimum information Current Workout needs to guide the user without becoming complex?
* Which Dashboard signals best answer "What should I do today?"
* What post-completion celebration feels rewarding without slowing users down?
* How should missed-week recovery appear without creating guilt?
* Which Achievement elements are essential for motivation in Phase 2?
* How much share-card customization is necessary for users to feel comfortable posting?
