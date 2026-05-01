import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:empowered_ai/src/core/network/dio_client.dart';
import 'package:empowered_ai/src/core/network/failure.dart';
import 'package:empowered_ai/src/core/url.dart';

import 'package:empowered_ai/src/data/models/enrolled_course.dart';

import 'package:empowered_ai/src/domain/repositories/profile/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  @override
  Future<Either<Failure, Map<String, dynamic>>> getMyprofile() async {
    final url = "${Url.baseUrl}/${Url.getMyprofile}";
    try {
      final response = await DioClient.dio.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;

        final List<dynamic> courseList = data['enrolled_courses'] ?? [];

        final courses = courseList
            .map((e) => EnrolledCourse.fromJson(e))
            .toList();

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
