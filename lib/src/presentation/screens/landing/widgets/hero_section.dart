// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class HeroSection extends StatelessWidget {
//   final VoidCallback? onStartDiagnostic;
//   final VoidCallback? onSeeHowWorks;

//   const HeroSection({super.key, this.onStartDiagnostic, this.onSeeHowWorks});

//   final Color navy = const Color(0xff1F2E4A);
//   final Color red = const Color(0xffE63946);
//   final Color green = const Color(0xff00D084);

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final width = constraints.maxWidth;

//         final isMobile = width < 768;
//         final isTablet = width >= 768 && width < 1100;
//         final isDesktop = width >= 1100;

//         return Container(
//           padding: EdgeInsets.symmetric(
//             horizontal: isMobile
//                 ? 20
//                 : isTablet
//                 ? 40
//                 : 60,
//             vertical: isMobile ? 40 : 60,
//           ),
//           child: isMobile
//               ? Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _leftContent(isMobile, isTablet, isDesktop),
//                     const SizedBox(height: 40),
//                     _rightContent(),
//                   ],
//                 )
//               : Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       flex: 6,
//                       child: _leftContent(isMobile, isTablet, isDesktop),
//                     ),
//                     const SizedBox(width: 40),
//                     Expanded(flex: 4, child: _rightContent()),
//                   ],
//                 ),
//         );
//       },
//     );
//   }

//   Widget _leftContent(bool isMobile, bool isTablet, bool isDesktop) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         /// TAG
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//           decoration: BoxDecoration(
//             color: Colors.green.withOpacity(.2),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Text(
//             "AI PERFORMANCE + MIND + RANK PLATFORM",
//             style: GoogleFonts.dmMono(
//               color: green,
//               fontSize: isMobile ? 10 : 12,
//             ),
//           ),
//         ),

//         const SizedBox(height: 20),

//         /// TITLE
//         RichText(
//           text: TextSpan(
//             style: GoogleFonts.playfairDisplay(
//               fontSize: isMobile
//                   ? 28
//                   : isTablet
//                   ? 36
//                   : 48,
//               fontWeight: FontWeight.w700,
//               color: Colors.white,
//               height: 1.2,
//             ),
//             children: [
//               const TextSpan(text: "Your NEET Rank Improves When Your\n"),
//               TextSpan(
//                 text: "Mind ",
//                 style: TextStyle(color: red),
//               ),
//               const TextSpan(text: "and Strategy Work Together"),
//             ],
//           ),
//         ),

//         const SizedBox(height: 20),

//         /// DESCRIPTION
//         Text(
//           "Take a diagnostic test, identify your weak areas, reset your focus with our Calm Corner, and improve your rank with AI-guided learning.",
//           style: GoogleFonts.outfit(
//             color: Colors.white70,
//             height: 1.6,
//             fontSize: isMobile ? 14 : 16,
//           ),
//         ),

//         const SizedBox(height: 30),

//         /// BUTTONS
//         Wrap(
//           spacing: 16,
//           runSpacing: 12,
//           children: [
//             GestureDetector(
//               onTap:
//                   onStartDiagnostic ??
//                   () {
//                     log("Start Diagnostic");
//                   },
//               child: Container(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: isMobile ? 20 : 26,
//                   vertical: isMobile ? 14 : 16,
//                 ),
//                 decoration: BoxDecoration(
//                   color: red,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Text(
//                   "Start Free Diagnostic Test →",
//                   style: GoogleFonts.outfit(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                     fontSize: isMobile ? 14 : 16,
//                   ),
//                 ),
//               ),
//             ),

