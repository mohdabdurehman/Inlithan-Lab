import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationsCard extends StatelessWidget {
  final String courseUpdated;
  final String description;
  final Image icon;
  final bool filled;
  final String date;

  const NotificationsCard({
    super.key,
    required this.courseUpdated,
    required this.description,
    required this.icon,
    required this.filled,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 360,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: const Color(0xff191A1F),
          borderRadius: BorderRadius.circular(4),
          border: filled
              ? const Border(
                  bottom: BorderSide(
                    color: Color(0xff00b764),
                    width: 1,
                  ),
                  top: BorderSide(
                    color: Color(0xff00b764),
                    width: 1,
                  ),
                  left: BorderSide(
                    color: Color(0xff00b764),
                    width: 24,
                  ),
                  right: BorderSide(
                    color: Color(0xff00b764),
                    width: 1,
                  ),
                )
              : const Border(
                  bottom: BorderSide(
                    color: Color(0xff8c8d8f),
                    width: 1,
                  ),
                  top: BorderSide(
                    color: Color(0xff8c8d8f),
                    width: 1,
                  ),
                  left: BorderSide(
                    color: Color(0xff8c8d8f),
                    width: 24,
                  ),
                  right: BorderSide(
                    color: Color(0xff8c8d8f),
                    width: 1,
                  ),
                )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // icon

          Container(
              padding: const EdgeInsets.all(8),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xff191A1F),
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xff8c8d8f),
                  width: 1,
                ),
              ),
              child: icon),

          const SizedBox(width: 20),

          // course updated and description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  courseUpdated,
                  style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 18),

                // date

                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    date,
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
