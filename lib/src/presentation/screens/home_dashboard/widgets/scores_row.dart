import 'package:flutter/material.dart';
import '../../../controller/home_dashboard/dashboardController.dart';
import 'score_card.dart';

class ScoresRow extends StatelessWidget {
  final DashboardController controller;

  const ScoresRow({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: controller.recentScores
            .asMap()
            .entries
            .map((e) => Padding(
          padding: EdgeInsets.only(
              right: e.key < controller.recentScores.length - 1 ? 10 : 0),
          child: ScoreCard(score: e.value, index: e.key),
        ))
            .toList(),
      ),
    );
  }
}