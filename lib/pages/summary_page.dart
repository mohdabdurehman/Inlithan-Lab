import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryPage extends StatefulWidget {
  const SummaryPage({super.key});

  @override
  State<SummaryPage> createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  int _currentNoteIndex = 0; // tracks current lesson note section
  bool _showLesson = true;

  final List<Map<String, String>> lessonNotes = [
    {
      'content':
          'The Software Development Life Cycle (SDLC) is a structured approach that outlines all the  steps involved in creating software, from planning to maintenance. It ensures that software  is built systematically and meets user requirements.\n\n The Software Development Life Cycle (SDLC) consists of several key steps, each with a  specific purpose. These steps ensure that the software development process is systematic  and efficient. The main steps are:\n\n1. Planning: This is the initial step where the project’s goals are defined. The feasibility  of the project is analyzed, including cost, time, and resource estimates.\n 2. Requirements Analysis: Gather and analyze all functional and non-functional  requirements. This step helps to determine what the software must do to meet the  needs of users.   \n3. System Design: Convert the gathered requirements into a blueprint for the software.  The design outlines the architecture, modules, interfaces, and data flow.  \n 4. Implementation (Coding): The actual development of the software begins. Developers  write code based on the designs.  \n 5. Testing: Ensure that the software works correctly and meets all requirements. Bugs,  issues, and discrepancies are identified and resolved.   \n6. Deployment: Deliver the software to the user environment where it will operate. This  could involve installing the software on servers or providing it as a downloadable  product.  7. Maintenance: After deployment, maintenance ensures the software continues to work  smoothly and meets user needs. This includes fixing bugs, adding new features, and  making improvements.'
    },
  ];

  final List<String> pageNotes = [
    'Apply time value of money concepts to real-world engineering problems'
  ];

  void _next() {
    if (_currentNoteIndex < lessonNotes.length - 1) {
      setState(() {
        _currentNoteIndex++;
      });
    }
  }

  void _previous() {
    if (_currentNoteIndex > 0) {
      setState(() {
        _currentNoteIndex--;
      });
    }
  }

  void _toggleMode() {
    setState(() {
      _showLesson = !_showLesson;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentLesson = lessonNotes[_currentNoteIndex];

    return Scaffold(
      backgroundColor: const Color(0xff191A1F),

      // APP BAR
      appBar: AppBar(
        backgroundColor: const Color(0xff191A1F),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xff00B764)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Week 4: Software Development...',
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

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 32,
          ),
          child: Column(
            children: [
              // ── LESSON NOTES CARD ──
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff191A1F),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xff152826), width: 2),
                ),
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Lesson Notes Label + Icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color(0xff00B764), width: 1)),
                            color: Color(0xff152826),
                          ),
                          child: Text(
                            'Summary',
                            style: GoogleFonts.raleway(
                                color: const Color(0xff00B764),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Image.asset('assets/flashcard.png',
                            width: 32, height: 32),
                      ],
                    ),

                    const Divider(
                        color: Color(0xff152826), height: 32, thickness: 2),

                    // Progress Indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Lesson',
                          style: GoogleFonts.raleway(
                            color: _showLesson
                                ? const Color(0xff00B764)
                                : Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 28),
                        GestureDetector(
                          onTap: _toggleMode,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            width: 72,
                            height: 40,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xff152826),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Align(
                              alignment: _showLesson
                                  ? Alignment.centerLeft
                                  : Alignment.centerRight,
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: const BoxDecoration(
                                  color: Color(0xff00B764),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 28),
                        Text(
                          'Page',
                          style: GoogleFonts.raleway(
                            color: !_showLesson
                                ? const Color(0xff00B764)
                                : Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Lesson Notes Content
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _showLesson
                              ? currentLesson['content']!
                              : pageNotes[_currentNoteIndex],
                          style: GoogleFonts.raleway(
                            color: const Color(0xfffeffff),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 20),
                    // ── NEXT BUTTON ──
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: _next,
                        child: Text(
                          'Next',
                          style: GoogleFonts.raleway(
                            color: _currentNoteIndex < lessonNotes.length - 1
                                ? const Color(0xff00B764)
                                : Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
