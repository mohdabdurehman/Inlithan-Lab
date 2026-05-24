import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AttemptingQuiz extends StatefulWidget {
  const AttemptingQuiz({super.key});

  @override
  State<AttemptingQuiz> createState() => _AttemptingQuizState();
}

class _AttemptingQuizState extends State<AttemptingQuiz> {
  int _currentIndex = 0;
  int? _selectedAnswer;
  int _timeLeft = 656; // 10:56 in seconds
  late Timer _timer;

  final List<Map<String, dynamic>> questions = [
    {
      'question': '1. In Agile, what is the purpose of a Sprint Review/Demo?',
      'answers': [
        'To plan the next sprint',
        'To present completed work to stakeholders',
        'To refine requirements',
        'To test prototypes',
      ],
      'correct': 1,
    },
    {
      'question': '2. What does SCRUM stand for?',
      'answers': [
        'A project management tool',
        'A software testing method',
        'A framework for agile development',
        'A type of meeting',
      ],
      'correct': 2,
    },
    {
      'question': '3. What is a Sprint in Agile?',
      'answers': [
        'A daily standup meeting',
        'A fixed time period for completing tasks',
        'A product release',
        'A bug fixing session',
      ],
      'correct': 1,
    },
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  // START COUNTDOWN TIMER
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() => _timeLeft--);
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // always cancel timer when screen closes
    super.dispose();
  }

  //  FORMAT SECONDS TO MM:SS
  String get _formattedTime {
    final minutes = _timeLeft ~/ 60; // integer division
    final seconds = _timeLeft % 60; // remainder
    return '${minutes.toString().padLeft(2, '0')} : ${seconds.toString().padLeft(2, '0')}';
  }

  void _next() {
    if (_currentIndex < questions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedAnswer = null; // reset selection
      });
    }
  }

  void _previous() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _selectedAnswer = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[_currentIndex];

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
          ' Quiz',
          style: GoogleFonts.raleway(
              color: Color(0xff8c8d8f),
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

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xff191A1F),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xff152826), width: 2),
          ),
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              //  TIMER
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Color(0xff00b764), width: 1)),
                    color: const Color(0xff152826),
                  ),
                  child: Text(
                    'Time Left:   $_formattedTime',
                    style: GoogleFonts.raleway(
                      color: Color(0xff00B764),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              Divider(color: Color(0xff152826), height: 32, thickness: 1),

              //  PROGRESS
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _previous,
                    child: Icon(Icons.chevron_left,
                        color: _currentIndex > 0
                            ? const Color(0xff00B764)
                            : Colors.grey,
                        size: 28),
                  ),
                  const SizedBox(width: 28),
                  Container(
                    width: 72,
                    height: 35,
                    decoration: BoxDecoration(
                      color: const Color(0xff152826),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text('${_currentIndex + 1}',
                          style: GoogleFonts.raleway(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text('of ${questions.length}',
                      style: GoogleFonts.raleway(
                          color: Color(0xff8C8D8F), fontSize: 16)),
                  const SizedBox(width: 28),
                  GestureDetector(
                    onTap: _next,
                    child: Icon(Icons.chevron_right,
                        color: _currentIndex < questions.length - 1
                            ? const Color(0xff00B764)
                            : Colors.grey,
                        size: 28),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              //  QUESTION
              Text(q['question'],
                  style:
                      GoogleFonts.raleway(color: Colors.white, fontSize: 16)),

              const SizedBox(height: 20),

              //  ANSWER OPTIONS
              ...List.generate(q['answers'].length, (i) {
                final bool isSelected = _selectedAnswer == i;
                return GestureDetector(
                  onTap: () => setState(() => _selectedAnswer = i),
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xff00b764)
                          : const Color(0xff152826),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        // radio circle
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xff152826)
                                  : const Color(0xff00B764),
                              width: 2,
                            ),
                          ),
                          child: isSelected
                              ? Center(
                                  child: Container(
                                    width: 16,
                                    height: 16,
                                    decoration: const BoxDecoration(
                                      color: Color(0xff152826),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                )
                              : null,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(q['answers'][i],
                              style: GoogleFonts.raleway(
                                  color: isSelected
                                      ? Color(0xff152826)
                                      : Colors.white,
                                  fontSize: 16)),
                        ),
                      ],
                    ),
                  ),
                );
              }),

              const SizedBox(height: 20),

              //  NEXT BUTTON
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: _selectedAnswer != null ? _next : null,
                  child: Text(
                    'Next',
                    style: GoogleFonts.raleway(
                      color: _selectedAnswer != null
                          ? const Color(0xff00B764)
                          : Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
