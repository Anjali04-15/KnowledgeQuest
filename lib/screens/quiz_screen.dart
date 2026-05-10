import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../models/domain.dart';
import '../models/topic.dart';
import '../models/question.dart';
import '../models/user_progress.dart';
import '../widgets/app_bottom_nav.dart';

class QuizScreen extends StatefulWidget {
  final Domain domain;
  final Topic topic;
  final dynamic level;

  const QuizScreen({
    super.key,
    required this.domain,
    required this.topic,
    required this.level,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Question> _questions;
  int _currentIndex = 0;
  int _selectedOption = -1;
  bool _answered = false;
  int _score = 0;
  int _timeLeft = 20;
  int _totalTime = 0;
  // time remaining when each correct answer was given (for per-question time bonus)
  final List<int> _timeOnCorrect = [];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _questions = List.from(widget.level.questions);
    _startTimer();
  }

  void _startTimer() {
    _timeLeft = 20;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      setState(() {
        _totalTime++;
        if (_timeLeft > 0) {
          _timeLeft--;
        } else {
          _timer?.cancel();
          if (!_answered) _handleAnswer(-1);
        }
      });
    });
  }

  void _handleAnswer(int selected) {
    if (_answered) return;
    _timer?.cancel();
    final isCorrect = selected == _questions[_currentIndex].correctIndex;
    setState(() {
      _selectedOption = selected;
      _answered = true;
      if (isCorrect) {
        _score++;
        _timeOnCorrect.add(_timeLeft); // capture remaining time
      }
    });
    // Show explanation overlay
    _showExplanation();
  }

  void _showExplanation() {
    final question = _questions[_currentIndex];
    final isCorrect = _selectedOption == question.correctIndex;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isCorrect ? '✅ Correct!' : '❌ Incorrect',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: isCorrect
                      ? const Color(0xFF4CAF50)
                      : const Color(0xFFF44336),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                question.explanation,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _nextQuestion();
                  },
                  child: Text(
                    _currentIndex < _questions.length - 1
                        ? 'Next Question'
                        : 'See Results',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedOption = -1;
        _answered = false;
      });
      _startTimer();
    } else {
      _finishQuiz();
    }
  }

  void _finishQuiz() {
    _timer?.cancel();
    final points = _calculatePoints();
    final result = LevelResult(
      levelId: widget.level.id,
      score: _score,
      totalQuestions: _questions.length,
      timeTaken: _totalTime,
      pointsEarned: points,
      completedAt: DateTime.now(),
    );
    context.read<AppProvider>().saveResult(result);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => _ResultScreen(
          score: _score,
          total: _questions.length,
          points: points,
          timeTaken: _totalTime,
          onRetry: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => QuizScreen(
                  domain: widget.domain,
                  topic: widget.topic,
                  level: widget.level,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  /// Points only awarded for correct answers.
  /// Each correct answer = 20 base points + up to 10 time bonus (proportional to time left).
  /// If score is 0, returns 0 — level stays locked.
  int _calculatePoints() {
    if (_score == 0) return 0;
    int points = 0;
    for (final timeLeft in _timeOnCorrect) {
      points += 20; // base per correct answer
      points += (timeLeft / 20 * 10).round(); // up to 10 time bonus
    }
    return points;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _difficultyLabel(dynamic d) {
    switch (d.toString()) {
      case 'Difficulty.easy': return 'Easy';
      case 'Difficulty.medium': return 'Medium';
      default: return 'Hard';
    }
  }

  @override
  Widget build(BuildContext context) {

    final question = _questions[_currentIndex];
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            '${widget.topic.name} · ${_difficultyLabel(widget.level.difficulty)}'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: _TimerWidget(timeLeft: _timeLeft),
          ),
        ],
      ),
      // No bottomNavigationBar during quiz
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${_currentIndex + 1} / ${_questions.length}',
                    style: theme.textTheme.bodyMedium),
                Text('Score: $_score', style: theme.textTheme.bodyMedium),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: (_currentIndex + 1) / _questions.length,
                backgroundColor: theme.colorScheme.surface,
                valueColor:
                    AlwaysStoppedAnimation(theme.colorScheme.primary),
                minHeight: 6,
              ),
            ),
            const SizedBox(height: 28),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: theme.cardTheme.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(question.text, style: theme.textTheme.titleLarge),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: question.options.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, i) => _OptionTile(
                  text: question.options[i],
                  index: i,
                  selected: _selectedOption,
                  correct: _answered ? question.correctIndex : -1,
                  onTap: _answered ? null : () => _handleAnswer(i),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  final String text;
  final int index;
  final int selected;
  final int correct;
  final VoidCallback? onTap;

  const _OptionTile({
    required this.text,
    required this.index,
    required this.selected,
    required this.correct,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Color borderColor = theme.colorScheme.surface;
    Color bgColor = theme.cardTheme.color!;
    Color textColor = theme.textTheme.bodyLarge!.color!;

    if (correct >= 0) {
      if (index == correct) {
        borderColor = const Color(0xFF4CAF50);
        bgColor = const Color(0xFF4CAF50).withValues(alpha: 0.15);
        textColor = const Color(0xFF4CAF50);
      } else if (index == selected && selected != correct) {
        borderColor = const Color(0xFFF44336);
        bgColor = const Color(0xFFF44336).withValues(alpha: 0.15);
        textColor = const Color(0xFFF44336);
      }
    } else if (index == selected) {
      borderColor = theme.colorScheme.primary;
      bgColor = theme.colorScheme.primary.withValues(alpha: 0.15);
    }

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 14,
              backgroundColor: borderColor.withValues(alpha: 0.2),
              child: Text(
                String.fromCharCode(65 + index),
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child:
                  Text(text, style: TextStyle(color: textColor, fontSize: 15)),
            ),
            if (correct >= 0 && index == correct)
              const Icon(Icons.check_circle,
                  color: Color(0xFF4CAF50), size: 20),
            if (correct >= 0 && index == selected && selected != correct)
              const Icon(Icons.cancel, color: Color(0xFFF44336), size: 20),
          ],
        ),
      ),
    );
  }
}

