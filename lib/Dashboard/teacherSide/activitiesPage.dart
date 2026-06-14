import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/components/appBar.dart';
import '../../../components/activityCard.dart';
import 'package:provider/provider.dart';
import '../../providers/activities_provider.dart';

class ActivitiesPageT extends StatefulWidget {
  const ActivitiesPageT({super.key});

  @override
  State<ActivitiesPageT> createState() => _ActivitiesPageTState();
}

class _ActivitiesPageTState extends State<ActivitiesPageT> {
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
