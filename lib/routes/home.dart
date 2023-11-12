import 'package:reakt_admin/routes/widget/alert_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    "Reakt",
                    style: GoogleFonts.inter(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Emergency alerts",
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF06080A),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const AlertMessage(),
                  const AlertMessage(),
                  const AlertMessage(),
                  const AlertMessage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
