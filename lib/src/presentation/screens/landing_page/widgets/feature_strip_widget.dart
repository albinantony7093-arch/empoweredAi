import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeatureStrip extends StatelessWidget {
  const FeatureStrip({super.key});

  static const List<FeatureItem> features = [
    FeatureItem(text: "Free Diagnostic Test"),
    FeatureItem(text: "AI-Powered Rank Engine"),
    FeatureItem(text: "Built-in Calm Corner"),
    FeatureItem(text: "AI + Real Performance Tracking"),
  ];

  static const FeatureItem academy = FeatureItem(
    text: "Red Cross Academy · Kottayam",
    isAcademy: true,
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 768;

        return Container(
          width: double.infinity,
          color: const Color(0xffF5F3F1),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 30,
                runSpacing: 12,
                children: features
                    .map(
                      (e) => SizedBox(
                        width: isMobile ? constraints.maxWidth / 2 - 30 : null,
                        child: _StripItem(item: e),
                      ),
                    )
                    .toList(),
              ),

              const SizedBox(height: 14),

              _StripItem(item: academy),
            ],
          ),
        );
      },
    );
  }
}

class FeatureItem {
  final String text;
  final bool isAcademy;

  const FeatureItem({required this.text, this.isAcademy = false});
}

class _StripItem extends StatelessWidget {
  final FeatureItem item;

  const _StripItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          item.isAcademy ? Icons.account_balance : Icons.check,
          size: 18,
          color: item.isAcademy ? Colors.grey : Colors.green,
        ),
        const SizedBox(width: 6),
        Flexible(
          child: Text(
            item.text,
            style: GoogleFonts.outfit(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
