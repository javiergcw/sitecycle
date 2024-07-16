import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sitecycle/app/config/colors.dart';
import 'package:sitecycle/app/config/dark_ligthmode.dart';
import 'package:sitecycle/app/config/fontfamily_modal.dart';
import 'package:sitecycle/app/config/images.dart';
import 'package:sitecycle/app/feauture/presentation/ui/login/login_screen.dart';



class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  late ColorNotifire notifire;

  bool isChecked = false;
  bool passwordVisible = true;

  bool reenterpasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getBgColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
        return constraints.maxWidth < 870 ? forgot2(constraints) :  constraints.maxWidth < 1200 ? forgot1(constraints) : forgot(constraints);
      },),
    );
  }
  Widget forgot(constraints){
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
                          child: Image.asset(Appcontent.miracleLogo,color: notifire.getContainer,)),
                      const SizedBox(width: 15),
                      Text('Miracle', style: TextStyle(color: notifire.getContainer, fontSize: 48, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w400)),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text('Reset Password'.tr,style: TextStyle(fontSize: 30, color: notifire.getContainer, fontFamily: FontFamily.qBold)),
                  const SizedBox(height: 20),

                  Text('Password'.tr,style: TextStyle(fontSize: 16, color: notifire.getContainer, fontFamily: FontFamily.qBold)),
                  Container(
                    height: 45,
                    margin: const EdgeInsets.symmetric(vertical: 13),
                    child: TextField(
                      style: TextStyle(fontSize: 14, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w700),
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                        hintText: 'Password'.tr,
                        suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                            child: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off,color: Colors.grey)),
                        prefixIcon: Image.asset(Appcontent.password,
                            scale: 3, color: const Color(0xff9DA2A7)),
                        hintStyle:  const TextStyle(color: Colors.grey,fontSize: 15,fontFamily: FontFamily.qRegular),
                        contentPadding: const EdgeInsets.only(left: 20, right: 20),
                        filled: true,
                        fillColor: notifire.getContentColor,
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: blue),borderRadius: const BorderRadius.all(Radius.circular(12))),
                        border: const OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(12))),
                      ),
                    ),
                  ),

                  Text('Re-enter Password'.tr,style: TextStyle(fontSize: 16, color: notifire.getContainer, fontFamily: FontFamily.qBold)),
                  Container(
                    height: 45,
                    margin: const EdgeInsets.symmetric(vertical: 13),
                    child: TextField(
                      style: TextStyle(fontSize: 14, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w700),
                      obscureText: reenterpasswordVisible,
                      decoration: InputDecoration(
                        hintText: 'Re-enter Password'.tr,
                        suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                reenterpasswordVisible = !reenterpasswordVisible;
                              });
                            },
                            child: Icon(reenterpasswordVisible ? Icons.visibility : Icons.visibility_off,color: Colors.grey)),
                        prefixIcon: Image.asset(Appcontent.password,
                            scale: 3, color: const Color(0xff9DA2A7)),
                        hintStyle:  const TextStyle(color: Colors.grey,fontSize: 15,fontFamily: FontFamily.qRegular),
                        contentPadding: const EdgeInsets.only(left: 20, right: 20),
                        filled: true,
                        fillColor: notifire.getContentColor,
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: blue),borderRadius: const BorderRadius.all(Radius.circular(12))),
                        border: const OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(12))),
                      ),
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
                            Get.to(const LoginScreen());
                          },
                          child: Container(
                            height: 42,
                        
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: notifire.getContainer,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child:  Center(child: Text('Procced'.tr,style: TextStyle(fontSize: 15, color: notifire.text,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
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
                      const Text('Copyright Miracle 2024 ',style: TextStyle(fontSize: 12, color: Color(0xff99B2C6), fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
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
                      Text("Design Delight: Your Ultimate UI Kit".tr, style: const TextStyle(fontFamily: FontFamily.qBold, fontWeight: FontWeight.w400, color: Colors.white, fontSize: 36),overflow: TextOverflow.ellipsis,),
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

  Widget forgot1(constraints){
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: notifire.getBgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child:  Row(
          children: [
            SizedBox(width: constraints.maxWidth < 1000 ? 40 : 60,),
            Expanded(
              flex: 3,
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
                      Text('Miracle', style: TextStyle(color: notifire.getContainer, fontSize: 34, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w400)),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Text('Reset Password'.tr,style: TextStyle(fontSize: 26, color: notifire.getContainer, fontFamily: FontFamily.qBold)),
                  const SizedBox(height: 20),

                  Text('Password'.tr,style: TextStyle(fontSize: 14, color: notifire.getContainer, fontFamily: FontFamily.qBold)),
                  Container(
                    height: 45,
                    margin: const EdgeInsets.symmetric(vertical: 13),
                    child: TextField(
                      style: TextStyle(fontSize: 14, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w700),
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                        hintText: 'Password'.tr,
                        suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                            child: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off,color: Colors.grey)),
                        prefixIcon: Image.asset(Appcontent.password,
                            scale: 4, color: const Color(0xff9DA2A7)),
                        hintStyle:  const TextStyle(color: Colors.grey,fontSize: 12,fontFamily: FontFamily.qRegular),
                        contentPadding: const EdgeInsets.only(left: 20, right: 20),
                        filled: true,
                        fillColor: notifire.getContentColor,
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: blue),borderRadius: const BorderRadius.all(Radius.circular(12))),
                        border: const OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(12))),
                      ),
                    ),
                  ),

                  Text('Re-enter Password'.tr,style: TextStyle(fontSize: 14, color: notifire.getContainer, fontFamily: FontFamily.qBold)),
                  Container(
                    height: 45,
                    margin: const EdgeInsets.symmetric(vertical: 13),
                    child: TextField(
                      style: TextStyle(fontSize: 14, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w700),
                      obscureText: reenterpasswordVisible,
                      decoration: InputDecoration(
                        hintText: 'Re-enter Password'.tr,
                        suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                reenterpasswordVisible = !reenterpasswordVisible;
                              });
                            },
                            child: Icon(reenterpasswordVisible ? Icons.visibility : Icons.visibility_off,color: Colors.grey)),
                        prefixIcon: Image.asset(Appcontent.password,
                            scale: 4, color: const Color(0xff9DA2A7)),
                        hintStyle:  const TextStyle(color: Colors.grey,fontSize: 12,fontFamily: FontFamily.qRegular),
                        contentPadding: const EdgeInsets.only(left: 20, right: 20),
                        filled: true,
                        fillColor: notifire.getContentColor,
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: blue),borderRadius: const BorderRadius.all(Radius.circular(12))),
                        border: const OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(12))),
                      ),
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
                            height: 38,
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
                            Get.to(const LoginScreen());
                          },
                          child: Container(
                            height: 38,

                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: notifire.getContainer,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child:  Center(child: Text('Procced'.tr,style: TextStyle(fontSize: 15, color: notifire.text,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
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
                      const Text('Copyright Miracle 2024 ',style: TextStyle(fontSize: 12, color: Color(0xff99B2C6), fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: constraints.maxWidth < 1000 ? 40 : 60,),
            Expanded(
              flex: 5,
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
                          const Text('Miracle', style: TextStyle(color: Colors.white, fontSize: 46, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w400)),
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

  Widget forgot2(constraints){
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: notifire.getBgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                        height: 38,
                        child: Image.asset(Appcontent.miracleLogo,color: notifire.getContainer,)),
                    const SizedBox(width: 15),
                    Text('Miracle', style: TextStyle(color: notifire.getContainer, fontSize: 30, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w400)),
                  ],
                ),
                const SizedBox(height: 40),
                Text('Reset Password'.tr,style: TextStyle(fontSize: 26, color: notifire.getContainer, fontFamily: FontFamily.qBold)),
                const SizedBox(height: 20),

                Text('Password'.tr,style: TextStyle(fontSize: 14, color: notifire.getContainer, fontFamily: FontFamily.qBold)),
                Container(
                  height: 45,
                  margin: const EdgeInsets.symmetric(vertical: 13),
                  child: TextField(
                    style: TextStyle(fontSize: 14, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w700),
                    obscureText: passwordVisible,
                    decoration: InputDecoration(
                      hintText: 'Password'.tr,
                      suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                          child: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off,color: Colors.grey)),
                      prefixIcon: Image.asset(Appcontent.password,
                          scale: 4, color: const Color(0xff9DA2A7)),
                      hintStyle:  const TextStyle(color: Colors.grey,fontSize: 12,fontFamily: FontFamily.qRegular),
                      contentPadding: const EdgeInsets.only(left: 20, right: 20),
                      filled: true,
                      fillColor: notifire.getContentColor,
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: blue),borderRadius: const BorderRadius.all(Radius.circular(12))),
                      border: const OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
                  ),
                ),

                Text('Re-enter Password'.tr,style: TextStyle(fontSize: 14, color: notifire.getContainer, fontFamily: FontFamily.qBold)),
                Container(
                  height: 45,
                  margin: const EdgeInsets.symmetric(vertical: 13),
                  child: TextField(
                    style: TextStyle(fontSize: 14, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w700),
                    obscureText: reenterpasswordVisible,
                    decoration: InputDecoration(
                      hintText: 'Re-enter Password'.tr,
                      suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              reenterpasswordVisible = !reenterpasswordVisible;
                            });
                          },
                          child: Icon(reenterpasswordVisible ? Icons.visibility : Icons.visibility_off,color: Colors.grey)),
                      prefixIcon: Image.asset(Appcontent.password,
                          scale: 4, color: const Color(0xff9DA2A7)),
                      hintStyle:  const TextStyle(color: Colors.grey,fontSize: 12,fontFamily: FontFamily.qRegular),
                      contentPadding: const EdgeInsets.only(left: 20, right: 20),
                      filled: true,
                      fillColor: notifire.getContentColor,
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: blue),borderRadius: const BorderRadius.all(Radius.circular(12))),
                      border: const OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(12))),
                    ),
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
                          height: 38,
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
                          Get.to(const LoginScreen());
                        },
                        child: Container(
                          height: 38,

                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: notifire.getContainer,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child:  Center(child: Text('Procced'.tr,style: TextStyle(fontSize: 15, color: notifire.text,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
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
                    const Text('Copyright Miracle 2024 ',style: TextStyle(fontSize: 12, color: Color(0xff99B2C6), fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            Container(
              height: 800,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(Appcontent.miracle),fit: BoxFit.fill,),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
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
    );
  }
}
