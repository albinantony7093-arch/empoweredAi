import 'package:empowered_ai/src/presentation/controller/home/home_controller.dart';
import 'package:empowered_ai/src/presentation/screens/calmcorner/calm_corner.dart';
import 'package:empowered_ai/src/presentation/screens/dashboard/dashboard.dart';
import 'package:empowered_ai/src/presentation/screens/dashboard/widgets/stat_card.dart';
import 'package:empowered_ai/src/presentation/screens/home/widgets/topappbar.dart';
import 'package:empowered_ai/src/presentation/screens/courses/courses.dart';
import 'package:empowered_ai/src/presentation/screens/profile/profile.dart';
import 'package:empowered_ai/src/presentation/screens/exam_card/exam_card.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(HomeController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ResponsiveTopBar(),

            Expanded(
              child: Obx(
                () => IndexedStack(
                  index: ctrl.currentIndex.value,
                  children: [
                    Courses(),
                    DashboardScreen(),
                    ExamCard(),
                    Profile(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
