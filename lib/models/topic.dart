import 'question.dart';

enum Difficulty { easy, medium, hard }

class Level {
  final String id;
  final int levelNumber; // 1, 2, 3
  final Difficulty difficulty;
  final List<Question> questions;
  final int maxPoints;

  const Level({
    required this.id,
    required this.levelNumber,
    required this.difficulty,
    required this.questions,
    this.maxPoints = 100,
  });
}

class Topic {
  final String id;
  final String name;
  final String icon;
  final List<Level> levels; // always 3 levels: easy, medium, hard

  const Topic({
    required this.id,
    required this.name,
    required this.icon,
    required this.levels,
  });
}
