class LevelProgress {
  const LevelProgress({
    required this.currentLevel,
    required this.xpIntoCurrentLevel,
    required this.xpPerLevel,
    required this.nextLevel,
  });

  final int currentLevel;
  final int xpIntoCurrentLevel;
  final int xpPerLevel;
  final int nextLevel;

  double get progressValue {
    return xpIntoCurrentLevel / xpPerLevel;
  }

  String get progressLabel {
    return '$xpIntoCurrentLevel / $xpPerLevel XP to Level $nextLevel';
  }
}

class LevelService {
  static const int xpPerLevel = 100;

  LevelProgress calculateProgress(int totalXp) {
    final normalizedXp = totalXp < 0 ? 0 : totalXp;
    final currentLevel = (normalizedXp ~/ xpPerLevel) + 1;
    final xpIntoCurrentLevel = normalizedXp % xpPerLevel;

    return LevelProgress(
      currentLevel: currentLevel,
      xpIntoCurrentLevel: xpIntoCurrentLevel,
      xpPerLevel: xpPerLevel,
      nextLevel: currentLevel + 1,
    );
  }
}
