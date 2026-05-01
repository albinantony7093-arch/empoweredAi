import 'package:empowered_ai/src/data/models/exam_result_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExamResultScreen extends StatelessWidget {
  final ExamResultModel result;

  const ExamResultScreen({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f5f7),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(
              children: [
                _topCard(),
                const SizedBox(height: 18),

                /// ROW 1
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: _rankCard()),
                    const SizedBox(width: 16),
                    Expanded(flex: 3, child: _weakAreaCard()),
                  ],
                ),

                const SizedBox(height: 16),

                /// ROW 2
                _mentorCard(),

                const SizedBox(height: 22),

                /// BUTTONS
                // Row(
                //   children: [
                //     Expanded(
                //       child: _actionButton(
                //         title: "Retake Test",
                //         filled: true,
                //         icon: Icons.refresh,
                //       ),
                //     ),
                //     const SizedBox(width: 16),
                //     Expanded(
                //       child: _actionButton(
                //         title: "View Solutions",
                //         filled: false,
                //         icon: Icons.remove_red_eye_outlined,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// =====================================
  /// TOP CARD
  /// =====================================
  Widget _topCard() {
    return Container(
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        color: const Color(0xFF010029),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Final Result",
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "${result.score}",
                      style: const TextStyle(
                        fontSize: 52,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "/${result.total}",
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Text(
                  "Keep pushing! You can improve 🚀",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    _miniStat("Attempted", "${result.total}/${result.total}"),
                    const SizedBox(width: 14),
                    _miniStat("Correct", "${result.score}"),
                  ],
                ),
              ],
            ),
          ),

          /// ACCURACY
          SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 130,
                  height: 130,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    value: result.accuracy / 100,
                    backgroundColor: Colors.white24,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.white,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${result.accuracy}%",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "ACCURACY",
                      style: TextStyle(color: Colors.white70, fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _miniStat(String title, String value) {
    return Container(
      width: 130,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.10),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }

  /// =====================================
  /// RANK CARD
  /// =====================================
  Widget _rankCard() {
    return _whiteCard(
      child: Column(
        children: [
          const CircleAvatar(
            radius: 28,
            backgroundColor: Color(0xffFDE7D7),
            child: Icon(
              Icons.emoji_events_outlined,
              color: Colors.orange,
              size: 30,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            "AIR #${result.rank}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          const SizedBox(height: 12),
          Text(
            "You performed better than ${result.percentile}% students this week.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade700, height: 1.5),
          ),
        ],
      ),
    );
  }

  /// =====================================
  /// MENTOR CARD
  /// =====================================
  Widget _mentorCard() {
    return _whiteCard(
      color: const Color(0xffEEF2FF),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                height: 48,
                width: 48,
                child: Image.asset("assets/images/aimentor.png"),
              ),
              SizedBox(width: 10),
              Text(
                "AI Mentor Insight",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 18),

          ...result.mentorAdvice.map(
            (advice) => Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 7),
                    child: CircleAvatar(
                      radius: 3,
                      backgroundColor: Color(0xff0D4CC9),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      advice,
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        height: 1.6,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// =====================================
  /// WEAK AREA CARD
  /// =====================================
  Widget _weakAreaCard() {
    return _whiteCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Weak Areas",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Color(0xFF010029),
            ),
          ),
          const SizedBox(height: 18),

          ...result.weakAreas.map(
            (e) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xffFFF4F4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const CircleAvatar(radius: 4, backgroundColor: Colors.red),
                  const SizedBox(width: 10),
                  Expanded(child: Text(e)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// =====================================
  /// BUTTON
  /// =====================================
  Widget _actionButton({
    required String title,
    required bool filled,
    required IconData icon,
  }) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: filled ? const Color(0xff0D4CC9) : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xff0D4CC9)),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 18,
              color: filled ? Colors.white : const Color(0xff0D4CC9),
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                color: filled ? Colors.white : const Color(0xff0D4CC9),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// =====================================
  /// COMMON CARD
  /// =====================================
  Widget _whiteCard({required Widget child, Color color = Colors.white}) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: child,
    );
  }
}
