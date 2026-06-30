# FlowFit Development Log

---

# Day 1

## Completed
- Created GitHub repository
- Connected VS Code with GitHub
- Defined MVP scope
- Created Notion project board
- Decided tech stack
- Created project setup script
- Created PROJECT_CONTEXT.md

## Learned
- Basic Git workflow
- Flutter project initialization
- Shell script basics
- Feature-based architecture

## Challenges
- Understanding Git vs Flutter project structure
- Understanding lib folder organization

## Next Steps
- Build HomeScreen
- Implement weekly calendar UI

---

# Day 2

## Completed
- Initialized Flutter project
- Created feature-based folder structure
- Connected Codex workflow
- Created HomeScreen
- Implemented weekly calendar UI
- Added current date highlighting
- Added selectable weekly dates

## Learned
- Flutter widget structure
- Hot reload workflow
- Basic UI composition in Flutter
- Feature-based project organization

## Challenges
- Understanding routing structure
- Understanding reusable widget separation

## Next Steps
- Implement workout data model
- Add local persistence
- Connect workout list to selected date

---

# Day 3

## Completed
- Installed and initialized Hive
- Added local persistence structure
- Created Workout model
- Created WorkoutLog model
- Created workoutBox and workoutLogBox
- Implemented StorageService
- Connected selected date to workout log retrieval
- Added empty workout state UI
- Verified flutter analyze and flutter test

## Learned
- Basic Hive local storage workflow
- Difference between Workout and WorkoutLog
- Date-based data structure design
- Simple local persistence architecture

## Challenges
- Understanding how data flows from UI to local storage
- Understanding selected date state management
- Managing app structure while keeping code beginner-friendly

## Current App State
- Weekly calendar UI works
- Date selection works
- Workout logs can be retrieved by selected date
- Hive persistence is connected
- App structure is becoming scalable

## Next Steps
- Add workout creation flow
- Add workout modal/dialog
- Add category selection
- Connect workout creation to selected date
- Enable real workout tracking workflow

---

# Day 4

## Completed
- Created reusable Add Workout button
- Added workout creation bottom sheet
- Added workout name input
- Added workout category dropdown
- Added optional sets and reps inputs
- Connected workout creation to selected date
- Saved new WorkoutLog records with Hive
- Confirmed workout list refreshes after saving
- Kept checkbox completion logic working
- Kept workout delete logic working
- Fixed bottom sheet controller lifecycle issue
- Fixed bottom sheet keyboard overflow issue
- Verified flutter analyze and flutter test

## Learned
- How to use showModalBottomSheet for quick input flows
- How TextEditingController lifecycle works
- Why form state should live inside the widget that owns the form
- How Hive listenables update the UI after saving data

## Challenges
- Avoiding TextEditingController disposal errors
- Preventing bottom sheet overflow when the keyboard is open
- Keeping the add workout flow simple and beginner-friendly

## Current App State
- Weekly calendar UI works
- Date selection works
- Add Workout button opens a bottom sheet
- Workout logs can be created for the selected date
- Workout logs persist locally with Hive
- Added workouts appear immediately in the selected date list
- Empty state disappears after adding a workout
- Completion checkbox and delete button are available for workout logs
- Users can now create workout logs through the actual app UI

## Next Steps
- Improve workout list UI
- Polish workout completion UX
- Add completed workout styling
- Improve add workout validation
- Prepare reusable workout widgets

---

# Day 5

## Completed
- Created reusable WorkoutItem widget
- Created reusable WorkoutList widget
- Moved workout list UI out of HomeScreen
- Removed inline workout tile code from HomeScreen
- Improved completed workout styling
- Added line-through text for completed workouts
- Added softer text color for completed workouts
- Added lighter background for completed workouts
- Sorted incomplete workouts before completed workouts
- Kept checkbox toggle logic working
- Kept workout delete logic working
- Verified flutter analyze and flutter test

## Learned
- How to refactor UI into reusable widgets
- How to keep HomeScreen focused on screen-level state
- How to make completion status clearer with simple visual feedback
- How to sort UI data without changing stored Hive data

## Challenges
- Keeping the refactor simple and beginner-friendly
- Avoiding nested scroll issues with workout lists
- Preserving existing add, toggle, delete, and empty state behavior

## Current App State
- Weekly calendar UI works
- Date selection works
- Workout logs can be added for the selected date
- Workout logs display in a reusable WorkoutList
- Each workout displays through a reusable WorkoutItem
- Incomplete workouts appear before completed workouts
- Completed workouts are visually easier to recognize
- Workout completion and delete actions still work

