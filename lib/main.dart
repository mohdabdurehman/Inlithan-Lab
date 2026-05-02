import 'package:flutter/material.dart';
import 'package:mobile_version/authintication/signup_Page.dart';
import 'package:mobile_version/components/bottomNavbar.dart';
import 'package:mobile_version/pages/activities_page.dart';
import 'package:mobile_version/pages/courses_page.dart';
import 'package:mobile_version/pages/explore_page.dart';
import 'package:mobile_version/pages/home_page.dart';
import 'package:mobile_version/pages/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bottomnavbar(),
      routes: {
        'signup': (context) => const SignupPage(),
        'bottomnavbar': (context) => const Bottomnavbar(),
        'profilescreen': (context) => const ProfileScreen(),
        'explorepage': (context) => const ExplorePage(),
        'coursespage': (context) => const CoursesPage(),
        'activitiespage': (context) => const ActivitiesPage(),
        'homepage': (context) => HomePage(),
      },
    );
  }
}