class _TimerWidget extends StatelessWidget {
  final int timeLeft;
  const _TimerWidget({required this.timeLeft});

  @override
  Widget build(BuildContext context) {
    final color = timeLeft > 10
        ? const Color(0xFF4CAF50)
        : timeLeft > 5
            ? const Color(0xFFFF9800)
            : const Color(0xFFF44336);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.timer, color: color, size: 16),
          const SizedBox(width: 4),
          Text('${timeLeft}s',
              style: TextStyle(color: color, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class _ResultScreen extends StatelessWidget {
  final int score;
  final int total;
  final int points;
  final int timeTaken;
  final VoidCallback onRetry;

  const _ResultScreen({
    required this.score,
    required this.total,
    required this.points,
    required this.timeTaken,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final percent = (score / total * 100).round();
    final passed = points > 0;

    return Scaffold(
      appBar: AppBar(
        leading: TextButton.icon(
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context, '/domains', (r) => r.isFirst),
          icon: const Icon(Icons.arrow_back, size: 18),
          label: const Text('Domains'),
          style: TextButton.styleFrom(
            foregroundColor: theme.colorScheme.primary,
          ),
        ),
        leadingWidth: 120,
        title: const Text('Results'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(passed ? '🎉' : '😔', style: const TextStyle(fontSize: 64)),
              const SizedBox(height: 16),
              Text(
                passed ? 'Well Done!' : 'No points — try again!',
                style: theme.textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              if (!passed) ...[
                const SizedBox(height: 8),
                Text(
                  'You need at least 1 correct answer to unlock the next level.',
                  style: theme.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: 32),
              _StatCard(label: 'Score', value: '$score / $total'),
              const SizedBox(height: 12),
              _StatCard(label: 'Accuracy', value: '$percent%'),
              const SizedBox(height: 12),
              _StatCard(label: 'Points Earned', value: '⭐ $points'),
              const SizedBox(height: 12),
              _StatCard(label: 'Time Taken', value: '${timeTaken}s'),
              const SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: onRetry,
                      child: const Text('Retry'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamedAndRemoveUntil(
                          context, '/', (r) => false),
                      child: const Text('Home'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 0),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  const _StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: theme.textTheme.bodyMedium),
          Text(value,
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
