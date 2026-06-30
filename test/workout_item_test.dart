import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flowfit/data/models/workout_log.dart';
import 'package:flowfit/features/workout/widgets/workout_item.dart';

void main() {
  testWidgets('shows optional workout memo when present', (
    WidgetTester tester,
  ) async {
    final workoutLog = WorkoutLog(
      id: 'log-1',
      date: '2026-06-30',
      workoutId: 'workout-1',
      workoutName: 'Squat',
      category: 'Strength',
      isCompleted: false,
      sets: 3,
      reps: 5,
      memo: 'Felt strong today',
      createdAt: DateTime(2026, 6, 30),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WorkoutItem(
            workoutLog: workoutLog,
            onToggle: () {},
            onDelete: () {},
          ),
        ),
      ),
    );

    expect(find.text('Squat'), findsOneWidget);
    expect(find.text('Strength · 3 sets · 5 reps'), findsOneWidget);
    expect(find.text('Felt strong today'), findsOneWidget);
  });
}
