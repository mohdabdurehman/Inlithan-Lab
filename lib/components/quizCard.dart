import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizCard extends StatelessWidget {
  final String label;
  final String title;
  final String? questions;
  final String? duration;
  final String message;
  final Widget icon;
  final VoidCallback? Startbtn;
  final VoidCallback? Reviewbtn;
  final VoidCallback? Donebtn;
  final bool showtwobtns;

  const QuizCard({
    required this.label,
    required this.title,
    this.questions,
    this.duration,
    required this.message,
    required this.icon,
    this.Startbtn,
    this.Reviewbtn,
    this.Donebtn,
    this.showtwobtns = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff152826),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xff00B764), width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //the quiz label
          QuizLabel(label: label),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Column(
              children: [
                //icon img
                icon,
                const SizedBox(height: 32),

                Text(title,
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(height: 24),
                if (questions != null) ...[
                  QuizText(text: questions!),
                ],
                if (duration != null) ...[
                  QuizText(text: duration!),
                ],
                const SizedBox(height: 20),
                QuizText(text: message),
                const SizedBox(height: 48),

                //start btn
                if (showtwobtns)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 136,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: Reviewbtn,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff152826),
                            side: const BorderSide(
                                color: Color(0xff00b764), width: 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: Text('Review',
                              style: GoogleFonts.raleway(
                                color: const Color(0xff00b764),
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                      ),
                      SizedBox(width: 20),
                      SizedBox(
                        width: 112,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: Donebtn,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff00B764),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: Text('Done',
                              style: GoogleFonts.raleway(
                                color: const Color(0xff191a1f),
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                      ),
                    ],
                  )
                else
                  SizedBox(
                    width: 108,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: Startbtn,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff00B764),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('Start',
                          style: GoogleFonts.raleway(
                            color: const Color(0xff191a1f),
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Quiz label widget
class QuizLabel extends StatelessWidget {
  final String label;
  const QuizLabel({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xff00B764), width: 1),
        ),
      ),
      child: Column(
        children: [
          Text(label,
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                color: const Color(0xff00B764),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )),
          const SizedBox(height: 10),
          Container(width: 82, height: 1.5, color: const Color(0xff00B764)),
        ],
      ),
    );
  }
}

// reusable text widget
class QuizText extends StatelessWidget {
  final String text;
  const QuizText({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center,
        style: GoogleFonts.raleway(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ));
  }
}
