import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/coursesCard.dart';
import '../components/appBar.dart';
import '../components/activityCard.dart';
import 'package:provider/provider.dart';
import '../providers/courses_provider.dart';
import '../providers/activities_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final courses = context.watch<CoursesProvider>().courses;
    final activities = context.watch<ActivitiesProvider>().activities;

    return Scaffold(
      backgroundColor: const Color(0xff191A1F),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // APP BAR
            SliverToBoxAdapter(child: Appbar(title: 'Home')),

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

            if (courses.isEmpty)
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: Text(
                    'No courses yet. Join a course from the Explore',
                    style: GoogleFonts.raleway(
                      color: const Color(0xff8C8D8F),
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            else
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
                    (context, index) {
                      final course = courses[index];
                      // final studentCount = (course['students'] as List?)?.length ?? 0;
                      return CourseCard(
                        imgIcon: Image.asset('assets/coursesIcon.png'),
                        courseName: course['title'] ?? '',
                        code: course['code'] ?? '',
                      );
                    },
                    childCount: courses.length,
                  ),
                ),
              ),

            SliverToBoxAdapter(child: SizedBox(height: 64)),

            // ACTIVITIES TITLE
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Text('Activities',
                        style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        )),
                    const Spacer(),
                    Text('View More',
                        style: GoogleFonts.raleway(
                          color: Color(0xff00B764),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: 24)),

            // ACTIVITIES HEADER
            if (activities.isEmpty)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'No activities yet.',
                    style: GoogleFonts.raleway(
                      color: const Color(0xff8C8D8F),
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            else
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 206,
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (notification) => true,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      itemCount: activities.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 24),
                      itemBuilder: (context, index) {
                        final activity = activities[index];
                        // final submissions = (activity['submissions'] as List?)?.length ?? 0;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex =
                                  _selectedIndex == index ? -1 : index;
                            });
                          },
                          child: ActivitiesCard(
                            title: activity['type'] ?? '',
                            coursename: activity['title'] ?? '',
                            icon: Image.asset('assets/coursesIcon.png'),
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
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: const Color(0xff1e212a),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ResearchText(),
                  _PreviewButton(),
                ])));
  }
}

//Research text Widget
class _ResearchText extends StatelessWidget {
  const _ResearchText();

  @override
  Widget build(BuildContext context) {
    return Text(' Research Papers \n for the week',
        style: GoogleFonts.raleway(
          color: const Color(0xfffeffff),
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
        color: const Color(0xff00B764),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Image.asset('assets/previewIcon.png'),
            const SizedBox(width: 26),
            Text('Preview',
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
