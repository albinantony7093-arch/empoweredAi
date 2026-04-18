import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalmResetWidget extends StatelessWidget {
  CalmResetWidget({super.key});

  final Color navy = const Color(0xff1F2E4A);
  final Color navyLight = const Color(0xff253554);
  final Color navyCard = const Color(0xff1A2740);
  final Color navyBorder = const Color(0xff2E4060);
  final Color green = const Color(0xff00D084);
  final Color greenDim = const Color(0xff00A868);
  final Color white = const Color(0xffEEF2F0);
  final Color muted = const Color(0xff7A93B8);

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

        final leftPanel = _LeftCopy(
          navy: navy,
          navyLight: navyLight,
          green: green,
          greenDim: greenDim,
          white: white,
          muted: muted,
          isMobile: isMobile,
        );

        final rightPanel = _RightPanel(
          navyCard: navyCard,
          navyBorder: navyBorder,
          navyLight: navyLight,
          green: green,
          white: white,
          muted: muted,
        );

        return Container(
          color: navyCard,
          padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [leftPanel, const SizedBox(height: 40), rightPanel],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 6, child: leftPanel),
                    SizedBox(width: isTablet ? 32 : 48),
                    Expanded(flex: 5, child: rightPanel),
                  ],
                ),
        );
      },
    );
  }
}

// ── Left copy ──────────────────────────────────────────────────────────────
class _LeftCopy extends StatelessWidget {
  final Color navy, navyLight, green, greenDim, white, muted;
  final bool isMobile;

  const _LeftCopy({
    required this.navy,
    required this.navyLight,
    required this.green,
    required this.greenDim,
    required this.white,
    required this.muted,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final headlineSize = isMobile ? 28.0 : 38.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tag pill
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: green.withOpacity(0.25)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('🌿', style: TextStyle(fontSize: 12)),
              const SizedBox(width: 7),
              Text(
                'EMOTIONAL DIFFERENTIATOR',
                style: GoogleFonts.spaceGrotesk(
                  color: green,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 22),

        // Headline
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'When Stress Drops,\n',
                style: GoogleFonts.spaceGrotesk(
                  color: white,
                  fontSize: headlineSize,
                  fontWeight: FontWeight.w800,
                  height: 1.15,
                ),
              ),
              TextSpan(
                text: 'Performance Rises.',
                style: GoogleFonts.spaceGrotesk(
                  color: green,
                  fontSize: headlineSize,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.italic,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        Text(
          'After every test, a 2-minute Calm Corner session resets your nervous system, restores focus, and returns you ready — not rattled.',
          style: GoogleFonts.inter(
            color: muted,
            fontSize: isMobile ? 13 : 14,
            height: 1.7,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Students who use the Calm Corner between sessions improve their next test score by an average of 23%. This is not a wellness feature — it is a performance tool.',
          style: GoogleFonts.inter(
            color: muted,
            fontSize: isMobile ? 13 : 14,
            height: 1.7,
          ),
        ),
        const SizedBox(height: 14),
        Text(
          'USED BY TOPPERS TO RECOVER FASTER BETWEEN TESTS.',
          style: GoogleFonts.spaceGrotesk(
            color: green,
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.4,
          ),
        ),
        const SizedBox(height: 32),

        // Stats row
        Wrap(
          spacing: 32,
          runSpacing: 16,
          children: [
            _Stat(
              value: '2 min',
              label: 'Instant Reset',
              green: green,
              white: white,
              muted: muted,
            ),
            _Stat(
              value: '+23%',
              label: 'Avg. Score Lift',
              green: green,
              white: white,
              muted: muted,
            ),
            _Stat(
              value: '4 modes',
              label: 'Breath + Sound',
              green: green,
              white: white,
              muted: muted,
            ),
          ],
        ),
        const SizedBox(height: 36),

        // CTA
        _CtaButton(green: green, greenDim: greenDim, fullWidth: isMobile),
      ],
    );
  }
}

// ── Stat ───────────────────────────────────────────────────────────────────
class _Stat extends StatelessWidget {
  final String value, label;
  final Color green, white, muted;
  const _Stat({
    required this.value,
    required this.label,
    required this.green,
    required this.white,
    required this.muted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: GoogleFonts.spaceGrotesk(
            color: green,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 2),
        Text(label, style: GoogleFonts.inter(color: muted, fontSize: 11)),
      ],
    );
  }
}

// ── CTA Button ─────────────────────────────────────────────────────────────
class _CtaButton extends StatefulWidget {
  final Color green, greenDim;
  final bool fullWidth;
  const _CtaButton({
    required this.green,
    required this.greenDim,
    this.fullWidth = false,
  });

