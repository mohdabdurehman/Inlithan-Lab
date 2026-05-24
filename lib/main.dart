import 'package:flutter/material.dart';
import 'package:mobile_version/authintication/signup_Page.dart';
import 'package:mobile_version/components/bottomNavbar.dart';
import 'package:mobile_version/pages/activities_page.dart';
import 'package:mobile_version/pages/courses_page.dart';
import 'package:mobile_version/pages/explore_page.dart';
import 'package:mobile_version/pages/flashCard_page.dart';
import 'package:mobile_version/pages/home_page.dart';
import 'package:mobile_version/pages/pendingActivities_page.dart';
import 'package:mobile_version/pages/profile_screen.dart';
import 'package:mobile_version/pages/quiz_completed.dart';
import 'package:mobile_version/pages/quiz_preview.dart';
import 'package:mobile_version/pages/role_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlashcardPage(),
      routes: {
        'signup': (context) => const SignupPage(),
        'bottomnavbar': (context) => const Bottomnavbar(),
        'profilescreen': (context) => const ProfileScreen(),
        'explorepage': (context) => const ExplorePage(),
        'coursespage': (context) => const CoursesPage(),
        'activitiespage': (context) => const ActivitiesPage(),
        'homepage': (context) => HomePage(),
        "rolpage": (context) => const RolePage(),
        'quizpreview': (context) => const QuizPreview(),
        'quizcompleted': (context) => const QuizCompleted(),
        'pendingactivities': (context) => const PendingActivities(),
      },
    );
  }
}
