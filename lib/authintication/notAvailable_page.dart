import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/appBar.dart';

class NotavailablePage extends StatelessWidget {
  const NotavailablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff191A1F),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // APP BAR
            Appbar(title: 'Explore'),

            SizedBox(height: 240),

            // Content
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
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
                      'There are currently no courses \n available for you to explore',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                        color: Color(0xff8B8C8F),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
            ),
          ],
        )));
  }
}
