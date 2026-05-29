import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseCard extends StatelessWidget {
  final Image imgIcon;
  final String courseName;
  final String code;

  const CourseCard({
    super.key,
    required this.imgIcon,
    required this.courseName,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 22,
        horizontal: 24,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xff303530), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //course img
          imgIcon,

          const Spacer(),

          //course name
          Text(
            courseName,
            style: GoogleFonts.raleway(
              color: const Color(0xfffeffff),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 16),

          //course code
          Text(
            code,
            style: GoogleFonts.raleway(
              color: const Color(0xfffeffff),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
