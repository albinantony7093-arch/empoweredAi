import 'package:empowered_ai/src/presentation/screens/profile/widgets/stat_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileHeaderCard extends StatelessWidget {
  final String name;
  final String email;
  final String testsTaken;
  final String avgScore;
  final String globalRank;

  const ProfileHeaderCard({
    super.key,
    required this.name,
    required this.email,
    required this.testsTaken,
    required this.avgScore,
    required this.globalRank,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.grey.shade200,
                child: const Icon(Icons.person, size: 35),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name, // ✅ dynamic
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff111C2D),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      email, // ✅ dynamic
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: const Color(0xff434654),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StatItem(
                title: "Tests Taken",
                value: testsTaken,
                color: const Color(0xff003D9B),
              ),
              StatItem(
                title: "Avg Score",
                value: avgScore,
                color: const Color(0xffFB7800),
              ),
              StatItem(
                title: "Global Rank",
                value: globalRank,
                color: const Color(0xff004962),
              ),
            ],
          ),
        ],
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Colors.grey.shade200),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.03),
          blurRadius: 20,
          offset: const Offset(0, 6),
        ),
      ],
    );
  }
}
