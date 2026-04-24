import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191A1F),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // APP BAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.search,
                        color: Color(0xff8C8D8F), size: 24),
                    onPressed: () {},
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.notifications_none,
                            color: Color(0xff8C8D8F), size: 28),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(360),
                          border: Border.all(
                              color: const Color(0xff8C8D8F), width: 1),
                        ), // Border width

                        child: IconButton(
                          icon: const Icon(Icons.person,
                              color: Color(0xff8C8D8F), size: 24),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        icon: const Icon(Icons.menu_open,
                            color: Color(0xff8C8D8F), size: 24),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //  Divider under appbar
            Divider(color: Color(0xff8C8D8F), height: 1),
            SizedBox(height: 45),
            //  COURSE CARDS
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 16.0),
              child: Text(
                'Courses',
                style: GoogleFonts.raleway(
                  color: Color(0xffffffff),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
