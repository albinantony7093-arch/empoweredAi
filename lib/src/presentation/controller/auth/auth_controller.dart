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

  var isOtpStep = false.obs;

  /// TEMP STORE USER DATA DURING OTP FLOW
  String tempName = "";
  String tempEmail = "";
  String tempMobile = "";
  String tempPassword = "";

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

  void requestOtp({
    required String name,
    required String email,
    required String mobile,
    required String password,
  }) async {
    try {
      isLoading.value = true;

      final res = await _authrepo.sendOtp(
        fullName: name,
        email: email,
        passwrd: password,
      );

      res.fold(
        (l) {
          isLoading.value = false;
        },
        (R) {
          isOtpStep.value = true;
        },
      );
    } catch (e) {
      log("💥 Error in registeruser():$e");
    } finally {
      isLoading.value = false;
    }
  }

  void verifyOtp({required String otp, required String email}) async {
    try {
      isLoading.value = true;
      final res = await _authrepo.verifyOtp(email: email, otp: otp);
      res.fold((l) {}, (R) async {
        await StorageService.saveTokens(
          accessToken: R['accessToken'],
          refreshToken: R['refreshToken'],
        );

        Get.offAll(() => HomeScreen());
      });
    } catch (e) {
      log("💥 Error in verifyOtp():$e");
    } finally {
      isLoading.value = false;
    }
  }

  void forgotpassword({required String email}) {
    log("called");
  }

  void switchTab(bool value) {
    isLogin.value = value;
  }
}
