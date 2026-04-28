import 'package:empowered_ai/src/presentation/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const _kNavBg = Color(0xFF010029);
const _kNavBgHover = Color(0xFF243156);
const _kAccent = Color(0xFFE8303A);
const _kTextPrimary = Color(0xFFFFFFFF);
const _kTextMuted = Color(0xFF8B9CC4);

class ResponsiveTopBar extends StatelessWidget {
  const ResponsiveTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<HomeController>();

    return Obx(() {
      final isOpen = ctrl.isMenuOpen.value;

      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: isOpen ? 240 : 68,
        decoration: const BoxDecoration(
          color: _kNavBg,
          border: Border(right: BorderSide(color: Color(0xFF2D3F6B), width: 1)),
        ),
        child: ClipRect(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SidebarHeader(isOpen: isOpen, onToggle: ctrl.toggleMenu),

              const SizedBox(height: 8),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Divider(color: Color(0xFF2D3F6B), height: 1),
              ),

              const SizedBox(height: 12),

              Obx(
                () => _MenuItem(
                  icon: Icons.home,
                  label: "Home",
                  isOpen: isOpen,
                  isActive: ctrl.currentIndex.value == 0,
                  onTap: () => ctrl.currentIndex.value = 0,
                ),
              ),

              Obx(
                () => _MenuItem(
                  icon: Icons.assignment_rounded,
                  label: "Dashboard",
                  isOpen: isOpen,
                  isActive: ctrl.currentIndex.value == 1,
                  onTap: () => ctrl.currentIndex.value = 1,
                ),
              ),

              Obx(
                () => _MenuItem(
                  icon: Icons.quiz,
                  label: "Exams",
                  isOpen: isOpen,
                  isActive: ctrl.currentIndex.value == 2,
                  onTap: () => ctrl.currentIndex.value = 2,
                ),
              ),

              Obx(
                () => _MenuItem(
                  icon: Icons.self_improvement_rounded,
                  label: "Calm Corner",
                  isOpen: isOpen,
                  isActive: ctrl.currentIndex.value == 3,
                  onTap: () => ctrl.currentIndex.value = 3,
                ),
              ),

              Obx(
                () => _MenuItem(
                  icon: Icons.person_rounded,
                  label: "Profile",
                  isOpen: isOpen,
                  isActive: ctrl.currentIndex.value == 4,
                  onTap: () => ctrl.currentIndex.value = 4,
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      );
    });
  }
}

class _SidebarHeader extends StatelessWidget {
  const _SidebarHeader({required this.isOpen, required this.onToggle});

  final bool isOpen;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: isOpen
            ? Row(
                key: const ValueKey('open'),
                children: [
                  const SizedBox(width: 10),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: _kAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.add, color: Colors.white, size: 20),
                  ),
                  const SizedBox(width: 10),
                  // Expanded absorbs remaining space — never overflows
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "EmpowerED",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: _kTextPrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.2,
                          ),
                        ),
                        Text(
                          "RED CROSS ACADEMY",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: _kTextMuted,
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Toggle fixed width — never squished
                  IconButton(
                    tooltip: "Collapse",
                    icon: const Icon(
                      Icons.keyboard_double_arrow_left_rounded,
                      color: _kTextMuted,
                      size: 20,
                    ),
                    onPressed: onToggle,
                  ),
                ],
              )
            : Center(
                key: const ValueKey('closed'),
                child: IconButton(
                  tooltip: "Expand",
                  icon: const Icon(
                    Icons.keyboard_double_arrow_right_rounded,
                    color: _kTextMuted,
                    size: 20,
                  ),
                  onPressed: onToggle,
                ),
              ),
      ),
    );
  }
}

// ── Single nav item ───────────────────────────────────────────────────────────
class _MenuItem extends StatelessWidget {
  const _MenuItem({
    required this.icon,
    required this.label,
    required this.isOpen,
    required this.isActive,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isOpen;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          hoverColor: _kNavBgHover,
          splashColor: _kAccent.withOpacity(0.15),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: isActive ? _kNavBgHover : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: isActive
                  ? Border.all(color: _kAccent.withOpacity(0.25), width: 1)
                  : null,
            ),
            child: ClipRect(
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  // Active indicator bar
                  Positioned(
                    left: 0,
                    top: 8,
                    bottom: 8,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 3,
                      decoration: BoxDecoration(
                        color: isActive ? _kAccent : Colors.transparent,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 11,
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: isOpen
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.center,
                      children: [
                        Icon(
                          icon,
                          size: 20,
                          color: isActive ? _kAccent : _kTextMuted,
                        ),

                        AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: isOpen
                              ? Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(width: 12),
                                    Text(
                                      label,
                                      style: TextStyle(
                                        color: isActive
                                            ? _kTextPrimary
                                            : _kTextMuted,
                                        fontSize: 13,
                                        fontWeight: isActive
                                            ? FontWeight.w600
                                            : FontWeight.w400,
                                        letterSpacing: 0.1,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
