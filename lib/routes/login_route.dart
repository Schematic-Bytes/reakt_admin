import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginRoute extends StatefulWidget {
  const LoginRoute({super.key});

  @override
  State<LoginRoute> createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  bool visibility = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 30),
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
                    "Phone",
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF06080A),
                    ),
                  ),
                ),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: const Color.fromRGBO(179, 179, 179, 0.1),
                    filled: true,
                    hintText: "+91 XXX XXXXXXX",
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
                    if (_controller.text == "") {
                      // TODO: add toast window;
                    } else {
                      print("THIS");
                      print(_controller.text);
                      context.go("/login/verification?phone_number=${_controller.text}");
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
