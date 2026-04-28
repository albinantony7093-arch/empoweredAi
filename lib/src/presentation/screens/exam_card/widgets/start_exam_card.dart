import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _kAccent = Color(0xFFE8303A);
const _kTextPrimary = Color(0xFF1B2A4A);
const _kTextMuted = Color(0xFF6B7280);
const _kBorder = Color(0xFFE5E7EB);

class StartExamCard extends StatelessWidget {
  const StartExamCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.meta,
    required this.onStart,
    required String description,
    required List<String> points,
  });

  final String title;
  final String subtitle;
  final List<String> meta;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      padding: const EdgeInsets.all(22),
      constraints: const BoxConstraints(maxWidth: 500),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _kBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 30,
            spreadRadius: -6,
            offset: const Offset(0, 12),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔥 TOP ROW
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// TITLE
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        fontSize: isMobile ? 18 : 20,
                        fontWeight: FontWeight.w700,
                        color: _kTextPrimary,
                        letterSpacing: -0.2,
                      ),
                    ),

                    const SizedBox(height: 6),

                    /// SUBTITLE
                    Text(
                      subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                        fontSize: 13.5,
                        height: 1.6,
                        color: _kTextMuted,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 12),

              /// CTA BUTTON
              SizedBox(
                height: 44,
                child: ElevatedButton(
                  onPressed: onStart,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _kAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    "Start",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 13.5,
                      color: Colors.white,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// META CHIPS
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: meta
                .map(
                  (e) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFFF3F4F6),
                    ),
                    child: Text(
                      e,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: _kTextMuted,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
