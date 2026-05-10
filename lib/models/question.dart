class Question {
  final String id;
  final String text;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  const Question({
    required this.id,
    required this.text,
    required this.options,
    required this.correctIndex,
    this.explanation = '',
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json['id'],
        text: json['text'],
        options: List<String>.from(json['options']),
        correctIndex: json['correctIndex'],
        explanation: json['explanation'] ?? '',
      );
}
