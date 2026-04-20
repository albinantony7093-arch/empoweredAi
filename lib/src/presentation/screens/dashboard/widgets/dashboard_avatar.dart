import 'package:flutter/material.dart';

class DashboardAvatar extends StatelessWidget {
  const DashboardAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6366F1).withOpacity(0.4),
            blurRadius: 14,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: const Center(
        child: Text(
          "A",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}