import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeakAreasWidget extends StatefulWidget {
  final List<String> weakAreas;

  const WeakAreasWidget({super.key, required this.weakAreas});

  @override
  State<WeakAreasWidget> createState() => _WeakAreasWidgetState();
}

class _WeakAreasWidgetState extends State<WeakAreasWidget>
    with SingleTickerProviderStateMixin {
  static const int _previewCount = 5;
  bool _expanded = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() => _expanded = !_expanded);
    if (_expanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  String formatText(String text) {
    return text
        .replaceAll("_", " ")
        .toLowerCase()
        .split(" ")
        .map((w) => w[0].toUpperCase() + w.substring(1))
        .join(" ");
  }

  @override
  Widget build(BuildContext context) {
    if (widget.weakAreas.isEmpty) {
      return const SizedBox.shrink();
    }

    final preview = widget.weakAreas.take(_previewCount).toList();
    final rest = widget.weakAreas.skip(_previewCount).toList();
    final hasMore = rest.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.warning_amber_rounded,
              color: Color(0xFFE8472A),
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'Weak Areas',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1A2341),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFEEEEEE)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: preview
                      .map((area) => _BulletItem(text: formatText(area)))
                      .toList(),
                ),
              ),
              if (hasMore) ...[
                SizeTransition(
                  sizeFactor: _animation,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: rest
                          .map((area) => _BulletItem(text: formatText(area)))
                          .toList(),
                    ),
                  ),
                ),
                InkWell(
                  onTap: _toggle,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(16),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(top: BorderSide(color: Color(0xFFF0F0F0))),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: Text(
                            _expanded
                                ? 'Show less'
                                : '+ ${rest.length} more topics',
                            key: ValueKey(_expanded),
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFE8472A),
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        AnimatedRotation(
                          turns: _expanded ? 0.5 : 0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          child: const Icon(
                            Icons.keyboard_arrow_down,
                            size: 16,
                            color: Color(0xFFE8472A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ] else
                const SizedBox(height: 8),
            ],
          ),
        ),
      ],
    );
  }
}

class _BulletItem extends StatelessWidget {
  final String text;

  const _BulletItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Color(0xFFE8472A),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF1A2341),
            ),
          ),
        ],
      ),
    );
  }
}
