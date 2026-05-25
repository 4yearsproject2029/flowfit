# FlowFit — Project Context

## Project Overview

FlowFit is a personal workout routine and workout tracking application built with Flutter.

This is not a commercial product at the moment.
The primary goal is to:
- improve personal workout experience
- practice product development
- learn project management workflows
- build a complete MVP within 7 days

The app should prioritize:
- speed
- simplicity
- usability during workouts

The user should be able to interact with the app quickly with minimal friction while exercising.

---

# Core Product Vision

FlowFit should feel lightweight and fast.

The experience should focus on:
- quickly viewing today's workout
- checking completed exercises
- starting rest timers instantly
- minimizing unnecessary taps

The app is intentionally simple.

---

# MVP Scope

## Included Features

### Weekly Calendar UI
- 7-day weekly calendar view
- current day highlight
- selectable dates

### Workout Management
- add workout to selected date
- display workout list
- delete workout (optional)
- exercise completion checkbox

### Workout Categories
Exercises are grouped by body parts:
- chest
- back
- legs
- shoulders
- arms
- abs
- cardio

### Rest Timer
- preset timer buttons
- quick start
- stop/reset timer

### Local Persistence
Workout data should remain after app restart.

---

# Out of Scope (MVP Non-Goals)

The following features are intentionally excluded from the first MVP version:

- user authentication
- cloud sync
- social features
- AI recommendations
- push notifications
- analytics dashboard
- advanced animations
- calorie tracking
- wearable integration
- online database

Focus should remain on shipping a working MVP quickly.

---

# Tech Stack

## Frontend
Flutter

## Language
Dart

## State Management
Riverpod

## Local Storage
Hive

## Version Control
Git + GitHub

## Project Management
Notion

## Documentation
Google Drive / Google Docs

---

# Architecture Philosophy

The project uses a feature-based folder structure.

Example:

lib/
├── core/
├── data/
├── features/
└── shared/

## Principles

### Keep Features Isolated
Each feature should manage:
- screens
- widgets
- providers

inside its own feature folder.

### Shared Components
Reusable widgets belong in:
shared/widgets/

### Avoid Overengineering
This is a 7-day MVP project.

Prioritize:
- implementation speed
- readability
- maintainability

Avoid:
- complex abstractions
- premature optimization
- enterprise-level architecture

---

# UX Principles

## Fast Interaction
The app should require minimal taps during workouts.

## One-Hand Friendly
Primary interactions should be accessible with one hand.

## Workout Flow First
The UI should never interrupt workout flow.

## Simplicity Over Complexity
Simple and usable beats feature-rich but confusing.

---

# Current Sprint Plan

## Day 1
- project setup
- GitHub setup
- Notion board
- MVP planning
- tech stack decision

## Day 2
- Flutter project setup
- app structure setup
- home screen
- weekly calendar UI

## Day 3
- workout data model
- local persistence

## Day 4
- workout add feature

## Day 5
- workout completion tracking

## Day 6
- rest timer

## Day 7
- QA
- bug fixes
- MVP polish

---

# Definition of MVP Success

The MVP is considered successful if:

- the app runs successfully
- weekly calendar works
- workouts can be added
- workout completion can be tracked
- rest timer works
- data persists locally
- the creator personally uses the app during workouts

---

# Development Workflow

## Commit Style

Examples:
- feat: add weekly calendar UI
- feat: implement workout add modal
- fix: resolve timer state issue
- refactor: simplify workout provider
- docs: update project context

## Workflow Priority

Priority order:
1. working functionality
2. simple UX
3. clean structure
4. visual polish

---

# Important Notes for AI Assistants

This project is:
- MVP-focused
- speed-focused
- learning-focused

When generating code:
- prefer simplicity
- avoid unnecessary abstraction
- avoid excessive architecture
- prioritize readable Flutter code
- keep files beginner-friendly

Avoid introducing:
- advanced enterprise patterns
- unnecessary packages
- overly complex state management
- premature optimization

The project owner is actively learning:
- Flutter
- Git/GitHub
- project management
- product thinking
- software architecture

Explanations should remain educational and beginner-friendly.