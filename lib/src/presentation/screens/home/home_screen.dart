import 'package:empowered_ai/src/presentation/controller/home/home_controller.dart';
import 'package:empowered_ai/src/presentation/screens/dashboard/dashboard.dart';
import 'package:empowered_ai/src/presentation/screens/home/widgets/topnavbar.dart';
import 'package:empowered_ai/src/presentation/screens/test_card/exam_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(HomeController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const TopNavBar(),
          Expanded(
            child: Obx(
              () => IndexedStack(
                index: ctrl.currentIndex.value,
                children: const [DashboardScreen(), ExamCard()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
