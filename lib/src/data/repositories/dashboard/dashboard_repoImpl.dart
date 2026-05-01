import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:empowered_ai/src/core/network/dio_client.dart';
import 'package:empowered_ai/src/core/network/failure.dart';
import 'package:empowered_ai/src/core/url.dart';
import 'package:empowered_ai/src/domain/repositories/dashboard/dashboard_repo.dart';

class DashboardRepoimpl implements DashboardRepo {
  @override
  Future<Either<Failure, Map<String, dynamic>>> fetchDashboardDetails({
    required String courseId,
  }) async {
    final url = "${Url.baseUrl}/${Url.dashboard}?course_id=$courseId";
    try {
      final response = await DioClient.dio.get(url);
      if (response.statusCode == 200) {
        return right({
          "user_id": response.data['user_id'],
          "exam": response.data['exam'],
          "course_id": response.data['course_id'],

          "recent_scores": response.data['recent_scores'] ?? [],
          "latest_score": response.data['latest_score'],
          "total_questions": response.data['total_questions'],
          "correct_answers": response.data['correct_answers'],
          "accuracy": response.data['accuracy'],
          "rank": response.data['rank'],
          "percentile": response.data['percentile'],

          "weak_areas": response.data['weak_areas'] ?? [],
          "topic_details": response.data['topic_details'] ?? [],

          "mentor_advice": response.data['mentor_advice'] ?? [],
        });
      } else {
        return Left(Failure(message: "${response.statusMessage}"));
      }
    } on DioException catch (e) {
      log("❌ Dio error: ${e.message}");
      return left(
        Failure(
          message:
              e.response?.data?['detail']?.toString() ??
              "Something went wrong!",
        ),
      );
    } catch (e) {
      log("💥 Unexpected error: $e");
      return left(Failure(message: "$e"));
    }
  }
}
