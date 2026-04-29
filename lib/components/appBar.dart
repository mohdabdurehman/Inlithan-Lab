import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Appbar extends StatelessWidget {
  final String title;
  
  const Appbar({super.key,
   required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.raleway(
                  color: Color(0xff8C8D8F),
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.search,
                        color: Color(0xff8C8D8F), size: 24),
                    onPressed: () {},
                  ),
                  Stack(children: [
                    IconButton(
                      icon: const Icon(Icons.notifications_none,
                          color: Color(0xff8C8D8F), size: 28),
                      onPressed: () {},
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xff00B764),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ],
          ),
        ),
        // Divider under appbar
        const Divider(color: Color(0xff8C8D8F), height: 1),
        const SizedBox(height: 32),
      ],
    );
  }
}