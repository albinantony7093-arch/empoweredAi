enum DifficultyLevel { low, moderate, high }

class SubjectProgress {
  final String subject;
  final DifficultyLevel level;
  final double percentage;

  const SubjectProgress({
    required this.subject,
    required this.level,
    required this.percentage,
  });
}
