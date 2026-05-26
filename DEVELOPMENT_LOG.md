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