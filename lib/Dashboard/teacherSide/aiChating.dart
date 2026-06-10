import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../components/appBar.dart';

class AiChatPageT extends StatefulWidget {
  const AiChatPageT({super.key});

  @override
  State<AiChatPageT> createState() => _AiChatPageTState();
}

class _AiChatPageTState extends State<AiChatPageT> {
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Appbar(
                  title: 'AI Lab',
                  showSearch: false,
                  leading: Icon(Icons.arrow_back_ios,
                      color: Color(0xff00b764), size: 28)),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Column(children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 22),
                      decoration: BoxDecoration(
                        color: const Color(0xff1e212a),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: const Color(0xff242727), width: 1),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "PDF",
                            style: GoogleFonts.raleway(
                              color: const Color(0xfffffffF),
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(width: 12),
                          Image.asset('assets/pdfLogo.png')
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                      "Your new course has been created successfully.\n Click here to View. \n If you would also like me to show you the course in \n this chat click here SHOW",
                      style: GoogleFonts.raleway(
                        color: const Color(0xfffffffF),
                        fontSize: 14,
                      )),
                  SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 22),
                      decoration: BoxDecoration(
                        color: const Color(0xff1e212a),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: const Color(0xff242727), width: 1),
                      ),
                      child: Text(
                        "SHOW",
                        style: GoogleFonts.raleway(
                          color: const Color(0xfffffffF),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 34),
                  Text(
                      "Building a ROS2 project from scratch can feel like\n trying to assemble a car while learning how\n engines work, but the modular nature of ROS2\n actually makes this very manageable\n Since you're a beginner, think of ROS2 as a\n 'Communication Layer.' Instead of one giant\n program, we write many small programs (Nodes) \nthat 'talk' to each other by sending messages. ",
                      style: GoogleFonts.raleway(
                        color: const Color(0xfffffffF),
                        fontSize: 14,
                      )),
                  const SizedBox(height: 40),
                  Container(
                    height: 171,
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
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
