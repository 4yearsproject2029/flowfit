import 'package:flutter_test/flutter_test.dart';

import 'package:flowfit/data/services/level_service.dart';

void main() {
  late LevelService levelService;

  setUp(() {
    levelService = LevelService();
  });

  test('calculates level progress from XP total', () {
    final zeroXpProgress = levelService.calculateProgress(0);
    expect(zeroXpProgress.currentLevel, 1);
    expect(zeroXpProgress.progressLabel, '0 / 100 XP to Level 2');
    expect(zeroXpProgress.progressValue, 0);

    final partialProgress = levelService.calculateProgress(10);
    expect(partialProgress.currentLevel, 1);
    expect(partialProgress.progressLabel, '10 / 100 XP to Level 2');
    expect(partialProgress.progressValue, 0.1);

    final boundaryProgress = levelService.calculateProgress(100);
    expect(boundaryProgress.currentLevel, 2);
    expect(boundaryProgress.progressLabel, '0 / 100 XP to Level 3');
    expect(boundaryProgress.progressValue, 0);

    final laterProgress = levelService.calculateProgress(250);
    expect(laterProgress.currentLevel, 3);
    expect(laterProgress.progressLabel, '50 / 100 XP to Level 4');
    expect(laterProgress.progressValue, 0.5);
  });

  test('normalizes negative XP to starting level', () {
    final progress = levelService.calculateProgress(-20);

    expect(progress.currentLevel, 1);
    expect(progress.progressLabel, '0 / 100 XP to Level 2');
    expect(progress.progressValue, 0);
  });
}
