import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntelligentLearningSection extends StatelessWidget {
  IntelligentLearningSection({super.key});

  final Color navy = const Color(0xff1F2E4A);
  final Color navyLight = const Color(0xff253554);
  final Color navyCard = const Color(0xff1A2740);
  final Color navyDeep = const Color(0xff152035);
  final Color red = const Color(0xffE63946);
  final Color white = const Color(0xffFFFFFF);
  final Color muted = const Color(0xff8A9BB8);
  final Color cardBg = const Color(0xffF7F8FC);
  final Color cardBorder = const Color(0xffE4E8F0);
  final Color pageBg = const Color(0xffF0F2F8);

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

        final leftPanel = _LiveAiPanel(
          navy: navy,
          navyLight: navyLight,
          navyCard: navyCard,
          navyDeep: navyDeep,
          red: red,
          white: white,
          muted: muted,
        );

        final rightPanel = _RightColumn(
          navy: navy,
          navyDeep: navyDeep,
          navyLight: navyLight,
          red: red,
          white: white,
          muted: muted,
          cardBg: cardBg,
          cardBorder: cardBorder,
          isMobile: isMobile,
        );

        return Container(
          color: pageBg,
          padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
          child: Column(
            children: [
              _SectionHeader(
                red: red,
                navy: navy,
                muted: muted,
                isMobile: isMobile,
              ),
              SizedBox(height: isMobile ? 36 : 52),
              if (isMobile)
                Column(
                  children: [leftPanel, const SizedBox(height: 28), rightPanel],
                )
              else
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 5, child: leftPanel),
                    SizedBox(width: isTablet ? 20 : 28),
                    Expanded(flex: 5, child: rightPanel),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}

// ── Section header ─────────────────────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  final Color red, navy, muted;
  final bool isMobile;
  const _SectionHeader({
    required this.red,
    required this.navy,
    required this.muted,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final fontSize = isMobile ? 26.0 : 36.0;
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Not Just Practice — \n',
                style: GoogleFonts.merriweather(
                  color: navy,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w900,
                  height: 1.2,
                ),
              ),
              TextSpan(
                text: 'Intelligent Learning',
                style: GoogleFonts.merriweather(
                  color: red,
                  fontSize: fontSize,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        Text(
          'An AI engine that analyses every answer, identifies reasoning gaps, and builds a personalised path to your NEET target rank — updating continuously as you improve.',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            color: muted,
            fontSize: isMobile ? 13 : 15,
            height: 1.65,
          ),
        ),
      ],
    );
  }
}

// ── Live AI panel (left) ───────────────────────────────────────────────────
class _LiveAiPanel extends StatelessWidget {
  final Color navy, navyLight, navyCard, navyDeep, red, white, muted;
  const _LiveAiPanel({
    required this.navy,
    required this.navyLight,
    required this.navyCard,
    required this.navyDeep,
    required this.red,
    required this.white,
    required this.muted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [navy, navyDeep, const Color(0xff2A1535)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Live pill
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: red.withOpacity(0.2),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: red.withOpacity(0.4)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 7,
                  height: 7,
                  decoration: BoxDecoration(color: red, shape: BoxShape.circle),
                ),
                const SizedBox(width: 7),
                Text(
                  'LIVE AI REASONING',
                  style: GoogleFonts.spaceGrotesk(
                    color: red,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          _ChatLabel(label: 'YOU', muted: muted),
          const SizedBox(height: 6),
          _UserBubble(
            text:
                'A 45-year-old male presents with sudden chest pain radiating to the jaw. ECG shows ST elevation in V1–V4.',
            navyLight: navyLight,
            white: white,
          ),
          const SizedBox(height: 18),

          _ChatLabel(label: 'EMPOWERED AI', muted: muted),
          const SizedBox(height: 6),
          _AiBubble(
            richText: RichText(
              text: TextSpan(
                style: GoogleFonts.inter(
                  color: Colors.white70,
                  fontSize: 13,
                  height: 1.6,
                ),
                children: const [
                  TextSpan(text: 'This is '),
                  TextSpan(
                    text: 'anterior STEMI',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text:
                        '. Activate the cath lab. Aspirin 325mg + heparin. Target PCI within 90 minutes. Rule out dissection before thrombolytics.',
                  ),
                ],
              ),
            ),
            navyCard: navyCard,
          ),
          const SizedBox(height: 18),

          _ChatLabel(label: 'YOU', muted: muted),
          const SizedBox(height: 6),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: navyLight,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withOpacity(0.08)),
              ),
              child: Text(
                'What NEET PG question pattern does this map to?',
                style: GoogleFonts.inter(color: white, fontSize: 13),
              ),
            ),
          ),
          const SizedBox(height: 18),

