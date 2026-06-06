import 'package:flutter/material.dart';
import 'package:mobile_version/Dashboard/teacherSide/components/coursesCard.dart';
import '../../../components/appBar.dart';
import 'package:google_fonts/google_fonts.dart';


class CoursesPageT extends StatelessWidget {
  const CoursesPageT({super.key});

  static const List<Map<String, String>> courses = [
    {
      'img': 'assets/coursesIcon.png',
      'courseName': 'Economics for Engineers',
      'code': 'All 426',
      'stdNum':'123 Students',
    },
    {
      'img': 'assets/coursesIcon.png',
      'courseName': 'Graduation Project',
      'code': 'COM 491',
      'stdNum':'123 Students',
    },
    {
      'img': 'assets/coursesIcon.png',
      'courseName': 'Graduation Project',
      'code': 'COM 491',
      'stdNum':'123 Students',
    },
   {
      'img': 'assets/coursesIcon.png',
      'courseName': 'Graduation Project',
      'code': 'COM 491',
      'stdNum':'123 Students',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191A1F),
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
          
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

              Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                    color: Color(0xff152826),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xff00b764), width: 1)),
                child: Text('Create New Course',
                    style: GoogleFonts.raleway(
                      color: const Color(0xff00b764),
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    )),
              ),
            ),
          ),
          SizedBox(height: 32),
            //  COURSE CARDS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: GridView.builder(
shrinkWrap: true,
physics: NeverScrollableScrollPhysics(),
                itemCount: courses.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 columns
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 32,
                    childAspectRatio: 1.0),
                itemBuilder: (context, index) {
                  return CourseCardT(
                    imgIcon: Image.asset(courses[index]['img']!),
                    courseName: courses[index]['courseName']!,
                    code: courses[index]['code']!,
                    stdNum: courses[index]['stdNum']!,
                  );
                },
              ),
            ),
            
    
      const SizedBox(height: 30),
          ],
        ),
        ) 
        
         ),

      
    );
  }
}
