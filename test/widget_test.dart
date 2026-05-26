import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flowfit/data/local/local_database.dart';
import 'package:flowfit/main.dart';

void main() {
  late Directory testHiveDirectory;

  setUpAll(() async {
    testHiveDirectory = await Directory.systemTemp.createTemp('flowfit_test_');
    await LocalDatabase.init(testPath: testHiveDirectory.path);
  });

  tearDownAll(() async {
    await testHiveDirectory.delete(recursive: true);
  });

  testWidgets('shows FlowFit home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const FlowFitApp());

    expect(find.text('FlowFit'), findsOneWidget);
    expect(find.text('This Week'), findsOneWidget);
    expect(find.textContaining('Workouts for '), findsOneWidget);
    expect(find.text('No workouts added yet.'), findsOneWidget);

    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('adds a workout log from the bottom sheet', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FlowFitApp());

    await tester.tap(find.text('+ Add Workout'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField).first, 'Bench Press');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(find.widgetWithText(ListTile, 'Bench Press'), findsOneWidget);
    expect(find.text('No workouts added yet.'), findsNothing);

    await tester.pumpWidget(const SizedBox());
  });
}
