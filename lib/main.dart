import 'package:flutter/material.dart';
import 'package:mobile_version/Dashboard/teacherSide/components/bottomNavbar.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'services/deep_link_service.dart';
import 'package:mobile_version/authintication/signup_Page.dart';
import 'package:mobile_version/components/bottomNavbar.dart';
import 'package:mobile_version/pages/activities_page.dart';
import 'providers/courses_provider.dart';
import 'providers/activities_provider.dart';
import 'package:mobile_version/pages/courses_page.dart';
import 'package:mobile_version/pages/explore_page.dart';
import 'package:mobile_version/pages/attemptingQuiz_page.dart';
import 'package:mobile_version/pages/home_page.dart';

import 'package:mobile_version/pages/courseActivities_page.dart';
import 'package:mobile_version/pages/profile_screen.dart';
import 'package:mobile_version/pages/quiz_completed.dart';

import 'package:mobile_version/pages/quiz_preview.dart';
import 'package:mobile_version/pages/role_page.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AuthProvider()..loadFromStorage()),
        ChangeNotifierProxyProvider<AuthProvider, CoursesProvider>(
          create: (context) => CoursesProvider(context.read<AuthProvider>()),
          update: (context, auth, previous) =>
              previous ?? CoursesProvider(auth),
        ),
        ChangeNotifierProxyProvider<AuthProvider, ActivitiesProvider>(
          create: (context) => ActivitiesProvider(context.read<AuthProvider>()),
          update: (context, auth, previous) =>
              previous ?? ActivitiesProvider(auth),
        ),
      ],
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

    context.read<AuthProvider>().setToken(
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMCIsInJvbGUiOiJ1bnNldCIsIm5hbWUiOiJUZXN0IFVzZXIiLCJlbWFpbCI6InRlc3RAZXhhbXBsZS5jb20iLCJhdmF0YXIiOiIiLCJpYXQiOjE3ODE0NjAxNDEsImV4cCI6MTc4MjA2NDk0MX0.VVaYiXnVg26yY482E2r2mZIMFfonTJ6vRN-e2zL2PxU',
        );

    DeepLinkService.init((token) async {
      await context.read<AuthProvider>().setToken(token);
      navigatorKey.currentState?.pushNamedAndRemoveUntil(
        'rolpage',
        (route) => false,
      );
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
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: SignupPage(),
      routes: {
        'signup': (context) => const SignupPage(),
        'bottomnavbarT': (context) => const BottomnavbarT(),
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
