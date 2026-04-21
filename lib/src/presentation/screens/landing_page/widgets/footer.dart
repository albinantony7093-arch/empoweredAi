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
          Positioned.fill(child: CustomPaint(painter: _DotGridPainter())),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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

              Divider(
                color: Colors.white.withOpacity(0.1),
                height: 1,
                thickness: 1,
              ),

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
        ],
      ),
    );
  }
}

class _WideLayout extends StatelessWidget {
  const _WideLayout();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(flex: 3, child: _BrandColumn()),
        const SizedBox(width: 40),

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

class _BrandColumn extends StatelessWidget {
  const _BrandColumn();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 52,
          height: 52,
          child: Image.asset(
            'assets/images/logo.png',
            scale: 1,
            fit: BoxFit.cover,
          ),
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
