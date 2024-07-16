import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sitecycle/app/config/colors.dart';
import 'package:sitecycle/app/config/dark_ligthmode.dart';
import 'package:sitecycle/app/config/fontfamily_modal.dart';
import 'package:sitecycle/app/config/images.dart';
import 'package:sitecycle/app/config/list_modal.dart';
import 'package:sitecycle/app/data/datasource/auth/register_case_use.dart';
import 'package:sitecycle/app/feauture/presentation/ui/drawer/drawer_main.dart';
import 'package:sitecycle/app/feauture/presentation/ui/login/login_screen.dart';
import 'package:sitecycle/app/service/firebase/auth/register.dart';
import 'package:url_launcher/url_launcher.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late ColorNotifire notifire;

  bool isChecked = false;
  bool passwordVisible = true;

  List socialName = [
    'Google',
    'Facebook',
    'Discord',
  ];

  List social = [
    Appcontent.google,
    Appcontent.facebook,
    Appcontent.discord,
  ];

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getBgColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.maxWidth < 870
              ? signup2(constraints)
              : constraints.maxWidth < 1328
                  ? signup1(constraints)
                  : signup(constraints);
        },
      ),
    );
  }

  Widget signup(constraints) {
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
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            height: 49,
                            child: Image.asset(
                              Appcontent.miracleLogo,
                              color: notifire.getContainer,
                            )),
                        const SizedBox(width: 15),
                        Text('Miracle',
                            style: TextStyle(
                                color: notifire.getContainer,
                                fontSize: 42,
                                fontFamily: FontFamily.qRegular,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Signup and create your account'.tr,
                      style: TextStyle(
                          fontSize: 32,
                          color: notifire.getContainer,
                          fontFamily: FontFamily.qBold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 30),
                    Text('User Name'.tr,
                        style: TextStyle(
                            fontSize: 16,
                            color: notifire.getContainer,
                            fontFamily: FontFamily.qBold)),
                    Container(
                      width: Get.width * 0.25,
                      height: 45,
                      margin: const EdgeInsets.symmetric(vertical: 13),
                      child: TextField(
                        controller: _userNameController,
                        keyboardType: TextInputType.name,
                        style: TextStyle(
                            fontSize: 14,
                            color: notifire.getContainer,
                            fontFamily: FontFamily.qRegular,
                            fontWeight: FontWeight.w700),
                        decoration: InputDecoration(
                          hintText: 'User Name'.tr,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              Appcontent.userIcon,
                              colorFilter: const ColorFilter.mode(
                                  Color(0xff9DA2A7), BlendMode.srcIn),
                            ),
                          ),
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
                    Text('Your Email'.tr,
                        style: TextStyle(
                            fontSize: 16,
                            color: notifire.getContainer,
                            fontFamily: FontFamily.qBold)),
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
                    Text('Mobile Number'.tr,
                        style: TextStyle(
                            fontSize: 16,
                            color: notifire.getContainer,
                            fontFamily: FontFamily.qBold)),
                    Container(
                      width: Get.width * 0.25,
                      height: 45,
                      margin: const EdgeInsets.symmetric(vertical: 13),
                      child: TextField(
                        controller: _mobileNumberController,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(
                            fontSize: 14,
                            color: notifire.getContainer,
                            fontFamily: FontFamily.qRegular,
                            fontWeight: FontWeight.w700),
                        decoration: InputDecoration(
                          hintText: 'Mobile Number'.tr,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              Appcontent.phone,
                              colorFilter: const ColorFilter.mode(
                                  Color(0xff9DA2A7), BlendMode.srcIn),
                            ),
                          ),
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
                    Text('Password'.tr,
                        style: TextStyle(
                            fontSize: 16,
                            color: notifire.getContainer,
                            fontFamily: FontFamily.qBold)),
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
                              color: Colors.grey,
                            ),
                          ),
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
                      child: StreamBuilder<Object>(
                        stream: null,
                        builder: (context, snapshot) {
                          return Row(
                            children: [
                              Checkbox(
                                checkColor: notifire.getBgColor,
                                fillColor: WidgetStatePropertyAll(
                                    notifire.getContainer),
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
                            ],
                          );
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await CUFirebaseAuthRegister.register(
                          context: context,
                          email: _emailController.text,
                          password: _passwordController.text,
                          userName: _userNameController.text,
                          mobileNumber: _mobileNumberController.text,
                        );
                      },
                      child: Container(
                        height: 42,
                        width: Get.width * 0.25,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: notifire.getContainer,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                            child: Text('Sign Up'.tr,
                                style: TextStyle(
                                    fontSize: 15,
                                    color: notifire.text,
                                    fontFamily: FontFamily.qBold,
                                    fontWeight: FontWeight.w700))),
                      ),
                    ),
                    const SizedBox(height: 60),
                    Text(
                      'or continue with open account'.tr,
                      style: TextStyle(
                          fontSize: 13,
                          color: notifire.getContainer,
                          fontFamily: FontFamily.qBold,
                          fontWeight: FontWeight.w700),
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
                                  if (!await launchUrl(modal().urlList[index])) {
                                    throw Exception(
                                        'Could not launch ${modal().urlList[index]}');
                                  }
                                },
                                child: Container(
                                  height: 55,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5),
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
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Already registered?".tr,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontFamily: FontFamily.qBold,
                              fontWeight: FontWeight.w700),
                        ),
                        InkWell(
                            onTap: () {
                              Get.to(const LoginScreen());
                            },
                            child: Text(" Log In".tr,
                                style: TextStyle(
                                    color: notifire.getContainer,
                                    fontSize: 18,
                                    fontFamily: FontFamily.qBold,
                                    fontWeight: FontWeight.w700))),
                      ],
                    ),
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
                      Text(
                        "Design Delight: Your Ultimate UI Kit".tr,
                        style: const TextStyle(
                            fontFamily: FontFamily.qBold,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 36),
                        overflow: TextOverflow.ellipsis,
                      ),
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

  Widget signup1(constraints) {
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
            constraints.maxWidth < 1328 ? SizedBox(width: constraints.maxWidth < 990 ? 50 : 100,) : const Spacer(),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                          height: 38,
                          width: 38,
                          child: Image.asset(Appcontent.miracleLogo, color: notifire.getContainer,)),
                      const SizedBox(width: 15),
                      Text('Miracle', style: TextStyle(color: notifire.getContainer, fontSize: 30, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w400)),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text('Signup and create your account'.tr, style: TextStyle(fontSize: 20, color: notifire.getContainer, fontFamily: FontFamily.qBold), overflow: TextOverflow.ellipsis,),
                  const SizedBox(height: 10),
                  Text('User Name'.tr, style: TextStyle(fontSize: 11, color: notifire.getContainer, fontFamily: FontFamily.qBold)),

                  Container(
                    width: constraints.maxWidth < 990 ? Get.width * 0.30 : Get.width * 0.25,
                    height: 45,
                    margin: const EdgeInsets.symmetric(vertical: 13),
                    child: TextField(
                      controller: _userNameController,
                      keyboardType: TextInputType.name,
                      style: TextStyle(fontSize: 11, color: notifire.getContainer, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),
                      decoration: InputDecoration(
                        hintText: 'User Name'.tr,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(14),
                          child: SvgPicture.asset(Appcontent.userIcon, colorFilter: const ColorFilter.mode(Color(0xff9DA2A7), BlendMode.srcIn),),
                        ),
                        hintStyle: const TextStyle(color: Colors.grey, fontSize: 11, fontFamily: FontFamily.qRegular),
                        contentPadding: const EdgeInsets.only(left: 20, right: 20),
                        filled: true,
                        fillColor: notifire.getContentColor,
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: blue), borderRadius: const BorderRadius.all(Radius.circular(12))),
                        border: const OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(12))),
                      ),
                    ),
                  ),

                  Text('Your Email'.tr, style: TextStyle(fontSize: 11, color: notifire.getContainer, fontFamily: FontFamily.qBold)),
                  Container(
                    width: constraints.maxWidth < 990 ? Get.width * 0.30 : Get.width * 0.25,
                    height: 45,
                    margin: const EdgeInsets.symmetric(vertical: 13),
                    child: TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(fontSize: 11, color: notifire.getContainer, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),
                      decoration: InputDecoration(
                        hintText: 'Your Email'.tr,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Image.asset(Appcontent.email, scale: 3, color: const Color(0xff9DA2A7)),
                        ),
                        hintStyle: const TextStyle(color: Colors.grey, fontSize: 11, fontFamily: FontFamily.qRegular),
                        contentPadding: const EdgeInsets.only(left: 20, right: 20),
                        filled: true,
                        fillColor: notifire.getContentColor,
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: blue), borderRadius: const BorderRadius.all(Radius.circular(12))),
                        border: const OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(12))),
                      ),
                    ),
                  ),

                  Text('Mobile Number'.tr, style: TextStyle(fontSize: 11, color: notifire.getContainer, fontFamily: FontFamily.qBold)),
                  Container(
                    width: constraints.maxWidth < 990 ? Get.width * 0.30 : Get.width * 0.25,
                    height: 45,
                    margin: const EdgeInsets.symmetric(vertical: 13),
                    child: TextField(
                      controller: _mobileNumberController,
                      keyboardType: TextInputType.phone,
                      style: TextStyle(fontSize: 11, color: notifire.getContainer, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),
                      decoration: InputDecoration(
                        hintText: 'Mobile Number'.tr,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(14),
                          child: SvgPicture.asset(Appcontent.phone, colorFilter: const ColorFilter.mode(Color(0xff9DA2A7), BlendMode.srcIn),),
                        ),
                        hintStyle: const TextStyle(color: Colors.grey, fontSize: 11, fontFamily: FontFamily.qRegular),
                        contentPadding: const EdgeInsets.only(left: 20, right: 20),
                        filled: true,
                        fillColor: notifire.getContentColor,
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: blue), borderRadius: const BorderRadius.all(Radius.circular(12))),
                        border: const OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(12))),
                      ),
                    ),
                  ),

                  Text('Password'.tr, style: TextStyle(fontSize: 11, color: notifire.getContainer, fontFamily: FontFamily.qBold)),
                  Container(
                    width: constraints.maxWidth < 990 ? Get.width * 0.30 : Get.width * 0.25,
                    height: 45,
                    margin: const EdgeInsets.symmetric(vertical: 13),
                    child: TextField(
                      controller: _passwordController,
                      style: TextStyle(fontSize: 11, color: notifire.getContainer, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                        hintText: 'Password'.tr,
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off, color: Colors.grey, ),
                          )),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Image.asset(Appcontent.password, scale: 3, color: const Color(0xff9DA2A7)),
                        ),
                        hintStyle: const TextStyle(color: Colors.grey, fontSize: 11, fontFamily: FontFamily.qRegular),
                        contentPadding: const EdgeInsets.only(left: 20, right: 20),
                        filled: true,
                        fillColor: notifire.getContentColor,
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: blue), borderRadius: const BorderRadius.all(Radius.circular(12))),
                        border: const OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(12))),
                      ),
                    ),
                  ),

                  SizedBox(
                    child: StreamBuilder<Object>(
                      stream: null,
                      builder: (context, snapshot) {
                        return Row(
                          children: [
                            Checkbox(
                              checkColor: notifire.getBgColor,
                              fillColor: WidgetStatePropertyAll(notifire.getContainer),
                              activeColor: notifire.getContainer,
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text('Keep me signed in'.tr, style: TextStyle(fontSize: 10, color: notifire.getContainer, fontFamily: FontFamily.qBold, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis,),
                          ],
                        );
                      }
                    ),
                  ),

                  InkWell(
                    onTap: () async {
                      final result = await SFirebaseAuthRegister.register(
                        context: context,
                        email: _emailController.text,
                        password: _passwordController.text,
                        userName: _userNameController.text,
                        mobileNumber: _mobileNumberController.text,
                      );

                      if (result.success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Registration successful!')),
                        );
                        Get.to(const DrawerMain());
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(result.message ?? 'Unknown error occurred')),
                        );
                      }
                    },
                    child: Container(
                      height: 42,
                      width: constraints.maxWidth < 990 ? Get.width * 0.30 : Get.width * 0.25,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: notifire.getContainer,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(child: Text('Sign Up'.tr, style: TextStyle(fontSize: 15, color: notifire.text, fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                    ),
                  ),

                  const SizedBox(height: 60),
                  Text('or continue with open account'.tr, style: TextStyle(fontSize: 13, color: notifire.getContainer, fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700), overflow: TextOverflow.ellipsis,),

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
                                if (!await launchUrl(modal().urlList[index])) {
                                  throw Exception('Could not launch ${modal().urlList[index]}');
                                }
                              },
                              child: Container(
                                height: 38,
                                padding: const EdgeInsets.symmetric(horizontal: 18),
                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  color: notifire.getContentColor,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(social[index], height: 16),
                                    const SizedBox(width: 10),
                                    Text(socialName[index], style: TextStyle(fontSize: 9, color: notifire.getContainer, fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                    ),
                  ),

                  Row(
                    children: [
                      Text("Already registered?".tr, style: const TextStyle(color: Colors.grey, fontSize: 18, fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700), overflow: TextOverflow.ellipsis,),
                      InkWell(
                        onTap: () {
                          Get.to(const LoginScreen());
                        },
                        child: Text(" Log In".tr, style: TextStyle(color: notifire.getContainer, fontSize: 18, fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700), overflow: TextOverflow.ellipsis,)),
                    ],
                  ),

                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Image.asset(Appcontent.copyright, height: 15),
                      const SizedBox(width: 10),
                      const Text('Copyright Miracle 2024 ', style: TextStyle(fontSize: 12, color: Color(0xff99B2C6), fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ],
              ),
            ),
            constraints.maxWidth < 1328 ? const SizedBox(width: 50,) : const Spacer(),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(image: AssetImage(Appcontent.miracle), fit: BoxFit.cover,),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: constraints.maxWidth < 1070 ? 60 : 100, bottom: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              height: 45,
                              child: Image.asset(Appcontent.miracleLogo, color: Colors.white,)),
                          const SizedBox(width: 15),
                          const Text('Miracle', style: TextStyle(color: Colors.white, fontSize: 56, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w400)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text("Design Delight: Your Ultimate UI Kit".tr, style: const TextStyle(fontFamily: FontFamily.qBold, fontWeight: FontWeight.w400, color: Colors.white, fontSize: 36), overflow: TextOverflow.ellipsis,),
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

  Widget signup2(constraints) {
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
                        child: Image.asset(Appcontent.miracleLogo, color: notifire.getContainer,)),
                    const SizedBox(width: 15),
                    Text('Miracle', style: TextStyle(color: notifire.getContainer, fontSize: 42, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w400)),
                  ],
                ),
                const SizedBox(height: 30),
                Text('Signup and create your account'.tr, style: TextStyle(fontSize: 19, color: notifire.getContainer, fontFamily: FontFamily.qBold), overflow: TextOverflow.ellipsis,),
                const SizedBox(height: 10),
                Text('User Name'.tr, style: TextStyle(fontSize: 14, color: notifire.getContainer, fontFamily: FontFamily.qBold)),

                Container(
                  height: 45,
                  margin: const EdgeInsets.symmetric(vertical: 13),
                  child: TextField(
                    controller: _userNameController,
                    keyboardType: TextInputType.name,
                    style: TextStyle(fontSize: 11, color: notifire.getContainer, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),
                    decoration: InputDecoration(
                      hintText: 'User Name'.tr,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(Appcontent.userIcon,
                          colorFilter: const ColorFilter.mode(Color(0xff9DA2A7), BlendMode.srcIn),
                        ),
                      ),
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: 11, fontFamily: FontFamily.qRegular),
                      contentPadding: const EdgeInsets.only(left: 20, right: 20),
                      filled: true,
                      fillColor: notifire.getContentColor,
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: blue), borderRadius: const BorderRadius.all(Radius.circular(12))),
                      border: const OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                  ),
                ),

                Text('Your Email'.tr, style: TextStyle(fontSize: 14, color: notifire.getContainer, fontFamily: FontFamily.qBold)),
                Container(
                  height: 45,
                  margin: const EdgeInsets.symmetric(vertical: 13),
                  child: TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 11, color: notifire.getContainer, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),
                    decoration: InputDecoration(
                      hintText: 'Your Email'.tr,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(Appcontent.email, color: const Color(0xff9DA2A7)),
                      ),
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: 11, fontFamily: FontFamily.qRegular),
                      contentPadding: const EdgeInsets.only(left: 20, right: 20),
                      filled: true,
                      fillColor: notifire.getContentColor,
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: blue), borderRadius: const BorderRadius.all(Radius.circular(12))),
                      border: const OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                  ),
                ),

                Text('Mobile Number'.tr, style: TextStyle(fontSize: 14, color: notifire.getContainer, fontFamily: FontFamily.qBold)),
                Container(
                  height: 45,
                  margin: const EdgeInsets.symmetric(vertical: 13),
                  child: TextField(
                    controller: _mobileNumberController,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(fontSize: 11, color: notifire.getContainer, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),
                    decoration: InputDecoration(
                      hintText: 'Mobile Number'.tr,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(Appcontent.phone, colorFilter: const ColorFilter.mode(Color(0xff9DA2A7), BlendMode.srcIn),),
                      ),
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: 11, fontFamily: FontFamily.qRegular),
                      contentPadding: const EdgeInsets.only(left: 20, right: 20),
                      filled: true,
                      fillColor: notifire.getContentColor,
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: blue), borderRadius: const BorderRadius.all(Radius.circular(12))),
                      border: const OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                  ),
                ),

                Text('Password'.tr, style: TextStyle(fontSize: 14, color: notifire.getContainer, fontFamily: FontFamily.qBold)),
                Container(
                  height: 45,
                  margin: const EdgeInsets.symmetric(vertical: 13),
                  child: TextField(
                    controller: _passwordController,
                    style: TextStyle(fontSize: 11, color: notifire.getContainer, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),
                    obscureText: passwordVisible,
                    decoration: InputDecoration(
                      hintText: 'Password'.tr,
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                        child: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off, color: Colors.grey)),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(Appcontent.password, color: const Color(0xff9DA2A7)),
                      ),
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: 11, fontFamily: FontFamily.qRegular),
                      contentPadding: const EdgeInsets.only(left: 20, right: 20),
                      filled: true,
                      fillColor: notifire.getContentColor,
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: blue), borderRadius: const BorderRadius.all(Radius.circular(12))),
                      border: const OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                  ),
                ),

                SizedBox(
                  child: StreamBuilder<Object>(
                      stream: null,
                      builder: (context, snapshot) {
                        return Row(
                          children: [
                            Checkbox(
                              checkColor: notifire.getBgColor,
                              fillColor: WidgetStatePropertyAll(notifire.getContainer),
                              activeColor: notifire.getContainer,
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text('Keep me signed in'.tr, style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qBold, fontWeight: FontWeight.w600), overflow: TextOverflow.ellipsis,),
                          ],
                        );
                      }
                  ),
                ),

                InkWell(
                  onTap: () async {
                    final result = await SFirebaseAuthRegister.register(
                      context: context,
                      email: _emailController.text,
                      password: _passwordController.text,
                      userName: _userNameController.text,
                      mobileNumber: _mobileNumberController.text,
                    );

                    if (result.success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Registration successful!')),
                      );
                      Get.to(const DrawerMain());
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(result.message ?? 'Unknown error occurred')),
                      );
                    }
                  },
                  child: Container(
                    height: 42,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: notifire.getContainer,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(child: Text('Sign Up'.tr, style: TextStyle(fontSize: 15, color: notifire.text, fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                  ),
                ),

                const SizedBox(height: 60),
                Text('or continue with open account'.tr, style: TextStyle(fontSize: 13, color: notifire.getContainer, fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700), overflow: TextOverflow.ellipsis,),

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
                              if (!await launchUrl(modal().urlList[index])) {
                                throw Exception('Could not launch ${modal().urlList[index]}');
                              }
                            },
                            child: Container(
                              height: 38,
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                color: notifire.getContentColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(social[index], height: 16),
                                  const SizedBox(width: 10),
                                  Text(socialName[index], style: TextStyle(fontSize: 12, color: notifire.getContainer, fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text("Already registered?".tr, style: const TextStyle(color: Colors.grey, fontSize: 12, fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700), overflow: TextOverflow.ellipsis,),
                    InkWell(
                        onTap: () {
                          Get.to(const LoginScreen());
                        },
                        child: Text(" Log In".tr, style: TextStyle(color: notifire.getContainer, fontSize: 12, fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700), overflow: TextOverflow.ellipsis,)),
                  ],
                ),

                const SizedBox(height: 30),
                Row(
                  children: [
                    Image.asset(Appcontent.copyright, height: 15),
                    const SizedBox(width: 10),
                    const Text('Copyright Miracle 2024 ', style: TextStyle(fontSize: 12, color: Color(0xff99B2C6), fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Container(
              height: 800,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(image: AssetImage(Appcontent.miracle), fit: BoxFit.cover,),
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
                            child: Image.asset(Appcontent.miracleLogo, color: Colors.white,)),
                        const SizedBox(width: 15),
                        const Text('Miracle', style: TextStyle(color: Colors.white, fontSize: 46, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w400)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text("Design Delight: Your Ultimate UI Kit".tr, style: const TextStyle(fontFamily: FontFamily.qBold, fontWeight: FontWeight.w400, color: Colors.white, fontSize: 36), overflow: TextOverflow.ellipsis,),
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
