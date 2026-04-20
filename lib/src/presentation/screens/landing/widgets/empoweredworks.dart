import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HowEmpoweredWorksSection extends StatelessWidget {
  const HowEmpoweredWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        int crossAxisCount = 4;
        double horizontalPadding = 60;
        double titleSize = 42;

        if (width < 1200) {
          crossAxisCount = 2;
          horizontalPadding = 40;
          titleSize = 34;
        }

        if (width < 700) {
          crossAxisCount = 1;
          horizontalPadding = 20;
          titleSize = 28;
        }

        final isMobile = width < 700;

        return Container(
          color: const Color(0xffF7F7F7),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: isMobile ? 40 : 80,
          ),
          child: Column(
            children: [
              /// TITLE
              Text(
                "THE SYSTEM",
                style: GoogleFonts.dmMono(
                  letterSpacing: 3,
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                "How EmpowerED Works",
                textAlign: TextAlign.center,
                style: GoogleFonts.playfairDisplay(
                  fontSize: titleSize,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff1F2E4A),
                ),
              ),

              const SizedBox(height: 12),

              Text(
                "One guided journey. Four purposeful steps. Built for serious NEET aspirants.",
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  color: Colors.black54,
                  fontSize: isMobile ? 14 : 16,
                ),
              ),

              SizedBox(height: isMobile ? 40 : 70),

              /// STEPS
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: isMobile ? 10 : 20,
                  mainAxisSpacing: isMobile ? 12 : 20,
                  childAspectRatio: isMobile ? 1.6 : 0.85,
                ),
                itemBuilder: (context, index) {
                  return _step(index: index, isMobile: isMobile);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _step({required int index, required bool isMobile}) {
    final steps = [
      (
        "1",
        const Color(0xff243A5E),
        "📋",
        "Take the Test",
        "15-minute free diagnostic. Covers all NEET subjects. Benchmarks your current level accurately.",
        "FREE • 15 MIN",
      ),
      (
        "2",
        const Color(0xffE63946),
        "📊",
        "See Your Rank",
        "Instant rank, percentile, subject-wise breakdown, and AI-identified weak areas — in real time.",
        "INSTANT RESULTS",
      ),
      (
        "3",
        const Color(0xff2AA876),
        "🌿",
        "Reset Your Mind",
        "Calm Corner activates automatically after each test. 2-minute breathing or frequency session.",
        "CALM CORNER",
      ),
      (
        "4",
        const Color(0xff3A86FF),
        "🚀",
        "Improve with AI",
        "AI-curated study path, targeted courses, and intelligent feedback — focused exactly on your weak areas.",
        "AI + COURSES",
      ),
    ];

    final item = steps[index];

    return Column(
      children: [
        /// NUMBER CIRCLE
        Container(
          width: isMobile ? 55 : 70,
          height: isMobile ? 55 : 70,
          decoration: BoxDecoration(
            color: item.$2,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: item.$2.withOpacity(.3), blurRadius: 20),
            ],
          ),
          child: Center(
            child: Text(
              item.$1,
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: isMobile ? 18 : 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),

        SizedBox(height: isMobile ? 10 : 30),

        /// ICON
        Text(item.$3, style: TextStyle(fontSize: isMobile ? 22 : 26)),

        SizedBox(height: isMobile ? 6 : 16),

        /// TITLE
        Text(
          item.$4,
          textAlign: TextAlign.center,
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.w600,
            fontSize: isMobile ? 15 : 16,
            color: const Color(0xff1F2E4A),
          ),
        ),

        SizedBox(height: isMobile ? 5 : 10),

        /// DESCRIPTION
        Text(
          item.$5,
          textAlign: TextAlign.center,
          style: GoogleFonts.outfit(
            color: Colors.black54,
            height: 1.5,
            fontSize: isMobile ? 13 : 14,
          ),
        ),

        SizedBox(height: isMobile ? 8 : 16),

        /// TAG
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 10 : 14,
            vertical: isMobile ? 5 : 6,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            item.$6,
            style: GoogleFonts.dmMono(
              fontSize: isMobile ? 10 : 11,
              letterSpacing: 1,
            ),
          ),
        ),
      ],
    );
  }
}
