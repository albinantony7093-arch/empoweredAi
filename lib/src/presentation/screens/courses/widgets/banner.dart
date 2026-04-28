import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 5, child: _LeftContent()),
            const SizedBox(width: 16),

            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(left: 18, top: 32, right: 18),
                child: const _ImageCard(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ── Badge ────────────────────────────────────────────────────────────────────

class _NewCoursesBadge extends StatelessWidget {
  const _NewCoursesBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Color(0xffDEE8FF),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Color(0xff994700),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            'New Courses Available',
            style: GoogleFonts.lexend(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: Color(0xff003D9B),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Left Content ─────────────────────────────────────────────────────────────

class _LeftContent extends StatelessWidget {
  const _LeftContent();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _NewCoursesBadge(),
          SizedBox(height: 18),

          RichText(
            text: TextSpan(
              style: GoogleFonts.lexend(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                height: 46.44 / 37.15, // convert line-height
                letterSpacing: -0.74,
                color: const Color(0xFF111C2D),
              ),
              children: [
                const TextSpan(text: 'Unlock Your\nPotential with '),
                TextSpan(
                  text: 'Expert-Led',
                  style: GoogleFonts.lexend(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    height: 1.0, // line-height: 100%
                    letterSpacing: 0,
                    color: const Color(0xFF2563EB),
                  ),
                ),
                const TextSpan(text: ' Courses'),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Subtitle
          Text(
            'Join a global community of learners and master new skills with interactive lessons designed by industry professionals.',
            style: GoogleFonts.lexend(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.0, // line-height: 100%
              letterSpacing: 0.3,
              color: const Color(0xff434654),
            ),
          ),
          const SizedBox(height: 20),

          // Search bar
          // const _SearchBar(),
          const SizedBox(height: 20),

          // Social proof
          const _SocialProof(),
        ],
      ),
    );
  }
}

// ── Search Bar ───────────────────────────────────────────────────────────────

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Input field
        Expanded(
          child: Container(
            height: 46,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE5E7EB)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Row(
              children: [
                SizedBox(width: 12),
                Icon(Icons.search, size: 18, color: Color(0xFF9CA3AF)),
                SizedBox(width: 8),
                Text(
                  'What do you want to learn?',
                  style: TextStyle(fontSize: 12.5, color: Color(0xFF9CA3AF)),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),

        // CTA button
        Container(
          height: 46,
          decoration: BoxDecoration(
            color: const Color(0xFF2563EB),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF2563EB).withOpacity(0.35),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextButton.icon(
            onPressed: () {},
            icon: const Text(
              'Start Learning',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.5,
                fontWeight: FontWeight.w600,
              ),
            ),
            label: const Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
      ],
    );
  }
}

// ── Social Proof ─────────────────────────────────────────────────────────────

class _SocialProof extends StatelessWidget {
  const _SocialProof();

  static const List<Color> _avatarColors = [
    Color(0xFF60A5FA),
    Color(0xFF34D399),
    Color(0xFFF472B6),
    Color(0xFFFBBF24),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Stacked avatars
        SizedBox(
          width: 76,
          height: 34,
          child: Stack(
            children: [
              for (int i = 0; i < 3; i++)
                Positioned(
                  left: i * 18.0,
                  child: _Avatar(color: _avatarColors[i], index: i),
                ),
              Positioned(
                left: 3 * 18.0,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xff994700),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Center(
                    child: Text(
                      '+5k',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '10,000+',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: Color(0xFF111827),
              ),
            ),
            Text(
              'Active Students Worldwide',
              style: TextStyle(fontSize: 11.5, color: Color(0xFF6B7280)),
            ),
          ],
        ),
      ],
    );
  }
}

class _Avatar extends StatelessWidget {
  final Color color;
  final int index;
  const _Avatar({required this.color, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Center(
        child: Icon(
          Icons.person,
          size: 16,
          color: Colors.white.withOpacity(0.9),
        ),
      ),
    );
  }
}

class _ImageCard extends StatelessWidget {
  const _ImageCard();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 260,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/images/students.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 260,
            ),
          ),
        ),
      ],
    );
  }
}

// ── Achievement Badge ─────────────────────────────────────────────────────────

class _AchievementBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: const Color(0xFFFEF3C7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text('🏆', style: TextStyle(fontSize: 18)),
            ),
          ),
          const SizedBox(width: 8),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Achievement',
                style: TextStyle(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF374151),
                ),
              ),
              Text(
                'Skill',
                style: TextStyle(fontSize: 10, color: Color(0xFF9CA3AF)),
              ),
              SizedBox(height: 1),
              Text(
                'Mastered! 🎉',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2563EB),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
