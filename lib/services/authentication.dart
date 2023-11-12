import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  Stream<User?> get stateChanges => _firebaseAuth.userChanges();

  User? get currentUser => _firebaseAuth.currentUser;

  // Future<String> signUp({required String phoneNumber}) async {
  //   try {
  //     UserCredential us = await _firebaseAuth.verifyPhoneNumber(phoneNumber: phoneNumber.trim());
  //     if (us.user != null) {
  //       return "ok-${us.user!.uid}";
  //     }
  //     return 'something went wrong';
  //   } on FirebaseAuthException catch (e) {
  //     return e.message ?? 'something went wrong';
  //   }
  // }

  // Future<String> signInWithPhoneNumber({required String phoneNumber}) async {
  //   try {
  //     await _firebaseAuth.signInWithPhoneNumber(phoneNumber);
  //     return '';
  //   } on FirebaseAuthException catch (e) {
  //     return e.message ?? 'something went wrong';
  //   }
  // }

  Future<String> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return 'proceed';
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'something went wrong';
    }
  }

  Future<String> signInWithPhoneNumber(String phoneNumber, BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final router = context.go("/");
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
          return context.go("/"); // Redirect to the dashboard after successful verification
        },
        verificationFailed: (FirebaseAuthException e) {
          print("something went wrong $e");
          return context.go("/");
        },
        codeSent: (String verificationId, int? resendToken) {
          // Save the verification ID and resend token for later use
          // e.g., when the user enters the OTP
          // You can use a state management solution like Provider to store these value
          return context.go("/otp_verification", extra: {"verificationId": verificationId, "resendToken": resendToken});
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle the auto-retrieval timeout
          // You can use a state management solution like Provider to store the verification I

          return context.go("/otp_verification");
        },
      );
      return "";
    } catch (e) {
      return e.toString();
    }
  }
}
