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

  final List<Map<String, String>> studentRequests = [
    {
      'id': '20201818@std.neu.edu.tr',
      'course': 'Economics for engineers',
    },
    {
      'id': '20247224@std.neu.edu.tr',
      'course': 'Mobile programming',
    },
    {
      'id': '20219080@std.neu.edu.tr',
      'course': 'Engineering for engineers',
    },
    {
      'id': '20232301@std.neu.edu.tr',
      'course': 'Mobile programming',
    },
  ];

  void _showStudentRequestsDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Color(0xff00B764), width: 1),
        ),
        backgroundColor: const Color(0xff191a1f),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'New Student List',
                  style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, color: Colors.white, size: 20),
                ),
              ]),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Students (${studentRequests.length})',
                    style: GoogleFonts.poppins(
                      color: const Color(0xfffffffF),
                      fontSize: 14,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Accept all logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('All students accepted!'),
                          backgroundColor: Color(0xff00B764),
                        ),
                      );
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Accept All',
                      style: GoogleFonts.raleway(
                        color: const Color(0xff00b764),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              // Student List
              ListView.separated(
                shrinkWrap: true,
                itemCount: studentRequests.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final student = studentRequests[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffffffff),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              student['id']!,
                              style: GoogleFonts.raleway(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              student['course']!,
                              style: GoogleFonts.raleway(
                                color: const Color(0xff8C8D8F),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Accept single student logic
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Accepted: ${student['id']}'),
                              backgroundColor: const Color(0xff00B764),
                            ),
                          );
                          setState(() {
                            studentRequests.removeAt(index);
                          });
                          Navigator.pop(context);
                          _showStudentRequestsDialog(); // Refresh dialog
                        },
                        child: Text(
                          'Accept',
                          style: GoogleFonts.raleway(
                            color: const Color(0xff00b764),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

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
            SliverToBoxAdapter(
                child: ResearchCard(
              onViewList: _showStudentRequestsDialog,
            )),

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
  final VoidCallback? onViewList;

  const ResearchCard({super.key, this.onViewList});

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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ResearchText(text: "New Student\n Requests"),
                _PreviewButton(text: "View List", onTap: onViewList),
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
  final VoidCallback? onTap;

  const _PreviewButton({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
