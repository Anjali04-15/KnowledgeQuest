import 'package:flutter/material.dart';
import '../models/domain.dart';
import '../models/user_progress.dart';
import '../services/question_service.dart';
import '../services/progress_service.dart';

class AppProvider extends ChangeNotifier {
  final QuestionService _questionService = QuestionService();
  final ProgressService _progressService = ProgressService();

  UserProgress _progress = const UserProgress(
    username: 'Quester',
    totalPoints: 0,
    completedLevels: {},
  );

  bool _isDarkMode = true;
  bool _isLoading = false;

  UserProgress get progress => _progress;
  bool get isDarkMode => _isDarkMode;
  bool get isLoading => _isLoading;
  List<Domain> get domains => QuestionService.allDomains;

  Future<void> init() async {
    _isLoading = true;
    notifyListeners();
    _progress = await _progressService.loadProgress();
    _isLoading = false;
    notifyListeners();
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  Future<void> saveResult(LevelResult result) async {
    await _progressService.saveResult(result);
    _progress = await _progressService.loadProgress();
    notifyListeners();
  }

  Future<void> updateUsername(String name) async {
    await _progressService.saveUsername(name);
    _progress = _progress.copyWith(username: name);
    notifyListeners();
  }

  QuestionService get questionService => _questionService;

  bool isLevelUnlocked(Domain domain, int topicIndex, int levelIndex) {
    if (topicIndex == 0 && levelIndex == 0) return true;
    if (levelIndex > 0) {
      final prevLevelId = domain.topics[topicIndex].levels[levelIndex - 1].id;
      return _progress.isLevelCompleted(prevLevelId);
    }
    // First level of a topic — previous topic's last level must be done
    final prevTopic = domain.topics[topicIndex - 1];
    final prevLevelId = prevTopic.levels.last.id;
    return _progress.isLevelCompleted(prevLevelId);
  }

  int completedLevelsInDomain(Domain domain) {
    int count = 0;
    for (final topic in domain.topics) {
      for (final level in topic.levels) {
        if (_progress.isLevelCompleted(level.id)) count++;
      }
    }
    return count;
  }

  int totalLevelsInDomain(Domain domain) =>
      domain.topics.fold(0, (sum, t) => sum + t.levels.length);
}