## Next Steps
- Add rest timer feature
- Add preset timer buttons
- Add timer start, stop, and reset behavior
- Continue MVP polish

---

# Day 6

## Completed
- Created RestTimer widget
- Added preset timer buttons
- Added 30s, 60s, 90s, 120s, 3m, and 5m presets
- Added MM:SS timer display
- Added Start button
- Added Stop button
- Added Reset button
- Added countdown behavior
- Added timer cleanup in dispose
- Placed RestTimer on HomeScreen
- Added optional workout weight input
- Saved weight to WorkoutLog
- Displayed workout weight in WorkoutItem
- Verified flutter analyze and flutter test

## Learned
- How to use Timer.periodic in Flutter
- Why timers must be cancelled in dispose
- How to keep temporary UI state local to a widget
- How to extend an existing form without changing Hive model adapters

## Challenges
- Keeping the timer useful without adding unnecessary architecture
- Avoiding timer lifecycle issues
- Keeping the HomeScreen usable after adding more UI

## Current App State
- Weekly calendar UI works
- Date selection works
- Workout logs can be added for the selected date
- Optional weight can be added to workout logs
- Workout logs persist locally with Hive
- Completion checkbox and delete actions work
- Rest timer supports quick preset durations
- Rest timer can start, stop, and reset

## Next Steps
- Improve HomeScreen scrolling
- Make RestTimer more compact
- Keep RestTimer visible while scrolling
- Continue MVP polish

---

# Day 6.5

## Completed
- Refactored HomeScreen to use CustomScrollView
- Changed HomeScreen to full-page scrolling
- Removed independent workout list scrolling
- Changed WorkoutList to render as normal page content
- Made RestTimer more compact
- Reduced RestTimer padding and spacing
- Used compact preset chips
- Used compact timer control buttons
- Added pinned RestTimer behavior with SliverPersistentHeader
- Kept workout list scrolling naturally under the timer
- Verified flutter analyze and flutter test

## Learned
- How CustomScrollView supports full-page scroll layouts
- How SliverPersistentHeader can pin important UI
- Why nested scroll areas can make workout screens feel cramped
- How to make a widget more compact without changing its behavior

## Challenges
- Balancing sticky timer visibility with workout list space
- Avoiding nested scroll issues
- Keeping the implementation beginner-friendly

## Current App State
- HomeScreen scrolls as one natural page
- RestTimer stays pinned near the top while scrolling
- RestTimer takes less vertical space
- Workout list has more visible room
- Add workout, completion, delete, and timer behavior still work

## Next Steps
- QA manual workout flow
- Polish small UI spacing issues
- Update README with MVP status
- Prepare Day 7 QA and bug fixes

---

# Day 7

## Completed
- Completed manual MVP testing
- Verified date selection flow
- Verified Add Workout bottom sheet opens correctly
- Verified workout category selection
- Verified workout creation flow
- Verified workout list updates after saving
- Verified completion checkbox behavior
- Verified delete workout behavior
- Verified rest timer behavior
- Updated README for MVP status
- Confirmed flutter analyze passes
- Confirmed flutter test passes

## Learned
- Manual QA can reveal environment warnings that automated tests do not show
- MVP polish should focus on stability and clarity before adding features
- Documentation should match the actual implemented tech stack

## Challenges
- Evaluating a Flutter HardwareKeyboard warning during text input
- Confirming whether the warning came from app code or the dev environment
- Keeping Day 7 focused on QA and documentation instead of adding new scope

## Known Issues
- Flutter printed a HardwareKeyboard KeyDownEvent warning while typing in the Add Workout bottom sheet
- The warning said a KeyDownEvent was dispatched while the physical key was already marked as pressed
- No custom FocusNode, RawKeyboard, HardwareKeyboard, or manual keyboard handling is used in the app
- TextEditingController instances are owned by the bottom sheet state and disposed correctly
- Current conclusion: this appears to be a Flutter Web/dev environment warning, not an app logic issue
- The warning is non-blocking as long as typing continues to work normally

## Current App State
- FlowFit MVP is ready for demo
- Weekly calendar works
- Date-based workout logs work
- Add workout flow works
- Categories, sets, reps, and weight work
- Completion tracking works
- Delete workout works
- Hive persistence is connected
- Rest timer works
- HomeScreen uses full-page scrolling with a pinned compact timer

## Next Steps
- Prepare MVP demo
- Record short walkthrough
- Commit final MVP changes
- Plan post-MVP improvements

---

## 2026-06-20

### RL-0000

Status:
Done

Summary:

- Closed RL-0000 after Release Manager validation.
- Confirmed Flutter environment readiness for RepLog MVP development.
- Confirmed dependency resolution, Hive initialization, code review approval, and QA pass.
- Confirmed required planning documents are present and readable.

