import 'dart:developer';

import 'package:empowered_ai/src/data/models/exam_model.dart';
import 'package:empowered_ai/src/data/repositories/exam/exam_repoImpl.dart';
import 'package:empowered_ai/src/domain/repositories/exam/exam_repo.dart';
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
    final payload = submitPayload();

    try {
      log("Submitting Exam: $payload");

      final res = await _examRepo.submit(answers: payload);
      res.fold((l) {}, (r) {
        Get.back();
      });

      log("Submit Success: $res");
    } catch (e) {
      log("💥 Error in submitExam(): $e");
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
