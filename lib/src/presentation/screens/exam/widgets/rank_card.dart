import 'package:empowered_ai/src/presentation/widgets/card.dart';
import 'package:flutter/material.dart';

class RankCard extends StatelessWidget {
  final int rank;
  final double percentile;

  const RankCard({super.key, required this.rank, required this.percentile});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.emoji_events_outlined, size: 18),
              ),
              const SizedBox(width: 10),
              Text(
                "Rank #$rank",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "You are ahead of ${percentile.toStringAsFixed(1)}% of students",
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
