class EnrolledCourse {
  final String enrollmentId;
  final String paymentStatus;
  final String courseId;
  final String title;
  final String description;
  final String exam;
  final int price;
  final List<String> keypoints;
  final bool isActive;

  EnrolledCourse({
    required this.enrollmentId,
    required this.paymentStatus,
    required this.courseId,
    required this.title,
    required this.description,
    required this.exam,
    required this.price,
    required this.keypoints,
    required this.isActive,
  });

  factory EnrolledCourse.fromJson(Map<String, dynamic> json) {
    return EnrolledCourse(
      enrollmentId: json['enrollment_id'] ?? '',
      paymentStatus: json['payment_status'] ?? '',
      courseId: json['course_id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      exam: json['exam'] ?? '',
      price: json['price'] ?? 0,
      keypoints: List<String>.from(json['keypoints'] ?? []),
      isActive: json['is_active'] ?? false,
    );
  }
}
