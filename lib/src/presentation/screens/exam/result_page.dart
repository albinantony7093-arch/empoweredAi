import 'package:empowered_ai/src/presentation/screens/exam/widgets/exam_info_card.dart';
import 'package:empowered_ai/src/presentation/screens/exam/widgets/rank_card.dart';
import 'package:empowered_ai/src/presentation/screens/exam/widgets/result_summary_card.dart';
import 'package:empowered_ai/src/presentation/screens/exam/widgets/weak_area_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text("Result"),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFEDEFF5), // panel background
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: const [
                  ResultSummaryCard(score: 1, totalQuestions: 5, accuracy: 20),
                  SizedBox(height: 16),
                  ExamInfoCard(examName: "NEET UG"),
                  SizedBox(height: 16),
                  RankCard(rank: 4993, percentile: 0.1),
                  SizedBox(height: 16),
                  // WeakAreasCard(
                  //   weakAreas: [
                  //     "WAVES",
                  //     "OPTICS",
                  //     "PLANT_PHYSIOLOGY",
                  //     "HUMAN_PHYSIOLOGY",
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
