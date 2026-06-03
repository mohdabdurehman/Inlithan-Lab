import 'package:flutter/material.dart';
import 'package:mobile_version/pages/courses_page.dart';
import 'package:mobile_version/pages/explore_page.dart';
import 'package:mobile_version/pages/home_page.dart';
import 'package:mobile_version/pages/aiLabHistory_page.dart';
import 'package:mobile_version/pages/activities_page.dart';
// import 'package:mobile_version/pages/profile_screen.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    const CoursesPage(),
    const LabHistory(),
    const ActivitiesPage(),
    const ExplorePage(),
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
                  'assets/exploreLogo.png',
                  width: 60,
                  height: 44,
                  color: _selectedIndex == 4
                      ? const Color(0xff00B764)
                      : const Color(0xff8B8C8F),
                ),
                label: "Explore"),
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
