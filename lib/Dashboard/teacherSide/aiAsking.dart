import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../components/appBar.dart';

class AiAskingPageT extends StatefulWidget {
  const AiAskingPageT({super.key});

  @override
  State<AiAskingPageT> createState() => _AiAskingPageTState();
}

class _AiAskingPageTState extends State<AiAskingPageT> {
  // ── tracks which mode is selected ──
  bool _isStudyBuddy = true; // true = Study Buddy, false = Tutor

  // ── text controller for the input field ──
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191A1F),

      // ── APP BAR ──
      // appBar: AppBar(
      //   backgroundColor: const Color(0xff191A1F),
      //   elevation: 0,
      //   scrolledUnderElevation: 0,
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.arrow_back_ios,
      //       color: Color(0xff00B764),
      //     ),
      //     onPressed: () => Navigator.pop(context),
      //   ),
      //   title: Text(
      //     'AI Labs',
      //     style: GoogleFonts.raleway(
      //       color: const Color(0xff8C8D8F),
      //       fontSize: 24,
      //       fontWeight: FontWeight.w500,
      //     ),
      //   ),
      //   bottom: const PreferredSize(
      //     preferredSize: Size.fromHeight(32),
      //     child: Divider(color: Color(0xff8c8d8f), thickness: 1, height: 32),
      //   ),
      // ),

      body: SafeArea(
        child: Column(
          children: [
            Appbar(
                title: 'AI Lab',
                showSearch: false,
                leading: Icon(Icons.arrow_back_ios,
                    color: Color(0xff00b764), size: 28)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ── GREETING TEXT ──

                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                            text: 'Good Afternoon, Jason\nNeed help with '),
                        TextSpan(
                          text: 'any course?',
                          style:
                              GoogleFonts.raleway(fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // ── MODE TOGGLE ──

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(color: const Color(0xff8c8d8f), width: 1),
                    ),
                    child: Row(
                      children: [
                        // ── Tutor Mode ──
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => _isStudyBuddy = false),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: !_isStudyBuddy
                                    ? const Color(0xff00B764)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  'Tutor Mode',
                                  style: GoogleFonts.raleway(
                                    color: !_isStudyBuddy
                                        ? Color(0xff152826)
                                        : const Color(0xff8C8D8F),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 16),

                        // ── Study Buddy Mode ──
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => _isStudyBuddy = true),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: _isStudyBuddy
                                    ? const Color(0xff00B764)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Study Buddy Mode',
                                style: GoogleFonts.raleway(
                                  color: _isStudyBuddy
                                      ? Color(0xff152826)
                                      : const Color(0xff8C8D8F),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // ── INPUT CARD ──

                  Container(
                    height: 320,
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border:
                          Border.all(color: const Color(0xff8c8d8f), width: 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ── TEXT INPUT ──

                        Expanded(
                          child: TextField(
                            controller: _messageController,
                            maxLines: null, // allows multiple lines

                            style: GoogleFonts.raleway(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Ask whenever you are ready...',
                              hintStyle: GoogleFonts.raleway(
                                color: const Color(0xfffefffF),
                                fontSize: 16,
                              ),
                              border: InputBorder.none, // no visible border
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        // ── BOTTOM ROW: Attach + Send ──
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Attach button
                            GestureDetector(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Attach file...'),
                                    backgroundColor: Color(0xff00B764),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  const Icon(Icons.add,
                                      color: Color(0xfffefffF), size: 20),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Attach',
                                    style: GoogleFonts.raleway(
                                      color: const Color(0xfffefffF),
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Send button — green rounded square
                            GestureDetector(
                              onTap: () {
                                if (_messageController.text.isNotEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Sent: ${_messageController.text}'),
                                      backgroundColor: const Color(0xff00B764),
                                    ),
                                  );
                                  _messageController.clear();
                                }
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: const Color(0xff00B764),
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: const Color(0xff152826), width: 1),
                                ),
                                child: const Icon(
                                  Icons.arrow_upward,
                                  color: Color(0xff152826),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
