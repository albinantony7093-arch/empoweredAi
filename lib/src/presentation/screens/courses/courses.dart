import 'package:empowered_ai/src/presentation/controller/home/home_controller.dart';
import 'package:empowered_ai/src/presentation/screens/courses/widgets/course_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:empowered_ai/src/presentation/screens/courses/widgets/banner.dart';
import 'package:empowered_ai/src/presentation/screens/courses/widgets/section_divider.dart';

class Courses extends StatelessWidget {
  Courses({super.key});

  final ctrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeroWidget(),
        const SizedBox(height: 40),

        Expanded(
          child: Obx(
            () => GridView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: ctrl.courseList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _getCrossAxisCount(context),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 2,
              ),
              itemBuilder: (context, index) {
                final course = ctrl.courseList[index];

                return SizedBox.expand(
                  child: CourseCard(
                    title: course.title,
                    description: course.description,
                    totalQuestions: 180,
                    duration: "3 Hours",
                    accentColor: const Color(0xff003D9B),
                    onStart: () {},
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 600) return 1; // 📱 mobile
    if (width < 1000) return 2; // 📲 tablet
    return 3; // 💻 desktop
  }
}
