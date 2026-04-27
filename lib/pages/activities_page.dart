import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> courses = [
      {
        'code': 'All 426',
        'title': 'Economics for Engineers',
        'instructor': 'Aliyu Zafir',
      },
      {
        'code': 'COM 491',
        'title': 'Graduation Project',
        'instructor': 'Elbrus imanov',
      },
    ];
    return Scaffold(
        backgroundColor: const Color(0xff191A1F),
        body: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // APP BAR
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 32),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Activities',
                      style: GoogleFonts.raleway(
                        color: Color(0xff8C8D8F),
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.search,
                          color: Color(0xff8C8D8F), size: 24),
                      onPressed: () {},
                    ),
                  ])),

          // Divider under appbar
          Divider(color: Color(0xff8C8D8F), height: 1),

          SizedBox(height: 32),

          // ACTIVITIES CARDS
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: courses.length,
              separatorBuilder: (__, _) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                return _CourseCard(
                  code: courses[index]['code']!,
                  title: courses[index]['title']!,
                  instructor: courses[index]['instructor']!,
                );
              },
            ),
          ),
        ])));
  }
}

class _CourseCard extends StatelessWidget {
  final String code;
  final String title;
  final String instructor;

  const _CourseCard({
    required this.code,
    required this.title,
    required this.instructor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 368,
      height: 309,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
          color: const Color(0xff191A1F),
          borderRadius: BorderRadius.circular(8),
          border: Border(
            bottom: BorderSide(
              color: Color(0xff8C8D8F),
              width: 1,
            ),
            top: BorderSide(
              color: Color(0xff8C8D8F),
              width: 1,
            ),
            left: BorderSide(
              color: Color(0xff8C8D8F),
              width: 4,
            ),
            right: BorderSide(
              color: Color(0xff8C8D8F),
              width: 1,
            ),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Course code
          Text(
            code,
            style: GoogleFonts.raleway(
              color: Color(0xff8B8C8F),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),

          SizedBox(height: 16),

          // Course title
          Text(
            title,
            style: GoogleFonts.raleway(
              color: Color(0xff8C8D8F),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),

          SizedBox(height: 16),

            // Instructor name
            Text(
              instructor,
              style: GoogleFonts.raleway(
                color: Color(0xff8B8C8F),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      );
    }
  }