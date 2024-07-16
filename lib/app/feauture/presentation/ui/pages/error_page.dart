import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sitecycle/app/config/colors.dart';
import 'package:sitecycle/app/config/controller/index_controller.dart';
import 'package:sitecycle/app/config/dark_ligthmode.dart';
import 'package:sitecycle/app/config/fontfamily_modal.dart';



class ErrorPage extends StatefulWidget {
  const ErrorPage({super.key});

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {

  late ColorNotifire notifire;
  IndexController inboxController = Get.put(IndexController());

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of(context, listen: true);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: error(constraints),
        );
    },);
  }
  Widget error(constraints){
    return Container(
      height: Get.height,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: notifire.getContentColor,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("404 Not Found".tr, style: TextStyle(color: notifire.getContainer, fontFamily: FontFamily.qBold, fontSize: 60),textAlign: TextAlign.center,),
          const SizedBox(height: 20),
          Lottie.asset("assets/404.json",height: 200),
          Text("Sorry, the page not find!".tr, style: TextStyle(fontSize: 16, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700, color: greytext, letterSpacing: 0),),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ButtonStyle(
              elevation: const WidgetStatePropertyAll(0),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              padding: const WidgetStatePropertyAll(EdgeInsets.only(right: 20, left: 20, bottom: 16, top: 16)),
              backgroundColor: WidgetStatePropertyAll(Colors.grey.withOpacity(0.2))
            ),
              onPressed: () {
                inboxController.setTextIsTrue(1);
          }, child: Text("Back to Home Page".tr, style: TextStyle(fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700, color: greytext, letterSpacing: 0.2, fontSize: 14),))
        ],
      ),
    );
  }
}
