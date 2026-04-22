import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:empowered_ai/src/core/network/dio_client.dart';
import 'package:empowered_ai/src/core/network/failure.dart';
import 'package:empowered_ai/src/core/url.dart';
import 'package:empowered_ai/src/domain/repositories/AuthRepo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failure, Map<String, dynamic>>> login({
    required String email,
    required String passwd,
  }) async {
    final url = "${Url.baseUrl}/${Url.login}";

    try {
      print("url->:$url");
      final data = jsonEncode({"email": email, "password": passwd});
      final response = await DioClient.dio.post(url, data: data);
      if (response.statusCode == 200) {
        return right({"access_token": response.data['access_token']});
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
  Future<Either<Failure, Map<String, dynamic>>> registration() async {
    final url = "${Url.baseUrl}/${Url.register}";

    try {
      final response = await DioClient.dio.post(url, data: {});
      if (response.statusCode == 200) {
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
