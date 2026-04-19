import 'dart:developer';

import 'package:empowered_ai/src/data/services/storage_services/storage_services.dart';
import 'package:empowered_ai/src/presentation/screens/auth/auth.dart';
import 'package:empowered_ai/src/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class LandingPageController extends GetxController {
  var selectedTab = 0.obs;
  RxnString token = RxnString();

  void changeTab(int index) {
    selectedTab.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      navigate();
    });
  }

  Future<void> navigate() async {
    try {
      token.value = await StorageService.getAccessToken();
      if (token.value != null) {
        Get.offAll(() => HomeScreen());
      }
    } catch (e) {
      log("💥 Error in navigate():$e");
    }
  }

  void scrollToSection(GlobalKey key) {
    try {
      final context = key.currentContext;

      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      } else {
        log("scroll get's null");
      }
    } catch (e) {
      log("💥 Error in scrollToSection():$e");
    }
  }

  void logout() {
    Get.offAll(() => Auth());
  }
}
