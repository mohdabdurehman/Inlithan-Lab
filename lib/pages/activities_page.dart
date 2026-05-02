import 'package:flutter/material.dart';
import '../components/appBar.dart';
import '../components/activityCard.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
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
