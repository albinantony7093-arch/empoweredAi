import 'dart:developer';

import 'package:empowered_ai/src/presentation/controller/home/home_controller.dart';
import 'package:empowered_ai/src/presentation/screens/courses/widgets/course_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:empowered_ai/src/presentation/screens/courses/widgets/banner.dart';

class Courses extends StatelessWidget {
  Courses({super.key});

  final ctrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (ctrl.courseLoading.value) {
        return const Center(
          child: CircularProgressIndicator(color: Color(0xFF010029)),
        );
      }

      return Column(
        children: [
          HeroWidget(),
          const SizedBox(height: 40),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: ctrl.courseList.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 360, // 👈 tighter cards
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                mainAxisExtent: 160, // 👈 compact height (KEY)
              ),
              itemBuilder: (context, index) {
                final course = ctrl.courseList[index];

                return CourseCard(
                  isEnrolled: course.isenrollerd,
                  title: course.title,
                  description: course.description,
                  totalQuestions: 180,
                  duration: "3 Hours",
                  accentColor: const Color(0xff003D9B),
                  onStart: () {
                    if (!EasyLoading.isShow) {
                      ctrl.enrollCourse(courseId: course.id);
                    }
                  },
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
