import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CodePage extends StatefulWidget {
  const CodePage({super.key});

  @override
  State<CodePage> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodePage> {
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
                    child: Text('Code',
                        style: GoogleFonts.raleway(
                            color: const Color(0xff00B764),
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  ),
                  Image.asset('assets/flashcard.png', width: 32, height: 32),
                ],
              ),

              const Divider(color: Color(0xff152826), height: 32, thickness: 2),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextField(
                    style: GoogleFonts.poppins(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'Git Hub Repo Link',
                      hintStyle:
                          TextStyle(color: Color(0xff8c8d8f), fontSize: 16),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff303530),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
