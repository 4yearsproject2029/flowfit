enum ShareCardType { workout, level, weeklyGoal }

class ShareCardData {
  const ShareCardData({
    required this.type,
    required this.title,
    required this.message,
    required this.detail,
    this.extraDetails = const [],
  });

  final ShareCardType type;
  final String title;
  final String message;
  final String detail;
  final List<String> extraDetails;

  String get actionLabel {
    switch (type) {
      case ShareCardType.workout:
        return 'Workout';
      case ShareCardType.level:
        return 'Level';
      case ShareCardType.weeklyGoal:
        return 'Weekly';
    }
  }

  String get confirmationLabel {
    switch (type) {
      case ShareCardType.workout:
        return 'Workout card generated';
      case ShareCardType.level:
        return 'Level card generated';
      case ShareCardType.weeklyGoal:
        return 'Weekly goal card generated';
    }
  }
}
