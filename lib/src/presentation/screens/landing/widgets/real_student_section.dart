import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RealStudentsSection extends StatelessWidget {
  const RealStudentsSection({super.key});

  static const Color _pageBg = Color(0xffFAF7F2);
  static const Color _navy = Color(0xff1F2E4A);
  static const Color _navyDeep = Color(0xff152035);
  static const Color _muted = Color(0xff7A8FA8);
  static const Color _cardBg = Color(0xffFFFFFF);
  static const Color _border = Color(0xffE8EAF0);
  static const Color _green = Color(0xff00A86B);
  static const Color _red = Color(0xffE63946);

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
        final vPad = isMobile ? 48.0 : 64.0;
        final titleSize = isMobile ? 28.0 : 38.0;

        return Container(
          color: _pageBg,
          padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
          child: Column(
            children: [
              // ── Header ─────────────────────────────────────────────────
              Text(
                'RESULTS',
                style: GoogleFonts.spaceGrotesk(
                  color: _green,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.2,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Real Students. Real Ranks.',
                textAlign: TextAlign.center,
                style: GoogleFonts.merriweather(
                  color: _navyDeep,
                  fontSize: titleSize,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'From diagnostic to improvement — this is what the system delivers.',
                style: GoogleFonts.inter(
                  color: _muted,
                  fontSize: isMobile ? 13 : 15,
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: isMobile ? 32 : 44),

              // ── Stats ──────────────────────────────────────────────────
              _StatsRow(isMobile: isMobile),

              SizedBox(height: isMobile ? 24 : 36),

              // ── Testimonials ───────────────────────────────────────────
              if (isMobile)
                Column(
                  children: [
                    _testimonialCard1,
                    const SizedBox(height: 16),
                    _testimonialCard2,
                    const SizedBox(height: 16),
                    _testimonialCard3,
                  ],
                )
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _testimonialCard1),
                    const SizedBox(width: 20),
                    Expanded(child: _testimonialCard2),
                    const SizedBox(width: 20),
                    Expanded(child: _testimonialCard3),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  _TestimonialCard get _testimonialCard1 => const _TestimonialCard(
    quote:
        '"I took the diagnostic and my rank was AIR 12,400. Six weeks of following the AI plan, and I\'m now at AIR 4,820. The Calm Corner genuinely helped me stop panicking after bad tests."',
    name: 'Arjun Menon',
    sub: 'NEET UG 2024 · Kerala',
    initial: 'A',
    avatarColor: _navy,
    badgeLabel: 'AIR 12,400 → 4,820',
    badgeIcon: '📈',
    badgeColor: _navy,
    cardBg: _cardBg,
    border: _border,
    muted: _muted,
    navy: _navyDeep,
  );

  _TestimonialCard get _testimonialCard2 => const _TestimonialCard(
    quote:
        '"The AI identified that my Physics mechanics was the problem — not the subject broadly. It gave me a targeted 10-day plan and I improved by 38 marks in the next mock."',
    name: 'Priya Raghunathan',
    sub: 'NEET UG · Tamil Nadu',
    initial: 'P',
    avatarColor: _red,
    badgeLabel: '+38 marks in 10 days',
    badgeIcon: '📈',
    badgeColor: _green,
    cardBg: _cardBg,
    border: _border,
    muted: _muted,
    navy: _navyDeep,
  );

  _TestimonialCard get _testimonialCard3 => const _TestimonialCard(
    quote:
        '"What sets EmpowerED apart is the Calm Corner. As someone with exam anxiety, having a built-in reset after every test changed everything. My focus in the actual exam was completely different."',
    name: 'Rohan Varghese',
    sub: 'NEET PG · Karnataka',
    initial: 'R',
    avatarColor: _green,
    badgeLabel: 'Calm Corner changed it',
    badgeIcon: '✨',
    badgeColor: _green,
    cardBg: _cardBg,
    border: _border,
    muted: _muted,
    navy: _navyDeep,
  );
}

// ── Stats row — 2×2 grid on mobile, single row on larger ──────────────────
class _StatsRow extends StatelessWidget {
  final bool isMobile;
  const _StatsRow({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    const cells = [
      _StatData('12,000+', 'STUDENTS ENROLLED'),
      _StatData('94%', 'PASS RATE (NEET UG)'),
      _StatData('AIR 847', 'BEST RANK ACHIEVED'),
      _StatData('+23%', 'AVG. SCORE IMPROVEMENT'),
    ];

    final decoration = BoxDecoration(
      color: RealStudentsSection._cardBg,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: RealStudentsSection._border),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.04),
          blurRadius: 16,
          offset: const Offset(0, 4),
        ),
      ],
    );

    if (isMobile) {
      // 2×2 grid
      return Container(
        decoration: decoration,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _StatCell(
                    value: cells[0].value,
                    label: cells[0].label,
                    navy: RealStudentsSection._navyDeep,
                    muted: RealStudentsSection._muted,
                  ),
                ),
                Container(width: 1, color: RealStudentsSection._border),
                Expanded(
                  child: _StatCell(
                    value: cells[1].value,
                    label: cells[1].label,
                    navy: RealStudentsSection._navyDeep,
                    muted: RealStudentsSection._muted,
                  ),
                ),
              ],
            ),
            Container(height: 1, color: RealStudentsSection._border),
            Row(
              children: [
                Expanded(
                  child: _StatCell(
                    value: cells[2].value,
                    label: cells[2].label,
                    navy: RealStudentsSection._navyDeep,
                    muted: RealStudentsSection._muted,
                  ),
                ),
                Container(width: 1, color: RealStudentsSection._border),
                Expanded(
                  child: _StatCell(
                    value: cells[3].value,
                    label: cells[3].label,
                    navy: RealStudentsSection._navyDeep,
                    muted: RealStudentsSection._muted,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    // Single row for tablet/desktop
    return Container(
      decoration: decoration,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: _StatCell(
                value: cells[0].value,
                label: cells[0].label,
                navy: RealStudentsSection._navyDeep,
                muted: RealStudentsSection._muted,
              ),
            ),
            Container(width: 1, color: RealStudentsSection._border),
            Expanded(
              child: _StatCell(
                value: cells[1].value,
                label: cells[1].label,
                navy: RealStudentsSection._navyDeep,
                muted: RealStudentsSection._muted,
              ),
            ),
            Container(width: 1, color: RealStudentsSection._border),
            Expanded(
              child: _StatCell(
                value: cells[2].value,
                label: cells[2].label,
                navy: RealStudentsSection._navyDeep,
                muted: RealStudentsSection._muted,
              ),
            ),
            Container(width: 1, color: RealStudentsSection._border),
            Expanded(
              child: _StatCell(
                value: cells[3].value,
                label: cells[3].label,
                navy: RealStudentsSection._navyDeep,
                muted: RealStudentsSection._muted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatData {
  final String value, label;
  const _StatData(this.value, this.label);
}

// ── Stat cell ──────────────────────────────────────────────────────────────
class _StatCell extends StatelessWidget {
  final String value, label;
  final Color navy, muted;
  const _StatCell({
    required this.value,
    required this.label,
    required this.navy,
    required this.muted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.merriweather(
              color: navy,
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.spaceGrotesk(
              color: muted,
              fontSize: 10,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.3,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// ── Testimonial card ───────────────────────────────────────────────────────
class _TestimonialCard extends StatelessWidget {
  final String quote, name, sub, initial, badgeLabel, badgeIcon;
  final Color avatarColor, badgeColor, cardBg, border, muted, navy;

  const _TestimonialCard({
    required this.quote,
    required this.name,
    required this.sub,
    required this.initial,
    required this.avatarColor,
    required this.badgeLabel,
    required this.badgeIcon,
    required this.badgeColor,
    required this.cardBg,
    required this.border,
    required this.muted,
    required this.navy,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stars
          Row(
            children: List.generate(
              5,
              (_) => const Padding(
                padding: EdgeInsets.only(right: 2),
                child: Icon(
                  Icons.star_rounded,
                  color: Color(0xffF5A623),
                  size: 18,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Quote
          Text(
            quote,
            style: GoogleFonts.merriweather(
              color: navy,
              fontSize: 13,
              fontStyle: FontStyle.italic,
              height: 1.75,
            ),
          ),
          const SizedBox(height: 24),

          // Avatar + name
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: avatarColor,
                child: Text(
                  initial,
                  style: GoogleFonts.spaceGrotesk(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.spaceGrotesk(
                        color: navy,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      sub,
                      style: GoogleFonts.inter(color: muted, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Badge
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          //   decoration: BoxDecoration(
          //     color: badgeColor.withOpacity(0.08),
          //     borderRadius: BorderRadius.circular(50),
          //     border: Border.all(color: badgeColor.withOpacity(0.2)),
          //   ),
          //   child: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       Text(badgeIcon, style: const TextStyle(fontSize: 12)),
          //       const SizedBox(width: 6),
          //       Text(
          //         badgeLabel,
          //         style: GoogleFonts.inter(
          //           color: badgeColor,
          //           fontSize: 11,
          //           fontWeight: FontWeight.w600,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: badgeColor.withOpacity(0.08),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: badgeColor.withOpacity(0.2)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(badgeIcon, style: const TextStyle(fontSize: 12)),
                const SizedBox(width: 6),
                Flexible(
                  child: Text(
                    badgeLabel,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GoogleFonts.inter(
                      color: badgeColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
