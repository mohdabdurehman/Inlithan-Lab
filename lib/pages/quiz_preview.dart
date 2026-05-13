import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizPreview extends StatelessWidget {
  const QuizPreview({super.key});

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
              color: Color(0xff8c8d8f),
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
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xff152826),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xff00B764), width: 1),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Quiz label
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xff00B764), width: 1),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Quiz',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                        color: Color(0xff00B764),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 82,
                      height: 1.5,
                      color: const Color(0xff00B764),
                    ),
                  ],
                ),
              ),

              //  MAIN CONTENT
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Column(
                  children: [
                    // img
                    RotatedBox(
                      quarterTurns: 3,
                      child: Container(
                        child: Image.asset(
                          'assets/projectLogo.png',
                          width: 54,
                          height: 120,
                          color: Color(0xff00B764),
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    Text(
                      'Quiz Preview',
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 24),

                    Text(
                      '50 questions',
                      style: GoogleFonts.raleway(
                        color: Color(0xffffffff),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    Text(
                      '30 minutes',
                      style: GoogleFonts.raleway(
                        color: Color(0xffffffff),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      'Good Luck :)',
                      style: GoogleFonts.raleway(
                        color: Color(0xfffffffF),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 48),

                    // ── START BUTTON ──
                    SizedBox(
                      width: 108,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Quiz Started!'),
                              backgroundColor: Color(0xff00B764),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff00B764),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Start',
                          style: GoogleFonts.raleway(
                            color: Color(0xff191a1f),
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
