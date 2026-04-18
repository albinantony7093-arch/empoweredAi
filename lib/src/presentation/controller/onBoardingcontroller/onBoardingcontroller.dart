import 'package:empowered_ai/src/presentation/screens/auth/auth.dart';

import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class LandingPageController extends GetxController {
  var selectedTab = 0.obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  void logout() {
    Get.offAll(() => Auth());
  }
}
