import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/appBar.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> courses = [
      {
        'title': 'Quiz',
        'code': 'Economics for Engineers',
        'icon': 'assets/coursesIcon.png',
      },
      {
        'title': 'Notes',
        'code': 'Graduation Project',
        'icon': 'assets/coursesIcon.png',
      },
    ];
    return Scaffold(
        backgroundColor: const Color(0xff191A1F),
        body: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // APP BAR
          Appbar(title: 'Activities'),

          // ACTIVITIES CARDS
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              itemCount: courses.length,
              separatorBuilder: (__, _) => const SizedBox(height: 24),
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_selectedIndex == index) {
                          _selectedIndex = -1; // Deselect
                        } else {
                          _selectedIndex = index; // Select new card
                        }
                      });
                    },
                    child: _ActivitiesCard(
                      title: courses[index]['title']!,
                      coursename: courses[index]['code']!,
                      icon: Image.asset('assets/coursesIcon.png'),
                      filled: _selectedIndex == index,
                    ));
              },
            ),
          ),
        ])));
  }
}

class _ActivitiesCard extends StatelessWidget {
  final String title;
  final String coursename;
  final Image icon;
  final bool filled;

  const _ActivitiesCard({
    required this.title,
    required this.coursename,
    required this.icon,
    required this.filled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 197,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
      decoration: BoxDecoration(
          color: filled ? Color(0xff292f2f) : Color(0xff191A1F),
          borderRadius: BorderRadius.circular(8),
          border: Border(
            bottom: BorderSide(
              color: Color(0xff292f2f),
              width: 1,
            ),
            top: BorderSide(
              color: Color(0xff292f2f),
              width: 1,
            ),
            left: BorderSide(
              color: Color(0xff292f2f),
              width: 4,
            ),
            right: BorderSide(
              color: Color(0xff292f2f),
              width: 1,
            ),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          Text(
            title,
            style: GoogleFonts.raleway(
              color: Color(0xffffffff),
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(height: 16),

          // course name
          Text(
            coursename,
            style: GoogleFonts.raleway(
              color: Color(0xffffffff),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),

          SizedBox(height: 16),

          // courses with questions
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'All 426',
              style: GoogleFonts.raleway(
                color: Color(0xffffffff),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              '15 questions',
              style: GoogleFonts.raleway(
                color: Color(0xffffffff),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ]),

          SizedBox(height: 40),

          // ICON
          icon,
        ],
      ),
    );
  }
}
