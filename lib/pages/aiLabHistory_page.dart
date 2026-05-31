import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LabHistory extends StatefulWidget {
  const LabHistory({super.key});

  @override
  State<LabHistory> createState() => _LabHistoryState();
}

class _LabHistoryState extends State<LabHistory> {
  // ── Lab history data ──
  final List<Map<String, String>> labHistory = [
    {
      'title': 'Programing II',
      'date': '12 April 2026',
      'icon': 'courses',
    },
    {
      'title': 'Asset Pricing model and what it emtails',
      'date': '22 March 2026',
      'icon': 'book',
    },
    {
      'title': 'Operations research',
      'date': '10 September 2025',
      'icon': 'class',
    },
    {
      'title': 'Economics for Engineers',
      'date': '15 October 2025',
      'icon': 'courses',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191A1F),

      // ── APP BAR ──

      appBar: AppBar(
        backgroundColor: const Color(0xff191A1F),
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          'AI Lab',
          style: GoogleFonts.raleway(
            color: const Color(0xff8C8D8F),
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xff8C8D8F), size: 30),
            onPressed: () {},
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(32),
          child: Divider(color: Color(0xff8c8d8f), thickness: 1, height: 32),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── LAB HISTORY HEADER ROW ──

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Lab History',
                  style: GoogleFonts.raleway(
                    color: Color(0xff8C8D8F),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // TODO: navigate to new lab session screen
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Starting new lab session...'),
                        backgroundColor: Color(0xff00B764),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.add, color: Color(0xff00B764), size: 16),
                      const SizedBox(width: 6),
                      Text(
                        'Start New Lab Session',
                        style: GoogleFonts.raleway(
                          color: const Color(0xff00B764),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // ── LAB HISTORY LIST ──
            // Expanded + ListView so it scrolls if many items
            Expanded(
              child: ListView.separated(
                itemCount: labHistory.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return _LabHistoryCard(item: labHistory[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// LAB HISTORY CARD WIDGET
class _LabHistoryCard extends StatelessWidget {
  final Map<String, String> item;
  const _LabHistoryCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
        decoration: BoxDecoration(
            color: const Color(0xff1E212A),
            borderRadius: BorderRadius.circular(8),
            border: Border(
              bottom: BorderSide(color: const Color(0xff242727), width: 1),
              top: BorderSide(color: const Color(0xff242727), width: 1),
              left: BorderSide(color: const Color(0xff242727), width: 4),
              right: BorderSide(color: const Color(0xff242727), width: 1),
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              item['icon'] == 'courses'
                  ? 'assets/coursesLogo.png'
                  : 'assets/coursesIcon.png',
              color: Colors.white,
              width: 20,
              height: 20,
            ),

            const SizedBox(width: 30),

            // ── TITLE + DATE ──
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    item['title']!,
                    style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Date — right aligned
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        item['date']!,
                        style: GoogleFonts.raleway(
                          color: const Color(0xfffffFff),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 20),
                      // ── 3-DOT MENU ──
                      GestureDetector(
                        onTap: () {
                          // show options menu
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: const Color(0xff1E212A),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16)),
                            ),
                            builder: (_) =>
                                _LabOptionsSheet(title: item['title']!),
                          );
                        },
                        child: const Icon(
                          Icons.more_horiz,
                          color: Color(0xfffffffF),
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

// BOTTOM SHEET — shown when 3-dot tapped

class _LabOptionsSheet extends StatelessWidget {
  final String title;
  const _LabOptionsSheet({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sheet title
          Text(title,
              style: GoogleFonts.raleway(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              )),

          const SizedBox(height: 20),

          // Options
          _optionRow(context, Icons.open_in_new, 'Open Session'),
          _optionRow(context, Icons.share_outlined, 'Share'),
          _optionRow(context, Icons.delete_outline, 'Delete', isRed: true),
        ],
      ),
    );
  }

  Widget _optionRow(BuildContext context, IconData icon, String label,
      {bool isRed = false}) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(icon,
                color: isRed ? Colors.red : const Color(0xff8C8D8F), size: 20),
            const SizedBox(width: 16),
            Text(label,
                style: GoogleFonts.raleway(
                  color: isRed ? Colors.red : Colors.white,
                  fontSize: 15,
                )),
          ],
        ),
      ),
    );
  }
}
