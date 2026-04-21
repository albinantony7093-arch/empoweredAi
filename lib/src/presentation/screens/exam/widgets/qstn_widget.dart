import 'package:empowered_ai/src/core/config/theme/colors.dart';
import 'package:empowered_ai/src/presentation/screens/exam/widgets/option_tile.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.index,
    required this.question,
    required this.options,
    required this.selected,
    required this.onSelect,
    required this.isLast,
  });

  final int index;
  final String question;
  final Map options;
  final String? selected;
  final Function(String) onSelect;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.fromLTRB(22, 22, 22, 18),
      decoration: BoxDecoration(
        color: AppColor.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColor.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.02),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Question Header
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Color(0xffe0243a),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "Q${index + 1}",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Text(
                  question,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColor.ink,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          /// Options
          ...options.entries.map((e) {
            final isSelected = selected == e.key;

            return OptionTile(
              optionKey: e.key,
              optionValue: e.value,
              isSelected: isSelected,
              groupValue: selected,
              onSelect: onSelect,
            );
          }),
        ],
      ),
    );
  }
}