  @override
  State<_CtaButton> createState() => _CtaButtonState();
}

class _CtaButtonState extends State<_CtaButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: widget.fullWidth ? double.infinity : null,
        decoration: BoxDecoration(
          color: _hovered ? widget.greenDim : widget.green,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: widget.green.withOpacity(_hovered ? 0.4 : 0.2),
              blurRadius: 24,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
            shape: const StadiumBorder(),
          ),
          child: Row(
            mainAxisSize: widget.fullWidth
                ? MainAxisSize.max
                : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('🌿', style: TextStyle(fontSize: 14)),
              const SizedBox(width: 8),
              Text(
                'Try Calm Reset →',
                style: GoogleFonts.spaceGrotesk(
                  color: const Color(0xff0D1F1F),
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Right panel ────────────────────────────────────────────────────────────
class _RightPanel extends StatelessWidget {
  final Color navyCard, navyBorder, navyLight, green, white, muted;
  const _RightPanel({
    required this.navyCard,
    required this.navyBorder,
    required this.navyLight,
    required this.green,
    required this.white,
    required this.muted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _ModeCard(
                minutes: '2 min',
                title: 'Instant Calm',
                sub: 'AFTER BAD TEST',
                navyLight: navyLight,
                navyBorder: navyBorder,
                green: green,
                white: white,
                muted: muted,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _ModeCard(
                minutes: '5 min',
                title: 'Focus Reset',
                sub: 'BEFORE NEXT TEST',
                navyLight: navyLight,
                navyBorder: navyBorder,
                green: green,
                white: white,
                muted: muted,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _ModeCard(
                minutes: '10 min',
                title: 'Deep Recovery',
                sub: 'BURNOUT MODE',
                navyLight: navyLight,
                navyBorder: navyBorder,
                green: green,
                white: white,
                muted: muted,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _ModeCard(
                minutes: '10 min',
                title: 'Frequency Reset',
                sub: 'SOUND HEALING',
                navyLight: navyLight,
                navyBorder: navyBorder,
                green: green,
                white: white,
                muted: muted,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _LoopBanner(
          navyLight: navyLight,
          navyBorder: navyBorder,
          green: green,
          white: white,
          muted: muted,
        ),
        const SizedBox(height: 12),
        _WellnessHubBanner(
          navyLight: navyLight,
          navyBorder: navyBorder,
          green: green,
          white: white,
          muted: muted,
        ),
      ],
    );
  }
}

// ── Mode card ──────────────────────────────────────────────────────────────
class _ModeCard extends StatefulWidget {
  final String minutes, title, sub;
  final Color navyLight, navyBorder, green, white, muted;
  const _ModeCard({
    required this.minutes,
    required this.title,
    required this.sub,
    required this.navyLight,
    required this.navyBorder,
    required this.green,
    required this.white,
    required this.muted,
  });

  @override
  State<_ModeCard> createState() => _ModeCardState();
}

class _ModeCardState extends State<_ModeCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
        decoration: BoxDecoration(
          color: _hovered
              ? widget.navyLight.withOpacity(0.8)
              : widget.navyLight,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: _hovered ? widget.green.withOpacity(0.5) : widget.navyBorder,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: widget.green.withOpacity(0.08),
                    blurRadius: 16,
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.minutes,
              style: GoogleFonts.spaceGrotesk(
                color: widget.green,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.title,
              style: GoogleFonts.spaceGrotesk(
                color: widget.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              widget.sub,
              style: GoogleFonts.inter(
                color: widget.muted,
                fontSize: 10,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Loop banner ────────────────────────────────────────────────────────────
class _LoopBanner extends StatelessWidget {
  final Color navyLight, navyBorder, green, white, muted;
  const _LoopBanner({
    required this.navyLight,
    required this.navyBorder,
    required this.green,
    required this.white,
    required this.muted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: navyLight,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: navyBorder),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: green.withOpacity(0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.swap_horiz_rounded, color: green, size: 18),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Test → Result → Calm → Improve',
                  style: GoogleFonts.spaceGrotesk(
                    color: white,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'The complete loop. Every session connects back to your rank.',
                  style: GoogleFonts.inter(color: muted, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Wellness hub banner ────────────────────────────────────────────────────
class _WellnessHubBanner extends StatelessWidget {
  final Color navyLight, navyBorder, green, white, muted;
  const _WellnessHubBanner({
    required this.navyLight,
    required this.navyBorder,
    required this.green,
    required this.white,
    required this.muted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: navyLight,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: navyBorder),
      ),
      child: Row(
        children: [
          const Text('🌿', style: TextStyle(fontSize: 20)),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Wellness Hub',
                    style: GoogleFonts.spaceGrotesk(
                      color: white,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                  TextSpan(
                    text:
                        ' — Frequencies, affirmations, Pomodoro, mood check-in and more. ',
                    style: GoogleFonts.inter(color: muted, fontSize: 12),
                  ),
                  TextSpan(
                    text: 'Explore →',
                    style: GoogleFonts.inter(
                      color: green,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
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
}
