import 'package:empowered_ai/src/presentation/screens/dashboard/widgets/toggle_button.dart';
import 'package:flutter/material.dart';

class ExamToggle extends StatelessWidget {
  final int selectedExam;
  final Function(int) onToggle;

  const ExamToggle({
    super.key,
    required this.selectedExam,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Row(
        children: [
          ToggleButton(
            label: "NEET UG",
            index: 0,
            selectedExam: selectedExam,
            onTap: onToggle,
          ),
          const SizedBox(width: 4),
          ToggleButton(
            label: "NEET PG",
            index: 1,
            selectedExam: selectedExam,
            onTap: onToggle,
          ),
        ],
      ),
    );
  }
}
