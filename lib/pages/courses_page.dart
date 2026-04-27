import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> courses = [
      {
        'img': 'assets/coursesIcon.png',
        'courseName': 'Economics for Engineers',
        'code': 'All 426',
      },
      {
        'img': 'assets/coursesIcon.png',
        'courseName': 'Graduation Project',
        'code': 'COM 491',
      },
      {
        'img': 'assets/coursesIcon.png',
        'courseName': 'Mobile Computing',
        'code': 'All 417',
      },
      {
        'img': 'assets/coursesIcon.png',
        'courseName': 'Computing',
        'code': 'All 407',
      },
    ];
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
                  Text(
                    'Courses',
                    style: GoogleFonts.raleway(
                      color: Color(0xff8C8D8F),
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.search,
                            color: Color(0xff8C8D8F), size: 24),
                        onPressed: () {},
                      ),
                      Stack(children: [
                        IconButton(
                          icon: const Icon(Icons.notifications_none,
                              color: Color(0xff8C8D8F), size: 28),
                          onPressed: () {},
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xff00B764),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ],
              ),
            ),

            //  Divider under appbar
            Divider(color: Color(0xff8C8D8F), height: 1),

            SizedBox(height: 32),

            //  COURSE CARDS
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: GridView.builder(
                itemCount: courses.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 columns
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 32,
                    childAspectRatio: 1.0),
                itemBuilder: (context, index) {
                  return _CourseCard(
                    imgIcon: Image.asset(courses[index]['img']!),
                    courseName: courses[index]['courseName']!,
                    code: courses[index]['code']!,
                  );
                },
              ),
            )),
            SizedBox(height: 256),
          ],
        ),
      ),

      // floating action btn
      floatingActionButton: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xff152826),
        ),
        child: IconButton(
          icon: const Icon(Icons.error_outline_outlined,
              color: Color(0xff00B764), size: 24),
          onPressed: () {},
        ),
      ),
    );
  }
}

//  COURSE CARD WIDGET
class _CourseCard extends StatelessWidget {
  final Image imgIcon;
  final String courseName;
  final String code;

  const _CourseCard({
    required this.imgIcon,
    required this.courseName,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 22,
        horizontal: 24,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xff303530), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //course img
          imgIcon,

          Spacer(),

          //course name
          Text(
            courseName,
            style: GoogleFonts.raleway(
              color: Color(0xfffeffff),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),

          SizedBox(height: 16),

          //course code
          Text(
            code,
            style: GoogleFonts.raleway(
              color: Color(0xfffeffff),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
