import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sitecycle/app/data/models/response_auth_result.dart';
import 'package:sitecycle/app/feauture/presentation/ui/login/login_screen.dart';

import 'package:sitecycle/app/service/firebase/auth/register.dart';

class CUFirebaseAuthRegister {
  static Future<void> register({
    required BuildContext context,
    required String email,
    required String password,
    required String userName,
    required String mobileNumber,
  }) async {
    final ResponsAuthResult registerResult =
        await SFirebaseAuthRegister.register(
            context: context,
            email: email,
            password: password,
            userName: userName,
            mobileNumber: mobileNumber);
    if (registerResult.success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Register successful!')),
      );
      Get.offAll(const LoginScreen());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(registerResult.message ?? 'Unknown error occurred')),
      );
    }
  }
}
