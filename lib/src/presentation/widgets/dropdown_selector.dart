import 'package:flutter/material.dart';

const _kBg = Color(0xFFFFFFFF);
const _kBorder = Color(0xFFE5E7EB);
const _kTextPrimary = Color(0xFF1B2A4A);

class DropdownSelector extends StatelessWidget {
  const DropdownSelector({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final String value;
  final List<String> items;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: onChanged,
      color: _kBg,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: _kBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: _kTextPrimary,
            ),
          ),
          const SizedBox(width: 6),
          const Icon(Icons.keyboard_arrow_down_rounded, size: 18),
        ],
      ),
      itemBuilder: (context) => items.map((item) {
        final isSelected = item == value;

        return PopupMenuItem<String>(
          value: item,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ),
              if (isSelected) const Icon(Icons.check, size: 18),
            ],
          ),
        );
      }).toList(),
    );
  }
}
