// core/theme/app_theme.dart
import 'package:flutter/material.dart';

class AppColors {
  static const red = Color(0xFFD72638);
  static const navy = Color(0xFF1A2B4A);
  static const green = Color(0xFF2D9D78);
  static const cream = Color(0xFFFDF8F4);
  static const light = Color(0xFFF3F4F6);
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Outfit',
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.bold,
        color: AppColors.navy,
      ),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.grey),
    ),
  );
}
