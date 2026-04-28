// ─────────────────────────────────────────
// DATA MODEL
// ─────────────────────────────────────────

import 'package:flutter/material.dart';

class InsightItem {
  final String title;
  final String message;
  final List<String> boldWords; // words to bold inside message
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;

  const InsightItem({
    required this.title,
    required this.message,
    required this.boldWords,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
  });
}

// ─────────────────────────────────────────
// AI INSIGHTS WIDGET
// ─────────────────────────────────────────

class AIInsightsWidget extends StatelessWidget {
  const AIInsightsWidget({super.key});

  static const List<InsightItem> _insights = [
    InsightItem(
      title: 'Accuracy Alert',
      message:
          'Your accuracy needs improvement in Mechanics. Focus on clarifying fundamental NCERT concepts.',
      boldWords: ['accuracy'],
      icon: Icons.error_outline_rounded,
      iconColor: Color(0xFFE8472A),
      iconBgColor: Color(0xFFFFF0ED),
    ),
    InsightItem(
      title: 'Daily Revision',
      message:
          'Revise Organic Chemistry naming reactions daily for better retention during long tests.',
      boldWords: [
        'Revise',
        'Organic',
        'Chemistry',
        'naming',
        'reactions',
        'daily',
        'for',
        'better',
        'retention',
        'during',
        'long',
        'tests.',
      ],
      icon: Icons.push_pin_rounded,
      iconColor: Color(0xFF3B5BDB),
      iconBgColor: Color(0xFFEEF2FF),
    ),
    InsightItem(
      title: 'Time Management',
      message:
          'Practice time-bound tests for Biology section to save more time for complex Physics problems.',
      boldWords: ['time-bound', 'tests'],
      icon: Icons.check_circle_rounded,
      iconColor: Color(0xFF2ECC71),
      iconBgColor: Color(0xFFEAFAF1),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Header
        Row(
          children: const [
            Icon(Icons.psychology_outlined, color: Color(0xFF3B5BDB), size: 22),
            SizedBox(width: 8),
            Text(
              'AI Insights',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1A2341),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Insight cards
        Column(
          children: _insights
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _InsightCard(item: item),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────
// INSIGHT CARD
// ─────────────────────────────────────────

class _InsightCard extends StatelessWidget {
  final InsightItem item;

  const _InsightCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: item.iconBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(item.icon, color: item.iconColor, size: 22),
          ),

          const SizedBox(width: 14),

          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A2341),
                  ),
                ),
                const SizedBox(height: 5),
                _StyledMessage(
                  message: item.message,
                  boldWords: item.boldWords,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────
// STYLED MESSAGE (selective bold)
// ─────────────────────────────────────────

class _StyledMessage extends StatelessWidget {
  final String message;
  final List<String> boldWords;

  const _StyledMessage({required this.message, required this.boldWords});

  @override
  Widget build(BuildContext context) {
    final words = message.split(' ');
    final spans = <TextSpan>[];

    for (int i = 0; i < words.length; i++) {
      final word = words[i];
      final isBold = boldWords.any(
        (b) => word.toLowerCase().contains(b.toLowerCase()),
      );

      spans.add(
        TextSpan(
          text: i < words.length - 1 ? '$word ' : word,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isBold ? FontWeight.w700 : FontWeight.w400,
            color: const Color(0xFF4A5568),
            height: 1.5,
          ),
        ),
      );
    }

    return RichText(text: TextSpan(children: spans));
  }
}