          _ChatLabel(label: 'EMPOWERED AI', muted: muted),
          const SizedBox(height: 6),
          _AiBubble(
            richText: RichText(
              text: TextSpan(
                style: GoogleFonts.inter(
                  color: Colors.white70,
                  fontSize: 13,
                  height: 1.6,
                ),
                children: const [
                  TextSpan(
                    text: 'Type 2 clinical reasoning',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  TextSpan(
                    text:
                        ' — ECG diagnosis + management priority + contraindication identification. Want a similar practice case?',
                  ),
                ],
              ),
            ),
            navyCard: navyCard,
          ),
          const SizedBox(height: 28),

          Row(
            children: [
              Expanded(
                child: _StatChip(
                  value: '50K+',
                  label: 'Clinical Cases',
                  navyCard: navyCard,
                  white: white,
                  muted: muted,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _StatChip(
                  value: '98%',
                  label: 'Accuracy',
                  navyCard: navyCard,
                  white: white,
                  muted: muted,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _StatChip(
                  value: '24/7',
                  label: 'Always On',
                  navyCard: navyCard,
                  white: white,
                  muted: muted,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ChatLabel extends StatelessWidget {
  final String label;
  final Color muted;
  const _ChatLabel({required this.label, required this.muted});
  @override
  Widget build(BuildContext context) => Text(
    label,
    style: GoogleFonts.spaceGrotesk(
      color: muted,
      fontSize: 10,
      fontWeight: FontWeight.w700,
      letterSpacing: 1.3,
    ),
  );
}

class _UserBubble extends StatelessWidget {
  final String text;
  final Color navyLight, white;
  const _UserBubble({
    required this.text,
    required this.navyLight,
    required this.white,
  });
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    decoration: BoxDecoration(
      color: navyLight,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.white.withOpacity(0.08)),
    ),
    child: Text(
      text,
      style: GoogleFonts.inter(color: white, fontSize: 13, height: 1.6),
    ),
  );
}

class _AiBubble extends StatelessWidget {
  final RichText richText;
  final Color navyCard;
  const _AiBubble({required this.richText, required this.navyCard});
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    decoration: BoxDecoration(
      color: navyCard,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.white.withOpacity(0.05)),
    ),
    child: richText,
  );
}

class _StatChip extends StatelessWidget {
  final String value, label;
  final Color navyCard, white, muted;
  const _StatChip({
    required this.value,
    required this.label,
    required this.navyCard,
    required this.white,
    required this.muted,
  });
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
      color: navyCard,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        Text(
          value,
          style: GoogleFonts.spaceGrotesk(
            color: white,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: GoogleFonts.inter(color: muted, fontSize: 11)),
      ],
    ),
  );
}

// ── Right column ───────────────────────────────────────────────────────────
class _RightColumn extends StatelessWidget {
  final Color navy, navyDeep, navyLight, red, white, muted, cardBg, cardBorder;
  final bool isMobile;
  const _RightColumn({
    required this.navy,
    required this.navyDeep,
    required this.navyLight,
    required this.red,
    required this.white,
    required this.muted,
    required this.cardBg,
    required this.cardBorder,
    required this.isMobile,
  });

  _FeatureCard _card(String icon, Color iconBg, String title, String sub) =>
      _FeatureCard(
        icon: icon,
        iconBg: iconBg,
        title: title,
        sub: sub,
        cardBg: cardBg,
        cardBorder: cardBorder,
        navy: navy,
        muted: muted,
      );

  @override
  Widget build(BuildContext context) {
    final cards = [
      _card(
        '🧠',
        const Color(0xffFDE8EA),
        'Adaptive Learning',
        'Adjusts difficulty to your real level',
      ),
      _card(
        '🎯',
        const Color(0xffEAE8FD),
        'Weak Area Engine',
        'Targets exact chapters holding you back',
      ),
      _card(
        '📊',
        const Color(0xffE8F4FD),
        'Rank Prediction',
        'Real-time NEET rank estimate',
      ),
      _card(
        '🔄',
        const Color(0xffE8FDF0),
        'Continuous Updates',
        'Plan rebuilds after every test session',
      ),
    ];

    final aiProgram = _AiProgramCard(
      navy: navy,
      navyDeep: navyDeep,
      navyLight: navyLight,
      red: red,
      white: white,
      muted: muted,
    );

    if (isMobile) {
      // Single column — all 4 cards stacked
      return Column(
        children: [
          ...cards.map(
            (c) =>
                Padding(padding: const EdgeInsets.only(bottom: 12), child: c),
          ),
          const SizedBox(height: 4),
          aiProgram,
        ],
      );
    }

    // 2×2 grid for tablet/desktop
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: cards[0]),
            const SizedBox(width: 12),
            Expanded(child: cards[1]),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: cards[2]),
            const SizedBox(width: 12),
            Expanded(child: cards[3]),
          ],
        ),
        const SizedBox(height: 16),
        aiProgram,
      ],
    );
  }
}

