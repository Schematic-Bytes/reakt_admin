import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  Stream<User?> get stateChanges => _firebaseAuth.userChanges();

  User? get currentUser => _firebaseAuth.currentUser;

  Future<String> signUp({required String phoneNumber}) async {
    try {
      UserCredential us = await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber.trim()
      );
      if (us.user != null) {
        return "ok-${us.user!.uid}";
      }
      return 'something went wrong';
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'something went wrong';
    }
  }

  Future<String> signInWithPhoneNumber({required String phoneNumber}) async {
    try {
      await _firebaseAuth.signInWithPhoneNumber(phoneNumber);
      return '';
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'something went wrong';
    }
  }

  Future<String> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return 'proceed';
    } on FirebaseAuthException catch (e) {
      return e.message ?? 'something went wrong';
    }
  }

  Future<String> sendVerification() async {
    try {
      await currentUser!.();
      return '';
    } catch (e) {
      return e.toString();
    }
  }
}
