import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseYourPathSection extends StatelessWidget {
  final VoidCallback? onExploreAiProgram;
  final VoidCallback? onBrowseCourses;

  const ChooseYourPathSection({
    super.key,
    this.onExploreAiProgram,
    this.onBrowseCourses,
  });

  static const Color _red = Color(0xffE63946);
  static const Color _greenAccent = Color(0xff00D084);
  static const Color _white = Color(0xffFFFFFF);
  static const Color _muted = Color(0xff8A9BB8);
  static const Color _mutedGreen = Color(0xffA8C8BC);

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
        final titleSize = isMobile ? 26.0 : 36.0;

        final aiCard = _PathCard(
          tagLabel: 'NEED GUIDANCE',
          tagColor: _red,
          tagBg: _red.withOpacity(0.2),
          tagBorder: _red.withOpacity(0.4),
          gradientColors: const [
            Color(0xff1E3060),
            Color(0xff2A2060),
            Color(0xff301840),
          ],
          title: 'AI Intelligence Program',
          subtitle: '"I want a system to tell me exactly what to study"',
          bulletColor: _red,
          bullets: const [
            'Adaptive AI study path from your diagnostic',
            'Clinical reasoning engine for NEET PG',
            'Real-time rank tracking + weak area targeting',
            'Personalised study plan that updates every session',
          ],
          ctaLabel: '👉  Explore AI Program →',
          ctaColor: _red,
          ctaHoverColor: const Color(0xffC8303A),
          ctaTextColor: _white,
          muted: const Color(0xffA0B0CC),
          onTap: onExploreAiProgram,
        );

        final coursesCard = _PathCard(
          tagLabel: 'NEED STRUCTURE',
          tagColor: _greenAccent,
          tagBg: _greenAccent.withOpacity(0.12),
          tagBorder: _greenAccent.withOpacity(0.3),
          gradientColors: const [
            Color(0xff0F4A32),
            Color(0xff135A3A),
            Color(0xff1A6B42),
          ],
          title: 'Structured Courses',
          subtitle: '"I want expert-led lessons in a clear sequence"',
          bulletColor: _greenAccent,
          bullets: const [
            'Expert medical faculty-led video lectures',
            'NCERT-mapped biology, chemistry, physics modules',
            'Subject-wise mock tests + performance tracking',
            'Scholarship support available',
          ],
          ctaLabel: 'Browse Courses →',
          ctaColor: _greenAccent,
          ctaHoverColor: const Color(0xff00B870),
          ctaTextColor: const Color(0xff0A2E1F),
          muted: _mutedGreen,
          onTap: onBrowseCourses,
        );

        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff1A2640), Color(0xff1F2E4A), Color(0xff1E2A45)],
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header ────────────────────────────────────────────────
              Text(
                'CHOOSE YOUR PATH',
                style: GoogleFonts.spaceGrotesk(
                  color: _muted,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Need guidance? Or structure?',
                style: GoogleFonts.spaceGrotesk(
                  color: _white,
                  fontSize: titleSize,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Two focused paths built for different learning styles. Both connect to the same rank engine.',
                style: GoogleFonts.inter(
                  color: _muted,
                  fontSize: isMobile ? 13 : 14,
                  height: 1.65,
                ),
              ),
              SizedBox(height: isMobile ? 28 : 40),

              // ── Cards ─────────────────────────────────────────────────
              if (isMobile)
                Column(
                  children: [aiCard, const SizedBox(height: 20), coursesCard],
                )
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: aiCard),
                    const SizedBox(width: 20),
                    Expanded(child: coursesCard),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}

// ── Path card ──────────────────────────────────────────────────────────────
class _PathCard extends StatefulWidget {
  final String tagLabel;
  final Color tagColor, tagBg, tagBorder;
  final List<Color> gradientColors;
  final String title, subtitle;
  final Color bulletColor;
  final List<String> bullets;
  final String ctaLabel;
  final Color ctaColor, ctaHoverColor, ctaTextColor, muted;
  final VoidCallback? onTap;

  const _PathCard({
    required this.tagLabel,
    required this.tagColor,
    required this.tagBg,
    required this.tagBorder,
    required this.gradientColors,
    required this.title,
    required this.subtitle,
    required this.bulletColor,
    required this.bullets,
    required this.ctaLabel,
    required this.ctaColor,
    required this.ctaHoverColor,
    required this.ctaTextColor,
    required this.muted,
    this.onTap,
  });

  @override
  State<_PathCard> createState() => _PathCardState();
}

class _PathCardState extends State<_PathCard> {
  bool _ctaHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: widget.gradientColors,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tag pill
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              color: widget.tagBg,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: widget.tagBorder),
            ),
            child: Text(
              widget.tagLabel,
              style: GoogleFonts.spaceGrotesk(
                color: widget.tagColor,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.4,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Title
          Text(
            widget.title,
            style: GoogleFonts.spaceGrotesk(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),

          // Subtitle
          Text(
            widget.subtitle,
            style: GoogleFonts.inter(
              color: widget.muted,
              fontSize: 13,
              fontStyle: FontStyle.italic,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),

          // Bullets
          ...widget.bullets.map(
            (b) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      '→',
                      style: TextStyle(
                        color: widget.bulletColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      b,
                      style: GoogleFonts.inter(
                        color: Colors.white.withOpacity(0.85),
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 28),

          // CTA button
          MouseRegion(
            onEnter: (_) => setState(() => _ctaHovered = true),
            onExit: (_) => setState(() => _ctaHovered = false),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: double.infinity,
              decoration: BoxDecoration(
                color: _ctaHovered ? widget.ctaHoverColor : widget.ctaColor,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: widget.ctaColor.withOpacity(
                      _ctaHovered ? 0.45 : 0.25,
                    ),
                    blurRadius: 20,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: TextButton(
                onPressed: widget.onTap,
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 15,
                  ),
                  shape: const StadiumBorder(),
                ),
                child: Text(
                  widget.ctaLabel,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.spaceGrotesk(
                    color: widget.ctaTextColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
