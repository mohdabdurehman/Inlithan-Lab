import 'package:flutter/material.dart';
import '../components/coursesCard.dart';
import '../components/appBar.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  static const List<Map<String, String>> courses = [
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
      'courseName': 'Graduation Project',
      'code': 'COM 491',
    },
    {
      'img': 'assets/coursesIcon.png',
      'courseName': 'Graduation Project',
      'code': 'COM 491',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191A1F),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // APP BAR
            Appbar(title: 'Courses'),

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
                  return CourseCard(
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
