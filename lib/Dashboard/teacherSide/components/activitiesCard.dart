import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivitiesCardT extends StatelessWidget {
  final String title;
  final String coursename;
  final Image icon;
  final bool filled;
  final String date;

  const ActivitiesCardT({
    super.key,
    required this.title,
    required this.coursename,
    required this.icon,
    required this.filled,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 197,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
      decoration: BoxDecoration(
          color: filled ? const Color(0xff292f2f) : const Color(0xff191A1F),
          borderRadius: BorderRadius.circular(8),
          border: const Border(
            bottom: BorderSide(
              color: Color(0xff292f2f),
              width: 1,
            ),
            top: BorderSide(
              color: Color(0xff292f2f),
              width: 1,
            ),
            left: BorderSide(
              color: Color(0xff292f2f),
              width: 4,
            ),
            right: BorderSide(
              color: Color(0xff292f2f),
              width: 1,
            ),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          Text(
            title,
            style: GoogleFonts.raleway(
              color: const Color(0xffffffff),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 12),

          // course name
          Text(
            coursename,
            style: GoogleFonts.raleway(
              color: const Color(0xffffffff),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),

          const SizedBox(height: 12),

          // courses with questions
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'All 426',
              style: GoogleFonts.raleway(
                color: const Color(0xffffffff),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '15 questions',
              style: GoogleFonts.raleway(
                color: const Color(0xffffffff),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ]),

          const SizedBox(height: 12),

          Text(
            date,
            style: GoogleFonts.raleway(
              color: const Color(0xffffffff),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 22),

          // ICON
          icon,
        ],
      ),
    );
  }
}
