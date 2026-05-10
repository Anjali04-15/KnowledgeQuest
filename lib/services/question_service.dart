import '../models/question.dart';
import '../models/domain.dart';
import '../data/ai_questions.dart';
import '../data/cyber_questions.dart';
import '../data/aptitude_questions.dart';

/// Abstract interface — swap hardcoded for Gemini by implementing this
abstract class QuestionSource {
  Future<List<Question>> getQuestions(String levelId, int count);
}

/// Hardcoded source — always works offline
class HardcodedSource implements QuestionSource {
  final Map<String, List<Question>> _cache = {};

  HardcodedSource() {
    for (final domain in QuestionService.allDomains) {
      for (final topic in domain.topics) {
        for (final level in topic.levels) {
          _cache[level.id] = level.questions;
        }
      }
    }
  }

  @override
  Future<List<Question>> getQuestions(String levelId, int count) async {
    return _cache[levelId] ?? [];
  }
}

/// Gemini source — plug in your API key when ready
class GeminiSource implements QuestionSource {
  final String apiKey;
  GeminiSource(this.apiKey);

  @override
  Future<List<Question>> getQuestions(String levelId, int count) async {
    // TODO: implement Gemini API call
    // POST to https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent
    // Parse response into List<Question>
    throw UnimplementedError('Gemini integration not yet configured');
  }
}

/// Main service — tries Gemini first, falls back to hardcoded
class QuestionService {
  static final List<Domain> allDomains = [aiDomain, cyberDomain, aptitudeDomain];

  final QuestionSource _primary;
  final QuestionSource _fallback;

  QuestionService({String? geminiApiKey})
      : _primary = geminiApiKey != null ? GeminiSource(geminiApiKey) : HardcodedSource(),
        _fallback = HardcodedSource();

  Future<List<Question>> getQuestions(String levelId, int count) async {
    try {
      final questions = await _primary.getQuestions(levelId, count);
      if (questions.isNotEmpty) return questions;
      return _fallback.getQuestions(levelId, count);
    } catch (_) {
      return _fallback.getQuestions(levelId, count);
    }
  }

  Domain getDomain(String domainId) =>
      allDomains.firstWhere((d) => d.id == domainId);
}
