import 'package:flutter/material.dart';
import 'stat_card.dart';

class StatsRow extends StatelessWidget {
  const StatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
            child: StatCard(
                title: "Avg Score", value: "78%", subtitle: "↑ 4% this week", accent: Color(0xFF6366F1))),
        SizedBox(width: 12),
        Expanded(
            child: StatCard(
                title: "Tests Taken", value: "24", subtitle: "This month", accent: Color(0xFF10B981))),
        SizedBox(width: 12),
        Expanded(
            child: StatCard(
                title: "Rank", value: "#142", subtitle: "Top 12%", accent: Color(0xFFF59E0B))),
      ],
    );
  }
}