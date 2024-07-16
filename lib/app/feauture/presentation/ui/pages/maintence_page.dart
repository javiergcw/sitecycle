import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sitecycle/app/config/colors.dart';
import 'package:sitecycle/app/config/dark_ligthmode.dart';
import 'package:sitecycle/app/config/fontfamily_modal.dart';



class MaintenancePage extends StatefulWidget {
  const MaintenancePage({super.key});

  @override
  State<MaintenancePage> createState() => _MaintenancePageState();
}

class _MaintenancePageState extends State<MaintenancePage> {

  late ColorNotifire notifire;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of(context, listen: true);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: maintenance(constraints),
        );
    },);
  }
  Widget maintenance(constraints){
    return Container(
      height: Get.height,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: notifire.getContentColor,
          borderRadius: BorderRadius.circular(16)
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Site is Under Maintenance".tr, style: TextStyle(color: notifire.getContainer, fontFamily: FontFamily.qBold, fontSize: constraints.maxWidth <  800 ? 40 : 60),textAlign: TextAlign.center,),
            const SizedBox(height: 20),
            Lottie.asset("assets/maintance.json",height: 200),
            const SizedBox(height: 10),
            Text("Do you need support?".tr, style: TextStyle(fontSize: 16, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700, color: greytext, letterSpacing: 0),),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
