import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sitecycle/app/data/models/response_auth_result.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SFirebaseAuthLogin {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<ResponsAuthResult> login({
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
      return ResponsAuthResult(success: true);
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
      return ResponsAuthResult(success: false, message: errorMessage);
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // El usuario canceló el inicio de sesión
        return null;
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential = await _auth.signInWithCredential(credential);
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

  static Future<void> signInWithPhone({
    required BuildContext context,
    required String phoneNumber,
    required Function(String verificationId) codeSentCallback,
  }) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Phone number automatically verified and user signed in: ${_auth.currentUser?.phoneNumber}')),
          );
        },
        verificationFailed: (FirebaseAuthException e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Phone number verification failed. Code: ${e.code}. Message: ${e.message}')),
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          codeSentCallback(verificationId);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please check your phone for the verification code.')),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Verification code timeout. Please try again.')),
          );
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to Verify Phone Number: $e')),
      );
    }
  }

  static Future<void> verifySmsCode({
    required BuildContext context,
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Phone number verified and user signed in: ${_auth.currentUser?.phoneNumber}')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign in: $e')),
      );
    }
  }

  static Future<void> resetPassword({
    required BuildContext context,
    required String email,
  }) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password reset email sent!')),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else {
        errorMessage = 'Failed to send password reset email: ${e.message}';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }
}
