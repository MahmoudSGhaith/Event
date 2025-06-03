import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  //todo : for Register screen  ... for signup screen
  static Future<UserCredential?> createAccount({
    required String signUpEmailAddress,
    required String signUpPassword,
    required String signUpName,
  }) async {
    try {
      final signUpCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: signUpEmailAddress,
            password: signUpPassword,
          );
      await signUpCredential.user?.updateDisplayName(signUpName);
      return signUpCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw "The password provided is too weak";
      } else if (e.code == 'email-already-in-use') {
        throw "The account already exists for that email";
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  //todo : for login screen  ... for sign_in screen
  static Future<UserCredential?> login({
    required String logInEmail,
    required String logInPassword,
  }) async {
    try {
      final logInCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: logInEmail,
            password: logInPassword,
          );
      return logInCredential;
    } on FirebaseAuthException catch (e) {
      throw "Invalid email or password";
    }
  }

  static Future<void> resetPassword({required String resetPasswordEmail}) async {
    try {
      final resetPasswordCredential = await FirebaseAuth.instance
          .sendPasswordResetEmail(email: resetPasswordEmail);
      return resetPasswordCredential;
    } catch (e) {
      rethrow;
    }
  }
}
