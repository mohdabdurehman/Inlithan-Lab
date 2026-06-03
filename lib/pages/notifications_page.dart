import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/notificationsCard.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> notifications = [
      {
        'Updated Course': 'Course Updated - Economics\n for Engineers',
        'description':
            'The Economics for Engineers course\n has been thoroughly revamped to\n replace outdated material with fresh,\n modernized content. This update\n ensures the course reflects current\n standards and provides learners with a\n more relevant and engaging\n experience.\n We encourage you to explore the\n refreshed modules and take advantage\n of the improved learning journey.',
        'icon': 'assets/profileLogo.png',
        'date': '5/26/26',
      },
      {
        'Updated Course': 'Course Updated - Graduation\n Project',
        'description':
            'The Economics for Engineers course\n has been thoroughly revamped to\n replace outdated material with fresh,\n modernized content. This update\n ensures the course reflects current\n standards and provides learners with a\n more relevant and engaging\n experience.\n We encourage you to explore the\n refreshed modules and take advantage\n of the improved learning journey.',
        'icon': 'assets/profileLogo.png',
        'date': '1/1/21',
      },
      {
        'Updated Course': 'Course Updated - operating\n systems',
        'description':
            'The Economics for Engineers course\n has been thoroughly revamped to\n replace outdated material with fresh,\n modernized content. This update\n ensures the course reflects current\n standards and provides learners with a\n more relevant and engaging\n experience.\n We encourage you to explore the\n refreshed modules and take advantage\n of the improved learning journey.',
        'icon': 'assets/profileLogo.png',
        'date': '26/4//26',
      },
    ];
    return Scaffold(
      backgroundColor: const Color(0xff191A1F),
      appBar: AppBar(
        backgroundColor: const Color(0xff191A1F),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xff00B764)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Notifications',
          style: GoogleFonts.raleway(
              color: const Color(0xff8c8d8f),
              fontSize: 24,
              fontWeight: FontWeight.w500),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(32),
          child: Divider(
            color: Color(0xff8c8d8f),
            thickness: 1,
            height: 32,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 32),
              itemCount: notifications.length,
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
                    child: NotificationsCard(
                      courseUpdated: notifications[index]['Updated Course']!,
                      description: notifications[index]['description']!,
                      icon: Image.asset(notifications[index]['icon']!),
                      date: notifications[index]['date']!,
                      filled: _selectedIndex == index,
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
