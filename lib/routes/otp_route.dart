import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:reakt_admin/services/authentication.dart';

class OtpRoute extends StatelessWidget {
  final String phoneNumber;
  String? verificationId;
  int? resendToken;
  OtpRoute({super.key, required this.phoneNumber});

  String cleanPhoneNumber(String phoneNumber) {
    final phone = phoneNumber.replaceAll(RegExp(r'\D'), '');
    if (phone.length == 10) {
      return '+91$phone';
    }
    return phone;
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthenticationService>();
    print("demn $phoneNumber");
    return Scaffold(
      body: Center(
        child: FutureBuilder<void>(
            future: auth.firebaseAuth.verifyPhoneNumber(
              phoneNumber: cleanPhoneNumber(phoneNumber),
              verificationCompleted: (PhoneAuthCredential credential) async {
                await auth.firebaseAuth.signInWithCredential(credential);
                return context.go("/");
              },
              verificationFailed: (FirebaseAuthException e) {
                print("something went wrong $e");
                return context.go("/");
              },
              codeSent: (String verificationId, int? resendToken) {
                // Save the verification ID and resend token for later use
                // e.g., when the user enters the OTP
                // You can use a state management solution like Provider to store these value
                print("code sent $verificationId");
                this.verificationId = verificationId;
                this.resendToken = resendToken;
              },
              codeAutoRetrievalTimeout: (String verificationId) {
                // Handle the auto-retrieval timeout
                // You can use a state management solution like Provider to store the verification I
                print("timeout $verificationId");
              },
            ),
            builder: (context, snapshot) {
              return Container(
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
                        "One time password",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF06080A),
                        ),
                      ),
                    ),
                    TextField(
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, letterSpacing: 20.0),
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
                        if (verificationId != null) {
                          auth.firebaseAuth.signInWithPhoneNumber(phoneNumber);
                        }
                      },
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
