import 'dart:developer';

import 'package:empowered_ai/src/presentation/screens/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ResponsiveNavBar extends StatefulWidget {
  final ScrollController scrollController;
  final GlobalKey howItWorksKey;
  final GlobalKey aiEngineKey;
  final GlobalKey calmKey;
  final GlobalKey programsKey;
  final GlobalKey coursesKey;

  const ResponsiveNavBar({
    super.key,
    required this.scrollController,
    required this.howItWorksKey,
    required this.aiEngineKey,
    required this.calmKey,
    required this.programsKey,
    required this.coursesKey,
  });

  @override
  State<ResponsiveNavBar> createState() => _ResponsiveNavBarState();
}

class _ResponsiveNavBarState extends State<ResponsiveNavBar> {
  final Color red = Colors.red;
  bool _isMenuOpen = false;

  void scrollTo(GlobalKey key) {
    final context = key.currentContext;

    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
        alignment: 0,
      );
    } else {
      log("context gets null");
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        final isTablet =
            constraints.maxWidth >= 600 && constraints.maxWidth < 1024;
        final isDesktop = constraints.maxWidth >= 1024;

        return Column(
          children: [
            Container(
              height: isMobile ? 64 : 80,
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : (isTablet ? 24 : 50),
              ),
              child: Row(
                children: [
                  _buildLogo(isMobile),
                  const Spacer(),

                  /// Desktop
                  if (isDesktop) ...[
                    _buildDesktopNav(),
                    const SizedBox(width: 20),
                    _buildCTAButton(),
                  ]
                  /// Tablet
                  else if (isTablet) ...[
                    _buildTabletNav(),
                    const SizedBox(width: 12),
                    _buildCTAButton(compact: true),
                  ]
                  /// Mobile
                  else ...[
                    _buildCTAButton(compact: true),
                    const SizedBox(width: 8),
                    _buildMenuButton(),
                  ],
                ],
              ),
            ),

            /// Mobile Menu
            if (isMobile && _isMenuOpen) _buildMobileMenu(),
          ],
        );
      },
    );
  }

  Widget _buildLogo(bool compact) {
    return Row(
      children: [
        Icon(Icons.favorite, color: red),
        const SizedBox(width: 10),
        Text(
          "EmpowerED",
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.w700,
            fontSize: compact ? 18 : 20,
          ),
        ),
      ],
    );
  }

  /// Desktop Nav
  Widget _buildDesktopNav() {
    return Flexible(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _navItem("How It Works", () {
              scrollTo(widget.howItWorksKey);
            }),
            _navItem("AI Engine", () {
              scrollTo(widget.aiEngineKey);
            }),
            _navItem("Calm Corner", () {
              scrollTo(widget.calmKey);
            }),
            _navItem("Programs", () {
              scrollTo(widget.programsKey);
            }),
            _navItem("Courses", () {
              // scrollTo(widget.coursesKey);
            }),
          ],
        ),
      ),
    );
  }

  /// Tablet Nav
  Widget _buildTabletNav() {
    return _buildDesktopNav();
  }

  /// Mobile Menu
  Widget _buildMobileMenu() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      color: Colors.white,
      child: Column(
        children: [
          _mobileItem("How It Works", widget.howItWorksKey),
          _mobileItem("AI Engine", widget.aiEngineKey),
          _mobileItem("Calm Corner", widget.calmKey),
          _mobileItem("Programs", widget.programsKey),
          _mobileItem("Courses", widget.coursesKey),
        ],
      ),
    );
  }

  Widget _mobileItem(String text, GlobalKey key) {
    return ListTile(
      title: Text(text),
      onTap: () {
        setState(() => _isMenuOpen = false);
        scrollTo(key);
      },
    );
  }

  Widget _navItem(String label, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          label,
          style: GoogleFonts.outfit(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildCTAButton({bool compact = false}) {
    return GestureDetector(
      onTap: () {
        Get.to(() => Auth());
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: compact ? 12 : 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: red,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          "Login →",
          style: GoogleFonts.outfit(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton() {
    return IconButton(
      icon: Icon(_isMenuOpen ? Icons.close : Icons.menu),
      onPressed: () {
        setState(() {
          _isMenuOpen = !_isMenuOpen;
        });
      },
    );
  }
}
