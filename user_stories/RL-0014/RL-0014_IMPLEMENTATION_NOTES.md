# RL-0014 Implementation Notes

## Story

RL-0014 - Dashboard Redesign

## Status

Done

## Summary

The Home Dashboard was refocused around the approved Phase 2 dashboard direction. The implementation preserves the existing offline-first MVP data model and completed reward state while changing Home from a catch-all logging surface into a daily overview with a clear next action.

## Delivered

* Dark dashboard theme aligned to `design/approved/01_home_screen.png`.
* Greeting, XP signal, level context, Today's Focus, Weekly Progress, Next Achievement, and bottom navigation.
* Today's Focus card with Start/Resume or Plan Workout action based on local workout state.
* Weekly progress and next achievement cards using existing local goal, XP, and level services.
* Dashboard exclusions for primary History, Rest Timer, Share Cards, detailed statistics, and exercise editing sections.
* Existing add-workout behavior preserved as a planning placeholder from the dashboard.

## Code Changes

Primary file:

```text
lib/features/home/screens/home_screen.dart
```

Test file:

```text
test/widget_test.dart
```

The widget tests were updated because the old tests asserted pre-Phase-2 Home responsibilities. The new assertions match the RL-0014 dashboard contract and preserve coverage for excluded Home responsibilities, bottom navigation labels, small-screen rendering, rest timer controls, and existing data behaviors.

## Scope Control

RL-0014 did not implement RL-0015 Current Workout flow. Start/Resume remains a dashboard action surface and placeholder path until the Current Workout story owns execution behavior.

No backend, login, cloud sync, external analytics SDK, social graph, public ranking, or broad rewrite was introduced.

## Accepted Visual Differences

Remaining visual differences were accepted by the user and moved to `docs/IMPROVEMENT_BACKLOG.md`:

* Final mobile proportions should be reviewed later on emulator/device.
* Placeholder icons/assets may be replaced later.
* Minor typography and spacing differences remain acceptable.

