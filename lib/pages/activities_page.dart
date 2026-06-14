import 'package:flutter/material.dart';
import '../components/appBar.dart';
import '../components/activityCard.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/activities_provider.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final activities = context.watch<ActivitiesProvider>().activities;

    return Scaffold(
        backgroundColor: const Color(0xff191A1F),
        body: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // APP BAR
          const Appbar(title: 'Activities'),

          // ACTIVITIES CARDS
          Expanded(
            child: activities.isEmpty
                ? Center(
                    child: Text(
                      'No activities yet.',
                      style: GoogleFonts.raleway(
                        color: const Color(0xff8C8D8F),
                        fontSize: 14,
                      ),
                    ),
                  )
                : ListView.separated(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    itemCount: activities.length,
                    separatorBuilder: (__, _) => const SizedBox(height: 24),
                    itemBuilder: (context, index) {
                      final activity = activities[index];
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (_selectedIndex == index) {
                                _selectedIndex = -1;
                              } else {
                                _selectedIndex = index;
                              }
                            });
                          },
                          child: ActivitiesCard(
                            title: activity['type'] ?? '',
                            coursename: activity['title'] ?? '',
                            icon: Image.asset('assets/coursesIcon.png'),
                            filled: _selectedIndex == index,
                          ));
                    },
                  ),
          ),
        ])));
  }
}
