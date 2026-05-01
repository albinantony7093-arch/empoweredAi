import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonalInfoCard extends StatelessWidget {
  final String fullName;
  final String email;
  final String phone;
  final String dob;
  final String gender;

  const PersonalInfoCard({
    super.key,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.dob,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Personal Information",
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: const Color(0xff111C2D),
            ),
          ),

          const SizedBox(height: 16),

          _infoField("Full Name", fullName),
          _infoField("Email Address", email),

          Row(
            children: [
              Expanded(child: _infoField("Phone", phone)),
              const SizedBox(width: 10),
              Expanded(child: _infoField("DOB", dob)),
            ],
          ),

          _infoField("Gender", gender),
        ],
      ),
    );
  }

  Widget _infoField(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: const Color(0xff434654),
            ),
          ),
          const SizedBox(height: 6),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xffEEF1F7),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              value,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: const Color(0xff111C2D),
              ),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.04),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}
