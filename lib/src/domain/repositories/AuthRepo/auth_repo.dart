// abstact repo

import 'package:dartz/dartz.dart';

import '../../../core/network/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, Map<String, dynamic>>> login({
    required String email,
    required String passwd,
  });
  Future<Either<Failure, Map<String, dynamic>>> registration();
}
