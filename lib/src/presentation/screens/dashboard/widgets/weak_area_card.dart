import 'package:flutter/material.dart';

enum DifficultyLevel { low, moderate, high }

class SubjectProgress {
  final String subject;
  final DifficultyLevel level;
  final double percentage; // 0.0 to 1.0

  const SubjectProgress({
    required this.subject,
    required this.level,
    required this.percentage,
  });
}

class WeakAreasWidget extends StatelessWidget {
  const WeakAreasWidget({super.key});

  static const List<SubjectProgress> _subjects = [
    SubjectProgress(
      subject: 'Physics',
      level: DifficultyLevel.low,
      percentage: 0.25,
    ),
    SubjectProgress(
      subject: 'Chemistry',
      level: DifficultyLevel.moderate,
      percentage: 0.55,
    ),
    SubjectProgress(
      subject: 'Biology',
      level: DifficultyLevel.low,
      percentage: 0.20,
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
            Icon(
              Icons.warning_amber_rounded,
              color: Color(0xFFE8472A),
              size: 20,
            ),
            SizedBox(width: 8),
            Text(
              'Weak Areas',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A2341),
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        // Card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          decoration: BoxDecoration(
            color: const Color(0xFF1E2A45),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: _subjects.map((s) => _SubjectRow(data: s)).toList(),
          ),
        ),
      ],
    );
  }
}

class _SubjectRow extends StatelessWidget {
  final SubjectProgress data;

  const _SubjectRow({required this.data});

  Color get _barColor {
    switch (data.level) {
      case DifficultyLevel.low:
        return const Color(0xFFE8472A);
      case DifficultyLevel.moderate:
        return const Color(0xFFF5A623);
      case DifficultyLevel.high:
        return const Color(0xFF4CAF50);
    }
  }

  String get _levelLabel {
    switch (data.level) {
      case DifficultyLevel.low:
        return 'Low';
      case DifficultyLevel.moderate:
        return 'Moderate';
      case DifficultyLevel.high:
        return 'High';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Subject name + badge + percentage
          Row(
            children: [
              Text(
                data.subject,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 10),
              _LevelBadge(label: _levelLabel, color: _barColor),
              const Spacer(),
              Text(
                '${(data.percentage * 100).toInt()}%',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: data.percentage,
              minHeight: 8,
              backgroundColor: const Color(0xFF2E3F5C),
              valueColor: AlwaysStoppedAnimation<Color>(_barColor),
            ),
          ),
        ],
      ),
    );
  }
}

class _LevelBadge extends StatelessWidget {
  final String label;
  final Color color;

  const _LevelBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.4), width: 1),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}
