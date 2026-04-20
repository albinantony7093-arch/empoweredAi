import 'package:empowered_ai/src/presentation/screens/home_test/widgets/exam_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_test/hometestcontroller.dart';

class HomeTestPage extends StatelessWidget {
  HomeTestPage({super.key});

  final HomeTestController controller = Get.put(HomeTestController());

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.06, end: 0),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
      builder: (context, offset, child) {
        return TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeOut,
          builder: (context, opacity, child) {
            return Opacity(
              opacity: opacity,
              child: Transform.translate(
                offset: Offset(0, offset * MediaQuery.of(context).size.height),
                child: child,
              ),
            );
          },
          child: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                double w = constraints.maxWidth;
                double hPad = w > 900 ? ((w - 720) / 2) : 20.0;

                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.fromLTRB(hPad, 28, hPad, 40),

                  child: ExamCard(),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
