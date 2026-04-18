import 'package:empowered_ai/src/presentation/controller/onBoardingcontroller/onBoardingcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Onboardingcontroller());

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff1A2B4A), Color(0xff2C3E68)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Logo Box
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.school,
                  color: Color(0xffD72638),
                  size: 50,
                ),
              ),

              const SizedBox(height: 24),

              /// App Name
              const Text(
                "EmpowerED",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              /// Tagline
              const Text(
                "Learn. Track. Improve.",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),

              const SizedBox(height: 40),

              /// Loader
              const CircularProgressIndicator(color: Color(0xffD72638)),
            ],
          ),
        ),
      ),
    );
  }
}
