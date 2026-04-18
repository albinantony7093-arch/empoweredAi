import 'dart:developer';

import 'package:empowered_ai/src/data/services/storage_services/storage_services.dart';
import 'package:empowered_ai/src/presentation/screens/auth/auth.dart';
import 'package:empowered_ai/src/presentation/screens/home/home_screen.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class Onboardingcontroller extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checkToken();
  }

  Future<void> checkToken() async {
    try {
      final token = await StorageService.getAccessToken();
      if (token != null) {
        Get.to(() => HomeScreen());
      } else {
        Get.to(() => Auth());
      }
    } catch (e) {
      log("💥Error in checkToken():$e");
    }
  }

  void logout() {
    Get.offAll(() => Auth());
  }
}
