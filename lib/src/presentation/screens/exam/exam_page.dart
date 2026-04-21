import 'package:empowered_ai/src/core/config/theme/colors.dart';
import 'package:empowered_ai/src/presentation/controller/exam/exam_controller.dart';
import 'package:empowered_ai/src/presentation/screens/exam/widgets/header.dart';
import 'package:empowered_ai/src/presentation/screens/exam/widgets/qstn_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ExamPage extends StatelessWidget {
  const ExamPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<ExamController>();

    return Scaffold(
      backgroundColor: AppColor.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
          child: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 820),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderCard(ctrl: ctrl),

                  const SizedBox(height: 16),

                  /// Questions
                  Obx(() {
                    return Column(
                      children: List.generate(ctrl.questions.length, (index) {
                        final q = ctrl.questions[index];

                        return QuestionCard(
                          index: index,
                          question: q.text,
                          options: q.options,
                          selected: ctrl.answers[q.id],
                          onSelect: (v) => ctrl.selectAnswer(q.id, v),
                          isLast: false,
                        );
                      }),
                    );
                  }),

                  const SizedBox(height: 20),

                  /// Submit Button (Right aligned)
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 180,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffe0243a),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          ctrl.submitExam();
                        },
                        child: const Text(
                          "Submit Exam",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
