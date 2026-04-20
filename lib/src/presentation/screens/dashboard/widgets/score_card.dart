import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  final int score;
  final int index;

  const ScoreCard({super.key, required this.score, required this.index});

  @override
  Widget build(BuildContext context) {
    final colors = [
      const Color(0xFF6366F1),
      const Color(0xFF10B981),
      const Color(0xFFF59E0B),
      const Color(0xFFEC4899),
    ];
    final c = colors[index % colors.length];
    return Container(
      width: 80,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
      decoration: BoxDecoration(
        color: c.withOpacity(0.1),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: c.withOpacity(0.25)),
      ),
      child: Column(
        children: [
          Text(
            "$score",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: c,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Test ${index + 1}",
            style: TextStyle(
              fontSize: 11,
              color: Colors.white.withOpacity(0.4),
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}