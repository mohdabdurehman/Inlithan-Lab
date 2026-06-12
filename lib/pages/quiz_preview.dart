import 'package:flutter/material.dart';

import '../components/quizCard.dart';
import '../components/appBar.dart';

class QuizPreview extends StatelessWidget {
  const QuizPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191A1F),

      // preview card
      body: SafeArea(
        child: Column(
          children: [
            Appbar(
                title: 'Quiz',
                showSearch: false,
                leading: Icon(Icons.arrow_back_ios,
                    color: Color(0xff00b764), size: 28)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: QuizCard(
                label: 'Quiz',
                title: 'Quiz Preview',
                questions: '50 questions',
                duration: '30 minutes',
                message: 'Good Luck :)',
                icon: RotatedBox(
                  quarterTurns: 3,
                  child: Image.asset('assets/projectLogo.png',
                      width: 54, height: 120, color: const Color(0xff00B764)),
                ),
                showtwobtns: false,
                //START BUTTON
                Startbtn: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Quiz Started!'),
                      backgroundColor: Color(0xff00B764),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
