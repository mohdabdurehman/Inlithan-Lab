import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// btn style
class btnStyle extends StatelessWidget {
  final String label;
  final Image img;
  final Color color;
  final bool filled;

  const btnStyle({
    super.key,
    required this.label,
    required this.img,
    required this.color,
    required this.filled,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          final TextEditingController emailController = TextEditingController();

          showDialog(
            context: context,
            builder: (context) => Dialog(
              backgroundColor: const Color(0xff191a1f),
              shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Color(0xff00b764), width: 1.5),
                  borderRadius: BorderRadius.circular(8)),
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
                        Text('Join Course',
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
                      'In order for you to join a course we need the course code and either the email from the school you are affiliated with or the professional email you would like to use',
                      style: GoogleFonts.raleway(
                        color: const Color(0xfffffffF),
                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 32),

                    // ── Email input ──
                    TextField(
                      scrollPadding: EdgeInsets.all(16),
                      controller: emailController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Course Code',
                        hintStyle: GoogleFonts.poppins(
                            color: Color(0xff8C8D8F),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        filled: true,
                        fillColor: const Color(0xff191A1F),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: const Color(0xff303530), width: 1.5)),
                      ),
                    ),

                    const SizedBox(height: 32),

                    TextField(
                      scrollPadding: EdgeInsets.all(16),
                      controller: emailController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Student Email',
                        hintStyle: GoogleFonts.poppins(
                            color: Color(0xff8C8D8F),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        filled: true,
                        fillColor: const Color(0xff191A1F),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: const Color(0xff303530), width: 1.5)),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // ── Request to Join button ──
                    SizedBox(
                      width: double.infinity,
                      height: 69,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (emailController.text.isNotEmpty) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Request sent!'),
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
                        ),
                        icon: Image.asset('assets/coursesLogo.png',
                            width: 32,
                            height: 37,
                            color: const Color(0xff191A1F)),
                        label: Text('Request to Join',
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
          backgroundColor: filled ? color : const Color(0xff00b764),
          side: const BorderSide(color: Color(0xff00b764), width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            img,
            Text(label,
                style: GoogleFonts.raleway(
                  color: filled
                      ? const Color(0xff00B764)
                      : const Color(0xff191A1F),
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  shadows: filled
                      ? [
                          const Shadow(
                            color: Color(0xff000000),
                            blurRadius: 15,
                          )
                        ]
                      : null,
                ))
          ],
        ));
  }
}
