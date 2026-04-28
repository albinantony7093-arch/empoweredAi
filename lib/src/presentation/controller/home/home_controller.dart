import 'dart:developer';

import 'package:empowered_ai/src/data/models/course_model.dart';
import 'package:empowered_ai/src/data/models/enrolled_course.dart';
import 'package:empowered_ai/src/data/repositories/courses/course_repo_impl.dart';
import 'package:empowered_ai/src/domain/repositories/courses/course_repo.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Courses
  var courseList = <CourseModel>[].obs;
  var enrolledCourses = <EnrolledCourse>[].obs;

  // Selected course (IMPORTANT)
  var selectedCourse = Rxn<EnrolledCourse>();

  // UI states
  var currentIndex = 0.obs;
  var isSidebarVisible = true.obs;
  var isMenuOpen = true.obs;
  var isLoading = false.obs;

  RxBool courseLoading = true.obs;
  RxBool errorinCoursefetch = false.obs;

  Rxn<List<int>> recentScores = Rxn<List<int>>();
  Rxn<List<String>> weakAreas = Rxn<List<String>>();
  Rxn<List<Map<String, dynamic>>> topicDetails =
      Rxn<List<Map<String, dynamic>>>();

  final CourseRepo _courseRepo = CourseRepoImpl();

  void toggleMenu() => isMenuOpen.toggle();
  void toggleSidebar() => isSidebarVisible.toggle();

  @override
  void onInit() {
    super.onInit();
    fetchCourses();
    getMycourses();
  }

  void getMycourses() async {
    try {
      isLoading.value = true;

      final res = await _courseRepo.getMyCourses();

      res.fold(
        (l) {
          log("❌ Failed to fetch enrolled courses");
        },
        (R) {
          final List<EnrolledCourse> courses = R['course'] ?? [];

          enrolledCourses.assignAll(courses);

          if (courses.isNotEmpty) {
            selectedCourse.value = courses.first;
          }
        },
      );
    } catch (e) {
      log("💥 Error in getMyCourses(): $e");
    } finally {
      isLoading.value = false;
    }
  }

  void fetchCourses() async {
    try {
      final res = await _courseRepo.fetchCourses();

      res.fold(
        (l) {
          log("❌ something went wrong");
        },
        (R) {
          courseList.value = R['courses'];
        },
      );
    } catch (e) {
      log("💥 Error in fetchCourses");
    }
  }
}
