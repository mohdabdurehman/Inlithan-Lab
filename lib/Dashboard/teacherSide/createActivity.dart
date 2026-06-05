import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../components/appBar.dart';

class CreatecAtivityT extends StatelessWidget {
  const CreatecAtivityT({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff191A1F),
        body: SafeArea(
            child: Column(
          children: [
            // APP BAR
            Appbar(
              title: 'Activities',
            ),

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
                  Text('You currently have no\n activities created',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                        color: const Color(0xff8B8C8F),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      )),

                  const SizedBox(height: 64),

                  ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      backgroundColor: const Color(0xff00B764),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: Image.asset('assets/coursesIcon.png',
                        width: 32, height: 37, color: const Color(0xff191A1F)),
                    label: Text('Create Activity',
                        style: GoogleFonts.raleway(
                          color: const Color(0xff191A1F),
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}
