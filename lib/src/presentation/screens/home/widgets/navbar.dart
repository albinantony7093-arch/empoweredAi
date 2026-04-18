import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResponsiveNavBar extends StatefulWidget {
  const ResponsiveNavBar({super.key});
  @override
  State<ResponsiveNavBar> createState() => _ResponsiveNavBarState();
}

class _ResponsiveNavBarState extends State<ResponsiveNavBar> {
  final Color red = Colors.red;
  bool _isMenuOpen = false;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Breakpoints
        final isMobile = constraints.maxWidth < 600;
        final isTablet =
            constraints.maxWidth >= 600 && constraints.maxWidth < 1024;
        final isDesktop = constraints.maxWidth >= 1024;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: isMobile ? 64 : 80,
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : (isTablet ? 24 : 50),
              ),
              child: Row(
                children: [
                  // LOGO
                  _buildLogo(isMobile),
                  const Spacer(),
                  // Desktop: Full nav items
                  if (isDesktop) ...[
                    _buildDesktopNav(),
                    const SizedBox(width: 24),
                    _buildCTAButton(),
                  ]
                  // Tablet: Condensed nav + CTA
                  else if (isTablet) ...[
                    _buildTabletNav(),
                    const SizedBox(width: 16),
                    _buildCTAButton(compact: true),
                  ]
                  // Mobile: Hamburger menu
                  else ...[
                    _buildCTAButton(compact: true),
                    const SizedBox(width: 8),
                    _buildMenuButton(),
                  ],
                ],
              ),
            ),
            // Mobile dropdown menu
            if (isMobile && _isMenuOpen) _buildMobileMenu(),
          ],
        );
      },
    );
  }

  Widget _buildLogo(bool compact) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.favorite, color: red, size: compact ? 24 : 28),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "EmpowerED",
              style: GoogleFonts.outfit(
                fontWeight: FontWeight.w700,
                fontSize: compact ? 16 : 20,
              ),
            ),
            Text(
              "RED CROSS ACADEMY · KOTTAYAM",
              style: GoogleFonts.dmMono(fontSize: compact ? 8 : 10),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDesktopNav() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _navItem("How It Works"),
        _navItem("AI Engine"),
        _navItem("Calm Corner"),
        _navItem("Programs"),
      ],
    );
  }

  Widget _buildTabletNav() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _navItem("How It Works", compact: true),
        _navItem("AI Engine", compact: true),
        _navItem("Programs", compact: true),
      ],
    );
  }

  Widget _buildMobileMenu() {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          _mobileNavItem("How It Works"),
          _mobileNavItem("AI Engine"),
          _mobileNavItem("Calm Corner"),
          _mobileNavItem("Programs"),
        ],
      ),
    );
  }

  Widget _navItem(String label, {bool compact = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: compact ? 8 : 16),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: compact ? 8 : 12,
            vertical: 8,
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.outfit(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
            fontSize: compact ? 13 : 14,
          ),
        ),
      ),
    );
  }

  Widget _mobileNavItem(String label) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          setState(() => _isMenuOpen = false);
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: GoogleFonts.outfit(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCTAButton({bool compact = false}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: compact ? 12 : 20,
          vertical: compact ? 8 : 12,
        ),
        decoration: BoxDecoration(
          color: red,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          compact ? "Start" : "Start Free →",
          style: GoogleFonts.outfit(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: compact ? 13 : 14,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton() {
    return IconButton(
      icon: Icon(_isMenuOpen ? Icons.close : Icons.menu, color: Colors.black87),
      onPressed: () => setState(() => _isMenuOpen = !_isMenuOpen),
    );
  }
}
