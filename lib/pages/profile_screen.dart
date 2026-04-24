import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff191A1F),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 83),
            Text('Profile',
                style: GoogleFonts.raleway(
                  color: Color(0xffFFFFFF),
                  fontSize: 16,
                )),
            SizedBox(height: 16),
            informationCard(),

            /// not the same as the design
            const SizedBox(height: 200),

            buildLogoutButton(context),
            SizedBox(height: 38),
          ],
        ),
      ),
    );
  }

  /// INFO CARD

  Widget informationCard() {
    return Container(
      width: 380,

      /// it's not the same size as the design
      height: 374,

      decoration: BoxDecoration(
          color: const Color(0xff1E212A),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xff152826))),
      child: Column(
        children: [
          infoRow(
            imgIcon: Image.asset(
              'assets/profileLogo.png',
              width: 36,
              height: 28,
              color: Color(0xff000B764),
            ),
            value: 'Big Moh ',
            label: 'Full name',
          ),
          infoRow(
            imgIcon: Image.asset('assets/emailLogo.png', width: 36, height: 28),
            value: 'a****e@gmail.com',
            label: 'E-mail',
          ),
          infoRow(
            imgIcon: Image.asset('assets/stdLogo.png', width: 36, height: 28),
            value: 'Student',
            label: 'Role',
          ),
          infoRow(
            imgIcon: Image.asset(
              'assets/securityLogo.png',
              width: 36,
              height: 28,
            ),
            value: 'Security',
            label: 'Google',
          ),
        ],
      ),
    );
  }

  /// EACH ROW INFO
  Widget infoRow({
    required Image imgIcon,
    required String value,
    required String label,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Row(
            children: [
              imgIcon,
              const SizedBox(width: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: GoogleFonts.raleway(
                      color: Color(0xffFFFFFF),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    label,
                    style: GoogleFonts.raleway(
                      color: Color(0xff8B8C8F),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Logout button

  Widget buildLogoutButton(BuildContext context) {
    return Container(
      width: 388,
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
          color: const Color(0xff1E212A),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xff152826))),
      child: Row(
        children: [
          Container(
              child: Image.asset(
            'assets/logoutLogo.png',
            width: 24,
            height: 24,
          )),
          const SizedBox(width: 40),
          const Expanded(
            child: Text(
              'Log out',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const Icon(
            Icons.chevron_right,
            color: Color(0xff8B8C8F),
          ),
        ],
      ),
    );
  }
}
