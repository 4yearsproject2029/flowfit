import 'package:flowfit/data/models/workout_log.dart';
import 'package:flowfit/features/current_workout/models/current_workout_rest_state.dart';
import 'package:flowfit/features/current_workout/widgets/active_exercise_card.dart';
import 'package:flowfit/features/current_workout/widgets/adjust_session_sheet.dart';
import 'package:flowfit/features/current_workout/widgets/rest_timer_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('active exercise card preserves workout targets and memo copy', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ActiveExerciseCard(
            workoutLog: _workoutLog(),
            completedSets: 1,
            targetSets: 3,
            sessionReps: 12,
            sessionWeight: 55.5,
          ),
        ),
      ),
    );

    expect(find.text('Bench Press'), findsOneWidget);
    expect(find.text('Keep the reps controlled.'), findsOneWidget);
    expect(find.text('SETS'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(find.text('REPS'), findsOneWidget);
    expect(find.text('12'), findsOneWidget);
    expect(find.text('Session weight'.toUpperCase()), findsOneWidget);
    expect(find.text('55.5 kg'), findsOneWidget);
    expect(find.text('1 / 3'), findsOneWidget);
  });

  testWidgets('adjust session sheet returns current-session values only', (
    tester,
  ) async {
    SessionAdjustment? adjustment;

    await tester.pumpWidget(
      MaterialApp(
        home: _ModalLauncher<SessionAdjustment>(
          onResult: (value) {
            adjustment = value;
          },
          builder: (context) {
            return AdjustSessionSheet(
              workoutLog: _workoutLog(),
              sessionReps: 10,
              sessionWeight: 50,
            );
          },
        ),
      ),
    );

    await tester.tap(find.text('Open modal'));
    await tester.pumpAndSettle();
    expect(find.text('Adjust session'), findsOneWidget);

    await tester.enterText(
      find.widgetWithText(TextField, 'Current reps'),
      '12',
    );
    await tester.enterText(
      find.widgetWithText(TextField, 'Current weight'),
      '55.5',
    );
    await tester.tap(find.widgetWithText(FilledButton, 'Save Adjustment'));
    await tester.pumpAndSettle();

    expect(adjustment?.reps, 12);
    expect(adjustment?.weight, 55.5);
  });

  testWidgets('rest timer overlay returns skip rest selection', (tester) async {
    bool? shouldSkipRest;

    await tester.pumpWidget(
      MaterialApp(
        home: _ModalLauncher<bool>(
          onResult: (value) {
            shouldSkipRest = value;
          },
          builder: (context) {
            return RestTimerOverlay(restState: _restState());
          },
        ),
      ),
    );

    await tester.tap(find.text('Open modal'));
    await tester.pumpAndSettle();
    expect(find.text('REST TIMER'), findsOneWidget);
    expect(find.text('01:30'), findsOneWidget);

    await tester.tap(find.widgetWithText(FilledButton, 'Skip Rest'));
    await tester.pumpAndSettle();

    expect(shouldSkipRest, isTrue);
  });
}

class _ModalLauncher<T> extends StatelessWidget {
  const _ModalLauncher({required this.builder, required this.onResult});

  final WidgetBuilder builder;
  final ValueChanged<T?> onResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilledButton(
          onPressed: () async {
            final result = await showModalBottomSheet<T>(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: builder,
            );
            onResult(result);
          },
          child: const Text('Open modal'),
        ),
      ),
    );
  }
}

WorkoutLog _workoutLog() {
  return WorkoutLog(
    id: 'test-log',
    date: '2026-07-20',
    workoutId: 'test-workout',
    workoutName: 'Bench Press',
    category: 'Strength',
    isCompleted: false,
    sets: 3,
    reps: 10,
    weight: 50,
    memo: 'Keep the reps controlled.',
    createdAt: DateTime(2026, 7, 20),
  );
}

CurrentWorkoutRestState _restState() {
  return const CurrentWorkoutRestState(
    activeWorkoutName: 'Bench Press',
    completedSetNumber: 1,
    completedSetTotal: 3,
    nextWorkoutName: 'Cable Row',
    nextExerciseIndex: 1,
    suggestedRestDuration: '90 sec',
    returnTarget: 'Current Workout',
  );
}
