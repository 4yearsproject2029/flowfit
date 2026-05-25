#!/bin/bash

echo "🚀 Creating Flutter app code structure..."

# Core
mkdir -p lib/core/constants
mkdir -p lib/core/theme
mkdir -p lib/core/utils

# Data Layer
mkdir -p lib/data/models
mkdir -p lib/data/repositories
mkdir -p lib/data/services
mkdir -p lib/data/local

# Features
mkdir -p lib/features/home/screens
mkdir -p lib/features/home/widgets

mkdir -p lib/features/calendar/widgets
mkdir -p lib/features/calendar/providers

mkdir -p lib/features/workout/screens
mkdir -p lib/features/workout/widgets
mkdir -p lib/features/workout/providers

mkdir -p lib/features/timer/screens
mkdir -p lib/features/timer/widgets
mkdir -p lib/features/timer/providers

# Shared Widgets
mkdir -p lib/shared/widgets
mkdir -p lib/shared/layouts

# Initial files
touch lib/core/constants/app_constants.dart
touch lib/core/theme/app_theme.dart
touch lib/core/utils/date_utils.dart

touch lib/data/models/workout.dart
touch lib/data/models/workout_category.dart
touch lib/data/repositories/workout_repository.dart
touch lib/data/services/storage_service.dart
touch lib/data/local/local_database.dart

touch lib/features/home/screens/home_screen.dart
touch lib/features/calendar/widgets/weekly_calendar.dart
touch lib/features/calendar/providers/calendar_provider.dart

touch lib/features/workout/widgets/workout_list.dart
touch lib/features/workout/widgets/workout_item.dart
touch lib/features/workout/widgets/add_workout_button.dart
touch lib/features/workout/providers/workout_provider.dart

touch lib/features/timer/widgets/rest_timer.dart
touch lib/features/timer/providers/timer_provider.dart

touch lib/shared/widgets/primary_button.dart
touch lib/shared/layouts/app_scaffold.dart

echo "✅ Flutter code structure created!"