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
