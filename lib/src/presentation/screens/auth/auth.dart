import 'dart:developer';

import 'package:empowered_ai/src/presentation/controller/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

/// Forgot-password sub-steps
enum ForgotStep { none, enterEmail, enterOtp }

class Auth extends StatelessWidget {
  Auth({super.key});

  final controller = Get.put(AuthController());

  /// Text Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final otpController = TextEditingController();

  /// Forgot-password controllers
  final forgotEmailController = TextEditingController();
  final forgotOtpController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  /// Local forgot-password state
  final Rx<ForgotStep> forgotStep = ForgotStep.none.obs;

  final Color red = const Color(0xffD72638);
  final Color navy = const Color(0xff1A2B4A);
  final Color gray = const Color(0xff6B7280);

  // ─────────────────────────────────────────────────────────────────────────────
  //  ROOT
  // ─────────────────────────────────────────────────────────────────────────────
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
            child: Obx(() => _body()),
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  //  BODY SWITCHER
  // ─────────────────────────────────────────────────────────────────────────────
  Widget _body() {
    // Forgot-password screens take priority when active
    if (forgotStep.value != ForgotStep.none) {
      return _forgotPasswordBody();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title
        Text(
          "Welcome to EmpowerED",
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

        /// LOGIN
        if (controller.isLogin.value) ...[
          _input("Email or Mobile Number", controller: emailController),
          const SizedBox(height: 12),
          _input("Password", controller: passwordController, isPassword: true),
          const SizedBox(height: 10),

          /// Forgot password link
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => forgotStep.value = ForgotStep.enterEmail,
              child: Text(
                "Forgot Password?",
                style: GoogleFonts.outfit(
                  fontSize: 13,
                  color: red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 14),
          _button("Login"),
        ]
        /// REGISTER FORM
        else if (!controller.isOtpStep.value) ...[
          _input("Full Name", controller: nameController),
          const SizedBox(height: 12),
          _input("Email", controller: emailController),
          const SizedBox(height: 12),
          _input("Mobile Number", controller: mobileController),
          const SizedBox(height: 12),
          _input("Password", controller: passwordController, isPassword: true),
          const SizedBox(height: 18),
          _button("Create Account"),
        ]
        /// OTP SCREEN (registration)
        else ...[
          Text(
            "Enter OTP sent to ${emailController.text}",
            style: GoogleFonts.outfit(fontSize: 13, color: gray),
          ),
          const SizedBox(height: 16),
          _input("Enter OTP", controller: otpController),
          const SizedBox(height: 18),
          _otpButton(),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => controller.isOtpStep.value = false,
            child: Text(
              "Edit Details",
              style: GoogleFonts.outfit(fontSize: 13, color: gray),
            ),
          ),
        ],

        const SizedBox(height: 14),
        Center(
          child: Text(
            "Takes less than 30 seconds · No spam",
            style: GoogleFonts.outfit(fontSize: 11, color: gray),
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  //  FORGOT PASSWORD BODY
  // ─────────────────────────────────────────────────────────────────────────────
  Widget _forgotPasswordBody() {
    final isEmailStep = forgotStep.value == ForgotStep.enterEmail;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Back button
        GestureDetector(
          onTap: () {
            forgotStep.value = ForgotStep.none;
            forgotEmailController.clear();
            forgotOtpController.clear();
            newPasswordController.clear();
            confirmPasswordController.clear();

            controller.forgotpassword(email: forgotEmailController.text);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_back_ios_new_rounded, size: 14, color: navy),
              const SizedBox(width: 4),
              Text(
                "Back to Login",
                style: GoogleFonts.outfit(fontSize: 13, color: navy),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        /// Title
        Text(
          isEmailStep ? "Forgot Password" : "Reset Password",
          style: GoogleFonts.outfit(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: navy,
          ),
        ),
        const SizedBox(height: 6),

        /// Subtitle
        Text(
          isEmailStep
              ? "Enter your registered email to receive a reset OTP"
              : "Enter the OTP sent to ${forgotEmailController.text} and set your new password",
          style: GoogleFonts.outfit(fontSize: 13, color: gray),
        ),
        const SizedBox(height: 24),

        // ── STEP 1: Enter Email ──────────────────────────────────────────────
        if (isEmailStep) ...[
          _input("Registered Email", controller: forgotEmailController),
          const SizedBox(height: 18),
          _actionButton(
            label: "Send OTP",
            onTap: () async {
              if (forgotEmailController.text.trim().isEmpty) return;
              forgotStep.value = ForgotStep.enterOtp;
            },
          ),
        ]
        // ── STEP 2: OTP + New Password ───────────────────────────────────────
        else ...[
          _input("Enter OTP", controller: forgotOtpController),
          const SizedBox(height: 12),
          _input(
            "New Password",
            controller: newPasswordController,
            isPassword: true,
          ),
          const SizedBox(height: 12),
          _input(
            "Confirm Password",
            controller: confirmPasswordController,
            isPassword: true,
          ),
          const SizedBox(height: 18),
          _actionButton(
            label: "Reset Password",
            onTap: () async {
              final otp = forgotOtpController.text.trim();
              final newPass = newPasswordController.text;
              final confirmPass = confirmPasswordController.text;

              if (otp.isEmpty || newPass.isEmpty || confirmPass.isEmpty) return;
              if (newPass != confirmPass) {
                Get.snackbar(
                  "Mismatch",
                  "Passwords do not match",
                  backgroundColor: const Color(0xffD72638),
                  colorText: Colors.white,
                  snackPosition: SnackPosition.BOTTOM,
                );
                return;
              }

              // TODO: call controller.resetPassword(
              //   email: forgotEmailController.text,
              //   otp: otp,
              //   newPassword: newPass,
              // )
              // On success — go back to login:
              forgotStep.value = ForgotStep.none;
              forgotEmailController.clear();
              forgotOtpController.clear();
              newPasswordController.clear();
              confirmPasswordController.clear();
              controller.switchTab(true); // ensure login tab is active
              Get.snackbar(
                "Success",
                "Password reset successful. Please login.",
                backgroundColor: const Color(0xff1A2B4A),
                colorText: Colors.white,
                snackPosition: SnackPosition.BOTTOM,
              );
            },
          ),
          const SizedBox(height: 12),

          /// Resend OTP
          GestureDetector(
            onTap: () {
              // TODO: controller.sendForgotPasswordOtp(forgotEmailController.text)
            },
            child: Text(
              "Resend OTP",
              style: GoogleFonts.outfit(
                fontSize: 13,
                color: red,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ],
    );
  }

  // ─────────────────────────────────────────────────────────────────────────────
  //  SHARED WIDGETS
  // ─────────────────────────────────────────────────────────────────────────────

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
                color: controller.isLogin.value == isLoginTab ? red : navy,
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

  /// Primary button used in Login / Register flows (reads controller.isLoading)
  Widget _button(String title) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: Obx(
        () => ElevatedButton(
          onPressed: () {
            if (controller.isLogin.value &&
                controller.isLoading.value == false) {
              controller.loginUser(
                email: emailController.text,
                password: passwordController.text,
              );
            } else {
              if (controller.isLoading.value == false) {
                controller.requestOtp(
                  name: nameController.text,
                  email: emailController.text,
                  mobile: mobileController.text,
                  password: passwordController.text,
                );
              }
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffD72638),
            disabledBackgroundColor: const Color(0xffD72638),
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

  /// Simple async action button used in forgot-password flow
  Widget _actionButton({required String label, required VoidCallback onTap}) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: red,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
        child: Text(
          label,
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _otpButton() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: Obx(
        () => ElevatedButton(
          onPressed: () {
            if (controller.isLoading.value == false) {
              controller.verifyOtp(
                otp: otpController.text,
                email: emailController.text,
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
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
                  "Verify OTP",
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
