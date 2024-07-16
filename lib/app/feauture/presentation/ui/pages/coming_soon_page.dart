import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sitecycle/app/config/colors.dart';
import 'package:sitecycle/app/config/dark_ligthmode.dart';
import 'package:sitecycle/app/config/fontfamily_modal.dart';
import 'package:sitecycle/app/config/images.dart';
import 'package:sitecycle/app/feauture/presentation/ui/mq.dart';
import 'package:slide_countdown/slide_countdown.dart';


class ComingsoonPage extends StatefulWidget {
  const ComingsoonPage({super.key});

  @override
  State<ComingsoonPage> createState() => _ComingsoonPageState();
}

class _ComingsoonPageState extends State<ComingsoonPage> {

  late ColorNotifire notifire;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of(context, listen: true);
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: comingsoon(constraints),
      );
    },);
  }
  Widget comingsoon(constraints){
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
          Text("Coming Soon".tr, style: TextStyle(color: notifire.getContainer, fontFamily: FontFamily.qBold, fontSize: constraints.maxWidth < 580 ? 40 : 60),),
          const SizedBox(height: 30),
          Lottie.asset("assets/Comingsoon.json",height: 200),
          const SizedBox(height: 10),
          SlideCountdown(
            // padding: const EdgeInsets.only(left: 40,right: 40),
            separatorStyle: TextStyle(fontSize: 50, fontFamily: FontFamily.qBold,color: greytext),
            separatorPadding: EdgeInsets.all(constraints.maxWidth < 580 ? constraints.maxWidth / 10 : 40),
            duration: const Duration(days: 1),
            decoration: BoxDecoration(
                color: notifire.getContentColor,
                borderRadius: BorderRadius.circular(20)
            ),
            style: TextStyle(
              fontFamily: FontFamily.qBold,
              color: notifire.getContainer,
              fontSize: constraints.maxWidth < 580 ? constraints.maxWidth / 12 : 60,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: constraints.maxWidth < 580 ? constraints.maxWidth / 1.5 : 500,
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: rtl ? 0 : 25, left: rtl ? 25 :0, top: 2, bottom: 2),
                  child: SvgPicture.asset(Appcontent.shareIcon, height: 24,),
                ),
                fillColor: greyBorder,
                contentPadding: EdgeInsets.only(top: 25, bottom: 25, left: rtl ? 0 : 20, right: rtl ? 20 : 0),
                filled: true,
                hintStyle: TextStyle(color: greytext, fontFamily: FontFamily.qRegular, fontSize: 15, letterSpacing: 0.8, fontWeight: FontWeight.w700),
                hintText: "Enter your email for subcribe.".tr,
                enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.transparent),borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.transparent), borderRadius: BorderRadius.circular(12)),
              ),
            ),
          )
        ],
      ),
    );
  }
}


// ignore_for_file: camel_case_types
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:slide_countdown/slide_countdown.dart';
//
// import '../config/dark_lightmode.dart';
//
//
// class Comming_soon extends StatefulWidget {
//   const Comming_soon({super.key});
//
//   @override
//   State<Comming_soon> createState() => _Comming_soonState();
// }
//
// class _Comming_soonState extends State<Comming_soon> {
//   late ColorNotifire notifire;
//   @override
//   Widget build(BuildContext context) {
//     notifire = Provider.of<ColorNotifire>(context, listen: true);
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       color: notifire.getContentColor,
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           if (constraints.maxWidth < 600) {
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 mainrow(),
//                 const Spacer(),
//                 timr(constraints.maxWidth),
//                 const Spacer(),
//               ],
//             );
//           } else if (constraints.maxWidth < 1000) {
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   children: [
//                     Expanded(child: mainrow()),
//                   ],
//                 ),
//                 const Spacer(),
//                 timr(constraints.maxWidth),
//                 const Spacer(),
//               ],
//             );
//           } else {
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   children: [
//                     Expanded(child: mainrow()),
//                   ],
//                 ),
//                 const Spacer(),
//                 timr(constraints.maxWidth),
//                 const Spacer(),
//               ],
//             );
//           }
//         },
//       ),
//     );
//   }
//
//
//   Widget mainrow(){
//     return Row(
//       children:  [
//         Expanded(
//           child: SizedBox(
//             // color: Colors.red,
//             height: 50,
//             child: ListTile(
//               leading: Padding(
//                 padding: const EdgeInsets.only(top: 20),
//                 child: Text('Comming Soon',style: TextStyle(fontFamily: 'Jost-SemiBold',fontSize: 20,color: notifire.getContainer,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis),
//               ),
//               trailing:  Padding(
//                 padding: const EdgeInsets.only(top: 20,left: 0),
//                 child: SizedBox(
//                   height: 60,
//                   width: 150,
//                   child: Row(
//                     children: [
//                       const SizedBox(width: 0,),
//                       Image(image: const AssetImage('assets/hourglass.png'),color: notifire.getContainer),
//                       // SizedBox(width: 10,),
//                       // Text('Components',style: TextStyle(color: notifire.getContainer,fontSize: 15),overflow: TextOverflow.ellipsis),
//                       const SizedBox(width: 0,),
//                       Text('Comming Soon',style: TextStyle(color: notifire.getContainer,fontSize: 15),overflow: TextOverflow.ellipsis),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget timr(double size){
//     return Padding(
//       padding: const EdgeInsets.only(left: 10,right: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text('WE ARE COMING SOON',style: TextStyle(color: notifire.getContainer,fontSize: 30,),),
//           const SizedBox(height: 20,),
//
//           const SizedBox(height: 20,),
//           Text('Lorem ipsum dolor sit amet consectetur adipisicing elit. Nostrum reiciendis cupiditate ',style: TextStyle(color: notifire.getContainer,fontSize: 10),),
//           Text('repellendus odit quas enim? Eius error eos veritatis magni quia eum repellat vitae nul',style: TextStyle(color: notifire.getContainer,fontSize: 10),),
//           Text('iosam esse praesentium dolore commodi cupiditate exercitationem ',style: TextStyle(color: notifire.getContainer,fontSize: 10),),
//         ],
//       ),
//     );
//   }
//
// }
