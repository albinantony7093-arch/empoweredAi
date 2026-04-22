import 'dart:developer';

import 'package:empowered_ai/src/presentation/controller/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Auth extends StatelessWidget {
  Auth({super.key});

  final controller = Get.put(AuthController());

  /// Text Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();

  final Color red = const Color(0xffD72638);
  final Color navy = const Color(0xff1A2B4A);
  final Color gray = const Color(0xff6B7280);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff1A2B4A), Color(0xff2C3E68)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Container(
            width: 420,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(blurRadius: 60, color: Colors.black.withOpacity(.25)),
              ],
            ),
            child: Obx(
              () => Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  Text(
                    "Welcome to Empower",
                    style: GoogleFonts.outfit(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: navy,
                    ),
                  ),

                  const SizedBox(height: 6),

                  /// Subtitle
                  Text(
                    "Save your progress & track your rank improvement",
                    style: GoogleFonts.outfit(fontSize: 13, color: gray),
                  ),

                  const SizedBox(height: 20),

                  /// Tabs
                  Row(children: [_tab("Login", true), _tab("Register", false)]),

                  const SizedBox(height: 20),

                  /// Login Form
                  if (controller.isLogin.value) ...[
                    _input(
                      "Email or Mobile Number",
                      controller: emailController,
                    ),
                    const SizedBox(height: 12),

                    _input(
                      "Password",
                      controller: passwordController,
                      isPassword: true,
                    ),

                    const SizedBox(height: 18),

                    _button("Login"),
                  ]
                  /// Register Form
                  else ...[
                    _input("Full Name", controller: nameController),

                    const SizedBox(height: 12),

                    _input("Email", controller: emailController),

                    const SizedBox(height: 12),

                    _input("Mobile Number", controller: mobileController),

                    const SizedBox(height: 12),

                    _input(
                      "Password",
                      controller: passwordController,
                      isPassword: true,
                    ),

                    const SizedBox(height: 18),

                    _button("Create Account"),
                  ],

                  const SizedBox(height: 14),

                  Center(
                    child: Text(
                      "Takes less than 30 seconds · No spam",
                      style: GoogleFonts.outfit(fontSize: 11, color: gray),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Tabs
  Widget _tab(String text, bool isLoginTab) {
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.switchTab(isLoginTab),
        child: Column(
          children: [
            Text(
              text,
              style: GoogleFonts.outfit(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: controller.isLogin.value == isLoginTab
                    ? red
                    : const Color(0xff1A2B4A),
              ),
            ),

            const SizedBox(height: 10),

            Container(
              height: 2,
              color: controller.isLogin.value == isLoginTab
                  ? red
                  : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }

  /// Input Field
  Widget _input(
    String hint, {
    bool isPassword = false,
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: GoogleFonts.outfit(fontSize: 14, color: const Color(0xff1A2B4A)),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.outfit(
          fontSize: 14,
          color: const Color(0xff6B7280),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: const Color(0xff1A2B4A).withOpacity(.1),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(
            color: const Color(0xff1A2B4A).withOpacity(.1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Color(0xffD72638)),
        ),
      ),
    );
  }

  Widget _button(String title) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: Obx(
        () => ElevatedButton(
          onPressed: () {
            if (controller.isLogin.value) {
              controller.loginUser(
                email: emailController.text,
                password: passwordController.text,
              );
            } else {
              controller.registeruser(
                name: nameController.text,
                email: emailController.text,
                mobile: mobileController.text,
                password: passwordController.text,
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffD72638),
            disabledBackgroundColor: const Color(0xffD72638), // keep same color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            elevation: 0,
          ),
          child: controller.isLoading.value
              ? const SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : Text(
                  title,
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
