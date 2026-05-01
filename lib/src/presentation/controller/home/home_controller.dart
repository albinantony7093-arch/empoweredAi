// import 'dart:developer';
// import 'dart:ui';

// import 'package:empowered_ai/src/data/models/course_model.dart';
// import 'package:empowered_ai/src/data/models/enrolled_course.dart';
// import 'package:empowered_ai/src/data/models/exam_model.dart';
// import 'package:empowered_ai/src/data/repositories/courses/course_repo_impl.dart';
// import 'package:empowered_ai/src/data/repositories/dashboard/dashboard_repoImpl.dart';
// import 'package:empowered_ai/src/data/repositories/enrol/course_enrol_repoImpl.dart';
// import 'package:empowered_ai/src/data/repositories/exam/exam_repoImpl.dart';
// import 'package:empowered_ai/src/data/repositories/profile/profile_repo_impl.dart';
// import 'package:empowered_ai/src/domain/repositories/courses/course_repo.dart';
// import 'package:empowered_ai/src/domain/repositories/dashboard/dashboard_repo.dart';
// import 'package:empowered_ai/src/domain/repositories/enrol/course_enrol_repo.dart';
// import 'package:empowered_ai/src/domain/repositories/exam/exam_repo.dart';
// import 'package:empowered_ai/src/domain/repositories/profile/profile_repo.dart';
// import 'package:empowered_ai/src/presentation/controller/exam/exam_controller.dart';
// import 'package:empowered_ai/src/presentation/screens/exam/exam_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';

// class HomeController extends GetxController {
//   // Courses
//   var courseList = <CourseModel>[].obs;
//   var enrolledCourses = <EnrolledCourse>[].obs;

//   // Selected course (IMPORTANT)
//   var selectedCourse = Rxn<EnrolledCourse>();

//   // UI states
//   var currentIndex = 0.obs;
//   var isSidebarVisible = true.obs;
//   var isMenuOpen = true.obs;
//   var isLoading = false.obs;

//   //courses-home
//   RxBool courseLoading = true.obs;
//   RxBool errorinCoursefetch = false.obs;

//   //dashboard
//   RxBool dashboardLoading = true.obs;
//   RxBool errorindashBoardfetch = false.obs;
//   var dashboardselectedCourse = Rxn<EnrolledCourse>();

//   Rxn<List<int>> recentScores = Rxn<List<int>>();
//   Rxn<List<String>> weakAreas = Rxn<List<String>>();
//   Rxn<List<Map<String, dynamic>>> topicDetails =
//       Rxn<List<Map<String, dynamic>>>();

//   final CourseRepo _courseRepo = CourseRepoImpl();
//   final ExamRepo _examRepo = ExamRepoimpl();
//   final CourseEnrolRepo _courseEnrolRepo = CourseEnrolRepoimpl();
//   final ProfileRepo _profileRepo = ProfileRepoImpl();
//   final DashboardRepo _dashboardRepo = DashboardRepoimpl();

//   void toggleMenu() => isMenuOpen.toggle();
//   void toggleSidebar() => isSidebarVisible.toggle();

//   @override
//   void onInit() {
//     super.onInit();
//     fetchCourses();
//     getMyprofile();
//   }

//   void fetchdashBoard({required String courseId}) async {
//     try {
//       dashboardLoading.value = true;
//       final res = await _dashboardRepo.fetchDashboardDetails(
//         courseId: courseId,
//       );
//       res.fold((l) {}, (R) {});
//     } catch (e) {
//       errorindashBoardfetch.value = true;
//     } finally {
//       dashboardLoading.value = false;
//     }
//   }

//   void enrollCourse({required String courseId}) async {
//     try {
//       EasyLoading.show();
//       final res = await _courseEnrolRepo.enrolCourse(courseId: courseId);

//       res.fold(
//         (l) {
//           getMyprofile();
//           Fluttertoast.showToast(
//             msg: l.message,
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER, // Better for web
//             timeInSecForIosWeb: 3,
//             backgroundColor: const Color(0xFF010029),
//             textColor: Colors.white,
//             fontSize: 14.0,
//             webPosition: "center", // web support
//             webBgColor: "#010029",
//             webShowClose: true,
//           );
//         },
//         (R) async {
//           getMyprofile();
//           Fluttertoast.showToast(
//             msg: R['message'],
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER, // Better for web
//             timeInSecForIosWeb: 3,
//             backgroundColor: const Color(0xFF010029),
//             textColor: Colors.white,
//             fontSize: 14.0,
//             webPosition: "center", // web support
//             webBgColor: "#010029",
//             webShowClose: true,
//           );
//         },
//       );
//     } catch (e) {
//       log("⚠️ Error in enrollCourse():$e");
//       EasyLoading.dismiss();
//     } finally {
//       EasyLoading.dismiss();
//     }
//   }

//   void getMyprofile() async {
//     try {
//       isLoading.value = true;

//       final res = await _profileRepo.getMyprofile();

//       res.fold(
//         (l) {
//           log("❌ Failed to fetch enrolled courses");
//         },
//         (R) {
//           final List<EnrolledCourse> courses = R['course'] ?? [];

