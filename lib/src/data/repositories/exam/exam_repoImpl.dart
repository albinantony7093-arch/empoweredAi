import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:empowered_ai/src/core/network/dio_client.dart';
import 'package:empowered_ai/src/core/network/failure.dart';
import 'package:empowered_ai/src/core/url.dart';
import 'package:empowered_ai/src/data/models/exam_model.dart';

import 'package:empowered_ai/src/domain/repositories/exam/exam_repo.dart';
import 'package:get/get.dart';

class ExamRepoimpl implements ExamRepo {
  @override
  Future<Either<Failure, Map<String, dynamic>>> getQstns({
    required String course,
  }) async {
    final url = "${Url.baseUrl}/${Url.questions}?exam=$course";

    try {
      log("url:$url");
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
  Future<Either<Failure, Map<String, dynamic>>> submit({
    required Map<String, dynamic> answers,
  }) async {
    final url = "${Url.baseUrl}/${Url.submit}";

    try {
      final response = await DioClient.dio.post(url, data: answers);
      if (response.statusCode == 200) {
        log("resp:${response.data}");
        return right({});
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
