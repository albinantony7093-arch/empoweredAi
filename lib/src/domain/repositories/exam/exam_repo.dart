import 'package:dartz/dartz.dart';

import '../../../core/network/failure.dart';

abstract class ExamRepo {
  Future<Either<Failure, Map<String, dynamic>>> getQstns({
    required String course,
  });
  Future<Either<Failure, Map<String, dynamic>>> submit({
    required Map<String, dynamic> answers,
  });
}
