import 'dart:developer';

import 'package:empowered_ai/src/presentation/controller/home/home_controller.dart';
import 'package:empowered_ai/src/presentation/screens/dashboard/widgets/ai_insect.dart';
import 'package:empowered_ai/src/presentation/screens/dashboard/widgets/empty_dashboard.dart';
import 'package:empowered_ai/src/presentation/screens/dashboard/widgets/stat_card.dart';
import 'package:empowered_ai/src/presentation/screens/dashboard/widgets/weak_area_card.dart';
import 'package:empowered_ai/src/presentation/widgets/dropdown_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<HomeController>();

    return Obx(() {
      final selected = ctrl.selectedCourse.value;

      // 🔹 Initial loading
      if (selected == null) {
        return const Center(
          child: CircularProgressIndicator(color: Color(0xFF010029)),
        );
      }

      final isEmpty = ctrl.recentScores.isEmpty;

      return Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                // ── Header + Dropdown ───────────────
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'LAST TEST PERFORMANCE',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: const Color(0xff111C2D),
                      ),
                    ),
                    DropdownSelector(
                      value: selected.title,
                      items: ctrl.enrolledCourses.map((e) => e.title).toList(),
                      onChanged: (val) {
                        final course = ctrl.enrolledCourses.firstWhere(
                          (e) => e.title == val,
                        );

                        ctrl.changeCourse(course);
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                // ── Dashboard Content ───────────────
                if (ctrl.dashboardLoading.value)
                  const Center(
                    child: CircularProgressIndicator(color: Color(0xFF010029)),
                  )
                else if (isEmpty)
                  const EmptyDashboard()
                else ...[
                  // ── Stats Cards ────────────────
                  Row(
                    children: [
                      Expanded(
                        child: StatCard(
                          label: 'Score',
                          value:
                              "${ctrl.latestScore.value ?? 0}/${ctrl.totalQuestions.value ?? 0}",
                          imagePath: 'assets/images/Container.png',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: StatCard(
                          label: 'Rank',
                          value: ctrl.rank.value?.toString() ?? "--",
                          imagePath: 'assets/images/trophy.png',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: StatCard(
                          label: 'Percentile',
                          value: ctrl.percentile.value != null
                              ? "${ctrl.percentile.value!.toStringAsFixed(1)}%"
                              : "--",
                          imagePath: 'assets/images/percentage.png',
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // ── Mode Badge ────────────────
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEF2FF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '🎓 ${selected.title} Preparation Mode',
                      style: TextStyle(fontSize: 12, color: Color(0xFF3B5BDB)),
                    ),
                  ),

                  const SizedBox(height: 50),

                  // ── Bottom Section ─────────────
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (ctrl.dashboardweakAreas.isNotEmpty)
                        Expanded(
                          child: WeakAreasWidget(
                            weakAreas: ctrl.dashboardweakAreas,
                          ),
                        ),

                      if (ctrl.dashboardweakAreas.isNotEmpty)
                        const SizedBox(width: 16),

                      const Expanded(child: AIInsightsWidget()),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      );
    });
  }
}
