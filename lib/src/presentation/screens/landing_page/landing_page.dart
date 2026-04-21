import 'package:empowered_ai/src/presentation/controller/onBoardingcontroller/onBoardingcontroller.dart';
import 'package:empowered_ai/src/presentation/screens/landing_page/widgets/calm_reset_widget.dart';
import 'package:empowered_ai/src/presentation/screens/landing_page/widgets/choose_your_path.dart';
import 'package:empowered_ai/src/presentation/screens/landing_page/widgets/empoweredworks.dart';
import 'package:empowered_ai/src/presentation/screens/landing_page/widgets/feature_strip_widget.dart';
import 'package:empowered_ai/src/presentation/screens/landing_page/widgets/footer.dart';
import 'package:empowered_ai/src/presentation/screens/landing_page/widgets/free_diagonostic_test.dart';
import 'package:empowered_ai/src/presentation/screens/landing_page/widgets/hero_section.dart';
import 'package:empowered_ai/src/presentation/screens/landing_page/widgets/improvementwidget.dart';
import 'package:empowered_ai/src/presentation/screens/landing_page/widgets/intelligent_learning.dart';
import 'package:empowered_ai/src/presentation/screens/landing_page/widgets/navbar.dart';
import 'package:empowered_ai/src/presentation/screens/landing_page/widgets/performancepicturesection.dart';
import 'package:empowered_ai/src/presentation/screens/landing_page/widgets/real_student_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPage extends StatelessWidget {
  LandingPage({super.key});

  final Color navy = const Color(0xff1F2E4A);

  final ScrollController scrollController = ScrollController();

  final howItWorksKey = GlobalKey();
  final aiEngineKey = GlobalKey();
  final calmKey = GlobalKey();
  final programsKey = GlobalKey();
  final coursesKey = GlobalKey();
  final diagonoticsectionKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(LandingPageController());

    return Scaffold(
      backgroundColor: navy,
      body: Column(
        children: [
          ResponsiveNavBar(
            scrollController: scrollController,
            howItWorksKey: howItWorksKey,
            aiEngineKey: aiEngineKey,
            calmKey: calmKey,
            programsKey: programsKey,
            coursesKey: coursesKey,
          ),

          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  HeroSection(
                    onStartDiagnostic: () =>
                        ctrl.scrollToSection(diagonoticsectionKey),
                    onSeeHowWorks: () => ctrl.scrollToSection(howItWorksKey),
                  ),

                  FeatureStrip(),

                  Container(
                    key: howItWorksKey,
                    child: const HowEmpoweredWorksSection(),
                  ),

                  Container(
                    key: diagonoticsectionKey,
                    child: const StartDiagnosticSection(),
                  ),

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

                  ImprovementJourneyHero(),

                  EmpoweredFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
