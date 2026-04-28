import 'package:dartz/dartz.dart';

import '../../../core/network/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, Map<String, dynamic>>> login({
    required String email,
    required String passwd,
  });
  Future<Either<Failure, Map<String, dynamic>>> sendOtp({
    required String fullName,
    required String email,
    required String passwrd,
  });

  Future<Either<Failure, Map<String, dynamic>>> verifyOtp({
    required String email,
    required String otp,
  });

  Future<Either<Failure, Map<String, dynamic>>> forgotpassword({
    required String email,
  });

  Future<Either<Failure, Map<String, dynamic>>> resetpaswordOnforgot({
    required String email,
    required String otp,
    required String password,
  });
}
