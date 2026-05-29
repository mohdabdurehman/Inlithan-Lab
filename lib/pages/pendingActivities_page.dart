import 'package:flutter/material.dart';
import '../components/activityCard.dart';
import 'package:google_fonts/google_fonts.dart';

// DATA MODELS

class WeekItem {
  final String week;
  final String title;
  final String? description;
  final bool isExpanded;
  WeekItem(
      {required this.week,
      required this.title,
      this.description,
      this.isExpanded = false});
}

class PendingActivities extends StatefulWidget {
  const PendingActivities({super.key});

  @override
  State<PendingActivities> createState() => _PendingActivitiesState();
}

class _PendingActivitiesState extends State<PendingActivities> {
  // tracks which week is expanded
  int _expandedIndex = 0;
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

    final List<WeekItem> weeks = [
      WeekItem(
          week: 'Week 4:',
          title: 'Time Value of Money',
          description:
              'The Time Value of Money (TVM) is a fundamental principle in engineering economics that highlights how the value of money changes over time due to its earning potential.'),
      WeekItem(week: 'Week 5:', title: 'Time Value of Money II'),
      WeekItem(
          week: 'Week 6:',
          title: 'Evaluating a Single Project',
          description:
              'The Time Value of Money (TVM) is a fundamental principle in engineering economics that highlights how the value of money changes over time due to its earning potential.'),
      WeekItem(
          week: 'Week 7:',
          title: 'Comparison and Selection among Alternatives'),
      WeekItem(week: 'Week 8:', title: 'Midterm Exam'),
      WeekItem(week: 'Week 9:', title: 'Depreciation Methods and Income Taxes'),
      WeekItem(
          week: 'Week 10:',
          title: 'Evaluating Projects with the Benefit-Cost Ratio Method'),
      WeekItem(week: 'Week 11:', title: 'Price Changes and Exchange Rates'),
      WeekItem(week: 'Week 12:', title: 'Breakeven and Sensitivity Analysis'),
      WeekItem(week: 'Week 1:', title: 'Introduction'),
      WeekItem(week: 'Week 2:', title: 'Cost Concepts and Design Economics'),
      WeekItem(week: 'Week 3:', title: 'Cost Estimation Techniques'),
    ];

    const String aboutText =
        'Engineering Economics bridges the gap between technical decision-making and financial reasoning. This course introduces students to the principles of economic analysis applied to engineering projects, helping them evaluate costs, benefits, risks, and sustainability. Students will learn how to:\n\n'
        '• Apply time value of money concepts to real-world engineering problems.\n\n'
        '• Compare alternative designs and investments using cash flow analysis.\n\n'
        '• Understand cost estimation, depreciation, and break-even analysis.\n\n'
        '• Assess project feasibility with tools like Net Present Value (NPV), Internal Rate of Return (IRR), and Payback Period.\n\n'
        '• Integrate economic thinking into engineering design, resource allocation, and policy decisions.\n\n'
        'By the end of the course, learners will be equipped to make informed, financially sound engineering choices that balance innovation with practicality.';

    return Scaffold(
      backgroundColor: const Color(0xff191A1F),

      //  APP BAR
      appBar: AppBar(
        backgroundColor: const Color(0xff191A1F),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xff00B764)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Economics for engineers',
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

      body: CustomScrollView(
        slivers: [
          // PENDING ACTIVITIES TITLE

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
              child: Text('Pending Activities',
                  style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500)),
            ),
          ),

          //  ACTIVITY CARDS
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: activities.asMap().entries.map((entry) {
                  final index = entry.key;
                  final activity = entry.value;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = _selectedIndex == index ? -1 : index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: SizedBox(
                        width: double.infinity,
                        child: ActivitiesCard(
                          title: activity['title']!,
                          coursename: activity['code']!,
                          icon: Image.asset(activity['icon']!),
                          filled: _selectedIndex == index,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          //  CURRICULUM TITLE
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 32, 30, 12),
              child: Text('Curriculum',
                  style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500)),
            ),
          ),

          //  WEEK ITEMS
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final week = weeks[index];
                final bool isExpanded = _expandedIndex == index;
                return _WeekTile(
                  weeknum: week,
                  isExpanded: isExpanded,
                  onTap: () =>
                      setState(() => _expandedIndex = isExpanded ? -1 : index),
                );
              },
              childCount: weeks.length,
            ),
          ),

          //  ABOUT SECTION
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 160),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About This Course',
                      style: GoogleFonts.raleway(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(height: 32),
                  Text(aboutText,
                      style: GoogleFonts.raleway(
                          color: const Color(0xff8C8D8F), fontSize: 24)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// WEEK TILE WIDGET

class _WeekTile extends StatelessWidget {
  final WeekItem weeknum;
  final bool isExpanded;
  final VoidCallback onTap;

  const _WeekTile(
      {required this.weeknum, required this.isExpanded, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xff191A1F),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color:
                isExpanded ? const Color(0xff00B764) : const Color(0xff152826),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  Header row
            Container(
              decoration: BoxDecoration(
                color: isExpanded
                    ? const Color(0xff00B764)
                    : const Color(0xff191A1F),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              child: Row(
                children: [
                  Text('${weeknum.week}  ',
                      style: GoogleFonts.raleway(
                        color: isExpanded
                            ? const Color(0xff191a1f)
                            : const Color(0xff8C8D8F),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                  Expanded(
                    child: Text(weeknum.title,
                        style: GoogleFonts.raleway(
                          color: isExpanded
                              ? const Color(0xff191a1f)
                              : const Color(0xff8C8D8F),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: isExpanded
                        ? const Color(0xff191a1f)
                        : const Color(0xff00B764), // ✅ white on green
                    size: 22,
                  ),
                ],
              ),
            ),

            //  Expanded content
            if (isExpanded && weeknum.description != null) ...[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(weeknum.description!,
                        style: GoogleFonts.raleway(
                          color: const Color(0xff8C8D8F),
                          fontSize: 16,
                        )),
                    const SizedBox(height: 28),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xff152826),
                        side: const BorderSide(
                            color: Color(0xff00B764), width: 1.5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                      ),
                      child: Text('Resume',
                          style: GoogleFonts.raleway(
                              fontSize: 24,
                              color: const Color(0xff00B764),
                              fontWeight: FontWeight.w700)),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
