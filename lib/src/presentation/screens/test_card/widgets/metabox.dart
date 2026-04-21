import 'package:flutter/material.dart';

class MetaBox extends StatelessWidget {
  final String label;
  final String value;

  const MetaBox({required this.label, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xfffafafa),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xffe5e7eb)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 11, color: Color(0xff9ca3af)),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
