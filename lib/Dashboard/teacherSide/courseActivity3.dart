import 'package:flutter/material.dart';
import '../../components/activityCard.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/appBar.dart';

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

class CourseActivities3T extends StatefulWidget {
  const CourseActivities3T({super.key});

  @override
  State<CourseActivities3T> createState() => CourseActivities3TState();
}

class CourseActivities3TState extends State<CourseActivities3T> {
  // tracks which week is expanded
  int _expandedIndex = 0;
  int _selectedIndex = -1;
  bool _isLinkCopied = false;

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
      body: SafeArea(
        child: Column(
          children: [
            Appbar(
                title: 'Economics for Engineers',
                showSearch: false,
                leading: Icon(Icons.arrow_back_ios,
                    color: Color(0xff00b764), size: 28)),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 32),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Color(0xff303530), width: 1)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Student List',
                                    style: GoogleFonts.raleway(
                                      color: const Color(0xffffffff),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    )),
                                SizedBox(
                                  height: 30,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xff00B764),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                                'assets/previewIcon.png'),
                                            const SizedBox(width: 26),
                                            Text("View Student List",
                                                style: GoogleFonts.raleway(
                                                  color:
                                                      const Color(0xff191a1f),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => StatefulBuilder(
                                          builder: (context, setDialogState) {
                                        return Dialog(
                                          backgroundColor:
                                              const Color(0xff191a1f),
                                          shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                color: Color(0xff00b764),
                                                width: 1.5),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(24),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // ── Header ──
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('Student Invite',
                                                        style:
                                                            GoogleFonts.raleway(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                        )),
                                                    GestureDetector(
                                                      onTap: () {
                                                        setDialogState(
                                                          () {
                                                            _isLinkCopied =
                                                                false;
                                                          },
                                                        );

                                                        Navigator.pop(context);
                                                      },
                                                      child: const Icon(
                                                          Icons.close,
                                                          color: Colors.white,
                                                          size: 20),
                                                    ),
                                                  ],
                                                ),

                                                const SizedBox(height: 32),

                                                // ── Description ──
                                                Text(
                                                  'In order for students from your university or cohort to join course they need this link:',
                                                  style: GoogleFonts.raleway(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),

                                                const SizedBox(height: 32),

                                                Container(
                                                  width: double.infinity,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 24,
                                                      vertical: 16),
                                                  decoration: BoxDecoration(
                                                      color: Color(0xff152826),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: Text(
                                                    'https://inlithanlabs.com/course/69d2920ca7841592ca167ec8',
                                                    style: GoogleFonts.raleway(
                                                        color: Colors.white,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                const SizedBox(height: 32),
                                                GestureDetector(
                                                  onTap: () {
                                                    setDialogState(() {
                                                      _isLinkCopied = true;
                                                    });
                                                  },
                                                  child: Center(
                                                    child: _isLinkCopied
                                                        ? Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              const Icon(
                                                                  Icons
                                                                      .check_circle,
                                                                  color: Color(
                                                                      0xff00b764),
                                                                  size: 20),
                                                              const SizedBox(
                                                                  width: 8),
                                                              Text(
                                                                  'Link Copied!',
                                                                  style: GoogleFonts
                                                                      .raleway(
                                                                    color: const Color(
                                                                        0xff00b764),
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  )),
                                                            ],
                                                          )
                                                        : Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Image.asset(
                                                                  'assets/copyLink.png'),
                                                              SizedBox(
                                                                width: 8,
                                                              ),
                                                              Text('Copy Link',
                                                                  style: GoogleFonts.raleway(
                                                                      color: Color(
                                                                          0xff00b764),
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600)),
                                                            ],
                                                          ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }));
                            },
                            child: Row(
                              children: [
                                Icon(Icons.add,
                                    color: Color(0xff00b764), size: 18),
                                SizedBox(
                                  width: 4,
                                ),
                                Text('Invite Students',
                                    style: GoogleFonts.raleway(
                                        color: Color(0xff00b764),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          )
                        ],
                      ),
                    ),
                  ),
                  // course ACTIVITIES TITLE

                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Course Activities',
                              style: GoogleFonts.raleway(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500)),
                          Row(
                            children: [
                              Icon(Icons.add,
                                  color: Color(0xff00b764), size: 18),
                              SizedBox(
                                width: 4,
                              ),
                              Text('Create',
                                  style: GoogleFonts.raleway(
                                      color: Color(0xff00b764),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ],
                      ),
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
                                _selectedIndex =
                                    _selectedIndex == index ? -1 : index;
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
                          onTap: () => setState(
                              () => _expandedIndex = isExpanded ? -1 : index),
                        );
                      },
                      childCount: weeks.length,
                    ),
                  ),

                  //  ABOUT SECTION
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 160),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('About This Course',
                                  style: GoogleFonts.raleway(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500)),
                              Row(
                                children: [
                                  Icon(Icons.save,
                                      color: Color(0xff00b764), size: 18),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('Save',
                                      style: GoogleFonts.raleway(
                                          color: Color(0xff00b764),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 32),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                            decoration: BoxDecoration(
                              color: Color(0xff152826),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(aboutText,
                                style: GoogleFonts.raleway(
                                    color: const Color(0xff8C8D8F),
                                    fontSize: 20)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
                    Row(
                      children: [
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
                          child: Text('View',
                              style: GoogleFonts.raleway(
                                  fontSize: 24,
                                  color: const Color(0xff00B764),
                                  fontWeight: FontWeight.w700)),
                        ),
                        SizedBox(
                          width: 24,
                        ),
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
                          child: Text('Edit',
                              style: GoogleFonts.raleway(
                                  fontSize: 24,
                                  color: const Color(0xff00B764),
                                  fontWeight: FontWeight.w700)),
                        ),
                      ],
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
