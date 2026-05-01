import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoutSessionCard extends StatelessWidget {
  final VoidCallback onLogout;

  const LogoutSessionCard({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFFDECEC), // light red background
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF5C2C2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// LEFT TEXT
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Logout Session",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.red.shade700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Clear active session from this device",
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: Colors.red.shade400,
                ),
              ),
            ],
          ),

          /// RIGHT BUTTON
          GestureDetector(
            onTap: onLogout,
            child: Text(
              "Logout",
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.red.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
