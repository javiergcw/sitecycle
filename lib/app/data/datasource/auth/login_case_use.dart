import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sitecycle/app/data/models/response_auth_result.dart';
import 'package:sitecycle/app/data/utils/snackbar_verifications.dart';
import 'package:sitecycle/app/service/firebase/auth/login.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sitecycle/app/feauture/presentation/ui/drawer/drawer_main.dart';

class CUFirebaseAuthLogin {
  static Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    final ResponseAuthResult loginResult = await SFirebaseAuthLogin.login(
      context: context,
      email: email,
      password: password,
    );
    if (loginResult.success) {
      SnackbarHelper.showSnackbar(
        title: 'Success',
        message: 'Login successful!',
        backgroundColor: Colors.green,
      );
      Get.offAll(const DrawerMain());
    } else {
      SnackbarHelper.showSnackbar(
        title: 'Error',
        message: loginResult.message ?? 'Unknown error occurred',
      );
    }
  }

  static Future<void> signInWithGoogle({
    required BuildContext context,
  }) async {
    final User? user = await SFirebaseAuthLogin().signInWithGoogle();

    if (user != null) {
      SnackbarHelper.showSnackbar(
        title: 'Success',
        message: 'Login with Google successful!',
        backgroundColor: Colors.green,
      );
      Get.offAll(const DrawerMain());
    } else {
      SnackbarHelper.showSnackbar(
        title: 'Error',
        message: 'Failed to sign in with Google.',
      );
    }
  }

  static Future<void> signInWithPhone({
    required BuildContext context,
    required String phoneNumber,
    required Function(String verificationId) codeSentCallback,
  }) async {
    await SFirebaseAuthLogin.signInWithPhone(
      context: context,
      phoneNumber: phoneNumber,
      codeSentCallback: codeSentCallback,
      onCompleted: (ResponseAuthResult result) {
        if (!result.success) {
          SnackbarHelper.showSnackbar(
            title: 'Error',
            message: result.message ?? 'Unknown error occurred during phone sign-in',
          );
        }
      },
    );
  }

  static Future<void> verifySmsCode({
    required BuildContext context,
    required String verificationId,
    required String smsCode,
  }) async {
    await SFirebaseAuthLogin.verifySmsCode(
      context: context,
      verificationId: verificationId,
      smsCode: smsCode,
      onCompleted: (ResponseAuthResult result) {
        if (result.success) {
          SnackbarHelper.showSnackbar(
            title: 'Success',
            message: 'Phone verification successful!',
            backgroundColor: Colors.green,
          );
          Get.offAll(const DrawerMain());
        } else {
          SnackbarHelper.showSnackbar(
            title: 'Error',
            message: result.message ?? 'Failed to verify phone number.',
          );
        }
      },
    );
  }

  static Future<void> resetPassword({
    required BuildContext context,
    required String email,
  }) async {
    await SFirebaseAuthLogin.resetPassword(
      context: context,
      email: email,
      onCompleted: (ResponseAuthResult result) {
        if (result.success) {
          SnackbarHelper.showSnackbar(
            title: 'Success',
            message: result.message ?? 'Password reset email sent!',
            backgroundColor: Colors.green,
          );
        } else {
          SnackbarHelper.showSnackbar(
            title: 'Error',
            message: result.message ?? 'Failed to send password reset email.',
          );
        }
      },
    );
  }

  static Future<void> signOut({
    required BuildContext context,
  }) async {
    await SFirebaseAuthLogin().signOut();
    SnackbarHelper.showSnackbar(
      title: 'Success',
      message: 'Signed out successfully.',
      backgroundColor: Colors.green,
    );
  }
}
