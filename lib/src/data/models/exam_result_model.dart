// final List<String> mentorAdvice;
// mentorAdvice: List<String>.from(json["mentor_advice"]),

class ExamResultModel {
  final String testId;
  final int score;
  final int total;
  final double accuracy;
  final List<String> weakAreas;
  final int rank;
  final double percentile;
  final List<String> mentorAdvice;

  ExamResultModel({
    required this.testId,
    required this.score,
    required this.total,
    required this.accuracy,
    required this.weakAreas,
    required this.rank,
    required this.percentile,
    required this.mentorAdvice,
  });

  factory ExamResultModel.fromJson(Map<String, dynamic> json) {
    return ExamResultModel(
      testId: json["test_id"] ?? "",
      score: (json["score"] as num).toInt(),
      total: (json["total"] as num).toInt(),
      accuracy: (json["accuracy"] as num).toDouble(),
      weakAreas: List<String>.from(json["weak_areas"] ?? []),
      rank: (json["rank"] as num).toInt(),
      percentile: (json["percentile"] as num).toDouble(),
      mentorAdvice: List<String>.from(json["mentor_advice"]),
    );
  }
}
