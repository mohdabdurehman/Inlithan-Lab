import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// btn style
class btnStyle extends StatelessWidget {
  final String label;
  final Image img;
  final Color color;
  final bool filled;

  const btnStyle({
    super.key,
    required this.label,
    required this.img,
    required this.color,
    required this.filled,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: filled ? color : const Color(0xff00b764),
          side: const BorderSide(color: Color(0xff00b764), width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            img,
            Text(label,
                style: GoogleFonts.raleway(
                  color: filled
                      ? const Color(0xff00B764)
                      : const Color(0xff191A1F),
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  shadows: filled
                      ? [
                          const Shadow(
                            color: Color(0xff000000),
                            blurRadius: 15,
                          )
                        ]
                      : null,
                ))
          ],
        ));
  }
}