Files Modified:

- `user_stories/RL-0000/RL-0000_RELEASE_NOTE.md`
- `docs/EPIC_USER_STORY_TASKS.md`
- `DEVELOPMENT_LOG.md`

Commit:

`d58b16f`

Notes:

- Release decision: Approved.
- No unresolved blockers remain.
- Existing FlowFit naming is intentionally deferred to RL-0001.
- Next recommended story: RL-0001.

---

## 2026-06-30

### RL-0001

Epic:

EP-01 Brand Readiness

Status:

Done

Summary:

- Closed RL-0001 after Release Manager validation.
- Updated visible product identity from FlowFit to RepLog for app title, primary home label, README current-product copy, and iOS display metadata.
- Preserved excluded technical identifiers such as Dart package name, bundle identifiers, Android namespace, generated project names, and existing app architecture.
- Confirmed existing workout logging behavior still works.

Acceptance Criteria:

- Passed

Files Created:

- `user_stories/RL-0001/RL-0001_RELEASE_NOTE.md`
- `user_stories/RL-0001/RL-0001_IMPLEMENTATION_NOTES.md`
- `user_stories/RL-0001/RL-0001_CODE_REVIEW.md`
- `user_stories/RL-0001/RL-0001_QA_REPORT.md`

Files Modified:

- `README.md`
- `docs/EPIC_USER_STORY_TASKS.md`
- `docs/SPRINT_PLAN.md`
- `user_stories/RL-0001/RL-0001_TASKS.md`
- `user_stories/RL-0001/RL-0001_SPRINT_PLAN.md`
- `DEVELOPMENT_LOG.md`
- `ios/Runner/Info.plist`
- `lib/main.dart`
- `lib/features/home/screens/home_screen.dart`
- `test/widget_test.dart`

Packages Added:

- None

Manual Steps:

- None

Commit References:

- None

QA Result:

Passed

User Approval:

Not Required

Known Limitations:

- Technical `flowfit` identifiers remain unchanged by explicit RL-0001 scope.
- iOS display metadata was verified by file inspection, not by simulator launch.

Lessons Learned:

- Visible brand migration should stay separate from package and platform identifier renames.
- Flutter validation may require approved SDK cache access when sandbox restrictions block `engine.stamp`.

Next Recommended Story:

RL-0002

---

## 2026-06-30

### RL-0002

Epic:

EP-02 Onboarding

Status:

Done

Summary:

- Closed RL-0002 after Release Manager validation.
- Added first-launch onboarding so new users choose a weekly workout goal before reaching the main experience.
- Added local Hive-backed weekly goal and onboarding completion persistence.
- Confirmed returning users skip onboarding after setup.
- Cleaned up the widget-test harness after release validation so reliable Hive-backed widget tests run without hanging.
- Documented the remaining widget-test limitation for Hive writes inside tapped button callbacks.

Acceptance Criteria:

- Passed

Files Created:

- `lib/features/onboarding/screens/onboarding_screen.dart`
- `user_stories/RL-0002/RL-0002_SPRINT_PLAN.md`
- `user_stories/RL-0002/RL-0002_UX_SPEC.md`
- `user_stories/RL-0002/RL-0002_INTERPRETATION.md`
- `user_stories/RL-0002/RL-0002_IMPLEMENTATION_NOTES.md`
- `user_stories/RL-0002/RL-0002_CODE_REVIEW.md`
- `user_stories/RL-0002/RL-0002_QA_REPORT.md`
- `user_stories/RL-0002/RL-0002_RELEASE_NOTE.md`

Files Modified:

- `docs/EPIC_USER_STORY_TASKS.md`
- `docs/SPRINT_PLAN.md`
- `user_stories/RL-0002/RL-0002_TASKS.md`
- `DEVELOPMENT_LOG.md`
- `lib/main.dart`
- `lib/data/local/local_database.dart`
- `lib/data/services/storage_service.dart`
- `test/widget_test.dart`

Packages Added:

- None

Manual Steps:

- User completed manual onboarding and persistence testing.
- Widget-test cleanup completed with no production code changes.
- `flutter test test/widget_test.dart -r expanded` passed with 4 tests passing, 2 tests skipped, and no hang.

Commit References:

- None

QA Result:

Passed

User Approval:

Not Required

Known Limitations:

- Widget tests that depend on Hive writes inside tapped button callbacks remain skipped because `testWidgets` uses fake async, Hive uses real async file I/O, and `tester.tap()` does not await the async callback body.
- Skipped callback-write tests: onboarding Continue save and add workout Save.
- Weekly goal editing and weekly progress tracking are deferred to future stories.

