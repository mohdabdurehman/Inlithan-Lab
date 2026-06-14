import 'package:flutter/material.dart';
import '../components/coursesCard.dart';
import '../components/appBar.dart';
import 'package:provider/provider.dart';
import '../providers/courses_provider.dart';
import 'package:google_fonts/google_fonts.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = context.watch<CoursesProvider>().courses;
    return Scaffold(
      backgroundColor: const Color(0xff191A1F),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // APP BAR
            Appbar(
                title: 'Courses',
                showIcon: Stack(children: [
                  Icon(Icons.notifications_none,
                      color: Color(0xff8C8D8F), size: 28),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xff00B764),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ])),

            //  COURSE CARDS
            //  COURSE CARDS
            Expanded(
              child: courses.isEmpty
                  ? Center(
                      child: Text(
                        'No courses yet. Join one from Explore.',
                        style: GoogleFonts.raleway(
                          color: const Color(0xff8C8D8F),
                          fontSize: 14,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: GridView.builder(
                        itemCount: courses.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 24,
                                mainAxisSpacing: 32,
                                childAspectRatio: 1.0),
                        itemBuilder: (context, index) {
                          final course = courses[index];
                          return CourseCard(
                            imgIcon: Image.asset('assets/coursesIcon.png'),
                            courseName: course['title'] ?? '',
                            code: course['code'] ?? '',
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),

      // floating action btn
      floatingActionButton: Container(
        width: 48,
        height: 48,
        decoration: const BoxDecoration(
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
