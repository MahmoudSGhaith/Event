import 'package:event/authentication/services/firebase_service.dart';
import 'package:event/core/resources/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../core/common_widget/custom_toast/custom_toast.dart';

class AuthProvider extends ChangeNotifier {
  //todo : create account
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController =
      TextEditingController(); // for check on the password validation
  TextEditingController nameController = TextEditingController();

  bool isLoading = false;

  Future<void> createAccount(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    try {
      await FirebaseService.createAccount(
        signUpEmailAddress: emailController.text,
        signUpPassword: passwordController.text,
        signUpName: nameController.text,
      );
    } catch (e) {
      CustomToast.showToast(
        context: context,
        text: e.toString(),
        type: ToastType.error,
      );
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> logIn(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    try {
      var logInUser = await FirebaseService.login(
        logInEmail: emailController.text,
        logInPassword: passwordController.text,
      );
      if (logInUser?.user != null) {
        Navigator.pushReplacementNamed(context, AppRoutes.layout);
        CustomToast.showToast(
          context: context,
          text: "Welcome ${logInUser?.user?.displayName ?? ""}",
          type: ToastType.success,
        );
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      CustomToast.showToast(
        context: context,
        text: e.toString(),
        type: ToastType.error,
      );
    }
  }

  Future<void> resetPassword(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    try {
      await FirebaseService.resetPassword(
        resetPasswordEmail: emailController.text,
      );
      CustomToast.showToast(
        context: context,
        text: "please check your email",
        type: ToastType.success,
      );
    } catch (e) {
      CustomToast.showToast(
        context: context,
        text: e.toString(),
        type: ToastType.error,
      );
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return; // User canceled

      final GoogleSignInAuthentication? googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      if (userCredential.user != null) {
        Navigator.pushReplacementNamed(context, AppRoutes.layout);

        CustomToast.showToast(
          context: context,
          text: "Welcome ${userCredential.user?.displayName ?? ''}",
          type: ToastType.success,
        );
      }
    } catch (e) {
      CustomToast.showToast(
        context: context,
        text: "Google Sign-In failed: $e",
        type: ToastType.error,
      );
    }
  }
}
