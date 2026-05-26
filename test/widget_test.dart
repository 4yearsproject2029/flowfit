import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
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
    await Hive.close();
    await testHiveDirectory.delete(recursive: true);
  });

  testWidgets('shows FlowFit home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const FlowFitApp());

    expect(find.text('FlowFit'), findsOneWidget);
    expect(find.text('This Week'), findsOneWidget);
    expect(find.textContaining('Workouts for '), findsOneWidget);
    expect(find.text('No workouts added yet.'), findsOneWidget);
  });
}
