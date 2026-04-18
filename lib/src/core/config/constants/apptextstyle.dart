import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  /// Playfair (Headings)
  static TextStyle heading = GoogleFonts.playfairDisplay(
    fontWeight: FontWeight.w900,
    color: const Color(0xff1A2B4A),
  );

  /// Outfit (Body)
  static TextStyle body = GoogleFonts.outfit(color: const Color(0xff1A2B4A));

  /// DM Mono (Small Labels)
  static TextStyle label = GoogleFonts.dmMono(
    fontSize: 11,
    letterSpacing: 1.2,
    color: const Color(0xff6B7280),
  );
}
