import 'dart:developer';

import 'package:empowered_ai/src/data/repositories/Auth/auth_repoImpl.dart';
import 'package:empowered_ai/src/data/services/storage_services/storage_services.dart';
import 'package:empowered_ai/src/domain/repositories/AuthRepo/auth_repo.dart';
import 'package:empowered_ai/src/presentation/screens/home/home_screen.dart';

import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepo _authrepo = AuthRepoImpl();

  var isLoading = false.obs;
  var isLogin = true.obs;

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        return;
      }
      isLoading.value = true;

      final res = await _authrepo.login(email: email, passwd: password);

      res.fold(
        (l) {
          log(
            "failed in response left l.msg:${l.message} statuscode :${l.code}",
          );
        },
        (R) async {
          log("success in response right");
          await StorageService.saveTokens(accessToken: R['access_token']);
          Get.offAll(() => HomeScreen());
        },
      );
    } catch (e) {
      log("error:$e");
    } finally {
      isLoading.value = false;
    }
  }

  void registeruser({
    required String name,
    required String email,
    required String mobile,
    required String password,
  }) {}

  void switchTab(bool value) {
    isLogin.value = value;
  }
}
