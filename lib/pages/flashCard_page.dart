import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlashcardPage extends StatefulWidget {
  const FlashcardPage({super.key});

  @override
  State<FlashcardPage> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends State<FlashcardPage> {
  int _currentIndex = 0; // tracks current card
  bool _isFlipped = false; // tracks if card is flipped

  final List<Map<String, String>> cards = [
    {
      'question': 'What is the first step in Agile?',
      'answer': 'Define the project vision and create a product backlog.',
    },
    {
      'question': 'What does SCRUM stand for?',
      'answer':
          'SCRUM is not an acronym — it\'s a framework for agile development.',
    },
    {
      'question': 'What is a Sprint in Agile?',
      'answer':
          'A Sprint is a fixed time period (1-4 weeks) where a team completes a set of tasks.',
    },
  ];

  void _next() {
    if (_currentIndex < cards.length - 1) {
      setState(() {
        _currentIndex++;
        _isFlipped = false; // reset flip on new card
      });
    }
  }

  void _previous() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _isFlipped = false;
      });
    }
  }

  void _flip() {
    setState(() => _isFlipped = !_isFlipped);
  }

  @override
  Widget build(BuildContext context) {
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

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 69),
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
              //  FLASH CARDS LABEL + ICON
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Color(0xff00B764), width: 1)),
                        color: Color(0xff152826)),
                    child: Text('Flash Cards',
                        style: GoogleFonts.raleway(
                            color: const Color(0xff00B764),
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  ),
                  Image.asset('assets/flashcard.png', width: 32, height: 32),
                ],
              ),

              const Divider(color: Color(0xff152826), height: 32, thickness: 2),

              // PROGRESS
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
                  Text('of ${cards.length}',
                      style: GoogleFonts.raleway(
                          color: const Color(0xff8C8D8F), fontSize: 16)),
                  const SizedBox(width: 28),
                  GestureDetector(
                    onTap: _next,
                    child: Icon(Icons.chevron_right,
                        color: _currentIndex < cards.length - 1
                            ? const Color(0xff00B764)
                            : Colors.grey,
                        size: 28),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // INNER CARD
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 64, vertical: 72),
                decoration: BoxDecoration(
                  color: const Color(0xff191A1F),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xff8c8d8f), width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_isFlipped ? 'Answer:' : 'Question:',
                        style: GoogleFonts.raleway(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                    Text(
                      _isFlipped
                          ? cards[_currentIndex]['answer']!
                          : cards[_currentIndex]['question']!,
                      style: GoogleFonts.raleway(
                          color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // FLIP
              Center(
                child: GestureDetector(
                  onTap: _flip,
                  child: Text('Flip',
                      style: GoogleFonts.raleway(
                          color: const Color(0xff00B764),
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
