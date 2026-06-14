import 'package:flutter/material.dart';
import 'package:mobile_version/Dashboard/teacherSide/activitiesPage.dart';
import 'package:mobile_version/Dashboard/teacherSide/coursesPage.dart';
import 'package:mobile_version/Dashboard/teacherSide/homePage.dart';
import 'package:mobile_version/Dashboard/teacherSide/labHistory.dart';
import 'package:mobile_version/Dashboard/teacherSide/studentList.dart';
import 'package:provider/provider.dart';
import '../../../providers/courses_provider.dart';
import '../../../providers/activities_provider.dart';
// import 'package:mobile_version/pages/profile_screen.dart';

class BottomnavbarT extends StatefulWidget {
  const BottomnavbarT({super.key});

  @override
  State<BottomnavbarT> createState() => _BottomnavbarTState();
}

class _BottomnavbarTState extends State<BottomnavbarT> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<CoursesProvider>().fetchCourses();
      context.read<CoursesProvider>().fetchExploreCourses();
      context.read<ActivitiesProvider>().fetchActivities();
    });
  }

  final List<Widget> _pages = [
    HomePageT(),
    const CoursesPageT(),
    const LabHistoryT(),
    const ActivitiesPageT(),
    const StudentsPage(),
    // const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191A1F),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xff1E212A),
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xff00B764),
          unselectedItemColor: const Color(0xff8B8C8F),
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/homeLogo.png',
                  width: 60,
                  height: 44,
                  color: _selectedIndex == 0
                      ? const Color(0xff00B764)
                      : const Color(0xff8B8C8F),
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/coursesLogo.png',
                  width: 60,
                  height: 44,
                  color: _selectedIndex == 1
                      ? const Color(0xff00B764)
                      : const Color(0xff8B8C8F),
                ),
                label: "Courses"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/labLogo.png',
                  width: 60,
                  height: 44,
                  color: _selectedIndex == 2
                      ? const Color(0xff00B764)
                      : const Color(0xff8B8C8F),
                ),
                label: "AI Lab"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/coursesIcon.png',
                  width: 60,
                  height: 44,
                  color: _selectedIndex == 3
                      ? const Color(0xff00B764)
                      : const Color(0xff8B8C8F),
                ),
                label: "Activities"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/stuLogo.png',
                  width: 60,
                  height: 44,
                  color: _selectedIndex == 4
                      ? const Color(0xff00B764)
                      : const Color(0xff8B8C8F),
                ),
                label: "Students"),
            // BottomNavigationBarItem(
            //     icon: Image.asset(
            //       'assets/profileLogo.png',
            //       width: 60,
            //       height: 44,
            //       color: _selectedIndex == 3
            //           ? const Color(0xff00B764)
            //           : const Color(0xff8B8C8F),
            //     ),
            //     label: "Profile"),
          ]),
    );
  }
}
