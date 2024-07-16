import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sitecycle/app/data/models/response_auth_result.dart';
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
    final ResponsAuthResult loginResult = await SFirebaseAuthLogin.login(
      context: context,
      email: email,
      password: password,
    );
    if (loginResult.success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login successful!')),
      );
      Get.offAll(const DrawerMain());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loginResult.message ?? 'Unknown error occurred')),
      );
    }
  }
  static Future<void> signInWithGoogle({
    required BuildContext context,
  }) async {
    final User? user = await SFirebaseAuthLogin().signInWithGoogle();

    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login with Google successful!')),
      );
      Get.offAll(const DrawerMain());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to sign in with Google.')),
      );
    }
  }

  static Future<void> signOut({
    required BuildContext context,
  }) async {
    await SFirebaseAuthLogin().signOut();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Signed out successfully.')),
    );
  }
}
