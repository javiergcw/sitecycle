import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Asegúrate de tener esta importación
import 'package:provider/provider.dart';
import 'package:sitecycle/app/config/colors.dart';
import 'package:sitecycle/app/config/dark_ligthmode.dart';
import 'package:sitecycle/app/config/fontfamily_modal.dart';
import 'package:sitecycle/app/data/datasource/auth/login_case_use.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  late ColorNotifire notifire;

  Future<void> _resetPassword() async {
    await CUFirebaseAuthLogin.resetPassword(
      context: context,
      email: _emailController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getBgColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Reset Password'.tr, // Utiliza `.tr` para la traducción
                style: TextStyle(
                  fontSize: 24,
                  color: notifire.getContainer,
                  fontFamily: FontFamily.qBold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email'.tr, // Utiliza `.tr` para la traducción
                  prefixIcon: Icon(Icons.email, color: notifire.getContainer),
                  hintStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: notifire.getContentColor,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: blue),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: _resetPassword,
                child: Container(
                  height: 42,
                  decoration: BoxDecoration(
                    color: notifire.getContainer,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Text(
                      'Send Reset Link'.tr, // Utiliza `.tr` para la traducción
                      style: TextStyle(
                        fontSize: 15,
                        color: notifire.text,
                        fontFamily: FontFamily.qBold,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
