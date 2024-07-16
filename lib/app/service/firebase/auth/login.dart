import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sitecycle/app/data/models/login_result.dart';

class SFirebaseAuthLogin {
  static Future<LoginResult> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Login successful: ${userCredential.user?.email}');
      return LoginResult(success: true);
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
        print(errorMessage);
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided.';
        print(errorMessage);
      } else {
        errorMessage = 'Login failed: $e';
        print(errorMessage);
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
      return LoginResult(success: false, message: errorMessage);
    }
  }
}
