import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> courses = [
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explore',
                    style: GoogleFonts.raleway(
                      color: Color(0xff8C8D8F),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.search,
                            color: Color(0xff8C8D8F), size: 24),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.menu_open,
                            color: Color(0xff8C8D8F), size: 24),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //  Divider under appbar
            Divider(color: Color(0xff8C8D8F), height: 1),

            const SizedBox(height: 32),

            //  COURSE CARDS
            Expanded(
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: courses.length,
                separatorBuilder: (__, _) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  return _CourseCard(
                    code: courses[index]['code']!,
                    title: courses[index]['title']!,
                    instructor: courses[index]['instructor']!,
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

// Course Card Widget

class _CourseCard extends StatelessWidget {
  final String code;
  final String title;
  final String instructor;

  const _CourseCard({
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
          border: Border(
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
              color: Color(0xff8B8C8F),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),

          SizedBox(height: 16),

          // Course title
          Text(
            title,
            style: GoogleFonts.raleway(
              color: Color(0xff8C8D8F),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),

          SizedBox(height: 16),

          // Instructor name
          Text(
            instructor,
            style: GoogleFonts.raleway(
              color: Color(0xff8B8C8F),
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
                child: Expanded(
                  child: _CardButton(
                    label: 'Request to Join',
                    img: ImageIcon(
                      AssetImage('assets/coursesLogo.png'),
                      size: 16,
                    ),
                    color: const Color(0xff00B764),
                    filled: true,
                  ),
                ),
              ),

              // it's meant to be 16
              const SizedBox(height: 13),

              // Preview Course
              SizedBox(
                height: 37,
                width: 320,
                child: Expanded(
                  child: _CardButton(
                    label: 'Preview Course',
                    img: ImageIcon(
                      AssetImage('assets/coursesLogo.png'),
                      size: 16,
                    ),
                    color: const Color(0xff00B764),
                    filled: false,
                  ),
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
  final ImageIcon img;
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
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: filled ? color : Color(0xff152826),
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
                color: filled ? Color(0xff191A1F) : color),
            Text(label,
                style: GoogleFonts.raleway(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: filled ? Color(0xff191A1F) : color))
          ],
        ));
  }
}
