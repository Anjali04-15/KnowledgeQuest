import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../models/domain.dart';
import '../models/topic.dart';
import '../widgets/app_bottom_nav.dart';
import 'quiz_screen.dart';

class LevelsScreen extends StatelessWidget {
  final Domain domain;
  const LevelsScreen({super.key, required this.domain});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(domain.icon, style: const TextStyle(fontSize: 22)),
            const SizedBox(width: 8),
            Text(domain.name),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text('⭐ ${provider.progress.totalPoints}',
                  style: TextStyle(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: domain.topics.length,
        itemBuilder: (context, topicIndex) {
          final topic = domain.topics[topicIndex];
          return _TopicSection(
            topic: topic,
            topicIndex: topicIndex,
            domain: domain,
            provider: provider,
          );
        },
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 0),
    );
  }
}

class _TopicSection extends StatelessWidget {
  final Topic topic;
  final int topicIndex;
  final Domain domain;
  final AppProvider provider;

  const _TopicSection({
    required this.topic,
    required this.topicIndex,
    required this.domain,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              Text(topic.icon, style: const TextStyle(fontSize: 20)),
              const SizedBox(width: 8),
              Text(topic.name, style: theme.textTheme.titleLarge),
            ],
          ),
        ),
        Row(
          children: List.generate(topic.levels.length, (levelIndex) {
            final level = topic.levels[levelIndex];
            final isUnlocked =
                provider.isLevelUnlocked(domain, topicIndex, levelIndex);
            final isCompleted = provider.progress.isLevelCompleted(level.id);
            final bestScore = provider.progress.bestScore(level.id);

            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: _LevelTile(
                  level: level,
                  isUnlocked: isUnlocked,
                  isCompleted: isCompleted,
                  bestScore: bestScore,
                  onTap: isUnlocked
                      ? () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => QuizScreen(
                                domain: domain,
                                topic: topic,
                                level: level,
                              ),
                            ),
                          )
                      : null,
                ),
              ),
            );
          }),
        ),
        if (topicIndex < domain.topics.length - 1)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Divider(color: theme.colorScheme.surface),
          ),
      ],
    );
  }
}

class _LevelTile extends StatelessWidget {
  final dynamic level;
  final bool isUnlocked;
  final bool isCompleted;
  final int bestScore;
  final VoidCallback? onTap;

  const _LevelTile({
    required this.level,
    required this.isUnlocked,
    required this.isCompleted,
    required this.bestScore,
    this.onTap,
  });

  Color _difficultyColor(Difficulty d) {
    switch (d) {
      case Difficulty.easy:
        return const Color(0xFF4CAF50);
      case Difficulty.medium:
        return const Color(0xFFFF9800);
      case Difficulty.hard:
        return const Color(0xFFF44336);
    }
  }

  String _difficultyLabel(Difficulty d) {
    switch (d) {
      case Difficulty.easy:
        return 'Easy';
      case Difficulty.medium:
        return 'Medium';
      case Difficulty.hard:
        return 'Hard';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = _difficultyColor(level.difficulty);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isUnlocked
              ? theme.cardTheme.color
              : theme.cardTheme.color!.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isCompleted ? color : color.withValues(alpha: 0.3),
            width: isCompleted ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: isUnlocked
                      ? color.withValues(alpha: 0.2)
                      : Colors.grey.withValues(alpha: 0.1),
                  child: isCompleted
                      ? Icon(Icons.check_circle, color: color, size: 28)
                      : isUnlocked
                          ? Text(
                              '${level.levelNumber}',
                              style: TextStyle(
                                  color: color,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            )
                          : const Icon(Icons.lock, color: Colors.grey, size: 22),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              _difficultyLabel(level.difficulty),
              style: TextStyle(
                color: isUnlocked ? color : Colors.grey,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            if (isCompleted) ...[
              const SizedBox(height: 4),
              Text(
                '⭐ $bestScore',
                style: const TextStyle(fontSize: 11, color: Colors.amber),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
