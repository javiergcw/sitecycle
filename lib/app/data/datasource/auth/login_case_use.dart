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
}
