import 'package:dartz/dartz.dart';

import '../../../core/network/failure.dart';

abstract class CourseRepo {
  Future<Either<Failure, Map<String, dynamic>>> fetchCourses();
  Future<Either<Failure, Map<String, dynamic>>> getMyCourses();
}
