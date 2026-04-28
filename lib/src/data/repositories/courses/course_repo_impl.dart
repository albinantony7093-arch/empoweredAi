import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:empowered_ai/src/core/network/dio_client.dart';
import 'package:empowered_ai/src/core/network/failure.dart';
import 'package:empowered_ai/src/core/url.dart';
import 'package:empowered_ai/src/data/models/course_model.dart';
import 'package:empowered_ai/src/data/models/enrolled_course.dart';
import 'package:empowered_ai/src/domain/repositories/courses/course_repo.dart';

class CourseRepoImpl implements CourseRepo {
  @override
  Future<Either<Failure, Map<String, dynamic>>> fetchCourses() async {
    final url = "${Url.baseUrl}/${Url.getNewcourses}";
    try {
      final response = await DioClient.dio.get(url);
      if (response.statusCode == 200) {
        final courseList = CourseModel.fromJsonList(response.data);
        return right({"courses": courseList});
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

  @override
  Future<Either<Failure, Map<String, dynamic>>> getMyCourses() async {
    final url = "${Url.baseUrl}/${Url.getMyCourses}";
    try {
      final response = await DioClient.dio.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;

        final courses = data.map((e) => EnrolledCourse.fromJson(e)).toList();

        return right({'course': courses});
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
