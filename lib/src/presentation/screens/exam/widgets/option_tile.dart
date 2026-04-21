// import 'dart:developer';

// import 'package:empowered_ai/src/core/config/theme/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class OptionTile extends StatelessWidget {
//   const OptionTile({
//     super.key,
//     required this.optionKey,
//     required this.optionValue,
//     required this.isSelected,
//     required this.groupValue,
//     required this.onSelect,
//   });

//   final String optionKey;
//   final String optionValue;
//   final bool isSelected;
//   final String? groupValue;
//   final Function(String) onSelect;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         HapticFeedback.selectionClick();
//         onSelect(optionKey);
//       },
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 180),
//         margin: const EdgeInsets.only(bottom: 10),
//         padding: const EdgeInsets.all(14),
//         decoration: BoxDecoration(
//           color: isSelected ? AppColor.accentBg : AppColor.surface,
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(
//             color: isSelected ? AppColor.accentBorder : AppColor.border,
//             width: isSelected ? 1.4 : 1,
//           ),
//         ),
//         child: Row(
//           children: [
//             /// Radio
//             AnimatedContainer(
//               duration: const Duration(milliseconds: 160),
//               width: 20,
//               height: 20,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: isSelected ? AppColor.accent : Colors.transparent,
//                 border: Border.all(
//                   color: isSelected ? AppColor.accent : AppColor.borderStrong,
//                   width: 1.6,
//                 ),
//               ),
//               child: isSelected
//                   ? const Center(
//                       child: Icon(Icons.circle, size: 7, color: Colors.white),
//                     )
//                   : null,
//             ),

//             const SizedBox(width: 14),

//             /// Option Letter
//             Container(
//               width: 26,
//               height: 26,
//               decoration: BoxDecoration(
//                 color: isSelected
//                     ? AppColor.accent.withOpacity(.12)
//                     : AppColor.bg,
//                 borderRadius: BorderRadius.circular(7),
//               ),
//               child: Center(
//                 child: Text(
//                   optionKey,
//                   style: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.w700,
//                     color: isSelected ? AppColor.accent : AppColor.inkMid,
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(width: 12),

//             /// Text
//             Expanded(
//               child: Text(
//                 optionValue.toString(),
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: isSelected ? AppColor.ink : AppColor.inkMid,
//                   fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:empowered_ai/src/core/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OptionTile extends StatelessWidget {
  const OptionTile({
    super.key,
    required this.optionKey,
    required this.optionValue,
    required this.isSelected,
    required this.groupValue,
    required this.onSelect,
  });

  final String optionKey;
  final String optionValue;
  final bool isSelected;
  final String? groupValue;
  final Function(String) onSelect;

  static const touchColor = Color(0xffe0243a);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        onSelect(optionKey);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected
              ? touchColor.withOpacity(.08) // 👈 touch bg
              : AppColor.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? touchColor.withOpacity(.35) // 👈 border
                : AppColor.border,
            width: isSelected ? 1.4 : 1,
          ),
        ),
        child: Row(
          children: [
            /// Radio
            AnimatedContainer(
              duration: const Duration(milliseconds: 160),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? touchColor : Colors.transparent,
                border: Border.all(
                  color: isSelected ? touchColor : AppColor.borderStrong,
                  width: 1.6,
                ),
              ),
              child: isSelected
                  ? const Center(
                      child: Icon(Icons.circle, size: 7, color: Colors.white),
                    )
                  : null,
            ),

            const SizedBox(width: 14),

            /// Option Letter
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: isSelected ? touchColor.withOpacity(.12) : AppColor.bg,
                borderRadius: BorderRadius.circular(7),
              ),
              child: Center(
                child: Text(
                  optionKey,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: isSelected ? touchColor : AppColor.inkMid,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 12),

            /// Text
            Expanded(
              child: Text(
                optionValue.toString(),
                style: TextStyle(
                  fontSize: 14,
                  color: isSelected ? AppColor.ink : AppColor.inkMid,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
