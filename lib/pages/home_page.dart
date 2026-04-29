import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/coursesCard.dart';
import '../components/appBar.dart';

class HomePage extends StatelessWidget {
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191A1F),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // APP BAR
              Appbar(title: 'Courses'),

              // research box
              ResearchCard(),

              SizedBox(height: 32),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  'Courses',
                  style: GoogleFonts.raleway(
                    color: Color(0xfffffffF),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              SizedBox(height: 24),

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
                    return CourseCard(
                      imgIcon: Image.asset(courses[index]['img']!),
                      courseName: courses[index]['courseName']!,
                      code: courses[index]['code']!,
                    );
                  },
                ),
              ),

              SizedBox(height: 64),

              //  activities section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Activities',
                        style: GoogleFonts.raleway(
                          color: Color(0xfffffffF),
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        )),
                    Text('View More',
                        style: GoogleFonts.raleway(
                          color: Color(0xff00B764),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )),

                    SizedBox(height: 24),

                    //  activities cards
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//  Research Card Widget
class ResearchCard extends StatelessWidget {
  const ResearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: Color(0xff1e212a),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const _ResearchText(),
                  const _PreviewButton(),
                ])));
  }
}

// Research text Widget
class _ResearchText extends StatelessWidget {
  const _ResearchText();

  @override
  Widget build(BuildContext context) {
    return Text(' Research Papers \n for the week',
        style: GoogleFonts.raleway(
          color: Color(0xfffeffff),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ));
  }
}

// Preview Button Widget
class _PreviewButton extends StatelessWidget {
  const _PreviewButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff00B764),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Image.asset('assets/previewIcon.png'),
            SizedBox(width: 26),
            Text('Preview',
                style: GoogleFonts.raleway(
                  color: Color(0xff191a1f),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                )),
          ],
        ),
      ),
    );
  }
}
