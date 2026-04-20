import 'package:flutter/material.dart';
import 'dashboard_avatar.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning 👋",
              style: TextStyle(
                fontSize: 13,
                color: Colors.white,
                letterSpacing: 0.5,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Your Dashboard",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontFamily: 'Poppins',
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        DashboardAvatar(),
      ],
    );
  }
}