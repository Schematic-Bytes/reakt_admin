import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth firebaseAuth;
  AuthenticationService(this.firebaseAuth);

  Stream<User?> get stateChanges => firebaseAuth.userChanges();

  User? get currentUser => firebaseAuth.currentUser;

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
      await firebaseAuth.signOut();
      return 'proceed';
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'something went wrong';
    }
  }

  // Future<String> signInWithPhoneNumber(String phoneNumber, BuildContext context) async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   final router = context.go("/");
  //   try {

  //     return "";
  //   } catch (e) {
  //     return e.toString();
  //   }
}
