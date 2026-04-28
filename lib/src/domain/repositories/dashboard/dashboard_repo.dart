import 'package:dartz/dartz.dart';

import '../../../core/network/failure.dart';

abstract class DashboardRepo {
  Future<Either<Failure, Map<String, dynamic>>> fetchexamDetails({
    required String course,
  });
}
