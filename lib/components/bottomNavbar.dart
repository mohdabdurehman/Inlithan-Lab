import 'package:flutter/material.dart';
import 'package:mobile_version/pages/profile_screen.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text('Home', style: TextStyle(color: Colors.white))),
    const Center(child: Text('Courses', style: TextStyle(color: Colors.white))),
    const Center(child: Text('Explore', style: TextStyle(color: Colors.white))),
    const ProfileScreen(), // ✅
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff191A1F),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xff1E212A),
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xff00B764),
          unselectedItemColor: Color(0xff8B8C8F),
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
                      ? Color(0xff00B764)
                      : Color(0xff8B8C8F),
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/coursesLogo.png',
                  width: 60,
                  height: 44,
                  color: _selectedIndex == 1
                      ? Color(0xff00B764)
                      : Color(0xff8B8C8F),
                ),
                label: "Courses"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/exploreLogo.png',
                  width: 60,
                  height: 44,
                  color: _selectedIndex == 2
                      ? Color(0xff00B764)
                      : Color(0xff8B8C8F),
                ),
                label: "Explore"),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/profileLogo.png',
                  width: 60,
                  height: 44,
                  color: _selectedIndex == 3
                      ? Color(0xff00B764)
                      : Color(0xff8B8C8F),
                ),
                label: "Profile"),
          ]),
    );
  }
}
