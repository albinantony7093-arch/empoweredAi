class QuestionModel {
  final String id;
  final String text;
  final Map<String, String> options;
  final String subject;
  final String topic;

  QuestionModel({
    required this.id,
    required this.text,
    required this.options,
    required this.subject,
    required this.topic,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      id: json['id'],
      text: json['text'],
      options: Map<String, String>.from(json['options']),
      subject: json['subject'],
      topic: json['topic'],
    );
  }

  static List<QuestionModel> fromList(List list) {
    return list.map((e) => QuestionModel.fromJson(e)).toList();
  }
}
