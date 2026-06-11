import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/appBar.dart';

class SubmissionsPageT extends StatelessWidget {
  const SubmissionsPageT({super.key});

  // ── submissions data ──
  final List<Map<String, dynamic>> submissions = const [
    {'name': 'Yedil Beken', 'score': 12, 'total': 15},
    {'name': 'Yasmina Soldun', 'score': 15, 'total': 15},
    {'name': 'Victor Okafor', 'score': 10, 'total': 15},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191A1F),
      body: SafeArea(
        child: Column(
          children: [
            Appbar(
                title: 'd',
                showSearch: false,
                leading: Icon(Icons.arrow_back_ios,
                    color: Color(0xff00b764), size: 28)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ListView.separated(
                itemCount: submissions.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final s = submissions[index];
                  return _SubmissionCard(
                    name: s['name'],
                    score: s['score'],
                    total: s['total'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────
// SUBMISSION CARD
// ─────────────────────────────────────────
class _SubmissionCard extends StatelessWidget {
  final String name;
  final int score;
  final int total;

  const _SubmissionCard({
    required this.name,
    required this.score,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      decoration: BoxDecoration(
        color: const Color(0xff1E212A),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xff2A2D3A), width: 1),
      ),
      child: Row(
        children: [
          // ── PERSON ICON ──
          const Icon(Icons.person_outline, color: Color(0xff8C8D8F), size: 28),

          const SizedBox(width: 12),

          // ── NAME ──
          Expanded(
            child: Text(name,
                style: GoogleFonts.raleway(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                )),
          ),

          // ── SCORE ──
          RichText(
            text: TextSpan(
              style: GoogleFonts.raleway(color: Colors.white, fontSize: 14),
              children: [
                TextSpan(
                  text: 'Score:  ',
                  style: GoogleFonts.raleway(
                    color: const Color(0xff8C8D8F),
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: '$score/$total',
                  style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // ── VIEW BUTTON ──
          OutlinedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Viewing $name\'s submission'),
                  backgroundColor: const Color(0xff00B764),
                ),
              );
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xff00B764), width: 1.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            child: Text('View',
                style: GoogleFonts.raleway(
                  color: const Color(0xff00B764),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                )),
          ),
        ],
      ),
    );
  }
}