//           enrolledCourses.assignAll(courses);

//           if (courses.isNotEmpty) {
//             selectedCourse.value = courses.first;
//             fetchdashBoard(courseId: courses.first.courseId);
//           }
//         },
//       );
//     } catch (e) {
//       log("💥 Error in getMyCourses(): $e");
//     } finally {
//       isLoading.value = false;
//     }
//   }

//   void fetchCourses() async {
//     try {
//       courseLoading.value = true;
//       final res = await _courseRepo.fetchCourses();

//       res.fold(
//         (l) {
//           log("❌ something went wrong");
//         },
//         (R) {
//           courseList.value = R['courses'];
//         },
//       );
//     } catch (e) {
//       log("💥 Error in fetchCourses");
//     } finally {
//       courseLoading.value = false;
//     }
//   }

//   void getqstns({required String courseId}) async {
//     try {
//       EasyLoading.show();
//       final res = await _examRepo.getQstns(courseId: courseId);

//       res.fold(
//         (l) {
//           Fluttertoast.showToast(
//             msg: l.message,
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.CENTER, // Better for web
//             timeInSecForIosWeb: 3,
//             backgroundColor: const Color(0xFF010029),
//             textColor: Colors.white,
//             fontSize: 14.0,
//             webPosition: "center", // web support
//             webBgColor: "#010029",
//             webShowClose: true,
//           );
//         },
//         (R) {
//           final List<QuestionModel> qns = R["qns"];
//           final String testId = R["test_id"];

//           log("✅ Questions loaded: ${qns.length}");

//           Get.to(
//             () => ExamPage(),
//             binding: BindingsBuilder(() {
//               Get.put(
//                 ExamController(
//                   questions: qns,
//                   testId: testId,
//                   exm: selectedCourse.value?.courseId ?? "",
//                 ),
//               );
//             }),
//           );
//         },
//       );
//     } catch (e) {
//       log("⚠️ Error in getqstns():$e");
//       EasyLoading.dismiss();
//     } finally {
//       EasyLoading.dismiss();
//     }
//   }
// }

import 'dart:developer';
import 'dart:ui';

