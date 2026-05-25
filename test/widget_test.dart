import 'package:flutter_test/flutter_test.dart';

import 'package:flowfit/main.dart';

void main() {
  testWidgets('shows FlowFit home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const FlowFitApp());

    expect(find.text('FlowFit'), findsOneWidget);
    expect(find.text('This Week'), findsOneWidget);
    expect(find.text('Workout'), findsOneWidget);
    expect(
      find.text('No workouts yet. Your workout list will appear here.'),
      findsOneWidget,
    );
  });
}
