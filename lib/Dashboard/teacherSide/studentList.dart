import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../components/appBar.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  int _expandedIndex = -1; // tracks which student is expanded
  int _selectedFilter = 0; // tracks which filter tab is selected

  final List<String> filters = ['All', 'Rank', 'Courses', 'Activity'];

  final List<Map<String, dynamic>> students = [
    {
      'name': 'Yedil Beken',
      'activity': {
        'Quiz': 22,
        'Assignments': 22,
        'Activities': 22,
      },
      'course': 'Mobile Programming',
      'rank': {
        'commitsThisWeek': 8,
        'commitsThisMonth': 21,
        'commitsThisYear': 379,
        'allTimeCommits': 2782,
        'topLanguages': 'Solidity, JavaScript, C#',
        'rank': 1,
      },
    },
    {
      'name': 'Yasmina Soldun',
      'activity': {
        'Quiz': 18,
        'Assignments': 15,
        'Activities': 20,
      },
      'course': 'Economics for Engineers',
      'rank': {
        'commitsThisWeek': 5,
        'commitsThisMonth': 14,
        'commitsThisYear': 210,
        'allTimeCommits': 1540,
        'topLanguages': 'Python, Dart',
        'rank': 2,
      },
    },
    {
      'name': 'Victor Okafor',
      'activity': {
        'Quiz': 10,
        'Assignments': 12,
        'Activities': 8,
      },
      'course': 'Graduation Project',
      'rank': {
        'commitsThisWeek': 3,
        'commitsThisMonth': 9,
        'commitsThisYear': 140,
        'allTimeCommits': 980,
        'topLanguages': 'Java, Kotlin',
        'rank': 3,
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191A1F),
      body: SafeArea(
        child: Column(
          children: [
            Appbar(
              title: 'Students List',
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                ),
                child: Column(
                  children: [
                    // ── FILTER TABS ──
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(filters.length, (index) {
                          final bool isSelected = _selectedFilter == index;
                          final bool isCourses = filters[index] == 'Courses';

                          return GestureDetector(
                            onTap: () =>
                                setState(() => _selectedFilter = index),
                            child: Container(
                              margin: EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Color(0xff152826)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: isSelected
                                      ? const Color(0xff00B764)
                                      : const Color(0xff8c8d8f),
                                  width: 1.5,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    filters[index],
                                    style: GoogleFonts.raleway(
                                      color: isSelected
                                          ? const Color(0xff00B764)
                                          : const Color(0xff8C8D8F),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  // show dropdown arrow for Courses tab
                                  if (isCourses) ...[
                                    const SizedBox(width: 4),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: isSelected
                                          ? const Color(0xff00B764)
                                          : const Color(0xff8C8D8F),
                                      size: 16,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ── STUDENT LIST ──
                    Expanded(
                      child: ListView.separated(
                        itemCount: students.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 31),
                        itemBuilder: (context, index) {
                          final student = students[index];
                          final bool isExpanded = _expandedIndex == index;

                          return _StudentCard(
                            student: student,
                            isExpanded: isExpanded,
                            onTap: () => setState(() {
                              _expandedIndex = isExpanded ? -1 : index;
                            }),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────
// STUDENT CARD
// ─────────────────────────────────────────
class _StudentCard extends StatelessWidget {
  final Map<String, dynamic> student;
  final bool isExpanded;
  final VoidCallback onTap;

  const _StudentCard({
    required this.student,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final rank = student['rank'] as Map<String, dynamic>;
    final activity = student['activity'] as Map<String, dynamic>;

    return Container(
      decoration: BoxDecoration(
        color: isExpanded ? Colors.transparent : const Color(0xff1e212a),
        borderRadius: BorderRadius.circular(8),
        border: const Border(
            bottom: BorderSide(color: const Color(0xff242727), width: 1),
            top: BorderSide(color: const Color(0xff242727), width: 1),
            right: BorderSide(color: const Color(0xff242727), width: 1),
            left: BorderSide(color: const Color(0xff242727), width: 4)),
      ),
      child: Column(
        children: [
          // ── HEADER ROW ──
          GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  // person icon

                  const Icon(Icons.person, color: Colors.white, size: 28),

                  const SizedBox(width: 24),

                  // name
                  Expanded(
                    child: Text(
                      student['name'],
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  // chevron icon
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: const Color(0xff00B764),
                    size: 24,
                  ),
                ],
              ),
            ),
          ),

          // ── EXPANDED DETAILS ──
          if (isExpanded) ...[
            Divider(color: const Color(0xff242727), height: 1),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Activity Details
                  _sectionTitle('Activity Details:'),
                  const SizedBox(height: 10),
                  ...activity.entries
                      .map((e) => _detailRow('${e.key}:', '${e.value}')),

                  const SizedBox(height: 16),

                  // Course Details
                  _sectionTitle('Course Details:'),
                  const SizedBox(height: 10),
                  Text(student['course'],
                      style: GoogleFonts.raleway(
                          color: Colors.white, fontSize: 14)),

                  const SizedBox(height: 16),

                  // Rank Details
                  _sectionTitle('Rank Details:'),
                  const SizedBox(height: 10),
                  _detailRow(
                      'Commits this week:', '${rank['commitsThisWeek']}'),
                  _detailRow(
                      'Commits this month:', '${rank['commitsThisMonth']}'),
                  _detailRow(
                      'Commits this year:', '${rank['commitsThisYear']}'),
                  _detailRow('All time commits:', '${rank['allTimeCommits']}'),
                  _detailRow('Top programming language:', rank['topLanguages']),
                  _detailRow('Rank:', '${rank['rank']}'),

                  const SizedBox(height: 24),

                  // Review Student Button
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        width: 241,
                        height: 60,
                        child: OutlinedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text('Reviewing ${student['name']}...'),
                                backgroundColor: const Color(0xff00B764),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Color(0xff152826),
                            side: const BorderSide(
                                color: Color(0xff00B764), width: 1.5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Text('Review Student',
                              style: GoogleFonts.raleway(
                                color: const Color(0xff00B764),
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  // ── section title helper ──
  Widget _sectionTitle(String title) {
    return Text(title,
        style: GoogleFonts.raleway(
          color: const Color(0xfffffffF),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ));
  }

  // ── detail row helper: label + value ──
  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: RichText(
        text: TextSpan(
          style: GoogleFonts.raleway(color: Colors.white, fontSize: 14),
          children: [
            TextSpan(text: '$label '),
            TextSpan(
              text: value,
              style: const TextStyle(color: Color(0xff8C8D8F)),
            ),
          ],
        ),
      ),
    );
  }
}
