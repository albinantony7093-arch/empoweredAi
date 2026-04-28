import 'package:empowered_ai/src/presentation/widgets/card.dart';
import 'package:flutter/material.dart';

class ExamInfoCard extends StatelessWidget {
  final String examName;

  const ExamInfoCard({super.key, required this.examName});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Center(
        child: Text(
          "Exam: $examName",
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
