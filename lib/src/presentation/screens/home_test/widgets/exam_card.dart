import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home_test/hometestcontroller.dart';
import 'exam_toggle_button.dart';

class ExamCard extends StatelessWidget {
  const ExamCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<HomeTestController>();
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFF2A344D),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Choose Your Exam",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF4A5568)),
                gradient: const LinearGradient(
                  colors: [Color(0x33FFFFFF), Color(0x1AFFFFFF)],
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Row(
                  children: [
                    ExamToggleButton(
                      index: 0,
                      text: "NEET UG",
                      controller: ctrl,
                    ),
                    ExamToggleButton(
                      index: 1,
                      text: "NEET PG",
                      controller: ctrl,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            Text(
              ctrl.selectedExam.value == 0
                  ? "Undergraduate entrance — 50 questions from Physics, Chemistry, and Biology."
                  : "Postgraduate entrance — Advanced questions from Medical Sciences.",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Color(0xFF9CA3AF)),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6B46C1),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Start ${ctrl.selectedExam.value == 0 ? 'UG' : 'PG'} Test",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
