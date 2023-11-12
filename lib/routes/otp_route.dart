import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reakt_admin/routes/home_route.dart';

class OtpRoute extends StatelessWidget {
  const OtpRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.asset(
                "assets/images/logo.png",
                width: 80,
                height: 80,
              ),
              const SizedBox(height: 10),
              Text(
                "REAKT",
                style: GoogleFonts.inter(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Signin with your phone number",
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF06080A),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Otp",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF06080A),
                  ),
                ),
              ),
              TextField(
                style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 20.0),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  counterText: "",
                  fillColor: const Color.fromRGBO(179, 179, 179, 0.1),
                  filled: true,
                  // hintText: "",
                ),
              ),
              const Spacer(),
              InkWell(
                child: Container(
                  height: 56,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF06080A),
                  ),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeRoute()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
