import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CourseCardT extends StatelessWidget {
  final Image imgIcon;
  final String courseName;
  final String code;
  final String stdNum;

  const CourseCardT({
    super.key,
    required this.imgIcon,
    required this.courseName,
    required this.code,
    required this.stdNum,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 24,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xff303530), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //course img
          imgIcon,

          const SizedBox(height: 14),

          //course name
          Text(
            courseName,
            style: GoogleFonts.raleway(
              color: const Color(0xfffeffff),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 8),

          //course code
          Text(
            code,
            style: GoogleFonts.raleway(
              color: const Color(0xfffeffff),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            stdNum,
            style: GoogleFonts.raleway(
              color: const Color(0xfffeffff),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
