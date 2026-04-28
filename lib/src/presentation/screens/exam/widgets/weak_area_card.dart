import 'package:empowered_ai/src/presentation/widgets/card.dart';
import 'package:flutter/material.dart';

class WeakAreasCard extends StatelessWidget {
  final List<String> weakAreas;

  const WeakAreasCard({
    super.key,
    required this.weakAreas,
    required List<Map<String, dynamic>> topics,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.warning_amber_rounded, color: Colors.orange),
              SizedBox(width: 8),
              Text(
                "Weak Areas",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...weakAreas.map(
            (e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  const Text("• ", style: TextStyle(fontSize: 16)),
                  Text(e),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
