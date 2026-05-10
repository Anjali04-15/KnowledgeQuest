import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_progress.dart';

class ProgressService {
  static const _usernameKey = 'username';
  static const _totalPointsKey = 'totalPoints';
  static const _completedLevelsKey = 'completedLevels';
  static const _activityDatesKey = 'activityDates';

  Future<UserProgress> loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString(_usernameKey) ?? 'Quester';
    final totalPoints = prefs.getInt(_totalPointsKey) ?? 0;

    final rawLevels = prefs.getString(_completedLevelsKey);
    final Map<String, LevelResult> completedLevels = {};
    if (rawLevels != null) {
      final decoded = jsonDecode(rawLevels) as Map<String, dynamic>;
      decoded.forEach((k, v) {
        completedLevels[k] = LevelResult.fromJson(v as Map<String, dynamic>);
      });
    }

    final rawDates = prefs.getStringList(_activityDatesKey) ?? [];
    final activityDates = rawDates.map((s) => DateTime.parse(s)).toList();

    return UserProgress(
      username: username,
      totalPoints: totalPoints,
      completedLevels: completedLevels,
      activityDates: activityDates,
    );
  }

  Future<void> saveResult(LevelResult result) async {
    final prefs = await SharedPreferences.getInstance();
    final progress = await loadProgress();

    final existing = progress.completedLevels[result.levelId];
    final isImprovement =
        existing == null || result.pointsEarned > existing.pointsEarned;
    final pointsDiff =
        isImprovement ? result.pointsEarned - (existing?.pointsEarned ?? 0) : 0;

    final updatedLevels =
        Map<String, LevelResult>.from(progress.completedLevels);
    if (isImprovement) updatedLevels[result.levelId] = result;

    final updatedDates = [...progress.activityDates, result.completedAt];

    await prefs.setInt(_totalPointsKey, progress.totalPoints + pointsDiff);
    await prefs.setString(
      _completedLevelsKey,
      jsonEncode(updatedLevels.map((k, v) => MapEntry(k, v.toJson()))),
    );
    await prefs.setStringList(
      _activityDatesKey,
      updatedDates.map((d) => d.toIso8601String()).toList(),
    );
  }

  Future<void> saveUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_usernameKey, username);
  }

  Future<void> clearProgress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_totalPointsKey);
    await prefs.remove(_completedLevelsKey);
    await prefs.remove(_activityDatesKey);
  }
}
