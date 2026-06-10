import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../components/appBar.dart';

class Createcourse2T extends StatelessWidget {
  const Createcourse2T({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff191A1F),
        body: SafeArea(
            child: Column(
          children: [
            // APP BAR
            Appbar(
              title: 'Home',
              showIcon: Icon(Icons.person_rounded,
                  color: Color(0xff8C8D8F), size: 28),
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
                  Text(
                      'Your Courses and Activites\n will appear here once you \nCreate a course',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                        color: const Color(0xff8B8C8F),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      )),

                  const SizedBox(height: 64),

                  CreateCourseBtn()
                ],
              ),
            ),
          ],
        )));
  }
}

class CreateCourseBtn extends StatelessWidget {
  const CreateCourseBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 69,
      child: ElevatedButton.icon(
        onPressed: () {
          final TextEditingController emailController = TextEditingController();

          showDialog(
            context: context,
            builder: (context) => Dialog(
              backgroundColor: const Color(0xff191a1f),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Color(0xff00b764), width: 1.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Header ──
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Course Creation',
                            style: GoogleFonts.raleway(
                              color: Colors.white,
                              fontSize: 16,
                            )),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.close,
                              color: Colors.white, size: 20),
                        ),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // ── Description ──
                    Text(
                      'In order for you to create a course we need either the email from the school you are affiliated with or the professional email you would like to use',
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 32),

                    // ── Work Email input ──
                    TextField(
                      controller: emailController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Work Email',
                        hintStyle: GoogleFonts.poppins(
                          color: const Color(0xff8C8D8F),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        filled: true,
                        fillColor: const Color(0xff191A1F),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              color: Color(0xff303530), width: 1.5),
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // ── Create Course button ──
                    SizedBox(
                      width: double.infinity,
                      height: 69,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (emailController.text.isNotEmpty) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Course created!'),
                                backgroundColor: Color(0xff00B764),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff00B764),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                        ),
                        icon: Image.asset('assets/coursesLogo.png',
                            width: 32,
                            height: 37,
                            color: const Color(0xff191A1F)),
                        label: Text('Create Course',
                            style: GoogleFonts.raleway(
                              color: const Color(0xff191A1F),
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff00B764),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
        icon: Image.asset('assets/coursesLogo.png',
            width: 32, height: 37, color: const Color(0xff191A1F)),
        label: Text('Create Course',
            style: GoogleFonts.raleway(
              color: const Color(0xff191A1F),
              fontSize: 24,
              fontWeight: FontWeight.w700,
            )),
      ),
    );
  }
}
