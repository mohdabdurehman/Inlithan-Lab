import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivitiesCard extends StatelessWidget {
  final String title;
  final String coursename;
  final Image icon;
  final bool filled;

  const ActivitiesCard({
    required this.title,
    required this.coursename,
    required this.icon,
    required this.filled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 197,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
      decoration: BoxDecoration(
          color: filled ? Color(0xff292f2f) : Color(0xff191A1F),
          borderRadius: BorderRadius.circular(8),
          border: Border(
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
              color: Color(0xffffffff),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(height: 16),

          // course name
          Text(
            coursename,
            style: GoogleFonts.raleway(
              color: Color(0xffffffff),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),

          SizedBox(height: 16),

          // courses with questions
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'All 426',
              style: GoogleFonts.raleway(
                color: Color(0xffffffff),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '15 questions',
              style: GoogleFonts.raleway(
                color: Color(0xffffffff),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ]),

          SizedBox(height: 34),

          // ICON
          icon,
        ],
      ),
    );
  }
}
