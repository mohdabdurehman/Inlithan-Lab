import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/appBar.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> explore = [
      {
        'code': 'All 426',
        'title': 'Economics for Engineers',
        'instructor': 'Aliyu Zafir',
      },
      {
        'code': 'COM 491',
        'title': 'Graduation Project',
        'instructor': 'Elbrus imanov',
      },
      {
        'code': 'All 417',
        'title': 'Mobile Computing',
        'instructor': 'Ramiz Salama',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xff191A1F),
      body: SafeArea(
        child: Column(
          children: [
            // APP BAR
            const Appbar(title: 'Explore'),

            //  COURSE CARDS
            Expanded(
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: explore.length,
                separatorBuilder: (__, _) => const SizedBox(height: 54),
                itemBuilder: (context, index) {
                  return _ExploreCard(
                    code: explore[index]['code']!,
                    title: explore[index]['title']!,
                    instructor: explore[index]['instructor']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Explore Card Widget

class _ExploreCard extends StatelessWidget {
  final String code;
  final String title;
  final String instructor;

  const _ExploreCard({
    required this.code,
    required this.title,
    required this.instructor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 368,
      height: 309,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
          color: const Color(0xff191A1F),
          borderRadius: BorderRadius.circular(8),
          border: const Border(
            bottom: BorderSide(
              color: Color(0xff8C8D8F),
              width: 1,
            ),
            top: BorderSide(
              color: Color(0xff8C8D8F),
              width: 1,
            ),
            left: BorderSide(
              color: Color(0xff8C8D8F),
              width: 4,
            ),
            right: BorderSide(
              color: Color(0xff8C8D8F),
              width: 1,
            ),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Course code
          Text(
            code,
            style: GoogleFonts.raleway(
              color: const Color(0xff8B8C8F),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),

          const SizedBox(height: 16),

          // Course title
          Text(
            title,
            style: GoogleFonts.raleway(
              color: const Color(0xff8C8D8F),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),

          const SizedBox(height: 16),

          // Instructor name
          Text(
            instructor,
            style: GoogleFonts.raleway(
              color: const Color(0xff8B8C8F),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),

          const SizedBox(height: 55),

          //   BUTTONS
          Column(
            children: [
              // Request to Join
              SizedBox(
                height: 37,
                width: 320,
                child: _CardButton(
                  label: 'Request to Join',
                  img: Image.asset('assets/coursesLogo.png',
                      width: 16, height: 16),
                  color: const Color(0xff00B764),
                  filled: true,
                ),
              ),

              // it's meant to be 16
              const SizedBox(height: 13),

              // Preview Course
              SizedBox(
                height: 37,
                width: 320,
                child: _CardButton(
                  label: 'Preview Course',
                  img: Image.asset('assets/coursesLogo.png',
                      width: 16, height: 16),
                  color: const Color(0xff00B764),
                  filled: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Reusable Card Button

class _CardButton extends StatelessWidget {
  final String label;
  final Image img;
  final Color color;
  final bool filled;

  const _CardButton({
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
                      'In order for you to join a course we need either the email from the school you are affiliated with or the professional email you would like to use',
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
          backgroundColor: filled ? color : const Color(0xff152826),
          side: BorderSide(color: color, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/coursesLogo.png',
                color: filled ? const Color(0xff191A1F) : color),
            Text(label,
                style: GoogleFonts.raleway(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: filled ? const Color(0xff191A1F) : color))
          ],
        ));
  }
}