Lessons Learned:

- Direct Hive setup in widget tests should use `tester.runAsync`.
- Avoid `Hive.close()` in widget-test teardown when it hangs; isolate test state by clearing Hive boxes through `tester.runAsync`.
- Onboarding state should remain a small app-entry concern until future goal progress stories need richer coordination.

Next Recommended Story:

RL-0003

---

## 2026-06-30

### RL-0003

Epic:

EP-03 Workout Logging

Status:

Done

Summary:

- Completed RL-0003 workout logging refinement.
- Added optional memo capture to the Add Workout flow.
- Displayed saved workout memo text in workout list items when present.
- Preserved selected-date workout logging, required workout name validation, default category selection, and immediate list updates.
- Did not change production onboarding behavior, Hive adapter IDs, or Hive read/write order.

Acceptance Criteria:

- Passed

Files Created:

- `user_stories/RL-0003/RL-0003_SPRINT_PLAN.md`
- `user_stories/RL-0003/RL-0003_UX_SPEC.md`
- `user_stories/RL-0003/RL-0003_INTERPRETATION.md`
- `user_stories/RL-0003/RL-0003_IMPLEMENTATION_NOTES.md`
- `user_stories/RL-0003/RL-0003_CODE_REVIEW.md`
- `user_stories/RL-0003/RL-0003_QA_REPORT.md`
- `user_stories/RL-0003/RL-0003_RELEASE_NOTE.md`
- `test/workout_item_test.dart`

Files Modified:

- `docs/EPIC_USER_STORY_TASKS.md`
- `docs/SPRINT_PLAN.md`
- `DEVELOPMENT_LOG.md`
- `user_stories/RL-0003/RL-0003_TASKS.md`
- `user_stories/RL-0003/RL-0003_SPRINT_PLAN.md`
- `lib/features/home/screens/home_screen.dart`
- `lib/features/workout/widgets/workout_item.dart`

Packages Added:

- None

Manual Steps:

- None

Commit References:

- None

QA Result:

Passed

User Approval:

Not Required

Known Limitations:

- Existing callback-write widget tests remain skipped for the documented widget-test infrastructure reason.
- Editing existing workout logs is out of scope.
- Completion, XP, levels, weekly progress, and share cards remain future-story scope.

Lessons Learned:

- `WorkoutLog.memo` already existed, so memo support could be added without a Hive migration.
- Reliable RL-0003 widget coverage can target presentational widgets without reopening the Hive callback-write test issue.

Next Recommended Story:

RL-0005

---

## 2026-06-30

### RL-0005

Epic:

EP-03 Workout Completion

Status:

Done

Summary:

- Completed RL-0005 workout completion release.
- Verified existing checkbox-based completion toggling from the workout list.
- Verified completed workouts remain visually distinct with checked state, line-through title text, softer text color, and lighter row background.
- Verified completion can be toggled back without deleting the workout.
- Verified completion state persists locally after Hive reopen.
- Added focused storage-service regression coverage for completion, uncompletion, restart persistence, and delete interaction.
- Did not change production code, Hive adapter IDs, or Hive read/write order.

Acceptance Criteria:

- Passed

Files Created:

- `user_stories/RL-0005/RL-0005_SPRINT_PLAN.md`
- `user_stories/RL-0005/RL-0005_UX_SPEC.md`
- `user_stories/RL-0005/RL-0005_INTERPRETATION.md`
- `user_stories/RL-0005/RL-0005_IMPLEMENTATION_NOTES.md`
- `user_stories/RL-0005/RL-0005_CODE_REVIEW.md`
- `user_stories/RL-0005/RL-0005_QA_REPORT.md`
- `user_stories/RL-0005/RL-0005_RELEASE_NOTE.md`
- `test/storage_service_test.dart`

Files Modified:

- `docs/EPIC_USER_STORY_TASKS.md`
- `docs/SPRINT_PLAN.md`
- `DEVELOPMENT_LOG.md`
- `user_stories/RL-0005/RL-0005_TASKS.md`

Packages Added:

- None

Manual Steps:

- None

Commit References:

- None

QA Result:

Passed

User Approval:

Not Required

Known Limitations:

- Existing callback-write widget tests remain skipped for the documented widget-test infrastructure reason.
- XP, levels, weekly progress, and share cards remain future-story scope.

Lessons Learned:

- RL-0005 completion behavior had already been implemented as part of the earlier workout list foundation.
- Service-level Hive tests can verify restart persistence without relying on skipped widget callback-write paths.

Next Recommended Story:

RL-0004
