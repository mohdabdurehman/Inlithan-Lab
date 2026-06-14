import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api_config.dart';
import '../providers/auth_provider.dart';

class RolePage extends StatefulWidget {
  const RolePage({super.key});

  @override
  State<RolePage> createState() => _RolePageState();
}

class _RolePageState extends State<RolePage> {
  String? _selected;

  final List<Map<String, String>> roles = [
    {
      'title': 'Student',
      'subtitle': 'Learn at your own pace',
      'description':
          'As a student gives you access to personalized learning paths, instant explanations, auto-generated practice activities, and progress insights that help you understand exactly where you\'re improving and where you need support. You\'ll complete tasks, track your growth, and get smarter recommendations the more you learn.',
    },
    {
      'title': 'Tutor',
      'subtitle': 'Turn AI into your teaching assistant',
      'description':
          'As a teacher unlocks tools for creating lessons, generating activities, monitoring student progress, and understanding learning patterns across your class. You\'ll be able to assign tasks, review analytics, and use AI-powered insights to support every learner more effectively — without adding to your workload.',
    },
  ];

  Future<void> _submitRole(BuildContext context) async {
    final auth = context.read<AuthProvider>();
    final role = _selected == 'Tutor' ? 'teacher' : 'student';

    try {
      final res = await http.post(
        Uri.parse('${ApiConfig.baseUrl}/auth/role'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${auth.token}',
        },
        body: jsonEncode({'role': role}),
      );

      print('Status: ${res.statusCode}');
      print('Body: ${res.body}');
      final data = jsonDecode(res.body);
      if (data['success'] == true) {
        await auth.setToken(data['token']);
        if (context.mounted) {
          final destination =
              role == 'teacher' ? 'bottomnavbarT' : 'bottomnavbar';
          Navigator.pushNamedAndRemoveUntil(
            context,
            destination,
            (route) => false,
          );
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Failed to set role. Try again.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191A1F),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
                child: Column(
                  children: [
                    //  HEADER
                    Text(
                      'Which role suits your\n needs best?',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                        color: const Color(0xff8b8c8f),
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 40),

                    //  ROLE CARDS
                    ...roles.map((role) {
                      final bool isSelected = _selected == role['title'];

                      return GestureDetector(
                        onTap: () => setState(() {
                          _selected =
                              _selected == role['title'] ? null : role['title'];
                        }),
                        child: _buildCard(
                          title: role['title']!,
                          subtitle: role['subtitle']!,
                          description: role['description']!,
                          isSelected: isSelected,
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),

            //  DONE BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed:
                      _selected == null ? null : () => _submitRole(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff00B764),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Done',
                    style: GoogleFonts.raleway(
                      color: const Color(0xff191A1F),
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String subtitle,
    required String description,
    required bool isSelected,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 34),
      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 32),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xff152826) : const Color(0xff191A1F),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color:
                isSelected ? const Color(0xff00B764) : const Color(0xff152826),
            width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Radio + Title
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? const Color(0xff00B764)
                        : const Color(0xff152826),
                    width: 2,
                  ),
                ),
                child: isSelected
                    ? Center(
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: const BoxDecoration(
                            color: Color(0xff00B764),
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    : null,
              ),

              const Spacer(),

              // Title
              Text(
                title,
                style: GoogleFonts.raleway(
                  color: isSelected
                      ? const Color(0xff00B764)
                      : const Color(0xff8C8D8F),
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),

          const SizedBox(height: 26),

          //  Subtitle
          Text(
            subtitle,
            style: GoogleFonts.raleway(
              color: isSelected
                  ? const Color(0xff00B764)
                  : const Color(0xff8C8D8F),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),

          const SizedBox(height: 26),

          //  Description
          Text(
            description,
            style: GoogleFonts.raleway(
              color: isSelected
                  ? const Color(0xff00B764)
                  : const Color(0xff8C8D8f),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
