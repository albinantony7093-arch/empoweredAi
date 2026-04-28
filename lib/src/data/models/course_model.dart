class CourseModel {
  final String id;
  final String title;
  final String description;
  final int price;
  final bool isActive;
  final String createdBy;

  CourseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.isActive,
    required this.createdBy,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? 0,
      isActive: json['is_active'] ?? false,
      createdBy: json['created_by'] ?? '',
    );
  }

  static List<CourseModel> fromJsonList(List data) {
    return data.map((e) => CourseModel.fromJson(e)).toList();
  }
}