// ── Feature card ───────────────────────────────────────────────────────────
class _FeatureCard extends StatefulWidget {
  final String icon, title, sub;
  final Color iconBg, cardBg, cardBorder, navy, muted;
  const _FeatureCard({
    required this.icon,
    required this.iconBg,
    required this.title,
    required this.sub,
    required this.cardBg,
    required this.cardBorder,
    required this.navy,
    required this.muted,
  });
  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: _hovered ? Colors.white : widget.cardBg,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: _hovered ? widget.navy.withOpacity(0.15) : widget.cardBorder,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: widget.iconBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(widget.icon, style: const TextStyle(fontSize: 18)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: GoogleFonts.spaceGrotesk(
                      color: widget.navy,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    widget.sub,
                    style: GoogleFonts.inter(
                      color: widget.muted,
                      fontSize: 11,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── AI Program card ────────────────────────────────────────────────────────
class _AiProgramCard extends StatefulWidget {
  final Color navy, navyDeep, navyLight, red, white, muted;
  const _AiProgramCard({
    required this.navy,
    required this.navyDeep,
    required this.navyLight,
    required this.red,
    required this.white,
    required this.muted,
  });
  @override
  State<_AiProgramCard> createState() => _AiProgramCardState();
}

class _AiProgramCardState extends State<_AiProgramCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [widget.navy, widget.navyDeep, const Color(0xff2A1535)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: widget.red.withOpacity(0.2),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: widget.red.withOpacity(0.35)),
            ),
            child: Text(
              'AI PROGRAM',
              style: GoogleFonts.spaceGrotesk(
                color: widget.red,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.4,
              ),
            ),
          ),
          const SizedBox(height: 16),

          Text(
            'EmpowerED AI Intelligence Platform',
            style: GoogleFonts.spaceGrotesk(
              color: widget.white,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Full clinical reasoning + adaptive question bank + rank tracking + AI personalised study path. The complete performance engine.',
            style: GoogleFonts.inter(
              color: widget.muted,
              fontSize: 13,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 18),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                ['NEET UG', 'NEET PG', 'Clinical Reasoning', 'Rank Engine']
                    .map(
                      (tag) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 7,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.07),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.12),
                          ),
                        ),
                        child: Text(
                          tag,
                          style: GoogleFonts.inter(
                            color: widget.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),
          const SizedBox(height: 22),

          MouseRegion(
            onEnter: (_) => setState(() => _hovered = true),
            onExit: (_) => setState(() => _hovered = false),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              decoration: BoxDecoration(
                color: _hovered ? const Color(0xffC8303A) : widget.red,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: widget.red.withOpacity(_hovered ? 0.45 : 0.25),
                    blurRadius: 20,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26,
                    vertical: 14,
                  ),
                  shape: const StadiumBorder(),
                ),
                child: Text(
                  'Explore AI Programs →',
                  style: GoogleFonts.spaceGrotesk(
                    color: widget.white,
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
