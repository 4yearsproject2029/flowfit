# RL-0036 Release Note

## Story

Story ID:
RL-0036

Story Name:
Bottom Navigation Tab Switching Bug Fix

Epic:
EP-14 Journey Separation

Status:
Done

## Release Summary

RL-0036 fixes bottom navigation tab switching among implemented Phase 2 tabs. Users can now move directly between Home, Week, and History without detouring through Home first.

## User-Facing Changes

- History -> Week now works directly.
- Week -> History continues to work directly.
- Home -> Week and Home -> History continue to work.
- Home return from Week and History still returns to Dashboard.
- Today and Achievement remain visible placeholders until approved stories implement them.

## Technical Changes

- Added shared `Phase2BottomNavigation`.
- Replaced duplicated Home, Week, and History bottom navigation widgets with the shared widget.
- Used replacement navigation between Week and History to avoid duplicate tab-route stacking.
- Added focused widget coverage for direct tab switching.

## Verification

- `flutter analyze`: Passed.
- `flutter test test/widget_test.dart --plain-name 'bottom navigation switches directly between implemented tabs' -r expanded`: Passed.
- `flutter test test/widget_test.dart --plain-name 'opens History from Week and returns to dashboard Home' -r expanded`: Passed.
- `flutter test test/widget_test.dart --plain-name 'opens completed Workout Detail from History as read-only review' -r expanded`: Passed.
- `flutter test test/widget_test.dart --plain-name 'opens planned session detail and starts Current Workout' -r expanded`: Passed.
- `git diff --check`: Passed.

## Known Limitations

- Today and Achievement remain placeholders.
- Manual device QA was not run in this agent environment.

## Release Decision

Released.

## Next Recommended Story

RL-0019

Reason:
RL-0019 remains the next eligible feature story after the navigation hotfix.

