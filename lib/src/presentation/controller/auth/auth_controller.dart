import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  var isLogin = true.obs;

  Future<void> loginUser() async {
    try {} catch (e) {
      Fluttertoast.showToast(msg: "something went wrong");
    } finally {
      isLoading.value = false;
    }
  }

  void switchTab(bool value) {
    isLogin.value = value;
  }
}
