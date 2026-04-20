import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF3F4F6),

      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 460),

          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /// PERFORMANCE CARD
                _card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _label("LAST TEST PERFORMANCE"),

                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Expanded(child: _metric("412", "Score")),
                          _divider(),
                          Expanded(child: _metric("12,870", "Rank")),
                          _divider(),
                          Expanded(child: _metric("78.4%", "Percentile")),
                        ],
                      ),

                      const SizedBox(height: 12),

                      _statusPill("Rank improving"),

                      const SizedBox(height: 12),

                      _insightBox(
                        "You are losing marks mainly in Physics (Concept clarity). Focus here for fastest rank gain.",
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                /// CTA TEXT
                _monoText("YOUR FASTEST IMPROVEMENT PATH STARTS HERE"),

                const SizedBox(height: 8),

                /// PRIMARY CTA
                _primaryCTA(),

                const SizedBox(height: 6),

                _monoText("Takes 2 minutes · No negative marking · Free"),

                const SizedBox(height: 12),

                /// AI CARD
                _card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionTitle("AI Performance Correction"),

                      _aiRow(
                        "Focus on Thermodynamics — highest impact topic this week",
                      ),
                      _aiRow(
                        "Improve MCQ time management — spending 20% too long per question",
                      ),

                      const SizedBox(height: 10),

                      _monoText("Suggested: take a 20-question focused test"),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                /// WEAK AREAS
                _card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionTitle("Weak areas"),

                      _weakRow("Physics", 0.28, Color(0xFFE24B4A), "Low"),
                      _weakRow(
                        "Chemistry",
                        0.58,
                        Color(0xFFEF9F27),
                        "Moderate",
                      ),
                      _weakRow("Biology", 0.84, Color(0xFF639922), "Strong"),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                /// CALM CARD
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF5F0),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Color(0x332D9D78)),
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Your brain is overloaded after the test.\nTake 2 minutes to reset for better performance.",
                          style: TextStyle(
                            fontSize: 13,
                            height: 1.5,
                            color: Color(0xFF2d5a4f),
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2D9D78),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x552D9D78),
                              blurRadius: 14,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Text(
                          "Start 2-min Reset",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                /// ACTIVITY
                _card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionTitle("Recent activity"),

                      _activity("Full mock test completed today"),
                      _activity("Rank improved by 2,000 since last week"),
                      _activity("Biology revision set completed"),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ---------------- COMPONENTS ----------------

  Widget _card({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0x14000000)),
      ),
      child: child,
    );
  }

  Widget _label(String text) {
    return const Text(
      "LAST TEST PERFORMANCE",
      style: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
        color: Color(0xFF6B7280),
      ),
    );
  }

  Widget _metric(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A2B4A),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(fontSize: 11, color: Color(0xFF6B7280)),
        ),
      ],
    );
  }

  Widget _divider() {
    return Container(width: 1, height: 40, color: const Color(0x14000000));
  }

  Widget _statusPill(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF5F0),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0x332D9D78)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          CircleAvatar(radius: 3, backgroundColor: Color(0xFF2D9D78)),
          SizedBox(width: 6),
          Text(
            "Rank improving",
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  Widget _insightBox(String text) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFCEBEB),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: const TextStyle(fontSize: 13, height: 1.6)),
    );
  }

  Widget _primaryCTA() {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: const Color(0xFFD72638),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Color(0x55D72638),
            blurRadius: 20,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Start Free Diagnostic",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.arrow_forward_ios, size: 14, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _aiRow(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text, style: const TextStyle(fontSize: 13, height: 1.5)),
    );
  }

  Widget _weakRow(String label, double value, Color color, String level) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 70,
            child: Text(label, style: TextStyle(color: Color(0xFF6B7280))),
          ),
          Expanded(
            child: Container(
              height: 6,
              decoration: BoxDecoration(
                color: Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(20),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: value,
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 60,
            child: Text(
              level,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }

  Widget _activity(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.check_circle, size: 18, color: Color(0xFF2D9D78)),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 13))),
        ],
      ),
    );
  }

  Widget _monoText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 11,
        color: Color(0xFF6B7280),
        letterSpacing: 0.4,
      ),
      textAlign: TextAlign.center,
    );
  }
}