//             GestureDetector(
//               onTap:
//                   onSeeHowWorks ??
//                   () {
//                     log("See how works");
//                   },
//               child: Container(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: isMobile ? 20 : 26,
//                   vertical: isMobile ? 14 : 16,
//                 ),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.white30),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Text(
//                   "See How It Works →",
//                   style: GoogleFonts.outfit(
//                     color: Colors.white,
//                     fontSize: isMobile ? 14 : 16,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _rightContent() {
//     return Column(
//       children: [
//         Row(
//           children: [
//             _statCard("12K+", "Students"),
//             const SizedBox(width: 12),
//             _statCard("94%", "Pass Rate"),
//             const SizedBox(width: 12),
//             _statCard("4-Step", "System"),
//           ],
//         ),

//         const SizedBox(height: 20),

//         _featureCard(
//           "Diagnostic → Rank → Calm → Improve",
//           "One guided journey from test to result",
//         ),

//         const SizedBox(height: 16),

//         _featureCard("Calm Corner — Built In", "Reset your mind in 2 min"),

//         const SizedBox(height: 16),

//         _featureCard("AI Tutor + Weak Area Engine", "Adaptive learning"),
//       ],
//     );
//   }

//   Widget _statCard(String value, String label) {
//     return Expanded(
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white.withOpacity(.08),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Column(
//           children: [
//             Text(
//               value,
//               style: GoogleFonts.outfit(
//                 color: Colors.white,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//             const SizedBox(height: 5),
//             Text(
//               label,
//               style: GoogleFonts.outfit(color: Colors.white70, fontSize: 13),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _featureCard(String title, String subtitle) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(18),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(.08),
//         borderRadius: BorderRadius.circular(14),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 40,
//             height: 40,
//             decoration: BoxDecoration(
//               color: Colors.white.withOpacity(.1),
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: GoogleFonts.outfit(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 Text(
//                   subtitle,
//                   style: GoogleFonts.outfit(color: Colors.white70),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback? onStartDiagnostic;
  final VoidCallback? onSeeHowWorks;

  const HeroSection({super.key, this.onStartDiagnostic, this.onSeeHowWorks});

  final Color navy = const Color(0xff1F2E4A);
  final Color red = const Color(0xffE63946);
  final Color green = const Color(0xff00D084);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        final isMobile = width < 900;

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 60,
            vertical: isMobile ? 40 : 60,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// LEFT CONTENT
              Expanded(flex: 6, child: _leftContent(isMobile)),

              /// RIGHT CONTENT (Only if enough space)
              if (!isMobile) ...[
                const SizedBox(width: 40),
                Expanded(flex: 4, child: _rightContent()),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _leftContent(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// TAG
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "AI PERFORMANCE + MIND + RANK PLATFORM",
            style: GoogleFonts.dmMono(
              color: green,
              fontSize: isMobile ? 10 : 12,
            ),
          ),
        ),

        const SizedBox(height: 20),

        /// TITLE
        RichText(
          text: TextSpan(
            style: GoogleFonts.playfairDisplay(
              fontSize: isMobile ? 28 : 48,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              height: 1.2,
            ),
            children: [
              const TextSpan(text: "Your NEET Rank Improves When Your\n"),
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
            fontSize: isMobile ? 14 : 16,
          ),
        ),

        const SizedBox(height: 30),

        /// BUTTONS
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            GestureDetector(
              onTap:
                  onStartDiagnostic ??
                  () {
                    log("Start Diagnostic");
                  },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 20 : 26,
                  vertical: isMobile ? 14 : 16,
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

            GestureDetector(
              onTap:
                  onSeeHowWorks ??
                  () {
                    log("See how works");
                  },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 20 : 26,
                  vertical: isMobile ? 14 : 16,
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
    );
  }

  Widget _rightContent() {
    return Column(
      children: [
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

        _featureCard("Calm Corner — Built In", "Reset your mind in 2 min"),

        const SizedBox(height: 16),

        _featureCard("AI Tutor + Weak Area Engine", "Adaptive learning"),
      ],
    );
  }

  Widget _statCard(String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
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
                fontSize: 18,
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
      width: double.infinity,
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.outfit(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
