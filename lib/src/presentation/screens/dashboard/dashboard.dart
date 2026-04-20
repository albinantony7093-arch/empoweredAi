import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_dashboard/dashboardController.dart';
import 'widgets/dashboard_header.dart';
import 'widgets/exam_toggle.dart';
import 'widgets/stats_row.dart';
import 'widgets/section_label.dart';
import 'widgets/scores_row.dart';
import 'widgets/weak_areas.dart';
import 'widgets/accuracy_list.dart';

//0xFF0A0F1E

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0A0F1E), Color(0xFF0D1530), Color(0xFF0A0F1E)],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.06, end: 0),
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOut,
        builder: (context, offset, child) {
          return TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 700),
            curve: Curves.easeOut,
            builder: (context, opacity, child) {
              return Opacity(
                opacity: opacity,
                child: Transform.translate(
                  offset: Offset(
                    0,
                    offset * MediaQuery.of(context).size.height,
                  ),
                  child: child,
                ),
              );
            },
            child: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double w = constraints.maxWidth;
                  double hPad = w > 900 ? ((w - 720) / 2) : 20.0;
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(hPad, 28, hPad, 40),
                    child: Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const DashboardHeader(),
                          const SizedBox(height: 28),
                          ExamToggle(
                            selectedExam: controller.selectedExam.value,
                            onToggle: (index) =>
                                controller.selectedExam.value = index,
                          ),
                          const SizedBox(height: 28),
                          const StatsRow(),
                          const SizedBox(height: 28),
                          const SectionLabel("Recent Scores"),
                          const SizedBox(height: 14),
                          ScoresRow(controller: controller),
                          const SizedBox(height: 28),
                          const SectionLabel("Weak Areas"),
                          const SizedBox(height: 14),
                          WeakAreas(controller: controller),
                          const SizedBox(height: 28),
                          const SectionLabel("Topic Accuracy"),
                          const SizedBox(height: 16),
                          AccuracyList(controller: controller),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
