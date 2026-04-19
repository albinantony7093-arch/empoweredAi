import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartDiagnosticSection extends StatelessWidget {
  final VoidCallback? onStartPressed;

  const StartDiagnosticSection({super.key, this.onStartPressed});

  static const Color navy = Color(0xff1F2E4A);
  static const Color red = Color(0xffE63946);
  static const Color green = Color(0xff00D084);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = width < 700;
        final isTablet = width >= 700 && width < 1100;

        final horizontalPadding = isMobile
            ? 24.0
            : isTablet
            ? 40.0
            : 80.0;
        final verticalPadding = isMobile ? 48.0 : 80.0;
        final titleSize = isMobile
            ? 32.0
            : isTablet
            ? 38.0
            : 48.0;

        return Container(
          width: double.infinity,
          color: const Color(0xff162A4A),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: isMobile
              ? _mobileLayout(titleSize)
              : _desktopLayout(titleSize, isTablet),
        );
      },
    );
  }

  /// ── DESKTOP / TABLET ──────────────────────────────────────────────────────
  Widget _desktopLayout(double titleSize, bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: _leftContent(titleSize: titleSize, isMobile: false),
        ),
        SizedBox(width: isTablet ? 32 : 60),
        Expanded(flex: 5, child: _resultCard()),
      ],
    );
  }

  /// ── MOBILE ────────────────────────────────────────────────────────────────
  Widget _mobileLayout(double titleSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _leftContent(titleSize: titleSize, isMobile: true),
        const SizedBox(height: 40),
        _resultCard(),
      ],
    );
  }

  /// ── LEFT CONTENT ──────────────────────────────────────────────────────────
  Widget _leftContent({required double titleSize, required bool isMobile}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// TAG
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(.15),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "FREE • NO SIGNUP REQUIRED",
            style: GoogleFonts.dmMono(
              color: Colors.greenAccent,
              fontSize: 11,
              letterSpacing: 1,
            ),
          ),
        ),

        const SizedBox(height: 20),

        /// TITLE
        Text(
          "Start with a Free\nDiagnostic Test",
          style: GoogleFonts.playfairDisplay(
            color: Colors.white,
            fontSize: titleSize,
            fontWeight: FontWeight.w700,
          ),
        ),

        const SizedBox(height: 20),

        /// DESCRIPTION
        Text(
          "Understand your current NEET level in 15 minutes. Get a real rank estimate, subject-by-subject analysis, and an AI-generated improvement plan — immediately.",
          style: GoogleFonts.outfit(
            color: Colors.white70,
            height: 1.6,
            fontSize: isMobile ? 14 : 16,
          ),
        ),

        const SizedBox(height: 30),

        /// FEATURES
        _feature("📋", "Full-length adaptive NEET question set", isMobile),
        _feature("📊", "Rank estimate + percentile in real time", isMobile),
        _feature("🧠", "AI identifies your exact weak chapters", isMobile),
        _feature("🌿", "Calm Corner resets your mind after the test", isMobile),

        const SizedBox(height: 40),

        /// BUTTON
        GestureDetector(
          onTap: onStartPressed,
          child: Container(
            width: isMobile ? double.infinity : null,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 28,
              vertical: 18,
            ),
            decoration: BoxDecoration(
              color: red,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(color: red.withOpacity(.4), blurRadius: 20),
              ],
            ),
            child: Row(
              mainAxisSize: isMobile ? MainAxisSize.max : MainAxisSize.min,
              mainAxisAlignment: isMobile
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                const Icon(Icons.circle, size: 10, color: Colors.white),
                const SizedBox(width: 12),
                Text(
                  "Start Free Diagnostic Test →",
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: isMobile ? 15 : 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _feature(String icon, String text, bool isMobile) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Container(
            width: isMobile ? 36 : 40,
            height: isMobile ? 36 : 40,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(icon, style: TextStyle(fontSize: isMobile ? 16 : 18)),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.outfit(
                color: Colors.white70,
                fontSize: isMobile ? 13 : 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _resultCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.05),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "// LIVE RESULT PREVIEW",
            style: GoogleFonts.dmMono(color: Colors.white54, fontSize: 12),
          ),

          const SizedBox(height: 20),

          _progress("Biology", 0.82, Colors.greenAccent),
          _progress("Chemistry", 0.61, Colors.orange),
          _progress("Physics", 0.45, Colors.redAccent),

          const SizedBox(height: 20),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.teal.withOpacity(.2),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ESTIMATED RANK",
                  style: GoogleFonts.dmMono(
                    color: Colors.white54,
                    fontSize: 11,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  "AIR 4,820",
                  style: GoogleFonts.outfit(
                    color: Colors.greenAccent,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  "Top 28% • Improvement plan ready",
                  style: GoogleFonts.outfit(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _progress(String title, double value, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: GoogleFonts.outfit(color: Colors.white)),
              Text(
                "${(value * 100).toInt()}%",
                style: GoogleFonts.outfit(color: Colors.white54),
              ),
            ],
          ),

          const SizedBox(height: 6),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: value,
              color: color,
              backgroundColor: Colors.white12,
              minHeight: 8,
            ),
          ),
        ],
      ),
    );
  }
}
