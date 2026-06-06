import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Appbar extends StatelessWidget {
  final String title;
  final Widget? showIcon;
  final Widget? leading;
  final bool showSearch;

  const Appbar(
      {super.key,
      this.showSearch = true,
      this.showIcon,
      this.leading,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 32),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    leading ?? const SizedBox(width: 0),
                    SizedBox(width: 24),
                    Expanded(
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.raleway(
                          color: const Color(0xff8C8D8F),
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  if (showSearch)
                    IconButton(
                      icon: const Icon(Icons.search,
                          color: Color(0xff8C8D8F), size: 28),
                      onPressed: () {},
                    ),

                  if (showIcon != null)
                    GestureDetector(
                      onTap: () {},
                      child: showIcon,
                    )

                  // Stack(children: [
                  // Positioned(
                  //   top: 8,
                  //   right: 8,
                  //   child: Container(
                  //     width: 8,
                  //     height: 8,
                  //     decoration: const BoxDecoration(
                  //       color: Color(0xff00B764),
                  //       shape: BoxShape.circle,
                  //     ),
                  //   ),
                  // ),
                  // ]),
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
