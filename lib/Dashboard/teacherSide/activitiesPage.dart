import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/components/appBar.dart';
import '../../../components/activityCard.dart';

class ActivitiesPageT extends StatefulWidget {
  const ActivitiesPageT({super.key});

  @override
  State<ActivitiesPageT> createState() => _ActivitiesPageTState();
}

class _ActivitiesPageTState extends State<ActivitiesPageT> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> activities = [
      {
        'title': 'Quiz',
        'code': 'Economics for Engineers',
        'icon': 'assets/coursesIcon.png',
      },
      {
        'title': 'Assignment',
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
          const Appbar(title: 'Activities'),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                    color: Color(0xff152826),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xff00b764), width: 1)),
                child: Text('Create New Activity',
                    style: GoogleFonts.raleway(
                      color: const Color(0xff00b764),
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    )),
              ),
            ),
          ),
          SizedBox(height: 40),
          // ACTIVITIES CARDS
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              itemCount: activities.length,
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
                    child: ActivitiesCard(
                      title: activities[index]['title']!,
                      coursename: activities[index]['code']!,
                      icon: Image.asset(activities[index]['icon']!),
                      filled: _selectedIndex == index,
                    ));
              },
            ),
          ),
        ])));
  }
}
