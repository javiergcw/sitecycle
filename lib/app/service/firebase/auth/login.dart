import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sitecycle/app/data/models/response_auth_result.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SFirebaseAuthLogin {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<ResponseAuthResult> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Login successful: ${userCredential.user?.email}');
      return ResponseAuthResult(success: true);
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'invalid-credential') {
        errorMessage = 'User/Password invalid';
      } else {
        errorMessage = 'Login failed: $e';
      }

      return ResponseAuthResult(success: false, message: errorMessage);
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  // Método para iniciar sesión con número de teléfono
  static Future<void> signInWithPhone({
    required BuildContext context,
    required String phoneNumber,
    required Function(String verificationId) codeSentCallback,
    required Function(ResponseAuthResult result) onCompleted,
  }) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          onCompleted(ResponseAuthResult(success: true, message: 'Phone number automatically verified and user signed in.'));
        },
        verificationFailed: (FirebaseAuthException e) {
          String message = 'Phone number verification failed. Error: ${e.message}';
          onCompleted(ResponseAuthResult(success: false, message: message));
        },
        codeSent: (String verificationId, int? resendToken) {
          codeSentCallback(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // El tiempo de espera para la recuperación automática del código ha expirado
        },
      );
    } catch (e) {
      onCompleted(ResponseAuthResult(success: false, message: e.toString()));
    }
  }

  // Método para verificar el código SMS
  static Future<void> verifySmsCode({
    required BuildContext context,
    required String verificationId,
    required String smsCode,
    required Function(ResponseAuthResult result) onCompleted,
  }) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
      onCompleted(ResponseAuthResult(success: true, message: 'Phone number verified and user signed in.'));
    } catch (e) {
      onCompleted(ResponseAuthResult(success: false, message: 'Failed to sign in. Error: invalid verification code'));
    }
  }

  static Future<void> resetPassword({
    required BuildContext context,
    required String email,
    required Function(ResponseAuthResult result) onCompleted,
  }) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      onCompleted(ResponseAuthResult(success: true, message: 'Password reset email sent!'));
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else {
        errorMessage = 'Failed to send password reset email.';
      }
      onCompleted(ResponseAuthResult(success: false, message: errorMessage));
    }
  }
}
