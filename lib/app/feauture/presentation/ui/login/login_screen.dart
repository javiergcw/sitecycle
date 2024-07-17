import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitecycle/app/config/colors.dart';
import 'package:sitecycle/app/config/dark_ligthmode.dart';
import 'package:sitecycle/app/config/fontfamily_modal.dart';
import 'package:sitecycle/app/config/images.dart';
import 'package:sitecycle/app/config/list_modal.dart';
import 'package:sitecycle/app/data/datasource/auth/login_case_use.dart';
import 'package:sitecycle/app/feauture/presentation/ui/forgot_password/forgot_password_screen.dart';
import 'package:sitecycle/app/feauture/presentation/ui/register/register_screen.dart';
import 'package:sitecycle/app/feauture/presentation/ui/forgot_password/phone_verification_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  bool passwordVisible = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  List social = [
    Appcontent.google,
    Appcontent.phoneIcon, // Reemplazar Facebook por Phone
    Appcontent.apple, // Reemplazar Discord por Apple
  ];
  List socialName = [
    'Google',
    'Phone',
    'Apple',
  ];
  late ColorNotifire notifire;

  bool previusstate = false;
  getdarkmodepreviousstate() async {
    final prefs = await SharedPreferences.getInstance();
    previusstate = prefs.getBool("setIsDark") ?? false;
    if (previusstate == false) {
      notifire.setIsDark = false;
    } else {
      notifire.setIsDark = previusstate;
    }
  }

  Future<void> _login() async {
    await CUFirebaseAuthLogin.login(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  Future<void> _loginWithGoogle() async {
    await CUFirebaseAuthLogin.signInWithGoogle(context: context);
  }

  @override
  void initState() {
    getdarkmodepreviousstate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getBgColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.maxWidth < 870
              ? login2(constraints)
              : constraints.maxWidth < 1328
                  ? login1(constraints)
                  : login(constraints);
        },
      ),
    );
  }

  Widget login(constraints) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: notifire.getBgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const Spacer(),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 59,
                        width: 59,
                        child: Image.asset(
                          Appcontent.miracleLogo,
                          color: notifire.getContainer,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        'Miracle',
                        style: TextStyle(
                            color: notifire.getContainer,
                            fontSize: 48,
                            fontFamily: FontFamily.qRegular,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Login to your account'.tr,
                    style: TextStyle(
                        fontSize: 32,
                        color: notifire.getContainer,
                        fontFamily: FontFamily.qBold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Your Email'.tr,
                    style: TextStyle(
                        fontSize: 18,
                        color: notifire.getContainer,
                        fontFamily: FontFamily.qBold),
                  ),
                  Container(
                    width: Get.width * 0.25,
                    height: 45,
                    margin: const EdgeInsets.symmetric(vertical: 13),
                    child: TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                          fontSize: 14,
                          color: notifire.getContainer,
                          fontFamily: FontFamily.qRegular,
                          fontWeight: FontWeight.w700),
                      decoration: InputDecoration(
                        hintText: 'Your Email'.tr,
                        prefixIcon: Image.asset(Appcontent.email,
                            scale: 3, color: const Color(0xff9DA2A7)),
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontFamily: FontFamily.qRegular),
                        contentPadding:
                            const EdgeInsets.only(left: 20, right: 20),
                        filled: true,
                        fillColor: notifire.getContentColor,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: blue),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12))),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                      ),
                    ),
                  ),
                  Text(
                    'Password'.tr,
                    style: TextStyle(
                        fontSize: 18,
                        color: notifire.getContainer,
                        fontFamily: FontFamily.qBold),
                  ),
                  Container(
                    width: Get.width * 0.25,
                    height: 45,
                    margin: const EdgeInsets.symmetric(vertical: 13),
                    child: TextField(
                      controller: _passwordController,
                      style: TextStyle(
                          fontSize: 14,
                          color: notifire.getContainer,
                          fontFamily: FontFamily.qRegular,
                          fontWeight: FontWeight.w700),
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                        hintText: 'Password'.tr,
                        suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                            child: Icon(
                                passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey)),
                        prefixIcon: Image.asset(Appcontent.password,
                            scale: 3, color: const Color(0xff9DA2A7)),
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                            fontFamily: FontFamily.qRegular),
                        contentPadding:
                            const EdgeInsets.only(left: 20, right: 20),
                        filled: true,
                        fillColor: notifire.getContentColor,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: blue),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12))),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.25,
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: notifire.getBgColor,
                          fillColor:
                              WidgetStatePropertyAll(notifire.getContainer),
                          activeColor: notifire.getContainer,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Text(
                          'Keep me signed in'.tr,
                          style: TextStyle(
                              fontSize: 15,
                              color: notifire.getContainer,
                              fontFamily: FontFamily.qBold,
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        InkWell(
                            onTap: () {
                              Get.to(const PhoneVerification());
                            },
                            child: Text(
                              'Forgot password?'.tr,
                              style: TextStyle(
                                  fontSize: 13,
                                  color: notifire.getContainer,
                                  fontFamily: FontFamily.qBold,
                                  fontWeight: FontWeight.w600),
                            )),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: _login,
                    child: Container(
                      height: 42,
                      width: Get.width * 0.25,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: notifire.getContainer,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                          child: Text('Login'.tr,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: notifire.text,
                                  fontFamily: FontFamily.qBold,
                                  fontWeight: FontWeight.w700))),
                    ),
                  ),
                  const SizedBox(height: 70),
                  Text(
                    'or continue with open account'.tr,
                    style: TextStyle(
                        fontSize: 13,
                        color: notifire.getContainer,
                        fontFamily: FontFamily.qBold,
                        fontWeight: FontWeight.w700),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                        itemCount: social.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () async {
                                  if (socialName[index] == 'Google') {
                                    await _loginWithGoogle();
                                  } else if (socialName[index] == 'Phone') {
                                    Get.to(const PhoneVerification());
                                  } else if (socialName[index] == 'Apple') {
                                    // Agrega la funcionalidad de inicio de sesión con Apple aquí
                                  } else if (!await launchUrl(
                                      modal().urlList[index])) {
                                    throw Exception(
                                        'Could not launch ${modal().urlList[index]}');
                                  }
                                },
                                child: Container(
                                  height: 55,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    color: notifire.getContentColor,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(social[index], height: 27),
                                      const SizedBox(width: 10),
                                      Text(socialName[index],
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: notifire.getContainer,
                                              fontFamily: FontFamily.qBold,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "not registered yet?".tr,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontFamily: FontFamily.qBold,
                            fontWeight: FontWeight.w700),
                        overflow: TextOverflow.ellipsis,
                      ),
                      InkWell(
                          onTap: () {
                            Get.to(const SignupScreen());
                          },
                          child: Text(
                            " Try Sign Up".tr,
                            style: TextStyle(
                                color: notifire.getContainer,
                                fontSize: 18,
                                fontFamily: FontFamily.qBold,
                                fontWeight: FontWeight.w700),
                            overflow: TextOverflow.ellipsis,
                          )),
                    ],
                  ),
                  RichText(
                      text: const TextSpan(
                    children: [
                      TextSpan(
                        text: ' ',
                      ),
                      TextSpan(
                        text: '',
                      ),
                    ],
                  )),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Image.asset(Appcontent.copyright, height: 15),
                      const SizedBox(width: 10),
                      const Text('Copyright Miracle 2024 ',
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff99B2C6),
                              fontFamily: FontFamily.qRegular,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage(Appcontent.miracle),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 100, bottom: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              height: 45,
                              // width: 45,
                              child: Image.asset(
                                Appcontent.miracleLogo,
                                color: Colors.white,
                              )),
                          const SizedBox(width: 15),
                          const Text('Miracle',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 56,
                                  fontFamily: FontFamily.qRegular,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text("Design Delight: Your Ultimate UI Kit".tr,
                          style: const TextStyle(
                              fontFamily: FontFamily.qBold,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 36)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget login1(constraints) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: notifire.getBgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            constraints.maxWidth < 1328
                ? SizedBox(
                    width: constraints.maxWidth < 990 ? 50 : 100,
                  )
                : const Spacer(),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 38,
                        width: 38,
                        child: Image.asset(
                          Appcontent.miracleLogo,
                          color: notifire.getContainer,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        'Miracle',
                        style: TextStyle(
                            color: notifire.getContainer,
                            fontSize: 30,
                            fontFamily: FontFamily.qRegular,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Login to your account'.tr,
                    style: TextStyle(
                        fontSize: 19,
                        color: notifire.getContainer,
                        fontFamily: FontFamily.qBold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Your Email'.tr,
                    style: TextStyle(
                        fontSize: 11,
                        color: notifire.getContainer,
                        fontFamily: FontFamily.qBold),
                  ),
                  Container(
                    width: constraints.maxWidth < 990
                        ? Get.width * 0.30
                        : Get.width * 0.25,
                    height: 45,
                    margin: const EdgeInsets.symmetric(vertical: 13),
                    child: TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                          fontSize: 11,
                          color: notifire.getContainer,
                          fontFamily: FontFamily.qRegular,
                          fontWeight: FontWeight.w700),
                      decoration: InputDecoration(
                          hintText: 'Your Email'.tr,
                          prefixIcon: Image.asset(Appcontent.email,
                              scale: 3, color: const Color(0xff9DA2A7)),
                          hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 11,
                              fontFamily: FontFamily.qRegular),
                          contentPadding:
                              const EdgeInsets.only(left: 20, right: 20),
                          filled: true,
                          fillColor: notifire.getContentColor,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)))),
                    ),
                  ),
                  Text(
                    'Password'.tr,
                    style: TextStyle(
                        fontSize: 11,
                        color: notifire.getContainer,
                        fontFamily: FontFamily.qBold),
                  ),
                  Container(
                    width: constraints.maxWidth < 990
                        ? Get.width * 0.30
                        : Get.width * 0.25,
                    height: 45,
                    margin: const EdgeInsets.symmetric(vertical: 13),
                    child: TextField(
                      controller: _passwordController,
                      style: TextStyle(
                          fontSize: 11,
                          color: notifire.getContainer,
                          fontFamily: FontFamily.qRegular,
                          fontWeight: FontWeight.w700),
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                        hintText: 'Password'.tr,
                        suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                            child: Icon(
                                passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey)),
                        prefixIcon: Image.asset(Appcontent.password,
                            scale: 3, color: const Color(0xff9DA2A7)),
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 11,
                            fontFamily: FontFamily.qRegular),
                        contentPadding:
                            const EdgeInsets.only(left: 20, right: 20),
                        filled: true,
                        fillColor: notifire.getContentColor,
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: constraints.maxWidth < 990
                        ? Get.width * 0.30
                        : Get.width * 0.25,
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: notifire.getBgColor,
                          fillColor:
                              WidgetStatePropertyAll(notifire.getContainer),
                          activeColor: notifire.getContainer,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        Text(
                          'Keep me signed in'.tr,
                          style: TextStyle(
                              fontSize: 9,
                              color: notifire.getContainer,
                              fontFamily: FontFamily.qBold,
                              fontWeight: FontWeight.w600),
                        ),
                        const Spacer(),
                        InkWell(
                            onTap: () {
                              Get.to(const ForgotPasswordScreen());
                            },
                            child: Text(
                              'Forgot password?'.tr,
                              style: TextStyle(
                                  fontSize: 9,
                                  color: notifire.getContainer,
                                  fontFamily: FontFamily.qBold,
                                  fontWeight: FontWeight.w600),
                            )),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: _login,
                    child: Container(
                      height: 40,
                      width: constraints.maxWidth < 990
                          ? Get.width * 0.30
                          : Get.width * 0.25,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: notifire.getContainer,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                          child: Text('Login'.tr,
                              style: TextStyle(
                                  fontSize: 11,
                                  color: notifire.getBgColor,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: FontFamily.qBold))),
                    ),
                  ),
                  const SizedBox(height: 70),
                  Text(
                    'or continue with open account'.tr,
                    style: TextStyle(
                        fontSize: 11,
                        color: notifire.getContainer,
                        fontFamily: FontFamily.qBold,
                        fontWeight: FontWeight.w700),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                        itemCount: social.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () async {
                                  if (socialName[index] == 'Google') {
                                    await _loginWithGoogle();
                                  } else if (socialName[index] == 'Phone') {
                                    // Agrega la funcionalidad de inicio de sesión con Phone aquí
                                  } else if (socialName[index] == 'Apple') {
                                    // Agrega la funcionalidad de inicio de sesión con Apple aquí
                                  } else if (!await launchUrl(
                                      modal().urlList[index])) {
                                    throw Exception(
                                        'Could not launch ${modal().urlList[index]}');
                                  }
                                },
                                child: Container(
                                  height: 38,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    color: notifire.getContentColor,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Row(
                                    children: [
                                      Image.asset(social[index], height: 16),
                                      const SizedBox(width: 10),
                                      Text(socialName[index],
                                          style: TextStyle(
                                              fontSize: 9,
                                              color: notifire.getContainer,
                                              fontFamily: FontFamily.qBold,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const SignupScreen());
                    },
                    child: RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          children: [
                            const TextSpan(
                                text: 'not registered yet? ',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 11,
                                    fontFamily: FontFamily.qBold,
                                    fontWeight: FontWeight.w700)),
                            TextSpan(
                              text: 'Try Sign Up',
                              style: TextStyle(
                                  color: notifire.getContainer,
                                  fontSize: 11,
                                  fontFamily: FontFamily.qBold,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Image.asset(Appcontent.copyright, height: 10),
                      const SizedBox(width: 10),
                      const Text('Copyright Miracle 2024',
                          style: TextStyle(
                              fontSize: 7,
                              color: Color(0xff99B2C6),
                              fontFamily: FontFamily.qRegular,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                ],
              ),
            ),
            constraints.maxWidth < 1328
                ? const SizedBox(
                    width: 50,
                  )
                : const Spacer(),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage(Appcontent.miracle),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: constraints.maxWidth < 1070 ? 60 : 100,
                      bottom: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              height: 45,
                              // width: 45,
                              child: Image.asset(
                                Appcontent.miracleLogo,
                                color: Colors.white,
                              )),
                          const SizedBox(width: 15),
                          const Text('Miracle',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 56,
                                  fontFamily: FontFamily.qRegular,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text("Design Delight: Your Ultimate UI Kit".tr,
                          style: const TextStyle(
                              fontFamily: FontFamily.qBold,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 36)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget login2(constraints) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: notifire.getBgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Row(
                  children: [
                    SizedBox(
                      height: 38,
                      width: 38,
                      child: Image.asset(
                        Appcontent.miracleLogo,
                        color: notifire.getContainer,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      'Miracle',
                      style: TextStyle(
                          color: notifire.getContainer,
                          fontSize: 30,
                          fontFamily: FontFamily.qRegular,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  'Login to your account'.tr,
                  style: TextStyle(
                      fontSize: 19,
                      color: notifire.getContainer,
                      fontFamily: FontFamily.qBold),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Text(
                  'Your Email'.tr,
                  style: TextStyle(
                      fontSize: 14,
                      color: notifire.getContainer,
                      fontFamily: FontFamily.qBold),
                ),
                Container(
                  height: 45,
                  margin: const EdgeInsets.symmetric(vertical: 13),
                  child: TextField(
                    controller: _emailController,
                    autofillHints: const [AutofillHints.email],
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                        fontSize: 11,
                        color: notifire.getContainer,
                        fontFamily: FontFamily.qRegular,
                        fontWeight: FontWeight.w700),
                    decoration: InputDecoration(
                      hintText: 'Your Email'.tr,
                      prefixIcon: Image.asset(Appcontent.email,
                          scale: 3, color: const Color(0xff9DA2A7)),
                      hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                          fontFamily: FontFamily.qRegular),
                      contentPadding:
                          const EdgeInsets.only(left: 20, right: 20),
                      filled: true,
                      fillColor: notifire.getContentColor,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blue),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12))),
                    ),
                  ),
                ),
                Text(
                  'Password'.tr,
                  style: TextStyle(
                      fontSize: 14,
                      color: notifire.getContainer,
                      fontFamily: FontFamily.qBold),
                ),
                Container(
                  height: 45,
                  margin: const EdgeInsets.symmetric(vertical: 13),
                  child: TextField(
                    controller: _passwordController,
                    style: const TextStyle(fontSize: 11),
                    obscureText: passwordVisible,
                    decoration: InputDecoration(
                      hintText: 'Password'.tr,
                      suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                          child: Icon(
                              passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey)),
                      prefixIcon: Image.asset(Appcontent.password,
                          scale: 3, color: const Color(0xff9DA2A7)),
                      hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                          fontFamily: FontFamily.qRegular),
                      contentPadding:
                          const EdgeInsets.only(left: 20, right: 20),
                      filled: true,
                      fillColor: notifire.getContentColor,
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blue),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12))),
                    ),
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      Checkbox(
                        checkColor: notifire.getBgColor,
                        fillColor:
                            WidgetStatePropertyAll(notifire.getContainer),
                        activeColor: notifire.getContainer,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Text(
                        'Keep me signed in'.tr,
                        style: TextStyle(
                            fontSize: 12,
                            color: notifire.getContainer,
                            fontFamily: FontFamily.qBold,
                            fontWeight: FontWeight.w600),
                      ),
                      const Spacer(),
                      InkWell(
                          onTap: () {
                            Get.to(const PhoneVerification());
                          },
                          child: Text(
                            'Forgot password?'.tr,
                            style: TextStyle(
                                fontSize: 12,
                                color: notifire.getContainer,
                                fontFamily: FontFamily.qBold,
                                fontWeight: FontWeight.w600),
                          )),
                    ],
                  ),
                ),
                InkWell(
                  onTap: _login,
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: notifire.getContainer,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                        child: Text('Login'.tr,
                            style: TextStyle(
                                fontSize: 15,
                                color: notifire.getBgColor,
                                fontFamily: FontFamily.qBold,
                                fontWeight: FontWeight.w700))),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'or continue with open account'.tr,
                  style: TextStyle(
                      fontSize: 12,
                      color: notifire.getContainer,
                      fontFamily: FontFamily.qBold,
                      fontWeight: FontWeight.w700),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                      itemCount: social.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () async {
                                if (socialName[index] == 'Google') {
                                  await _loginWithGoogle();
                                } else if (socialName[index] == 'Phone') {
                                  // Agrega la funcionalidad de inicio de sesión con Phone aquí
                                } else if (socialName[index] == 'Apple') {
                                  // Agrega la funcionalidad de inicio de sesión con Apple aquí
                                } else if (!await launchUrl(
                                    modal().urlList[index])) {
                                  throw Exception(
                                      'Could not launch ${modal().urlList[index]}');
                                }
                              },
                              child: Container(
                                height: 38,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  color: notifire.getContentColor,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(social[index], height: 16),
                                    const SizedBox(width: 10),
                                    Text(socialName[index],
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: notifire.getContainer,
                                            fontFamily: FontFamily.qBold,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
                Row(
                  children: [
                    Text(
                      "not registered yet?".tr,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontFamily: FontFamily.qBold,
                          fontWeight: FontWeight.w700),
                      overflow: TextOverflow.ellipsis,
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(const SignupScreen());
                        },
                        child: Text(
                          " Try Sign Up".tr,
                          style: TextStyle(
                              color: notifire.getContainer,
                              fontSize: 12,
                              fontFamily: FontFamily.qBold,
                              fontWeight: FontWeight.w700),
                          overflow: TextOverflow.ellipsis,
                        ))
                  ],
                ),
                RichText(
                    text: const TextSpan(
                  children: [
                    TextSpan(
                      text: ' ',
                    ),
                    TextSpan(
                      text: '',
                    ),
                  ],
                )),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Image.asset(Appcontent.copyright, height: 10),
                    const SizedBox(width: 10),
                    const Text('Copyright Miracle 2024',
                        style: TextStyle(
                            fontSize: 10,
                            color: Color(0xff99B2C6),
                            fontFamily: FontFamily.qRegular,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              height: 800,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage(Appcontent.miracle),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            height: 45,
                            // width: 45,
                            child: Image.asset(
                              Appcontent.miracleLogo,
                              color: Colors.white,
                            )),
                        const SizedBox(width: 15),
                        const Text('Miracle',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 46,
                                fontFamily: FontFamily.qRegular,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text("Design Delight: Your Ultimate UI Kit".tr,
                        style: const TextStyle(
                            fontFamily: FontFamily.qBold,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 36)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
