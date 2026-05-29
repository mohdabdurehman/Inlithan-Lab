import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/signUpBtn.dart';
import '../components/appBar.dart';

class Haveingactivites extends StatelessWidget {
  const Haveingactivites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff191A1F),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // APP BAR
            const Appbar(title: 'Activities'),

            const SizedBox(height: 138),

            // Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
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

                  const SizedBox(height: 32),

                  // text
                  Text('You need to join a couse to \n have any activites',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                        color: const Color(0xff8B8C8F),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      )),

                  const SizedBox(height: 64),

                  // GoogleButton
                  btnStyle(
                    label: 'Join a Course',
                    img: Image.asset('assets/coursesLogo.png',
                        width: 32, height: 37, color: const Color(0xff191A1F)),
                    color: const Color(0xff152826),
                    filled: false,
                  ),
                  const SizedBox(height: 24),

                  // GithubButton
                  btnStyle(
                    label: 'Explore Courses',
                    img: Image.asset('assets/exploreLogo.png',
                        width: 32, height: 32, color: const Color(0xff00B764)),
                    color: const Color(0xff152826),
                    filled: true,
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}
