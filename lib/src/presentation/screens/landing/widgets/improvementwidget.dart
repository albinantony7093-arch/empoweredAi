import 'package:flutter/material.dart';

class ImprovementJourneyHero extends StatelessWidget {
  const ImprovementJourneyHero({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 700;
    final isMid = width > 480;

    final headlineFontSize = isWide
        ? 52.0
        : isMid
        ? 40.0
        : 30.0;
    final subFontSize = isWide ? 16.0 : 14.5;
    final vPad = isWide
        ? 90.0
        : isMid
        ? 70.0
        : 52.0;
    final hPad = isWide
        ? 64.0
        : isMid
        ? 36.0
        : 20.0;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0D1B35),
            Color(0xFF162444),
            Color(0xFF1C2E58),
            Color(0xFF142038),
          ],
          stops: [0.0, 0.3, 0.65, 1.0],
        ),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          // Magenta glow blob
          Positioned(
            top: -80,
            child: Container(
              width: isWide ? 520 : 260,
              height: isWide ? 320 : 200,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFFBB2070).withOpacity(0.38),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Blue accent blob
          Positioned(
            bottom: -20,
            right: 20,
            child: Container(
              width: 180,
              height: 140,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF1565C0).withOpacity(0.2),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Dot-grid texture
          Positioned.fill(child: CustomPaint(painter: _DotGridPainter())),

          // Main content
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Eyebrow chip
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF5272).withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFFFF5272).withOpacity(0.35),
                    width: 1,
                  ),
                ),
                child: const Text(
                  '✦  Free to start — no signup required',
                  style: TextStyle(
                    color: Color(0xFFFF8A99),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.4,
                  ),
                ),
              ),

              SizedBox(height: isWide ? 28 : 20),

              // Headline
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: 'Georgia',
                    fontSize: headlineFontSize,
                    fontWeight: FontWeight.w900,
                    height: 1.18,
                    letterSpacing: -0.5,
                  ),
                  children: const [
                    TextSpan(
                      text: 'Start Your ',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextSpan(
                      text: 'Improvement',
                      style: TextStyle(
                        color: Color(0xFFFF7080),
                        shadows: [
                          Shadow(color: Color(0xFFFF3055), blurRadius: 28),
                        ],
                      ),
                    ),
                    TextSpan(
                      text: '\nJourney Today',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),

              SizedBox(height: isWide ? 22 : 16),

              // Subtext
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480),
                child: Text(
                  'Start with a free test. See your rank. Improve with clarity.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF90A4C0),
                    fontSize: subFontSize,
                    height: 1.6,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.1,
                  ),
                ),
              ),

              SizedBox(height: isWide ? 44 : 36),

              // ── Buttons ──────────────────────────────────────────
              width > 520
                  ? IntrinsicHeight(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _PrimaryBtn(isWide: isWide),
                          const SizedBox(width: 14),
                          _SecondaryBtn(isWide: isWide),
                        ],
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _PrimaryBtn(isWide: isWide, fullWidth: true),
                        const SizedBox(height: 12),
                        _SecondaryBtn(isWide: isWide, fullWidth: true),
                      ],
                    ),

              SizedBox(height: isWide ? 36 : 28),

              // Trust row
              Wrap(
                alignment: WrapAlignment.center,
                spacing: isWide ? 28 : 16,
                runSpacing: 8,
                children: const [
                  _TrustBadge(
                    icon: Icons.people_alt_outlined,
                    label: '50K+ students',
                  ),
                  _TrustBadge(icon: Icons.star_rounded, label: '4.9 rated'),
                  _TrustBadge(
                    icon: Icons.verified_outlined,
                    label: 'Expert-verified',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── Primary Button ────────────────────────────────────────────────────────────
class _PrimaryBtn extends StatelessWidget {
  final bool isWide;
  final bool fullWidth;
  const _PrimaryBtn({required this.isWide, this.fullWidth = false});

  @override
  Widget build(BuildContext context) {
    return _HeroButton(
      fullWidth: fullWidth,
      backgroundColor: Colors.white,
      borderColor: Colors.white,
      borderWidth: 2.0,
      shadow: BoxShadow(
        color: const Color(0xFFFF3055).withOpacity(0.28),
        blurRadius: 24,
        spreadRadius: 0,
        offset: const Offset(0, 8),
      ),
      onTap: () {},
      child: Row(
        mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Vivid red dot with glow ring
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: const Color(0xFFEE1133),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFEE1133).withOpacity(0.5),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'Take Free Diagnostic Test',
            style: TextStyle(
              color: const Color(0xFF0D1B35),
              fontSize: isWide ? 15.5 : 14.0,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Secondary Button ──────────────────────────────────────────────────────────
class _SecondaryBtn extends StatelessWidget {
  final bool isWide;
  final bool fullWidth;
  const _SecondaryBtn({required this.isWide, this.fullWidth = false});

  @override
  Widget build(BuildContext context) {
    return _HeroButton(
      fullWidth: fullWidth,
      backgroundColor: const Color(0xFF1A2E52),
      borderColor: const Color(0xFF3A5080),
      borderWidth: 1.5,
      onTap: () {},
      child: Row(
        mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Muted grey dot — matches the original
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: const Color(0xFF7A92B8),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF9AAFCC), width: 1),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'Explore Programs →',
            style: TextStyle(
              color: const Color(0xFFCCD8EE),
              fontSize: isWide ? 15.5 : 14.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Shared Button Shell ───────────────────────────────────────────────────────
class _HeroButton extends StatelessWidget {
  final Widget child;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final BoxShadow? shadow;
  final VoidCallback onTap;
  final bool fullWidth;

  const _HeroButton({
    required this.child,
    required this.backgroundColor,
    required this.borderColor,
    required this.borderWidth,
    required this.onTap,
    this.shadow,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget btn = Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(14), // <— rounded rect, not pill
        border: Border.all(color: borderColor, width: borderWidth),
        boxShadow: shadow != null ? [shadow!] : [],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          splashColor: Colors.white.withOpacity(0.08),
          highlightColor: Colors.white.withOpacity(0.04),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
            child: child,
          ),
        ),
      ),
    );

    return fullWidth ? SizedBox(width: double.infinity, child: btn) : btn;
  }
}

// ─── Trust Badge ───────────────────────────────────────────────────────────────
class _TrustBadge extends StatelessWidget {
  final IconData icon;
  final String label;
  const _TrustBadge({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: const Color(0xFF6A85B0), size: 15),
        const SizedBox(width: 5),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF6A85B0),
            fontSize: 12.5,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

// ─── Dot Grid Painter ──────────────────────────────────────────────────────────
class _DotGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.04)
      ..style = PaintingStyle.fill;

    const spacing = 28.0;
    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 1.2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DotGridPainter oldDelegate) => false;
}
