import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String description;
  final int totalQuestions;
  final String duration;
  final bool hasNegativeMarking;
  final bool allSubjectsIncluded;
  final bool isEnrolled;
  final Color accentColor;
  final VoidCallback? onStart;

  const CourseCard({
    super.key,
    required this.title,
    required this.description,
    required this.totalQuestions,
    required this.duration,
    required this.accentColor,
    this.hasNegativeMarking = true,
    this.allSubjectsIncluded = true,
    this.isEnrolled = false,
    this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          /// LEFT ACCENT BAR
          Container(
            width: 4,
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
          ),

          /// CONTENT
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(isMobile ? 10 : 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // 👈 tight layout
                children: [
                  /// TOP CONTENT
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// TITLE
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: isMobile ? 15 : 16,
                          color: const Color(0xff2F3850),
                        ),
                      ),

                      const SizedBox(height: 4),

                      /// DESCRIPTION
                      Text(
                        description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: isMobile ? 10 : 11,
                          color: const Color(0xff999BA1),
                        ),
                      ),

                      const SizedBox(height: 6),

                      /// CHIPS
                      Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: [
                          _chip('$totalQuestions Q'),
                          _chip(duration),
                          if (hasNegativeMarking) _chip('Neg'),
                          if (allSubjectsIncluded) _chip('All'),
                        ],
                      ),
                    ],
                  ),

                  /// ACTION
                  Align(
                    alignment: Alignment.centerRight,
                    child: isEnrolled
                        ? _enrolledBadge()
                        : ElevatedButton(
                            onPressed: onStart,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              padding: EdgeInsets.symmetric(
                                horizontal: isMobile ? 10 : 12,
                                vertical: 6,
                              ),
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Text(
                              'Enroll',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: isMobile ? 11 : 12,
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _enrolledBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.check_circle, size: 14, color: Color(0xFF010029)),
          SizedBox(width: 4),
          Text(
            "Enrolled",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Color(0xFF010029),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xffF2F4F6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 10,
          color: const Color(0xff9A9DA3),
        ),
      ),
    );
  }
}
