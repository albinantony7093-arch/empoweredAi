import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:empowered_ai/src/presentation/controller/home/home_controller.dart';

class TabButton extends StatelessWidget {
  final String title;
  final String type;

  const TabButton({required this.title, required this.type, super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Obx(() {
      final isActive = controller.selected.value == type;

      return GestureDetector(
        onTap: () => controller.selectExam(type),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          decoration: BoxDecoration(
            color: isActive ? const Color(0xffe0243a) : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xffe0243a)),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.white : const Color(0xffe0243a),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    });
  }
}
