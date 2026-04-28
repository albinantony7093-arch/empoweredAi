import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String description;
  final int totalQuestions;
  final String duration;
  final bool hasNegativeMarking;
  final bool allSubjectsIncluded;
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
    this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Row(
          children: [
            Container(
              width: 5,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),

            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// TOP CONTENT
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Text(
                            title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Color(0xff2F3850),
                            ),
                          ),

                          const SizedBox(height: 6),

                          // Description
                          Text(
                            description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color(0xff999BA1),
                            ),
                          ),

                          const SizedBox(height: 10),

                          // Chips
                          Wrap(
                            spacing: 6,
                            runSpacing: 6,
                            children: [
                              _chip('$totalQuestions Questions'),
                              _chip(duration),
                              if (hasNegativeMarking) _chip('Negative Marking'),
                              if (allSubjectsIncluded) _chip('All Subjects'),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: onStart,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 10,
                                  ),
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  'Enroll now',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    /// BUTTON (fixed at bottom)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xffF2F4F6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w600,
          fontSize: 12,
          color: Color(0xff9A9DA3),
        ),
      ),
    );
  }
}
