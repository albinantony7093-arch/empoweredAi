// import 'dart:developer';

// import 'package:empowered_ai/src/presentation/screens/landing/widgets/calm_reset_widget.dart';
// import 'package:empowered_ai/src/presentation/screens/landing/widgets/choose_your_path.dart';
// import 'package:empowered_ai/src/presentation/screens/landing/widgets/empoweredworks.dart';
// import 'package:empowered_ai/src/presentation/screens/landing/widgets/free_diagonostic_test.dart';
// import 'package:empowered_ai/src/presentation/screens/landing/widgets/hero_section.dart';
// import 'package:empowered_ai/src/presentation/screens/landing/widgets/intelligent_learning.dart';
// import 'package:empowered_ai/src/presentation/screens/landing/widgets/navbar.dart';
// import 'package:empowered_ai/src/presentation/screens/landing/widgets/performancepicturesection.dart';
// import 'package:empowered_ai/src/presentation/screens/landing/widgets/real_student_section.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class LandingPage extends StatelessWidget {
//   LandingPage({super.key});

//   final Color navy = const Color(0xff1F2E4A);

//   /// Scroll Controller
//   final ScrollController scrollController = ScrollController();

//   /// Section Keys
//   final howItWorksKey = GlobalKey();
//   final aiEngineKey = GlobalKey();
//   final calmKey = GlobalKey();
//   final programsKey = GlobalKey();
//   final coursesKey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: navy,
//       body: ListView(
//         controller: scrollController,
//         children: [
//           ResponsiveNavBar(
//             scrollController: scrollController,
//             howItWorksKey: howItWorksKey,
//             aiEngineKey: aiEngineKey,
//             calmKey: calmKey,
//             programsKey: programsKey,
//             coursesKey: coursesKey,
//           ),

//           HeroSection(),

//           _Strip(),

//           Container(
//             key: howItWorksKey,
//             child: const HowEmpoweredWorksSection(),
//           ),

//           const StartDiagnosticSection(),
//           const PerformancePictureSection(),
//           Container(key: calmKey, child: CalmResetWidget()),
//           Container(key: aiEngineKey, child: IntelligentLearningSection()),
//           Container(key: programsKey, child: const ChooseYourPathSection()),
//           Container(key: coursesKey, child: const RealStudentsSection()),
//         ],
//       ),
//     );
//   }

//   Widget _Strip() {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       color: Colors.white,
//       child: Center(child: Text("Strip Section", style: GoogleFonts.outfit())),
//     );
//   }
// }

import 'package:empowered_ai/src/presentation/screens/landing/widgets/calm_reset_widget.dart';
import 'package:empowered_ai/src/presentation/screens/landing/widgets/choose_your_path.dart';
import 'package:empowered_ai/src/presentation/screens/landing/widgets/empoweredworks.dart';
import 'package:empowered_ai/src/presentation/screens/landing/widgets/free_diagonostic_test.dart';
import 'package:empowered_ai/src/presentation/screens/landing/widgets/hero_section.dart';
import 'package:empowered_ai/src/presentation/screens/landing/widgets/intelligent_learning.dart';
import 'package:empowered_ai/src/presentation/screens/landing/widgets/navbar.dart';
import 'package:empowered_ai/src/presentation/screens/landing/widgets/performancepicturesection.dart';
import 'package:empowered_ai/src/presentation/screens/landing/widgets/real_student_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatelessWidget {
  LandingPage({super.key});

  final Color navy = const Color(0xff1F2E4A);

  /// Scroll Controller
  final ScrollController scrollController = ScrollController();

  /// Section Keys
  final howItWorksKey = GlobalKey();
  final aiEngineKey = GlobalKey();
  final calmKey = GlobalKey();
  final programsKey = GlobalKey();
  final coursesKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: navy,
      body: Column(
        children: [
          /// Sticky Navbar
          ResponsiveNavBar(
            scrollController: scrollController,
            howItWorksKey: howItWorksKey,
            aiEngineKey: aiEngineKey,
            calmKey: calmKey,
            programsKey: programsKey,
            coursesKey: coursesKey,
          ),

          /// Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  HeroSection(),

                  _Strip(),

                  Container(
                    key: howItWorksKey,
                    child: const HowEmpoweredWorksSection(),
                  ),

                  const StartDiagnosticSection(),

                  const PerformancePictureSection(),

                  Container(key: calmKey, child: const CalmResetWidget()),

                  Container(
                    key: aiEngineKey,
                    child: IntelligentLearningSection(),
                  ),

                  Container(
                    key: programsKey,
                    child: const ChooseYourPathSection(),
                  ),

                  Container(
                    key: coursesKey,
                    child: const RealStudentsSection(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _Strip() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Center(child: Text("Strip Section", style: GoogleFonts.outfit())),
    );
  }
}
