import 'package:empowered_ai/src/presentation/screens/dashboard/widgets/ai_insect.dart';
import 'package:empowered_ai/src/presentation/screens/dashboard/widgets/stat_card.dart';
import 'package:empowered_ai/src/presentation/screens/dashboard/widgets/weak_area_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              // ── Header label ──────────────────────────
              Text(
                'LAST TEST PERFORMANCE',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Color(0xff111C2D),
                ),
              ),

              const SizedBox(height: 12),

              // ── Top row: Score | Rank | Percentile ────
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: StatCard(
                        label: 'Score',
                        value: '210/730',
                        imagePath: 'assets/images/Container.png',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: StatCard(
                        label: 'RANK',
                        value: '12,230',
                        imagePath: 'assets/images/trophy.png',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: StatCard(
                        label: 'PERCENTILE',
                        value: '20%',
                        imagePath: 'assets/images/percentage.png',
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // ── Mode badge ────────────────────────────
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEEF2FF),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFC5D0FF)),
                  ),
                  child: const Text(
                    '🎓  UG Preparation Mode',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF3B5BDB),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Expanded(child: WeakAreasWidget()),
                    SizedBox(width: 16),
                    Expanded(child: AIInsightsWidget()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
