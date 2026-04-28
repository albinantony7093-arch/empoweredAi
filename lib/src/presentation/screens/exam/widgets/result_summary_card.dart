import 'package:empowered_ai/src/presentation/widgets/card.dart';
import 'package:flutter/material.dart';

class ResultSummaryCard extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final double accuracy;

  const ResultSummaryCard({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.accuracy,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.bar_chart_rounded, color: Color(0xFF5B5FEF)),
              SizedBox(width: 8),
              Text(
                "Your Result",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _metric(score.toString(), "Score"),
              _metric(totalQuestions.toString(), "Questions"),
              _metric("${accuracy.toStringAsFixed(0)}%", "Accuracy"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _metric(String value, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF5B5FEF),
            ),
          ),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
