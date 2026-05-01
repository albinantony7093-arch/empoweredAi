import 'package:empowered_ai/src/presentation/screens/profile/widgets/logoout.dart';
import 'package:empowered_ai/src/presentation/screens/profile/widgets/profile_header.dart';
import 'package:empowered_ai/src/presentation/screens/profile/widgets/profile_info_card.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 24),
                  ProfileHeaderCard(
                    name: 'Albin Antony',
                    email: 'albinantony7093@gmail.com',
                    testsTaken: '23',
                    avgScore: '845',
                    globalRank: '#23',
                  ),
                  SizedBox(height: 16),
                  PersonalInfoCard(
                    fullName: 'Albin Antony',
                    email: 'albinantony7093@gmail.com',
                    phone: '+91 9633366246',
                    dob: '26/10/2001',
                    gender: 'MALE',
                  ),
                  SizedBox(height: 24),
                  LogoutSessionCard(onLogout: () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
