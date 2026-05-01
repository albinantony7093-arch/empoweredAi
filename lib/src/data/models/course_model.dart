class CourseModel {
  final String id;
  final String title;
  final String description;
  final int price;
  final bool isActive;
  final String createdBy;
  final bool isenrollerd;

  CourseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.isActive,
    required this.createdBy,
    required this.isenrollerd,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? 0,
      isActive: json['is_active'] ?? false,
      createdBy: json['created_by'] ?? '',
      isenrollerd: json['is_enrolled'] ?? false,
    );
  }

  static List<CourseModel> fromJsonList(List data) {
    return data.map((e) => CourseModel.fromJson(e)).toList();
  }
}
