import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/quizCard.dart';

class QuizCompleted extends StatelessWidget {
  const QuizCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191A1F),

      // appbar
      appBar: AppBar(
        backgroundColor: const Color(0xff191A1F),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xff00B764)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Quiz',
          style: GoogleFonts.raleway(
              color: const Color(0xff8c8d8f),
              fontSize: 24,
              fontWeight: FontWeight.w500),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(32),
          child: Divider(
            color: Color(0xff8c8d8f),
            thickness: 1,
            height: 32,
          ),
        ),
      ),

      // preview card
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: QuizCard(
          label: 'Quiz',
          title: 'Quiz Completed',
          questions: null,
          duration: null,
          message:
              'You answered 54 out of 55 \n questions and scored a 50 out of 55',
          icon: Image.asset('assets/projectLogo.png',
              width: 54, height: 120, color: const Color(0xff00B764)),
          showtwobtns: true,

          //START BUTTON
          Reviewbtn: () {},
          Donebtn: () {},
        ),
      ),
    );
  }
}
