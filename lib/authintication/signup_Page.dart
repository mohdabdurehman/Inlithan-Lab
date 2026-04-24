import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff191A1F),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  'assets/projectLogo.png',
                  width: 96,
                  height: 213,
                ),
              ),
              SizedBox(height: 16),
              Text('Welcome to Inlithan \n Labs',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.raleway(
                    color: Color(0xff8B8C8F),
                    fontSize: 32,
                  )),
              SizedBox(height: 80),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(
                      0xff152826,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(color: Color(0xff00B764), width: 1)),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset(
                    'assets/googleLogo.png',
                    width: 32,
                    height: 32,
                  ),
                  SizedBox(width: 26),
                  Text('Signup with Google',
                      style: GoogleFonts.raleway(
                          color: Color(0xff00B764),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Color(0xff000000),
                              blurRadius: 10,
                            )
                          ])),
                ]),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(
                      0xff00B764,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/gitLogo.png',
                        width: 32,
                        height: 32,
                      ),
                      SizedBox(width: 26),
                      Text('Signup with Github',
                          style: GoogleFonts.raleway(
                            color: Color(0xff191A1F),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ))
                    ],
                  ))
            ],
          ),
        )));
  }
}
