import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _kCardBg = Color(0xFFFFFFFF);
const _kCardBorder = Color(0xFFE5E7EB);
const _kSurface = Color(0xFFF3F4F6);
const _kAccent = Color(0xFFE8303A);
const _kTextPrimary = Color(0xFF1B2A4A);
const _kTextMuted = Color(0xFF6B7280);
const _kStrong = Color(0xFF4CAF82);

class PerformanceCard extends StatelessWidget {
  const PerformanceCard({
    super.key,
    required this.score,
    required this.rank,
    required this.percentile,
    required this.statusLabel,
    required this.insightText,
  });

  final String score;
  final String rank;
  final String percentile;
  final String statusLabel;
  final String insightText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      decoration: BoxDecoration(
        color: _kCardBg,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          // BoxShadow(
          //   color: Colors.black.withOpacity(0.06),
          //   blurRadius: 20,
          //   offset: const Offset(0, 4),
          // ),
          // BoxShadow(
          //   color: Colors.black.withOpacity(0.04),
          //   blurRadius: 6,
          //   offset: const Offset(0, 1),
          // ),

          // soft ambient
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 24,
            spreadRadius: -4,
            offset: const Offset(0, 10),
          ),

          // sharp depth (edge definition)
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          ),

          // subtle top highlight (premium feel)
          BoxShadow(
            color: Colors.white.withOpacity(0.9),
            blurRadius: 6,
            spreadRadius: -2,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "LAST TEST PERFORMANCE",
              style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.5,
                color: _kTextMuted,
              ),
            ),

            const SizedBox(height: 18),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: _kSurface,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: _kCardBorder),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _MetricCell(value: score, label: "Score"),
                  ),
                  const _VertDivider(),
                  Expanded(
                    child: _MetricCell(value: rank, label: "Rank"),
                  ),
                  const _VertDivider(),
                  Expanded(
                    child: _MetricCell(value: percentile, label: "Percentile"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _kStrong.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: _kStrong.withOpacity(0.3)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(
                      color: _kStrong,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    statusLabel,
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: _kStrong,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: _kAccent.withOpacity(0.04),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: _kAccent.withOpacity(0.15)),
                boxShadow: [
                  BoxShadow(
                    color: _kAccent.withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 3,
                    height: 44,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: _kAccent,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      insightText,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        height: 1.6,
                        color: _kTextMuted,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricCell extends StatelessWidget {
  const _MetricCell({required this.value, required this.label});
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: _kTextPrimary,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 11,
            color: _kTextMuted,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _VertDivider extends StatelessWidget {
  const _VertDivider();

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 44, color: _kCardBorder);
  }
}
