class LevelResult {
  final String levelId;
  final int score;
  final int totalQuestions;
  final int timeTaken; // seconds
  final int pointsEarned;
  final DateTime completedAt;

  const LevelResult({
    required this.levelId,
    required this.score,
    required this.totalQuestions,
    required this.timeTaken,
    required this.pointsEarned,
    required this.completedAt,
  });

  Map<String, dynamic> toJson() => {
        'levelId': levelId,
        'score': score,
        'totalQuestions': totalQuestions,
        'timeTaken': timeTaken,
        'pointsEarned': pointsEarned,
        'completedAt': completedAt.toIso8601String(),
      };

  factory LevelResult.fromJson(Map<String, dynamic> json) => LevelResult(
        levelId: json['levelId'],
        score: json['score'],
        totalQuestions: json['totalQuestions'],
        timeTaken: json['timeTaken'],
        pointsEarned: json['pointsEarned'],
        completedAt: DateTime.parse(json['completedAt']),
      );
}

class UserProgress {
  final String username;
  final int totalPoints;
  final Map<String, LevelResult> completedLevels;
  final List<DateTime> activityDates; // one entry per quiz completed

  const UserProgress({
    required this.username,
    required this.totalPoints,
    required this.completedLevels,
    this.activityDates = const [],
  });

  UserProgress copyWith({
    String? username,
    int? totalPoints,
    Map<String, LevelResult>? completedLevels,
    List<DateTime>? activityDates,
  }) =>
      UserProgress(
        username: username ?? this.username,
        totalPoints: totalPoints ?? this.totalPoints,
        completedLevels: completedLevels ?? this.completedLevels,
        activityDates: activityDates ?? this.activityDates,
      );

  // A level is only "completed" (unlocks next) if points > 0
  bool isLevelCompleted(String levelId) {
    final result = completedLevels[levelId];
    return result != null && result.pointsEarned > 0;
  }

  int bestScore(String levelId) => completedLevels[levelId]?.score ?? 0;

  int get currentStreak {
    if (activityDates.isEmpty) return 0;
    final days = activityDates
        .map((d) => DateTime(d.year, d.month, d.day))
        .toSet()
        .toList()
      ..sort((a, b) => b.compareTo(a));
    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);
    if (days.first.isBefore(todayDate.subtract(const Duration(days: 1)))) return 0;
    int streak = 1;
    for (int i = 0; i < days.length - 1; i++) {
      if (days[i].difference(days[i + 1]).inDays == 1) {
        streak++;
      } else {
        break;
      }
    }
    return streak;
  }

  // Returns a map of date -> count of quizzes for the last 12 weeks
  Map<DateTime, int> get heatmapData {
    final map = <DateTime, int>{};
    for (final d in activityDates) {
      final key = DateTime(d.year, d.month, d.day);
      map[key] = (map[key] ?? 0) + 1;
    }
    return map;
  }
}
