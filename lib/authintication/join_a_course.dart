import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/signUpBtn.dart';
import '../components/appBar.dart';

class courseJoin extends StatelessWidget {
  const courseJoin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff191A1F),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // APP BAR
            Appbar(title: 'Courses'),

            SizedBox(height: 138),

            // Content
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Logo img
                  RotatedBox(
                    quarterTurns: 3,
                    child: Container(
                      child: Image.asset(
                        'assets/projectLogo.png',
                        width: 96,
                        height: 213,
                      ),
                    ),
                  ),

                  SizedBox(height: 32),

                  // text
                  Text(
                      'Your Courses and Activities \n will appear here once you join \n a course',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                        color: Color(0xff8B8C8F),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      )),

                  SizedBox(height: 64),

                  // GoogleButton
                  btnStyle(
                    label: 'Join a Course',
                    img: Image.asset('assets/coursesLogo.png',
                        width: 32, height: 37, color: Color(0xff191A1F)),
                    color: Color(0xff152826),
                    filled: false,
                  ),
                  SizedBox(height: 24),

                  // GithubButton
                  btnStyle(
                    label: 'Explore Courses',
                    img: Image.asset('assets/exploreLogo.png',
                        width: 32, height: 32, color: Color(0xff00B764)),
                    color: Color(0xff152826),
                    filled: true,
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}
