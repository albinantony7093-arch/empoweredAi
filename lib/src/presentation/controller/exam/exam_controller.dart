import 'dart:developer';

import 'package:empowered_ai/src/data/models/exam_model.dart';
import 'package:empowered_ai/src/data/models/exam_result_model.dart';
import 'package:empowered_ai/src/data/repositories/exam/exam_repoImpl.dart';
import 'package:empowered_ai/src/domain/repositories/exam/exam_repo.dart';
import 'package:empowered_ai/src/presentation/controller/home/home_controller.dart';
import 'package:empowered_ai/src/presentation/screens/exam/result_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ExamController extends GetxController {
  ExamController({
    required List<QuestionModel> questions,
    required String testId,
    required String exm,
  }) {
    this.questions.value = questions;
    this.testId.value = testId;
    this.exm.value = exm;
  }

  final ExamRepo _examRepo = ExamRepoimpl();
  final ctrl = Get.find<HomeController>();

  RxInt remainingSeconds = 0.obs;

  RxString exm = "".obs;

  RxList<QuestionModel> questions = <QuestionModel>[].obs;

  RxMap<String, String> answers = <String, String>{}.obs;

  RxInt currentIndex = 0.obs;

  RxString testId = "".obs;

  void selectAnswer(String questionId, String answer) {
    answers[questionId] = answer;
  }

  void next() {
    if (currentIndex.value < questions.length - 1) {
      currentIndex.value++;
    }
  }

  void previous() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
    }
  }

  Map<String, dynamic> submitPayload() {
    return {"test_id": testId.value, "answers": answers};
  }

  void submitExam() async {
    try {
      EasyLoading.show();
      final payload = submitPayload();

      final res = await _examRepo.submit(answers: payload);
      res.fold((l) {}, (r) {
        Get.off(
          () => ExamResultScreen(
            result: ExamResultModel.fromJson({
              "test_id": r['test_id'],
              "exam": r['exam'] ?? "not found",
              "score": r['score'],
              "total": r['total'],
              "accuracy": r['accuracy'],
              "weak_areas": r['weak_areas'],
              "rank": r['rank'],
              "percentile": r['percentile'],
              "mentor_advice": [
                "You're answering roughly 1 in 2 correctly. Targeted revision of weak topics will quickly lift your score.",
                "You're answering roughly 1 in 2 correctly. Targeted revision of weak topics will quickly lift your scores.",
                "You're answering roughly 1 in 2 correctly. Targeted revision of weak topics will quickly lift your score.",
              ],
            }),
          ),
        );
        ctrl.fetchdashBoard(courseId: ctrl.selectedCourse.value!.courseId);
      });
    } catch (e) {
      log("💥 Error in submitExam(): $e");
    } finally {
      EasyLoading.dismiss();
    }
  }

  @override
  void onInit() {
    super.onInit();
    log("✅ ExamController Initialized");
  }

  @override
  void onClose() {
    log("🔥 ExamController Disposed");
    super.onClose();
  }
}
