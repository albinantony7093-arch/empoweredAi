import 'package:dartz/dartz.dart';

import '../../../core/network/failure.dart';

abstract class CourseEnrolRepo {
  Future<Either<Failure, Map<String, dynamic>>> enrolCourse({
    required String courseId,
  });
}
