import 'package:flutter/material.dart';
import 'package:mobile_version/Dashboard/teacherSide/components/quizCard.dart';

import '../../components/appBar.dart';

class AssignmentPreviewT extends StatelessWidget {
  const AssignmentPreviewT({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191A1F),

      // preview card
      body: SafeArea(
        child: Column(
          children: [
            Appbar(
                title: 'Assignment',
                showSearch: false,
                leading: Icon(Icons.arrow_back_ios,
                    color: Color(0xff00b764), size: 28)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: QuizCardT(
                label: 'Assignment',
                title: 'Assignment Preview',
                questions: '50 questions',
                duration: null,
                text: 'Review Assignment',

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
