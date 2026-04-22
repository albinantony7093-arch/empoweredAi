import 'package:empowered_ai/src/presentation/controller/home/home_controller.dart';
import 'package:empowered_ai/src/presentation/screens/test_card/widgets/metabox.dart';
import 'package:empowered_ai/src/presentation/screens/test_card/widgets/tabbutton.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExamCard extends StatelessWidget {
  const ExamCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Obx(() {
      final d = controller.current;

      return LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: isMobile ? double.infinity : 620,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xffe5e7eb)),
                      boxShadow: const [
                        BoxShadow(blurRadius: 12, color: Colors.black12),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Choose Your Exam",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        const SizedBox(height: 16),

                        Wrap(
                          spacing: 12,
                          children: const [
                            TabButton(title: "NEET UG", type: "ug"),
                            TabButton(title: "NEET PG", type: "pg"),
                          ],
                        ),

                        const SizedBox(height: 14),

                        Text(
                          d["desc"]!,
                          style: const TextStyle(
                            color: Color(0xff6b7280),
                            fontSize: 14,
                            height: 1.4,
                          ),
                        ),

                        const SizedBox(height: 18),

                        Obx(
                          () => ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffe0243a),
                              disabledBackgroundColor: const Color(0xffe0243a),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                            ),
                            onPressed: () {
                              if (!controller.isLoading.value) {
                                controller.getTestqstns();
                              }
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                /// Invisible text keeps width fixed
                                Opacity(
                                  opacity: controller.isLoading.value ? 0 : 1,
                                  child: Text(
                                    d["btn"]!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),

                                if (controller.isLoading.value)
                                  const SizedBox(
                                    height: 18,
                                    width: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 18),

                        LayoutBuilder(
                          builder: (context, box) {
                            final isMobile = box.maxWidth < 600;

                            return Wrap(
                              spacing: 12,
                              runSpacing: 12,
                              children: [
                                SizedBox(
                                  width: isMobile
                                      ? (box.maxWidth - 44) / 2
                                      : null,
                                  child: MetaBox(
                                    label: "Questions",
                                    value: d["q"]!,
                                  ),
                                ),
                                SizedBox(
                                  width: isMobile
                                      ? (box.maxWidth - 44) / 2
                                      : null,
                                  child: MetaBox(
                                    label: "Subjects",
                                    value: d["s"]!,
                                  ),
                                ),
                                SizedBox(
                                  width: isMobile
                                      ? (box.maxWidth - 44) / 2
                                      : null,
                                  child: MetaBox(
                                    label: "Level",
                                    value: d["l"]!,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
