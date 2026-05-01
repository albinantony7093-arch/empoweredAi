import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:empowered_ai/src/core/network/dio_client.dart';
import 'package:empowered_ai/src/core/network/failure.dart';
import 'package:empowered_ai/src/core/url.dart';
import 'package:empowered_ai/src/domain/repositories/enrol/course_enrol_repo.dart';

class CourseEnrolRepoimpl implements CourseEnrolRepo {
  @override
  Future<Either<Failure, Map<String, dynamic>>> enrolCourse({
    required String courseId,
  }) async {
    String url = "${Url.baseUrl}/${Url.enrollCourse(courseId)}";

    try {
      final response = await DioClient.dio.post(url);
      if (response.statusCode == 201) {
        return right({'message': 'Welcome! Your course is ready to start.'});
      } else {
        log("response br:${response.statusMessage}");
        return Left(Failure(message: "${response.statusMessage}"));
      }
    } on DioException catch (e) {
      log("❌ Dio error: ${e.message}");
      return left(
        Failure(
          message:
              e.response?.data?['message']?.toString() ??
              "Something went wrong!",
        ),
      );
    } catch (e) {
      log("💥 Unexpected error: $e");
      return left(Failure(message: "$e"));
    }
  }
}
