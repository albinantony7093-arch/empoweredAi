import 'dart:developer';

import 'package:empowered_ai/src/data/repositories/exam/exam_repoImpl.dart';
import 'package:empowered_ai/src/domain/repositories/exam/exam_repo.dart';
import 'package:empowered_ai/src/presentation/controller/exam/exam_controller.dart';
import 'package:empowered_ai/src/presentation/screens/exam/exam_page.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  final selected = "ug".obs;
  var isLoading = false.obs;

  final ExamRepo _examRepo = ExamRepoimpl();

  final Map<String, Map<String, String>> data = {
    "ug": {
      "desc":
          "Undergraduate entrance — 50 questions from Physics, Chemistry, and Biology.",
      "btn": "Start UG Test",
      "q": "50",
      "s": "PCB",
      "l": "UG",
    },
    "pg": {
      "desc": "Postgraduate entrance — advanced medical level test.",
      "btn": "Start PG Test",
      "q": "60",
      "s": "Clinical",
      "l": "PG",
    },
  };

  void selectExam(String type) {
    selected.value = type;
  }

  Map<String, String> get current => data[selected.value]!;

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  void getTestqstns() async {
    try {
      if (isLoading.value) {
        return;
      }

      isLoading.value = true;

      final res = await _examRepo.getQstns(course: selected.value);

      res.fold((l) {}, (R) {
        Get.to(
          () => ExamPage(),
          binding: BindingsBuilder(() {
            Get.lazyPut(
              () => ExamController(
                questions: R["qns"],
                testId: R["test_id"],
                exm: selected.value,
              ),
            );
          }),
        );
      });
    } catch (e) {
      log("💥 Error in getTestqstns:$e");
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}
