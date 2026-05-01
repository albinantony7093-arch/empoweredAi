import 'package:flutter/material.dart';

class EmptyDashboard extends StatelessWidget {
  const EmptyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Column(
          children: [
            const Icon(
              Icons.bar_chart_rounded,
              size: 40,
              color: Color(0xFF94A3B8),
            ),
            const SizedBox(height: 12),
            const Text(
              "No Test Data Yet",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            const Text(
              "Start your first test to unlock performance insights, rank, and analysis.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
            const SizedBox(height: 14),
          ],
        ),
      ),
    );
  }
}
