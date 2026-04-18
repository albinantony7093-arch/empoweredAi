import 'dart:developer';

import 'package:empowered_ai/src/presentation/screens/home/widgets/calm_reset_widget.dart';
import 'package:empowered_ai/src/presentation/screens/home/widgets/choose_your_path.dart';
import 'package:empowered_ai/src/presentation/screens/home/widgets/empoweredworks.dart';
import 'package:empowered_ai/src/presentation/screens/home/widgets/free_diagonostic_test.dart';
import 'package:empowered_ai/src/presentation/screens/home/widgets/intelligent_learning.dart';
import 'package:empowered_ai/src/presentation/screens/home/widgets/navbar.dart';
import 'package:empowered_ai/src/presentation/screens/home/widgets/performancepicturesection.dart';
import 'package:empowered_ai/src/presentation/screens/home/widgets/real_student_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final Color navy = const Color(0xff1F2E4A);
  final Color red = const Color(0xffE63946);
  final Color green = const Color(0xff00D084);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: navy,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ResponsiveNavBar(),
            heroSection(),

            _Strip(),
            const HowEmpoweredWorksSection(),
            StartDiagnosticSection(),
            PerformancePictureSection(),
            CalmResetWidget(),
            IntelligentLearningSection(),
            ChooseYourPathSection(),
            RealStudentsSection(),
          ],
        ),
      ),
    );
  }

  Widget heroSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 60),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isSmall = constraints.maxWidth < 1100;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    /// TAG
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "AI PERFORMANCE + MIND + RANK PLATFORM",
                        style: GoogleFonts.dmMono(color: green, fontSize: 12),
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// TITLE
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.playfairDisplay(
                          fontSize: isSmall ? 34 : 48,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        children: [
                          const TextSpan(
                            text: "Your NEET Rank Improves When Your\n",
                          ),
                          TextSpan(
                            text: "Mind ",
                            style: TextStyle(color: red),
                          ),
                          const TextSpan(text: "and Strategy Work Together"),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// DESCRIPTION
                    Text(
                      "Take a diagnostic test, identify your weak areas, reset your focus with our Calm Corner, and improve your rank with AI-guided learning.",
                      style: GoogleFonts.outfit(
                        color: Colors.white70,
                        height: 1.6,
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// BUTTONS
                    Wrap(
                      spacing: 20,
                      runSpacing: 12,
                      children: [
                        /// Primary
                        GestureDetector(
                          onTap: () {
                            log("nav to diagonistic card2");
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 26,
                              vertical: 16,
                            ),
                            decoration: BoxDecoration(
                              color: red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "Start Free Diagnostic Test →",
                              style: GoogleFonts.outfit(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        /// Secondary
                        GestureDetector(
                          onTap: () {
                            log("empowered works");
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 26,
                              vertical: 16,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white30),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "See How It Works →",
                              style: GoogleFonts.outfit(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              /// RIGHT CARDS (Hide if small)
              if (!isSmall) ...[
                const SizedBox(width: 40),

                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// STATS
                      Row(
                        children: [
                          _statCard("12K+", "Students"),
                          const SizedBox(width: 12),
                          _statCard("94%", "Pass Rate"),
                          const SizedBox(width: 12),
                          _statCard("4-Step", "System"),
                        ],
                      ),

                      const SizedBox(height: 20),

                      _featureCard(
                        "Diagnostic → Rank → Calm → Improve",
                        "One guided journey from test to result",
                      ),

                      const SizedBox(height: 16),

                      _featureCard(
                        "Calm Corner — Built In",
                        "Reset your mind in 2 min",
                      ),

                      const SizedBox(height: 16),

                      _featureCard(
                        "AI Tutor + Weak Area Engine",
                        "Adaptive learning",
                      ),
                    ],
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }

  Widget _statCard(String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.08),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 5),

            Text(label, style: GoogleFonts.outfit(color: Colors.white70)),
          ],
        ),
      ),
    );
  }

  Widget _featureCard(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.08),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.1),
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const SizedBox(width: 16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),

              Text(subtitle, style: GoogleFonts.outfit(color: Colors.white70)),
            ],
          ),
        ],
      ),
    );
  }

  /// Bottom strip
  Widget _Strip() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          color: Colors.white,
          child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            spacing: 12,
            runSpacing: 10,
            children: [
              _bottomItem("Free Diagnostic Test"),
              _bottomItem("AI Powered Rank Engine"),
              _bottomItem("Built in Calm Corner"),
              _bottomItem("AI Tracking"),
            ],
          ),
        );
      },
    );
  }

  Widget _bottomItem(String text) {
    return Row(
      children: [
        const Icon(Icons.check, size: 18),
        const SizedBox(width: 6),
        Text(text, style: GoogleFonts.outfit()),
      ],
    );
  }
}
