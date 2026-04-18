import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PerformancePictureSection extends StatelessWidget {
  const PerformancePictureSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = width < 700;
        final isTablet = width >= 700 && width < 1100;

        final hPad = isMobile
            ? 24.0
            : isTablet
            ? 40.0
            : 60.0;
        final vPad = isMobile ? 48.0 : 80.0;
        final titleSize = isMobile
            ? 28.0
            : isTablet
            ? 34.0
            : 42.0;

        const cards = [
          _CardData(
            icon: "📊",
            title: "All-India Rank Estimate",
            desc:
                "Benchmarked against 12,000+ students. Know exactly where you stand in the NEET pool today.",
            badge: "AIR 4,820",
            color: Color(0xff243A5E),
          ),
          _CardData(
            icon: "📈",
            title: "Percentile Score",
            desc:
                "Understand your relative performance by subject, section, and overall — with trend tracking over time.",
            badge: "Top 28%",
            color: Color(0xffE63946),
          ),
          _CardData(
            icon: "🧠",
            title: "AI Weak Area Analysis",
            desc: "AI pinpoints the exact chapters dragging your rank down.",
            badge: "Physics Ch. 4, 7",
            color: Color(0xff00D084),
          ),
          _CardData(
            icon: "🤖",
            title: "AI Improvement Plan",
            desc:
                "A personalised step-by-step study roadmap generated from your results.",
            badge: "7-day plan ready",
            color: Color(0xff3A86FF),
          ),
        ];

        Widget buildCards() {
          if (isMobile) {
            // Single column
            return Column(
              children: cards
                  .map(
                    (c) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: HoverCard(
                        icon: c.icon,
                        title: c.title,
                        desc: c.desc,
                        badge: c.badge,
                        color: c.color,
                      ),
                    ),
                  )
                  .toList(),
            );
          } else if (isTablet) {
            // 2-column grid
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: HoverCard(
                        icon: cards[0].icon,
                        title: cards[0].title,
                        desc: cards[0].desc,
                        badge: cards[0].badge,
                        color: cards[0].color,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: HoverCard(
                        icon: cards[1].icon,
                        title: cards[1].title,
                        desc: cards[1].desc,
                        badge: cards[1].badge,
                        color: cards[1].color,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: HoverCard(
                        icon: cards[2].icon,
                        title: cards[2].title,
                        desc: cards[2].desc,
                        badge: cards[2].badge,
                        color: cards[2].color,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: HoverCard(
                        icon: cards[3].icon,
                        title: cards[3].title,
                        desc: cards[3].desc,
                        badge: cards[3].badge,
                        color: cards[3].color,
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else {
            // 4-column row (original)
            return Row(
              children: cards
                  .expand(
                    (c) => [
                      Expanded(
                        child: HoverCard(
                          icon: c.icon,
                          title: c.title,
                          desc: c.desc,
                          badge: c.badge,
                          color: c.color,
                        ),
                      ),
                      if (c != cards.last) const SizedBox(width: 20),
                    ],
                  )
                  .toList(),
            );
          }
        }

        return Container(
          padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
          color: const Color(0xffF7F7F7),
          child: Column(
            children: [
              /// SMALL TITLE
              Text(
                "WHAT YOU GET",
                style: GoogleFonts.dmMono(
                  letterSpacing: 3,
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),

              const SizedBox(height: 10),

              /// TITLE
              Text(
                "Your Complete Performance Picture",
                textAlign: TextAlign.center,
                style: GoogleFonts.playfairDisplay(
                  fontSize: titleSize,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xff1F2E4A),
                ),
              ),

              const SizedBox(height: 10),

              /// SUBTITLE
              Text(
                "Not just a score — a full intelligence report that tells you exactly what to do next.",
                textAlign: TextAlign.center,
                style: GoogleFonts.outfit(
                  color: Colors.black54,
                  fontSize: isMobile ? 14 : 16,
                ),
              ),

              SizedBox(height: isMobile ? 32 : 50),

              buildCards(),
            ],
          ),
        );
      },
    );
  }
}

// ── Data holder ───────────────────────────────────────────────────────────────
class _CardData {
  final String icon;
  final String title;
  final String desc;
  final String badge;
  final Color color;

  const _CardData({
    required this.icon,
    required this.title,
    required this.desc,
    required this.badge,
    required this.color,
  });
}

// ── HoverCard ─────────────────────────────────────────────────────────────────
class HoverCard extends StatefulWidget {
  final String icon;
  final String title;
  final String desc;
  final String badge;
  final Color color;

  const HoverCard({
    super.key,
    required this.icon,
    required this.title,
    required this.desc,
    required this.badge,
    required this.color,
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: isHover
            ? (Matrix4.identity()..translate(0, -8))
            : Matrix4.identity(),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isHover ? .15 : .05),
              blurRadius: isHover ? 25 : 10,
              offset: const Offset(0, 10),
            ),
          ],
          border: Border(
            top: BorderSide(color: widget.color, width: isHover ? 4 : 2),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.icon, style: const TextStyle(fontSize: 26)),

            const SizedBox(height: 20),

            Text(
              widget.title,
              style: GoogleFonts.outfit(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: const Color(0xff1F2E4A),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              widget.desc,
              style: GoogleFonts.outfit(color: Colors.black54, height: 1.6),
            ),

            const SizedBox(height: 20),

            Container(
              height: 40,
              width: 60,
              decoration: BoxDecoration(
                color: widget.color.withOpacity(.15),
                borderRadius: BorderRadius.circular(6),
              ),
            ),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: widget.color.withOpacity(.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                widget.badge,
                style: GoogleFonts.dmMono(fontSize: 11, color: widget.color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
