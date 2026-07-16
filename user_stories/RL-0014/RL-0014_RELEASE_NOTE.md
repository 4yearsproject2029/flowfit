# RL-0014 Release Note

## Story

RL-0014 - Dashboard Redesign

## Status

Done

## Summary

RepLog now has the Phase 2 Home Dashboard foundation. Home has been refocused around today's action, visible XP/level context, weekly progress, next achievement, and bottom navigation while preserving existing local MVP data and offline-first behavior.

## Delivered

* Approved dark dashboard direction based on `design/approved/01_home_screen.png`.
* Greeting, XP signal, Today's Focus, Weekly Progress, Next Achievement, and bottom navigation.
* Dashboard action surface for starting/resuming a planned workout or planning a workout.
* Removal of primary Home sections for Rest Timer, Share Cards, History-style lists, detailed statistics, and exercise editing.
* Updated widget coverage for the new Home contract.

## Validation

* `flutter analyze` passed with no issues.
* `flutter test -r expanded` passed with 37 passing tests and 5 documented skipped tests.

## User Approval

User approval was provided on 2026-07-16 with the instruction:

```text
RL-0014 is approved. Let's close this.
```

The user explicitly accepted the remaining minor visual differences and instructed that they be recorded in the improvement backlog instead of continuing visual polish.

## Known Improvements

Tracked in `docs/IMPROVEMENT_BACKLOG.md`:

* Final mobile proportions should be reviewed later on emulator/device.
* Placeholder icons/assets may be replaced later.
* Minor typography and spacing differences remain acceptable unless a significant UX issue is discovered.

## Next Recommended Story

RL-0021 - Phase 2 Design Handoff, then RL-0015 - Guided Workout Flow.

