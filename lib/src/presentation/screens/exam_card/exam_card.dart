import 'dart:developer';

import 'package:empowered_ai/src/presentation/controller/home/home_controller.dart';
import 'package:empowered_ai/src/presentation/screens/exam_card/widgets/start_exam_card.dart';
import 'package:empowered_ai/src/presentation/widgets/dropdown_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ExamCard extends StatelessWidget {
  const ExamCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<HomeController>();

    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 24, top: 16),
        child: Obx(() {
          /// 🔄 Loading
          if (ctrl.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          /// ❌ No courses
          if (ctrl.enrolledCourses.isEmpty) {
            return const Center(child: Text("No enrolled courses found"));
          }

          final selected = ctrl.selectedCourse.value;

          /// ⚠️ Safety (should not happen, but safe)
          if (selected == null) {
            return const Center(child: Text("No course selected"));
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔽 Dropdown
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DropdownSelector(
                    value: selected.title,
                    items: ctrl.enrolledCourses
                        .map((course) => course.title)
                        .toList(),
                    onChanged: (val) {
                      // ctrl.selectedCourse.value = ctrl.enrolledCourses
                      //     .firstWhere((e) => e.title == val);

                      // log("Selected: ${ctrl.selectedCourse.value?.title}");

                      final course = ctrl.enrolledCourses.firstWhere(
                        (e) => e.title == val,
                      );
                      ctrl.changeCourse(course);
                    },
                  ),
                ],
              ),

              const SizedBox(height: 40),

              /// 🎯 Dynamic Card
              StartExamCard(
                title: selected.title,
                subtitle: selected.description,
                meta: selected.keypoints,
                description: selected.description,
                points: selected.keypoints,
                onStart: () {
                  if (EasyLoading.isShow != true) {
                    ctrl.getqstns(courseId: selected.courseId);
                  }
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
