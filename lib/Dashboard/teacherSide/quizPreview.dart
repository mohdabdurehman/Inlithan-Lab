import 'package:flutter/material.dart';
import 'package:mobile_version/Dashboard/teacherSide/components/quizCard.dart';
import '../../components/appBar.dart';

class QuizPreviewT extends StatelessWidget {
  const QuizPreviewT({super.key});

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
              child: QuizCardT(
                label: 'Quiz',
                title: 'Quiz Preview',
                questions: '50 questions',
                duration: '30 minutes',
                text: 'Review Quiz',

                icon: RotatedBox(
                  quarterTurns: 3,
                  child: Image.asset('assets/projectLogo.png',
                      width: 54, height: 120, color: const Color(0xff00B764)),
                ),
                showtwobtns: true,

                //START BUTTON
                Viewbtn: () {},
                Reviewbtn: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