import 'package:empowered_ai/src/data/models/course_model.dart';
import 'package:empowered_ai/src/data/models/enrolled_course.dart';
import 'package:empowered_ai/src/data/models/exam_model.dart';
import 'package:empowered_ai/src/data/repositories/courses/course_repo_impl.dart';
import 'package:empowered_ai/src/data/repositories/dashboard/dashboard_repoImpl.dart';
import 'package:empowered_ai/src/data/repositories/enrol/course_enrol_repoImpl.dart';
import 'package:empowered_ai/src/data/repositories/exam/exam_repoImpl.dart';
import 'package:empowered_ai/src/data/repositories/profile/profile_repo_impl.dart';
import 'package:empowered_ai/src/domain/repositories/courses/course_repo.dart';
import 'package:empowered_ai/src/domain/repositories/dashboard/dashboard_repo.dart';
import 'package:empowered_ai/src/domain/repositories/enrol/course_enrol_repo.dart';
import 'package:empowered_ai/src/domain/repositories/exam/exam_repo.dart';
import 'package:empowered_ai/src/domain/repositories/profile/profile_repo.dart';
import 'package:empowered_ai/src/presentation/controller/exam/exam_controller.dart';
import 'package:empowered_ai/src/presentation/screens/exam/exam_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // ── Course Data ─────────────────────────────
  RxList<CourseModel> courseList = <CourseModel>[].obs;
  RxList<EnrolledCourse> enrolledCourses = <EnrolledCourse>[].obs;

  // Selected course (single source of truth)
  Rxn<EnrolledCourse> selectedCourse = Rxn<EnrolledCourse>();

  // ── UI States ──────────────────────────────
  RxInt currentIndex = 0.obs;
  RxBool isSidebarVisible = true.obs;
  RxBool isMenuOpen = true.obs;
  RxBool isLoading = false.obs;

  // ── Course Loading ─────────────────────────
  RxBool courseLoading = true.obs;
  RxBool errorinCoursefetch = false.obs;

  // ── Dashboard State ────────────────────────
  RxBool dashboardLoading = true.obs;
  RxBool errorindashBoardfetch = false.obs;

  RxList<int> recentScores = <int>[].obs;
  RxList<String> dashboardweakAreas = <String>[].obs;
  RxList<Map<String, dynamic>> topicDetails = <Map<String, dynamic>>[].obs;

  RxnInt totalQuestions = RxnInt();
  RxnInt correctAnswers = RxnInt();
  RxnDouble accuracy = RxnDouble();
  RxnInt rank = RxnInt();
  RxnDouble percentile = RxnDouble();
  RxnInt latestScore = RxnInt();
  RxList<String> mentorAdvice = <String>[].obs;

  // ── Repositories ───────────────────────────
  final CourseRepo _courseRepo = CourseRepoImpl();
  final ExamRepo _examRepo = ExamRepoimpl();
  final CourseEnrolRepo _courseEnrolRepo = CourseEnrolRepoimpl();
  final ProfileRepo _profileRepo = ProfileRepoImpl();
  final DashboardRepo _dashboardRepo = DashboardRepoimpl();

  // ── UI Helpers ─────────────────────────────
  void toggleMenu() => isMenuOpen.toggle();
  void toggleSidebar() => isSidebarVisible.toggle();

  @override
  void onInit() {
    super.onInit();
    fetchCourses();
    getMyprofile();
  }

  // ── Change Course (used in UI) ─────────────
  void changeCourse(EnrolledCourse course) {
    selectedCourse.value = course;
    fetchdashBoard(courseId: course.courseId);
  }

  // ── Dashboard Fetch ───────────────────────
  void fetchdashBoard({required String courseId}) async {
    try {
      dashboardLoading.value = true;
      errorindashBoardfetch.value = false;

      final res = await _dashboardRepo.fetchDashboardDetails(
        courseId: courseId,
      );

      res.fold(
        (l) {
          errorindashBoardfetch.value = true;
        },
        (R) {
          recentScores.assignAll(List<int>.from(R['recent_scores'] ?? []));

          dashboardweakAreas.assignAll(
            List<String>.from(R['weak_areas'] ?? []),
          );

          topicDetails.assignAll(
            List<Map<String, dynamic>>.from(R['topics'] ?? []),
          );

          latestScore.value = R['latest_score'];
          totalQuestions.value = R['total_questions'];
          correctAnswers.value = R['correct_answers'];
          accuracy.value = (R['accuracy'] as num?)?.toDouble();
          rank.value = R['rank'];
          percentile.value = (R['percentile'] as num?)?.toDouble();

          mentorAdvice.assignAll(List<String>.from(R['mentor_advice'] ?? []));
        },
      );
    } catch (e) {
      errorindashBoardfetch.value = true;
      log("Dashboard error: $e");
    } finally {
      dashboardLoading.value = false;
    }
  }

  // ── Profile / Enrolled Courses ─────────────
  void getMyprofile() async {
    try {
      isLoading.value = true;

      final res = await _profileRepo.getMyprofile();

      res.fold(
        (l) {
          log("❌ Failed to fetch enrolled courses");
        },
        (R) {
          final List<EnrolledCourse> courses = R['course'] ?? [];

          enrolledCourses.assignAll(courses);

          if (courses.isNotEmpty) {
            // Only set if not already selected
            if (selectedCourse.value == null) {
              selectedCourse.value = courses.first;
              fetchdashBoard(courseId: courses.first.courseId);
            }
          }
        },
      );
    } catch (e) {
      log("💥 Error in getMyprofile(): $e");
    } finally {
      isLoading.value = false;
    }
  }

  // ── Fetch All Courses ──────────────────────
  void fetchCourses() async {
    try {
      courseLoading.value = true;

      final res = await _courseRepo.fetchCourses();

      res.fold(
        (l) {
          errorinCoursefetch.value = true;
          log("❌ Failed to fetch courses");
        },
        (R) {
          courseList.value = R['courses'];
        },
      );
    } catch (e) {
      log("💥 Error in fetchCourses(): $e");
    } finally {
      courseLoading.value = false;
    }
  }

  // ── Enroll Course ──────────────────────────
  void enrollCourse({required String courseId}) async {
    try {
      EasyLoading.show();

      final res = await _courseEnrolRepo.enrolCourse(courseId: courseId);

      res.fold(
        (l) {
          Fluttertoast.showToast(
            msg: l.message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER, // Better for web
            timeInSecForIosWeb: 3,
            backgroundColor: const Color(0xFF010029),
            textColor: Colors.white,
            fontSize: 14.0,
            webPosition: "center", // web support
            webBgColor: "#010029",
            webShowClose: true,
          );
        },
        (R) {
          Fluttertoast.showToast(msg: R['message']);
        },
      );

      getMyprofile();
    } catch (e) {
      log("⚠️ Error in enrollCourse(): $e");
    } finally {
      EasyLoading.dismiss();
    }
  }

  // ── Get Questions / Start Exam ─────────────
  void getqstns({required String courseId}) async {
    try {
      EasyLoading.show();

      final res = await _examRepo.getQstns(courseId: courseId);

      res.fold(
        (l) {
          Fluttertoast.showToast(
            msg: l.message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER, // Better for web
            timeInSecForIosWeb: 3,
            backgroundColor: const Color(0xFF010029),
            textColor: Colors.white,
            fontSize: 14.0,
            webPosition: "center", // web support
            webBgColor: "#010029",
            webShowClose: true,
          );
        },
        (R) {
          final List<QuestionModel> qns = R["qns"];
          final String testId = R["test_id"];

          Get.to(
            () => ExamPage(),
            binding: BindingsBuilder(() {
              Get.put(
                ExamController(
                  questions: qns,
                  testId: testId,
                  exm: selectedCourse.value?.title ?? "",
                ),
              );
            }),
          );
        },
      );
    } catch (e) {
      log("⚠️ Error in getqstns(): $e");
    } finally {
      EasyLoading.dismiss();
    }
  }
}
