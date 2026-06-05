import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_version/Dashboard/teacherSide/components/coursesCard.dart';
import 'package:mobile_version/Dashboard/teacherSide/components/activitiesCard.dart';
import '/components/appBar.dart';

class HomePageT extends StatefulWidget {
  const HomePageT({super.key});

  @override
  State<HomePageT> createState() => _HomePageTState();
}

class _HomePageTState extends State<HomePageT> {
  int _selectedIndex = -1;

  final List<Map<String, String>> courses = [
    {
      'img': 'assets/coursesIcon.png',
      'courseName': 'Economics for Engineers',
      'code': 'All 426',
      'stdNum': '124 students',
    },
    {
      'img': 'assets/coursesIcon.png',
      'courseName': 'Graduation Project',
      'code': 'COM 491',
      'stdNum': '12 students',
    },
  ];

  final List<Map<String, String>> activities = [
    {
      'title': 'Quiz',
      'code': 'Economics for Engineers',
      'date': 'Submissions: 24/32',
      'icon': 'assets/coursesIcon.png',
    },
    {
      'title': 'Assignmets',
      'code': 'Graduation Project',
      'date': 'Submissions: 14/44',
      'icon': 'assets/coursesIcon.png',
    },
    {
      'title': 'Exam',
      'code': 'Graduation Project',
      'date': 'Submissions: 65/18',
      'icon': 'assets/coursesIcon.png',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191A1F),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // APP BAR
            SliverToBoxAdapter(
                child: Appbar(
              title: 'Home',
              showIcon: Icon(Icons.person_rounded,
                  color: Color(0xff8C8D8F), size: 28),
            )),

            // RESEARCH BOX
            SliverToBoxAdapter(child: ResearchCard()),

            SliverToBoxAdapter(child: SizedBox(height: 32)),

            // COURSES TITLE
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text('Courses',
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    )),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 24)),

            // COURSE CARDS GRID
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 32,
                  childAspectRatio: 1.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) => CourseCardT(
                    imgIcon: Image.asset(courses[index]['img']!),
                    courseName: courses[index]['courseName']!,
                    code: courses[index]['code']!,
                    stdNum: courses[index]['stdNum']!,
                  ),
                  childCount: courses.length,
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 31)),

            // ACTIVITIES HEADER
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text('Activities',
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    )),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 20)),

            //
            SliverToBoxAdapter(
              child: SizedBox(
                height: 206,
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) =>
                      true, // to prevent the bouncing effect
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    itemCount: activities.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 24),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex =
                                _selectedIndex == index ? -1 : index;
                          });
                        },
                        child: ActivitiesCardT(
                          title: activities[index]['title']!,
                          coursename: activities[index]['code']!,
                          date: activities[index]['date']!,
                          icon: Image.asset(activities[index]['icon']!),
                          filled: _selectedIndex == index,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 32)),
          ],
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
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            color: const Color(0xff1e212a),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ResearchText(text: "New Student\n Requests"),
                _PreviewButton(text: "View List"),
              ],
            ),
          ),
        ),
        const SizedBox(height: 32),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            color: const Color(0xff1e212a),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ResearchText(text: "Research Papers\n for the week"),
                _PreviewButton(text: "Preview"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

//Research text Widget
class _ResearchText extends StatelessWidget {
  final String text;

  const _ResearchText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.raleway(
          color: const Color(0xfffeffff),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ));
  }
}

// Preview Button Widget
class _PreviewButton extends StatelessWidget {
  final String text;

  const _PreviewButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff00B764),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Image.asset('assets/previewIcon.png'),
            const SizedBox(width: 26),
            Text(text,
                style: GoogleFonts.raleway(
                  color: const Color(0xff191a1f),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                )),
          ],
        ),
      ),
    );
  }
}
