import 'package:empowered_ai/src/core/config/theme/colors.dart';
import 'package:empowered_ai/src/presentation/controller/exam/exam_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({super.key, required this.ctrl});

  final ExamController ctrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColor.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColor.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 18,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "NEET ${ctrl.exm.value.toUpperCase()} Test",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: AppColor.ink,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Obx(
                      () => Text(
                        "${ctrl.questions.length} Questions",
                        style: const TextStyle(color: AppColor.inkMid),
                      ),
                    ),
                  ],
                ),
              ),

              /// Status
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColor.greenBg,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  children: const [
                    CircleAvatar(radius: 4, backgroundColor: AppColor.greenDot),
                    SizedBox(width: 6),
                    Text(
                      "Test in progress",
                      style: TextStyle(
                        color: AppColor.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          const Divider(),

          const SizedBox(height: 18),

          /// Meta Row
          Row(
            children: [
              _Meta("EXAM", "${ctrl.exm}"),
              _Meta("SUBJECT", "PCB"),
              Obx(() => _Meta("QUESTIONS", "${ctrl.questions.length}")),
              _Meta("TIME", "60 min"),
            ],
          ),
        ],
      ),
    );
  }
}

class _Meta extends StatelessWidget {
  const _Meta(this.label, this.value);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColor.bg,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColor.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 10,
                color: AppColor.inkLight,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: AppColor.ink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
