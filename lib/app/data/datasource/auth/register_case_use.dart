// CUFirebaseAuthRegister.dart
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sitecycle/app/data/models/response_auth_result.dart';
import 'package:sitecycle/app/data/utils/snackbar_verifications.dart';
import 'package:sitecycle/app/feauture/presentation/ui/login/login_screen.dart';
import 'package:sitecycle/app/service/firebase/auth/register.dart';


class CUFirebaseAuthRegister {
  static Future<void> register({
    required BuildContext context,
    required String email,
    required String password,
    required String confirmPassword,
    required String userName,
    required String mobileNumber,
  }) async {
    final ResponseAuthResult registerResult =
        await SFirebaseAuthRegister.register(
            context: context,
            email: email,
            password: password,
            confirmPassword: confirmPassword,
            userName: userName,
            mobileNumber: mobileNumber);
    if (registerResult.success) {
      SnackbarHelper.showSnackbar(
        title: 'Success',
        message: 'Register successful!',
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      Get.offAll(const LoginScreen());
    } else {
      SnackbarHelper.showSnackbar(
        title: 'Error',
        message: registerResult.message ?? 'Unknown error occurred',
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }
}