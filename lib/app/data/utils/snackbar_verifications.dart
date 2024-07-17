// snackbar_helper.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarHelper {
  static void showSnackbar({
    required String title,
    required String message,
    Color backgroundColor = Colors.red,
    Color textColor = Colors.white,
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor,
      colorText: textColor,
    );
  }
}
