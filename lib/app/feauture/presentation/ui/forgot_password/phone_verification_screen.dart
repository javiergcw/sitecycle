import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sitecycle/app/config/colors.dart';
import 'package:sitecycle/app/config/dark_ligthmode.dart';
import 'package:sitecycle/app/config/fontfamily_modal.dart';
import 'package:sitecycle/app/config/images.dart';
import 'package:sitecycle/app/data/datasource/auth/login_case_use.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({super.key});

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  late ColorNotifire notifire;
  final TextEditingController _phoneController = TextEditingController();
  String? _verificationId;
  String _otpCode = '';
  bool _codeSent = false;

  Future<void> _sendCode() async {
    await CUFirebaseAuthLogin.signInWithPhone(
      context: context,
      phoneNumber: _phoneController.text,
      codeSentCallback: (verificationId) {
        setState(() {
          _verificationId = verificationId;
          _codeSent = true;
        });
      },
    );
  }

  Future<void> _verifyCode() async {
    if (_verificationId != null) {
      await CUFirebaseAuthLogin.verifySmsCode(
        context: context,
        verificationId: _verificationId!,
        smsCode: _otpCode,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getBgColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.maxWidth < 900
              ? phoneverify1(constraints)
              : constraints.maxWidth < 1450
                  ? phoneverify2(constraints)
                  : phoneverify3(constraints);
        },
      ),
    );
  }

  Widget phoneverify3(BoxConstraints constraints) {
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
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 49,
                        width: 49,
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
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Phone Verification'.tr,
                    style: TextStyle(
                      fontSize: 30,
                      color: notifire.getContainer,
                      fontFamily: FontFamily.qBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20),
                  if (!_codeSent)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mobile Number'.tr,
                          style: TextStyle(
                            fontSize: 16,
                            color: notifire.getContainer,
                            fontFamily: FontFamily.qBold,
                          ),
                        ),
                        Container(
                          height: 45,
                          margin: const EdgeInsets.symmetric(vertical: 13),
                          child: TextField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            style: TextStyle(
                              fontSize: 14,
                              color: notifire.getContainer,
                              fontFamily: FontFamily.qRegular,
                              fontWeight: FontWeight.w700,
                            ),
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
                                fontFamily: FontFamily.qRegular,
                              ),
                              contentPadding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              filled: true,
                              fillColor: notifire.getContentColor,
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: blue),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: _sendCode,
                          child: Container(
                            height: 42,
                            decoration: BoxDecoration(
                              color: notifire.getContainer,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: Text(
                                'Send Code'.tr,
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
                    )
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Enter Otp'.tr,
                          style: TextStyle(
                            fontSize: 16,
                            color: notifire.getContainer,
                            fontFamily: FontFamily.qBold,
                          ),
                        ),
                        const SizedBox(height: 13),
                        OtpTextField(
                          fieldWidth: constraints.maxWidth / 30,
                          fieldHeight: 55,
                          contentPadding: const EdgeInsets.all(2),
                          numberOfFields: 6,
                          showFieldAsBox: true,
                          disabledBorderColor: Colors.transparent,
                          borderColor: blue,
                          enabledBorderColor: Colors.transparent,
                          focusedBorderColor: blue,
                          borderRadius: BorderRadius.circular(10),
                          textStyle: TextStyle(
                            color: notifire.getContainer,
                            fontWeight: FontWeight.w700,
                            fontFamily: FontFamily.qRegular,
                            fontSize: 16,
                          ),
                          filled: true,
                          fillColor: notifire.getContentColor,
                          cursorColor: blue,
                          margin: EdgeInsets.only(
                            right: constraints.maxWidth / 80,
                          ),
                          onSubmit: (otp) {
                            _otpCode = otp;
                          },
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: _verifyCode,
                          child: Container(
                            height: 42,
                            decoration: BoxDecoration(
                              color: notifire.getContainer,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: Text(
                                'Verify Code'.tr,
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
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Image.asset(Appcontent.copyright, height: 15),
                      const SizedBox(width: 10),
                      const Text(
                        'Copyright Miracle 2024 ',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff99B2C6),
                          fontFamily: FontFamily.qRegular,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Expanded(
              flex: constraints.maxWidth < 1450 ? 4 : 3,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Appcontent.miracle),
                    fit: BoxFit.fill,
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
                            ),
                          ),
                          const SizedBox(width: 15),
                          const Text(
                            'Miracle',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 56,
                              fontFamily: FontFamily.qRegular,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Design Delight: Your Ultimate UI Kit".tr,
                        style: const TextStyle(
                          fontFamily: FontFamily.qBold,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 36,
                        ),
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

  Widget phoneverify2(BoxConstraints constraints) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: notifire.getBgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            constraints.maxWidth < 1450
                ? SizedBox(
                    width: constraints.maxWidth < 990 ? 50 : 100,
                  )
                : const Spacer(),
            Expanded(
              flex: constraints.maxWidth < 1450 ? 3 : 2,
              child: Padding(
                padding:
                    EdgeInsets.only(left: constraints.maxWidth < 1450 ? 20 : 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Phone Verification'.tr,
                      style: TextStyle(
                        fontSize: 20,
                        color: notifire.getContainer,
                        fontFamily: FontFamily.qBold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    if (!_codeSent)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mobile Number'.tr,
                            style: TextStyle(
                              fontSize: 13,
                              color: notifire.getContainer,
                              fontFamily: FontFamily.qBold,
                            ),
                          ),
                          Container(
                            height: 45,
                            margin: const EdgeInsets.symmetric(vertical: 13),
                            child: TextField(
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              style: TextStyle(
                                fontSize: 13,
                                color: notifire.getContainer,
                                fontFamily: FontFamily.qRegular,
                                fontWeight: FontWeight.w700,
                              ),
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
                                  fontSize: 13,
                                  fontFamily: FontFamily.qRegular,
                                ),
                                contentPadding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                filled: true,
                                fillColor: notifire.getContentColor,
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: blue),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          InkWell(
                            onTap: _sendCode,
                            child: Container(
                              height: 42,
                              decoration: BoxDecoration(
                                color: notifire.getContainer,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Text(
                                  'Send Code'.tr,
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
                      )
                    else
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Enter Otp'.tr,
                            style: TextStyle(
                              fontSize: 13,
                              color: notifire.getContainer,
                              fontFamily: FontFamily.qBold,
                            ),
                          ),
                          const SizedBox(height: 13),
                          OtpTextField(
                            fieldHeight: 45,
                            fieldWidth: constraints.maxWidth / 25,
                            numberOfFields: 6,
                            showFieldAsBox: true,
                            disabledBorderColor: Colors.transparent,
                            borderColor: blue,
                            enabledBorderColor: Colors.transparent,
                            focusedBorderColor: blue,
                            borderRadius: BorderRadius.circular(10),
                            textStyle: TextStyle(
                              color: notifire.getContainer,
                              fontWeight: FontWeight.w700,
                              fontFamily: FontFamily.qRegular,
                              fontSize: 13,
                            ),
                            filled: true,
                            fillColor: notifire.getContentColor,
                            cursorColor: blue,
                            margin: EdgeInsets.only(
                              right: constraints.maxWidth / 80,
                            ),
                            onSubmit: (otp) {
                              _otpCode = otp;
                            },
                          ),
                          const SizedBox(height: 20),
                          InkWell(
                            onTap: _verifyCode,
                            child: Container(
                              height: 42,
                              decoration: BoxDecoration(
                                color: notifire.getContainer,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Text(
                                  'Verify Code'.tr,
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
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Image.asset(Appcontent.copyright, height: 15),
                        const SizedBox(width: 10),
                        const Text(
                          'Copyright Miracle 2024 ',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff99B2C6),
                            fontFamily: FontFamily.qRegular,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            constraints.maxWidth < 1328
                ? const SizedBox(width: 50)
                : const Spacer(),
            Expanded(
              flex: constraints.maxWidth < 1450 ? 4 : 3,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Appcontent.miracle),
                    fit: BoxFit.fill,
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
                            ),
                          ),
                          const SizedBox(width: 15),
                          const Text(
                            'Miracle',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 56,
                              fontFamily: FontFamily.qRegular,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Design Delight: Your Ultimate UI Kit".tr,
                        style: const TextStyle(
                          fontFamily: FontFamily.qBold,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 36,
                        ),
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

  Widget phoneverify1(BoxConstraints constraints) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: notifire.getBgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Phone Verification'.tr,
                    style: TextStyle(
                      fontSize: 22,
                      color: notifire.getContainer,
                      fontFamily: FontFamily.qBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20),
                  if (!_codeSent)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mobile Number'.tr,
                          style: TextStyle(
                            fontSize: 13,
                            color: notifire.getContainer,
                            fontFamily: FontFamily.qBold,
                          ),
                        ),
                        Container(
                          height: 45,
                          margin: const EdgeInsets.symmetric(vertical: 13),
                          child: TextField(
                            controller: _phoneController,
                            keyboardType: TextInputType.phone,
                            style: TextStyle(
                              fontSize: 13,
                              color: notifire.getContainer,
                              fontFamily: FontFamily.qRegular,
                              fontWeight: FontWeight.w700,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Mobile Number'.tr,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12),
                                child: SvgPicture.asset(
                                  Appcontent.phone,
                                  colorFilter: const ColorFilter.mode(
                                      Color(0xff9DA2A7), BlendMode.srcIn),
                                ),
                              ),
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                                fontFamily: FontFamily.qRegular,
                              ),
                              contentPadding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              filled: true,
                              fillColor: notifire.getContentColor,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: blue),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: _sendCode,
                          child: Container(
                            height: 42,
                            decoration: BoxDecoration(
                              color: notifire.getContainer,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: Text(
                                'Send Code'.tr,
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
                    )
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Enter Otp'.tr,
                          style: TextStyle(
                            fontSize: 16,
                            color: notifire.getContainer,
                            fontFamily: FontFamily.qBold,
                          ),
                        ),
                        const SizedBox(height: 13),
                        OtpTextField(
                          fieldHeight: constraints.maxWidth < 550 ? 50 : 70,
                          fieldWidth: constraints.maxWidth < 550
                              ? constraints.maxWidth / 9
                              : constraints.maxWidth < 700
                                  ? constraints.maxWidth / 10
                                  : constraints.maxWidth / 15,
                          numberOfFields: 6,
                          showFieldAsBox: true,
                          disabledBorderColor: Colors.transparent,
                          borderColor: blue,
                          enabledBorderColor: Colors.transparent,
                          focusedBorderColor: blue,
                          borderRadius: BorderRadius.circular(10),
                          textStyle: TextStyle(
                            color: notifire.getContainer,
                            fontWeight: FontWeight.w700,
                            fontFamily: FontFamily.qRegular,
                            fontSize: 16,
                          ),
                          filled: true,
                          fillColor: notifire.getContentColor,
                          cursorColor: blue,
                          margin: EdgeInsets.only(
                            right: constraints.maxWidth / 60,
                          ),
                          onSubmit: (otp) {
                            _otpCode = otp;
                          },
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: _verifyCode,
                          child: Container(
                            height: 42,
                            decoration: BoxDecoration(
                              color: notifire.getContainer,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: Text(
                                'Verify Code'.tr,
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
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Image.asset(Appcontent.copyright, height: 15),
                      const SizedBox(width: 10),
                      const Text(
                        'Copyright Miracle 2024 ',
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff99B2C6),
                          fontFamily: FontFamily.qRegular,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
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
                            ),
                          ),
                          const SizedBox(width: 15),
                          const Text(
                            'Miracle',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 46,
                              fontFamily: FontFamily.qRegular,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Design Delight: Your Ultimate UI Kit".tr,
                        style: const TextStyle(
                          fontFamily: FontFamily.qBold,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 36,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
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
