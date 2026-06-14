import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'services/deep_link_service.dart';
import 'package:mobile_version/authintication/signup_Page.dart';
import 'package:mobile_version/components/bottomNavbar.dart';
import 'package:mobile_version/pages/activities_page.dart';

import 'package:mobile_version/pages/courses_page.dart';
import 'package:mobile_version/pages/explore_page.dart';
import 'package:mobile_version/pages/attemptingQuiz_page.dart';
import 'package:mobile_version/pages/home_page.dart';

import 'package:mobile_version/pages/courseActivities_page.dart';
import 'package:mobile_version/pages/profile_screen.dart';
import 'package:mobile_version/pages/quiz_completed.dart';

import 'package:mobile_version/pages/quiz_preview.dart';
import 'package:mobile_version/pages/role_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AuthProvider()..loadFromStorage(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    DeepLinkService.init((token) {
      context.read<AuthProvider>().setToken(token);
    });
  }

  @override
  void dispose() {
    DeepLinkService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupPage(),
      routes: {
        'signup': (context) => const SignupPage(),
        'bottomnavbar': (context) => const Bottomnavbar(),
        'profilescreen': (context) => const ProfileScreen(),
        'explorepage': (context) => const ExplorePage(),
        'coursespage': (context) => const CoursesPage(),
        'activitiespage': (context) => const ActivitiesPage(),
        'homepage': (context) => const HomePage(),
        "rolpage": (context) => const RolePage(),
        'quizpreview': (context) => const QuizPreview(),
        'quizcompleted': (context) => const QuizCompleted(),
        'courseactivities': (context) => const CourseActivities(),
        'attemptingquiz': (context) => const AttemptingQuiz(),
      },
    );
  }
}
