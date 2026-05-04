import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/signUpBtn.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff191A1F),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Logo img
              Container(
                child: Image.asset(
                  'assets/projectLogo.png',
                  width: 96,
                  height: 213,
                ),
              ),

              SizedBox(height: 16),

              // text
              Text('Welcome to Inlithan \n Labs',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.raleway(
                    color: Color(0xff8B8C8F),
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                  )),

              SizedBox(height: 80),

              // GoogleButton
              btnStyle(
                label: 'Signup with Google',
                img:
                    Image.asset('assets/googleLogo.png', width: 32, height: 32),
                color: Color(0xff152826),
                filled: true,
              ),
              SizedBox(height: 24),

              // GithubButton
              btnStyle(
                label: 'Signup with Github',
                img: Image.asset('assets/gitLogo.png', width: 32, height: 32),
                color: Color(0xff152826),
                filled: false,
              ),
            ],
          ),
        )));
  }
}
