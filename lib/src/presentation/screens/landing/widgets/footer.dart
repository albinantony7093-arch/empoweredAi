import 'package:flutter/material.dart';

class EmpoweredFooter extends StatelessWidget {
  const EmpoweredFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 900;
    final isMid = width > 600;

    return Container(
      width: double.infinity,
      color: const Color(0xFF0F1C36),
      child: Stack(
        children: [
          // Dot grid texture
          Positioned.fill(child: CustomPaint(painter: _DotGridPainter())),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Main footer content ──────────────────────────────
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isWide
                      ? 64
                      : isMid
                      ? 36
                      : 20,
                  vertical: isWide ? 56 : 40,
                ),
                child: isWide
                    ? _WideLayout()
                    : isMid
                    ? _MidLayout()
                    : _NarrowLayout(),
              ),

              // ── Divider ──────────────────────────────────────────
              Divider(
                color: Colors.white.withOpacity(0.1),
                height: 1,
                thickness: 1,
              ),

              // ── Bottom bar ───────────────────────────────────────
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isWide
                      ? 64
                      : isMid
                      ? 36
                      : 20,
                  vertical: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '© 2025 EmpowerED Academy · Red Cross Academy, Kottayam',
                      style: TextStyle(
                        color: Color(0xFF4A6080),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    if (isWide)
                      const Text(
                        'Performance + Mind + Rank',
                        style: TextStyle(
                          color: Color(0xFF4A6080),
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),

          // ── Floating CTA button (bottom-right) ───────────────────
          // Positioned(
          //   bottom: 12,
          //   right: isWide
          //       ? 64
          //       : isMid
          //       ? 36
          //       : 16,
          //   child: const _FloatingCTA(),
          // ),
        ],
      ),
    );
  }
}

// ─── Wide Layout (> 900px) ────────────────────────────────────────────────────
class _WideLayout extends StatelessWidget {
  const _WideLayout();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Brand column — takes more space
        const Expanded(flex: 3, child: _BrandColumn()),
        const SizedBox(width: 40),
        // Link columns
        Expanded(
          flex: 7,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(
                child: _LinkColumn(
                  title: 'PLATFORM',
                  links: [
                    'Free Diagnostic Test',
                    'Calm Corner',
                    'Wellness Hub',
                    'AI Programs',
                    'Courses',
                  ],
                ),
              ),
              Expanded(
                child: _LinkColumn(
                  title: 'RESOURCES',
                  links: [
                    'NEET UG Revision Kit',
                    'NEET PG Clinical Cases',
                    'Mock Tests',
                    'Rank Tracker',
                  ],
                ),
              ),
              Expanded(
                child: _LinkColumn(
                  title: 'ACADEMY',
                  links: [
                    'About EmpowerED',
                    'Contact & Support',
                    'Faculty',
                    'Scholarships',
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── Mid Layout (600–900px) ───────────────────────────────────────────────────
class _MidLayout extends StatelessWidget {
  const _MidLayout();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _BrandColumn(),
        const SizedBox(height: 40),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(
              child: _LinkColumn(
                title: 'PLATFORM',
                links: [
                  'Free Diagnostic Test',
                  'Calm Corner',
                  'Wellness Hub',
                  'AI Programs',
                  'Courses',
                ],
              ),
            ),
            Expanded(
              child: _LinkColumn(
                title: 'RESOURCES',
                links: [
                  'NEET UG Revision Kit',
                  'NEET PG Clinical Cases',
                  'Mock Tests',
                  'Rank Tracker',
                ],
              ),
            ),
            Expanded(
              child: _LinkColumn(
                title: 'ACADEMY',
                links: [
                  'About EmpowerED',
                  'Contact & Support',
                  'Faculty',
                  'Scholarships',
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ─── Narrow Layout (< 600px) ──────────────────────────────────────────────────
class _NarrowLayout extends StatelessWidget {
  const _NarrowLayout();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _BrandColumn(),
        SizedBox(height: 36),
        _LinkColumn(
          title: 'PLATFORM',
          links: [
            'Free Diagnostic Test',
            'Calm Corner',
            'Wellness Hub',
            'AI Programs',
            'Courses',
          ],
        ),
        SizedBox(height: 28),
        _LinkColumn(
          title: 'RESOURCES',
          links: [
            'NEET UG Revision Kit',
            'NEET PG Clinical Cases',
            'Mock Tests',
            'Rank Tracker',
          ],
        ),
        SizedBox(height: 28),
        _LinkColumn(
          title: 'ACADEMY',
          links: [
            'About EmpowerED',
            'Contact & Support',
            'Faculty',
            'Scholarships',
          ],
        ),
      ],
    );
  }
}

// ─── Brand Column ─────────────────────────────────────────────────────────────
class _BrandColumn extends StatelessWidget {
  const _BrandColumn();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo icon — red tent/mountain
        Container(
          width: 40,
          height: 36,
          child: CustomPaint(painter: _TentIconPainter()),
        ),

        const SizedBox(height: 14),

        const Text(
          'EMPOWERED ACADEMY',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13.5,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.8,
          ),
        ),

        const SizedBox(height: 12),

        const Text(
          'Performance + Mind + Rank Platform for\nNEET UG & PG aspirants. Powered by Red\nCross Academy, Kottayam, Kerala.',
          style: TextStyle(
            color: Color(0xFF6A85A8),
            fontSize: 13,
            height: 1.65,
            fontWeight: FontWeight.w400,
          ),
        ),

        const SizedBox(height: 18),

        // Contact
        RichText(
          text: const TextSpan(
            style: TextStyle(
              color: Color(0xFF6A85A8),
              fontSize: 12.5,
              height: 1.5,
            ),
            children: [
              TextSpan(text: 'iCall India: '),
              TextSpan(
                text: '9152987821',
                style: TextStyle(color: Color(0xFF8AAAC8)),
              ),
              TextSpan(text: '  ·  Vandrevala Foundation: '),
              TextSpan(
                text: '1860-2662-345',
                style: TextStyle(color: Color(0xFF8AAAC8)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── Link Column ──────────────────────────────────────────────────────────────
class _LinkColumn extends StatelessWidget {
  final String title;
  final List<String> links;

  const _LinkColumn({required this.title, required this.links});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 18),
        ...links.map(
          (link) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                link,
                style: const TextStyle(
                  color: Color(0xFF7A96B8),
                  fontSize: 13.5,
                  fontWeight: FontWeight.w400,
                  height: 1.4,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Floating CTA Button ──────────────────────────────────────────────────────
class _FloatingCTA extends StatelessWidget {
  const _FloatingCTA();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE8192C),
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE8192C).withOpacity(0.45),
            blurRadius: 20,
            spreadRadius: 0,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(50),
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Take Free Diagnostic →',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Dot Grid Painter ─────────────────────────────────────────────────────────
class _DotGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.03)
      ..style = PaintingStyle.fill;
    const spacing = 28.0;
    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 1.2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DotGridPainter old) => false;
}

// ─── Tent / Logo Icon Painter ─────────────────────────────────────────────────
class _TentIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFE8192C)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width * 0.5, 0) // apex
      ..lineTo(size.width, size.height) // bottom-right
      ..lineTo(0, size.height) // bottom-left
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_TentIconPainter old) => false;
}
