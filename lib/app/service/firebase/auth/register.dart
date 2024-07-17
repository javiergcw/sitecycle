// SFirebaseAuthRegister.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sitecycle/app/data/models/response_auth_result.dart';
import 'package:sitecycle/app/data/utils/snackbar_verifications.dart';

class SFirebaseAuthRegister {
  static Future<ResponseAuthResult> register({
    required BuildContext context,
    required String email,
    required String password,
    required String confirmPassword,
    required String userName,
    required String mobileNumber,
  }) async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Actualiza el perfil del usuario con el nombre y el número de teléfono
      await userCredential.user?.updateProfile(displayName: userName);

      print('Registration successful: ${userCredential.user?.email}');
      return ResponseAuthResult(success: true);
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'email-already-in-use') {
        errorMessage = 'Email already in use.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'Email badly formatted.';
      } else if (e.code == 'weak-password') {
        errorMessage = 'Password is too weak.';
      } else {
        errorMessage = 'Registration failed: Please contact support team.';
      }
      SnackbarHelper.showSnackbar(
        title: 'Error',
        message: errorMessage,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return ResponseAuthResult(success: false, message: errorMessage);
    } catch (e) {
      String errorMessage = 'Registration failed: An unknown error occurred.';
      SnackbarHelper.showSnackbar(
        title: 'Error',
        message: errorMessage,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return ResponseAuthResult(success: false, message: errorMessage);
    }
  }
}
