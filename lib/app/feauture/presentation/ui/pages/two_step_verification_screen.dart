import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sitecycle/app/config/colors.dart';
import 'package:sitecycle/app/config/dark_ligthmode.dart';
import 'package:sitecycle/app/config/fontfamily_modal.dart';
import 'package:sitecycle/app/config/images.dart';
import 'package:sitecycle/app/feauture/presentation/ui/login/login_screen.dart';



class TwostepVerificationPage extends StatefulWidget {
  const TwostepVerificationPage({super.key});

  @override
  State<TwostepVerificationPage> createState() => _TwostepVerificationPageState();
}

class _TwostepVerificationPageState extends State<TwostepVerificationPage> {

  late ColorNotifire notifire;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getBgColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
        return constraints.maxWidth < 870 ? verification2(constraints) :  constraints.maxWidth < 1328 ? verification1(constraints) : verification(constraints);
      },),
    );
  }
  Widget verification(constraints){
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
              flex: constraints.maxWidth < 1455 ? 3 : 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                          height: 49,
                          width: 49,
                          child: Image.asset(Appcontent.miracleLogo,color: notifire.getContainer,)),
                      const SizedBox(width: 15),
                      Text('Miracle', style: TextStyle(color: notifire.getContainer, fontSize: 48, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w400)),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text('Two Step Verification'.tr,style: TextStyle(fontSize: 30, color: notifire.getContainer, fontFamily: FontFamily.qBold)),
                  const SizedBox(height: 30),
                  RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                    text: "We sent a verification code to your mobile. Enter the code from the mobile in the field below.".tr,
                    style: TextStyle(fontSize: 16, color: greytext, fontWeight: FontWeight.w700, letterSpacing: 0.5, fontFamily: FontFamily.qRegular),
                    children: [
                      TextSpan(
                        text: "  *******3275",
                          style: TextStyle(fontSize: 16, color: notifire.getContainer, fontFamily: FontFamily.qBold)
                      ),
                    ]
                  )),
                  const SizedBox(height: 40),
                  Text('Enter your 6 digit OTP'.tr, style: TextStyle(fontSize: 16, color: notifire.getContainer, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 13 ),
                  OtpTextField(
                    fieldWidth: constraints.maxWidth / 32,
                    fieldHeight: 45,
                    numberOfFields: 6,
                    showFieldAsBox: true,
                    disabledBorderColor: Colors.transparent,
                    borderColor: Colors.transparent,
                    enabledBorderColor: Colors.transparent,
                    focusedBorderColor: blue,
                    borderRadius: BorderRadius.circular(10),
                    textStyle: TextStyle(color: notifire.getContainer, fontWeight: FontWeight.w700, fontFamily: FontFamily.qRegular,  fontSize: 16),
                    filled: true,
                    fillColor: notifire.getContentColor,
                    cursorColor: blue,
                    margin: EdgeInsets.only(right: constraints.maxWidth / 80,),
                    decoration: InputDecoration(
                        focusColor: blue,
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: greyBorder), borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: blue), borderRadius: const BorderRadius.all(Radius.circular(12))),
                        border: OutlineInputBorder(borderSide: BorderSide(color: greyBorder), borderRadius: const BorderRadius.all(Radius.circular(12))),
                        disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: greyBorder))
                    ),
                  ),

                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 42,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: notifire.getContentColor,
                              border: Border.all(color: notifire.getContainer),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child:  Center(child: Text('Back'.tr,style: TextStyle(fontSize: 15, color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                          },
                          child: Container(
                            height: 42,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: notifire.getContainer,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child:  Center(child: Text('Procced'.tr.tr,style: TextStyle(fontSize: 15, color: notifire.text,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Didn't Get the code?".tr, style: TextStyle(fontSize: 14, color: greytext, letterSpacing: 0.5, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),),
                      InkWell(onTap: () {

                      },child: Text("  Resend".tr, style: TextStyle(fontSize: 14, letterSpacing: 0.5, color: blue, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700))),
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
            const Spacer(),
            Expanded(
              flex: constraints.maxWidth < 1450 ? 4 : 3,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage(Appcontent.miracle),fit: BoxFit.fill,),
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
                              child: Image.asset(Appcontent.miracleLogo,color: Colors.white,)),
                          const SizedBox(width: 15),
                          const Text('Miracle', style: TextStyle(color: Colors.white, fontSize: 56, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w400)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text("Design Delight: Your Ultimate UI Kit".tr, style: const TextStyle(fontFamily: FontFamily.qBold, fontWeight: FontWeight.w400, color: Colors.white, fontSize: 36)),
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
  Widget verification1(constraints){
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: notifire.getBgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            constraints.maxWidth < 1328 ? SizedBox(width: constraints.maxWidth < 1100 ? 50 : 100,) : const Spacer(),
            Expanded(
              flex: constraints.maxWidth < 1450 ? 3 : 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                          height: 49,
                          width: 49,
                          child: Image.asset(Appcontent.miracleLogo,color: notifire.getContainer,)),
                      const SizedBox(width: 15),
                      Text('Miracle', style: TextStyle(color: notifire.getContainer, fontSize: 48, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w400)),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text('Two Step Verification'.tr,style: TextStyle(fontSize: 30, color: notifire.getContainer, fontFamily: FontFamily.qBold)),
                  const SizedBox(height: 30),
                  RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                    text: "We sent a verification code to your mobile. Enter the code from the mobile in the field below.".tr,
                    style: TextStyle(fontSize: 16, color: greytext, fontWeight: FontWeight.w700, letterSpacing: 0.5, fontFamily: FontFamily.qRegular),
                    children: [
                      TextSpan(
                        text: "  *******3275",
                          style: TextStyle(fontSize: 16, color: notifire.getContainer, fontFamily: FontFamily.qBold)
                      )
                    ]
                  )),
                  const SizedBox(height: 40),
                  Text('Enter your 6 digit OTP'.tr, style: TextStyle(fontSize: 16, color: notifire.getContainer, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 13 ),
                  OtpTextField(
                    fieldHeight: 45,
                    fieldWidth: constraints.maxWidth / 25,
                    numberOfFields: 6,
                    showFieldAsBox: true,
                    disabledBorderColor: Colors.transparent,
                    borderColor: Colors.transparent,
                    enabledBorderColor: Colors.transparent,
                    focusedBorderColor: blue,
                    borderRadius: BorderRadius.circular(10),
                    textStyle: TextStyle(color: notifire.getContainer, fontWeight: FontWeight.w700, fontFamily: FontFamily.qRegular,  fontSize: 16),
                    filled: true,
                    fillColor: notifire.getContentColor,
                    cursorColor: blue,
                    margin: const EdgeInsets.only(right: 20,),
                    decoration: InputDecoration(
                        focusColor: blue,
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: greyBorder), borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: blue), borderRadius: const BorderRadius.all(Radius.circular(12))),
                        border: OutlineInputBorder(borderSide: BorderSide(color: greyBorder), borderRadius: const BorderRadius.all(Radius.circular(12))),
                        disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: greyBorder))
                    ),
                  ),

                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 42,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: notifire.getContentColor,
                              border: Border.all(color: notifire.getContainer),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child:  Center(child: Text('Back'.tr,style: TextStyle(fontSize: 15, color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                          },
                          child: Container(
                            height: 42,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: notifire.getContainer,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child:  Center(child: Text('Procced'.tr.tr,style: TextStyle(fontSize: 15, color: notifire.text,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Didn't Get the code?".tr, style: TextStyle(fontSize: 14, color: greytext, letterSpacing: 0.5, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),),
                      InkWell(onTap: () {

                      },child: Text("  Resend".tr, style: TextStyle(fontSize: 14, letterSpacing: 0.5, color: blue, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700))),
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
              flex: constraints.maxWidth < 1450 ? 4 : 3,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage(Appcontent.miracle),fit: BoxFit.fill,),
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
                              child: Image.asset(Appcontent.miracleLogo,color: Colors.white,)),
                          const SizedBox(width: 15),
                          const Text('Miracle', style: TextStyle(color: Colors.white, fontSize: 56, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w400)),
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
  Widget verification2(constraints){
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
                          child: Image.asset(Appcontent.miracleLogo,color: notifire.getContainer,)),
                      const SizedBox(width: 15),
                      Text('Miracle', style: TextStyle(color: notifire.getContainer, fontSize: 30, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w400)),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text('Two Step Verification'.tr,style: TextStyle(fontSize: 25, color: notifire.getContainer, fontFamily: FontFamily.qBold)),
                  const SizedBox(height: 20),
                  RichText(
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                    text: "We sent a verification code to your mobile. Enter the code from the mobile in the field below.".tr,
                    style: TextStyle(fontSize: 11, color: greytext, fontWeight: FontWeight.w700, letterSpacing: 0.5, fontFamily: FontFamily.qRegular),
                    children: [
                      TextSpan(
                        text: "  *******3275",
                          style: TextStyle(fontSize: 16, color: notifire.getContainer, fontFamily: FontFamily.qBold)
                      )
                    ]
                  )),
                  const SizedBox(height: 30),
                  Text('Enter your 6 digit OTP'.tr, style: TextStyle(fontSize: 16, color: notifire.getContainer, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 13 ),
                  OtpTextField(
                    fieldHeight: constraints.maxWidth < 550 ? 50 : 70,
                    fieldWidth: constraints.maxWidth < 550 ? constraints.maxWidth / 9 : constraints.maxWidth < 700 ? constraints.maxWidth / 10 : constraints.maxWidth / 15,
                    numberOfFields: 6,
                    showFieldAsBox: true,
                    disabledBorderColor: Colors.transparent,
                    borderColor: blue,
                    enabledBorderColor: Colors.transparent,
                    focusedBorderColor: blue,
                    borderRadius: BorderRadius.circular(10),
                    textStyle: TextStyle(color: notifire.getContainer, fontWeight: FontWeight.w700, fontFamily: FontFamily.qRegular,  fontSize: 13),
                    filled: true,
                    fillColor: notifire.getContentColor,
                    cursorColor: blue,
                    margin: EdgeInsets.only(right: constraints.maxWidth / 60,),
                    decoration: InputDecoration(
                        focusColor: blue,
                        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: greyBorder), borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: blue), borderRadius: const BorderRadius.all(Radius.circular(12))),
                        border: OutlineInputBorder(borderSide: BorderSide(color: greyBorder), borderRadius: const BorderRadius.all(Radius.circular(12))),
                        disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: greyBorder))
                    ),
                  ),
          
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 42,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: notifire.getContentColor,
                              border: Border.all(color: notifire.getContainer),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child:  Center(child: Text('Back'.tr,style: TextStyle(fontSize: 12, color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.to(const LoginScreen());
                          },
                          child: Container(
                            height: 42,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: notifire.getContainer,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child:  Center(child: Text('Procced'.tr.tr,style: TextStyle(fontSize: 12, color: notifire.text,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Didn't Get the code?".tr, style: TextStyle(fontSize: 11, color: greytext, letterSpacing: 0.5, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),),
                      InkWell(onTap: () {
          
                      },child: Text("  Resend".tr, style: TextStyle(fontSize: 11, letterSpacing: 0.5, color: blue, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700))),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Image.asset(Appcontent.copyright, height: 15),
                      const SizedBox(width: 10),
                      const Text('Copyright Miracle 2024 ', style: TextStyle(fontSize: 11, color: Color(0xff99B2C6), fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              Container(
                height: 800,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(image: AssetImage(Appcontent.miracle),fit: BoxFit.cover,),
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
                              child: Image.asset(Appcontent.miracleLogo,color: Colors.white,)),
                          const SizedBox(width: 15),
                          const Text('Miracle', style: TextStyle(color: Colors.white, fontSize: 46, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w400)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text("Design Delight: Your Ultimate UI Kit".tr, style: const TextStyle(fontFamily: FontFamily.qBold, fontWeight: FontWeight.w400, color: Colors.white, fontSize: 36)),
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
