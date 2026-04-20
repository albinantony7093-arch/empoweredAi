import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_test/hometestcontroller.dart';

class ExamToggleButton extends StatelessWidget {
  final int index;
  final String text;
  final HomeTestController controller;

  const ExamToggleButton({
    super.key,
    required this.index,
    required this.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.selectedExam.value = index,
        child: Obx(
              () => Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: controller.selectedExam.value == index
                  ? const Color(0xFF6B46C1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: controller.selectedExam.value == index
                      ? Colors.white
                      : const Color(0xFF9CA3AF),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}