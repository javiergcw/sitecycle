import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sitecycle/app/data/models/response_auth_result.dart';

class SFirebaseAuthRegister {
  static Future<ResponsAuthResult> register({
    required BuildContext context,
    required String email,
    required String password,
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
      return ResponsAuthResult(success: true);
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'email-already-in-use') {
        errorMessage = 'Email already in use.';
        print(errorMessage);
      } else if (e.code == 'weak-password') {
        errorMessage = 'Password is too weak.';
        print(errorMessage);
      } else {
        errorMessage = 'Registration failed: $e';
        print(errorMessage);
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
      return ResponsAuthResult(success: false, message: errorMessage);
    }
  }
}
