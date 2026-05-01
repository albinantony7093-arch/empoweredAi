import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:empowered_ai/src/core/network/dio_client.dart';
import 'package:empowered_ai/src/core/network/failure.dart';
import 'package:empowered_ai/src/core/url.dart';
import 'package:empowered_ai/src/data/models/exam_model.dart';

import 'package:empowered_ai/src/domain/repositories/exam/exam_repo.dart';

class ExamRepoimpl implements ExamRepo {
  @override
  Future<Either<Failure, Map<String, dynamic>>> getQstns({
    required String courseId,
  }) async {
    String url = "${Url.baseUrl}/${Url.questions(courseId)}";

    try {
      final response = await DioClient.dio.get(url);
      if (response.statusCode == 200) {
        final qns = QuestionModel.fromList(response.data["questions"]);

        return right({"qns": qns, "test_id": response.data['test_id']});
      } else {
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

  @override
  Future<Either<Failure, Map<String, dynamic>>> submit({
    required Map<String, dynamic> answers,
  }) async {
    final url = "${Url.baseUrl}/${Url.submit}";

    try {
      final response = await DioClient.dio.post(url, data: answers);
      log("resp:$response");
      if (response.statusCode == 200) {
        return right({
          "test_id": response.data['test_id'],
          "score": response.data['score'],
          "total": response.data['total'],
          "accuracy": response.data['accuracy'],
          "weak_areas": response.data['weak_areas'],
          "rank": response.data['rank'],
          "percentile": response.data['percentile'],
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
