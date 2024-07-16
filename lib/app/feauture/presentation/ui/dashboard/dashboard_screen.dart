import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:sitecycle/app/config/colors.dart';
import 'package:sitecycle/app/config/dark_ligthmode.dart';
import 'package:sitecycle/app/config/fontfamily_modal.dart';
import 'package:sitecycle/app/config/images.dart';
import 'package:sitecycle/app/config/list_modal.dart';
import 'package:sitecycle/app/feauture/presentation/ui/drawer/drawer_main.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late ColorNotifire notifire;
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of(context,listen: true);
    return LayoutBuilder(
      builder: (context, constraints) {
       return constraints.maxWidth < 900 ?
          Container(
            color: notifire.getBgColor,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  container1(constraints.maxWidth),
                  container2(constraints.maxWidth),
                  container4(constraints.maxWidth),
                  container3(constraints.maxWidth),
                ],
              ),
            ),
          )
        : constraints.maxWidth < 1000 ?
       Container(
            color: notifire.getBgColor,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex:  2,
                            child: container1(constraints.maxWidth)),
                        const SizedBox(width: 10),
                        Expanded(
                            flex: 1,
                            child: container2(constraints.maxWidth)),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 2,
                            child: container3(constraints.maxWidth)),
                        const SizedBox(width: 10),
                        Expanded(
                            flex: 1,
                            child: container4(constraints.maxWidth)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
           : Container(
            color: notifire.getBgColor,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(constraints.maxWidth < 1450 ? 14 : 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: constraints.maxWidth > 1850 ? 3 : 2,
                            child: container1(constraints.maxWidth)),
                        const SizedBox(width: 20),
                        Expanded(
                            flex: 1,
                            child: container2(constraints.maxWidth)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: constraints.maxWidth > 1850 ? 3 : 2,
                            child: container3(constraints.maxWidth)),
                        const SizedBox(width: 20),
                        Expanded(
                            flex: 1,
                            child: container4(constraints.maxWidth)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
      },
    );
  }

  Widget container1(constraints) {
    return constraints < 900 ? Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(15),
        image: const DecorationImage(image: AssetImage(Appcontent.bgDashboard),fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Dashboard Overview'.tr, style: const TextStyle(fontSize: 20,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
          Row(
            children: [
              Flexible(child: Text('Hello Michael'.tr, style: const TextStyle(fontSize: 32,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis,)),
              SvgPicture.asset(Appcontent.deshImoji,height: 60),
            ],
          ),
          const SizedBox(height: 50),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(image: AssetImage(Appcontent.bg1),fit: BoxFit.cover)
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: constraints < 1600 ? 30 : 40, right: constraints < 1600 ? 34 : 44, bottom: 35, top: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 44,
                              width: 44,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff403D3D),
                              ),
                              child: const Center(child: Text('\$',style: TextStyle(fontSize: 22,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('TOTAL SALES'.tr,style: TextStyle(fontSize: 13,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
                                  const Text('\$ 23.577.22',style: TextStyle(fontSize: 34,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
                                  Text('Per Day'.tr,style: TextStyle(fontSize: 13,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: Get.height / 80,
                      width: Get.width / 1.8,
                      decoration: const BoxDecoration(
                          color: Color(0xff626262),
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(image: AssetImage(Appcontent.bg1),fit: BoxFit.cover)
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: constraints < 1600 ? 30 : 40, right: constraints < 1600 ? 34 : 44, bottom: 35, top: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 44,
                              width: 44,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff403D3D),
                              ),
                              child: const Center(child: Icon(Icons.remove_red_eye,color: Colors.white)),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('TOTAL VISITER'.tr,style: TextStyle(fontSize: 13,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
                                  const Text('57.711',style: TextStyle(fontSize: 34,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
                                  Text('View/Per Day'.tr,style: TextStyle(fontSize: 13,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: Get.height / 80,
                      width: Get.width / 1.8,
                      decoration: const BoxDecoration(
                          color: Color(0xff626262),
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ): constraints < 1000 ? Column(
      children: [
        Container(
          height: 450,
          decoration: BoxDecoration(
            borderRadius:  BorderRadius.circular(15),
            image: const DecorationImage(image: AssetImage(Appcontent.bgDashboard),fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Dashboard Overview'.tr,style: const TextStyle(fontSize: 16,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                Row(
                  children: [
                    Text('Hello Michael'.tr,style: const TextStyle(fontSize: 41,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                    SvgPicture.asset(Appcontent.deshImoji,height: 60),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Container(
                            // height: Get.height * 0.2,
                            // width: Get.width * 0.22,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: const DecorationImage(image: AssetImage(Appcontent.bg1),fit: BoxFit.cover)
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: constraints < 1600 ? 30 : 40, right: constraints < 1600 ? 34 : 44, bottom: 35, top: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 44,
                                    width: 44,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff403D3D),
                                    ),
                                    child: const Center(child: Text('\$',style: TextStyle(fontSize: 22,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text('TOTAL SALES'.tr,style: TextStyle(fontSize: constraints < 1600 ? 16 : 18,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
                                        Text('\$ 23.577.22',style: TextStyle(fontSize: constraints < 1600 ? 30 : 48,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
                                        Text('Per Day'.tr,style: TextStyle(fontSize: constraints < 1600 ? 16 : 18,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: Get.height / 70,
                            width: Get.width / 6,
                            decoration: const BoxDecoration(
                                color: Color(0xff626262),
                                borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 30,),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Container(
                            // width: Get.width * 0.22,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: const DecorationImage(image: AssetImage(Appcontent.bg1),fit: BoxFit.cover)
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: constraints < 1600 ? 30 : 40, right: constraints < 1600 ? 34 : 44, bottom: 35, top: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 44,
                                    width: 44,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff403D3D),
                                    ),
                                    child: const Center(child: Icon(Icons.remove_red_eye,color: Colors.white)),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text('TOTAL VISITER'.tr,style: TextStyle(fontSize: constraints < 1600 ? 16 : 18,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
                                        Text('57.711',style: TextStyle(fontSize: constraints < 1600 ? 36 : 48,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
                                        Text('View/Per Day'.tr,style: TextStyle(fontSize: constraints < 1600 ? 16 : 18,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: Get.height / 70,
                            width: Get.width / 6,
                            decoration: const BoxDecoration(
                                color: Color(0xff626262),
                                borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ],
    ) : Container(
      height: 550,
      // width: Get.width * 0.55,
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(15),
        image: const DecorationImage(image: AssetImage(Appcontent.bgDashboard),fit: BoxFit.fill),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 75, left: 40,right: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Dashboard Overview'.tr,style: const TextStyle(height: 1,fontSize: 26,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
            const SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Hello Michael'.tr,style: const TextStyle(height: 1,fontSize: 55,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                const SizedBox(width: 10),
                SvgPicture.asset(Appcontent.deshImoji,height: 60),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Container(
                        // height: Get.height * 0.2,
                        // width: Get.width * 0.22,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(image: AssetImage(Appcontent.bg1),fit: BoxFit.cover)
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: constraints < 1600 ? 30 : 40, right: constraints < 1600 ? 34 : 44, bottom: 35, top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 44,
                                width: 44,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff403D3D),
                                ),
                                child: const Center(child: Text('\$',style: TextStyle(fontSize: 22,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('TOTAL SALES'.tr,style: TextStyle(fontSize: constraints < 1600 ? 16 : 18,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
                                    Text('\$ 23.577.22',style: TextStyle(fontSize: constraints < 1600 ? 36 : 48,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
                                    Text('Per Day'.tr,style: TextStyle(fontSize: constraints < 1600 ? 16 : 18,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: Get.height / 70,
                        width: Get.width / 6,
                        decoration: const BoxDecoration(
                          color: Color(0xff626262),
                          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 30,),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Container(
                        // width: Get.width * 0.22,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(image: AssetImage(Appcontent.bg1),fit: BoxFit.cover)
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: constraints < 1600 ? 30 : 40, right: constraints < 1600 ? 34 : 44, bottom: 35, top: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 44,
                                width: 44,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff403D3D),
                                ),
                                child: const Center(child: Icon(Icons.remove_red_eye,color: Colors.white)),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('TOTAL VISITER'.tr,style: TextStyle(fontSize: constraints < 1600 ? 16 : 18,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
                                    Text('57.711',style: TextStyle(fontSize: constraints < 1600 ? 36 : 48,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
                                    Text('View/Per Day'.tr,style: TextStyle(fontSize: constraints < 1600 ? 16 : 18,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),textAlign: TextAlign.end,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: Get.height / 70,
                        width: Get.width / 6,
                        decoration: const BoxDecoration(
                            color: Color(0xff626262),
                            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget container2(constraints) {
    return constraints < 900 ? Container(
      height: 600,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(15),
        image: const DecorationImage(image: AssetImage(Appcontent.bgMarket),fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.centerRight,
              child: PopupMenuButton(
                tooltip: '',
                padding: const EdgeInsets.all(0),
                offset: const Offset(35, 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                // initialValue: selectedMenu,
                constraints: const BoxConstraints(
                  maxWidth: 100,
                  maxHeight: 350,
                ),
                color: notifire.getContentColor,
                child:  Icon(Icons.more_horiz, color: greyScale),
                itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<SampleItem2>>[
                  PopupMenuItem<SampleItem2>(
                    enabled: true,
                    value: SampleItem2.itemOne,
                    onTap: () {},
                    child: SizedBox(
                      width: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                        scrollDirection: Axis.vertical,
                        itemCount: modal().tooltip.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(modal().tooltip[index].toString().tr, style: TextStyle(fontSize: 14, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700, color: notifire.getContainer),),
                          );
                        },),
                    ),
                  ),
                ],
              ),
             ),
          Text('Marketing Goal'.tr,style: const TextStyle(fontSize: 26,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: CircularPercentIndicator(
              radius: 120,
              lineWidth: 40,
              animation: true,
              percent: 0.7,
              center: const Text("75%", style: TextStyle(fontSize: 54,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              progressColor: Colors.white,
              backgroundColor: const Color(0xff4F4F4F),
            ),
          ),
          const Text("\$103.577", style: TextStyle(fontSize: 32,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
          const SizedBox(height: 10),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "You reached".tr,
                  style: const TextStyle(fontSize: 15,color: Colors.white,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),
                  children: [
                    TextSpan(
                        text: " \$ 103.577 ",
                        style: const TextStyle(fontSize: 15,color: Colors.white,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),
                        children: [
                          TextSpan(
                              text: "from".tr,
                              style: const TextStyle(fontSize: 15,color: Colors.white,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),
                              children: const [
                                TextSpan(
                                  text: " \$150.000",
                                  style: TextStyle(fontSize: 15,color: Colors.white,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),
                                )
                              ]
                          )
                        ]
                    )
                  ]
              )),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              fixedSize: const Size(185, 46),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            ),
            onPressed: () {},
            child: const Text('Show All Sales',style: TextStyle(fontSize: 15,color: Colors.black,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
          ),
          const Spacer(),
        ],
      ),
    ) : constraints < 1000 ? Container(
      height: 450,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(15),
        image: const DecorationImage(image: AssetImage(Appcontent.bgMarket),fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.centerRight,
              child: PopupMenuButton(
                tooltip: '',
                padding: const EdgeInsets.all(0),
                offset: const Offset(35, 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                // initialValue: selectedMenu,
                constraints: const BoxConstraints(
                  maxWidth: 100,
                  maxHeight: 350,
                ),
                color: notifire.getContentColor,
                child:  Icon(Icons.more_horiz, color: greyScale),
                itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<SampleItem2>>[
                  PopupMenuItem<SampleItem2>(
                    enabled: true,
                    value: SampleItem2.itemOne,
                    onTap: () {},
                    child: SizedBox(
                      width: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                        scrollDirection: Axis.vertical,
                        itemCount: modal().tooltip.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(modal().tooltip[index].toString().tr, style: TextStyle(fontSize: 14, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700, color: notifire.getContainer),),
                          );
                        },),
                    ),
                  ),
                ],
              )),
          Text('Marketing Goal'.tr,style: const TextStyle( height: 1,fontSize: 26,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),textAlign: TextAlign.center,),
          const SizedBox(height: 20),
          CircularPercentIndicator(
            radius: 90,
            lineWidth: 30,
            animation: true,
            percent: 0.7,
            center: const Text("75%", style: TextStyle(fontSize: 38,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
            progressColor: Colors.white,
            backgroundColor: const Color(0xff4F4F4F),
          ),
          const SizedBox(height: 12),
          const Text("\$103.577", style: TextStyle(fontSize: 32,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
          const SizedBox(height: 10),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: "You reached".tr,
                  style: const TextStyle(height: 1,fontSize: 15,color: Colors.white,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),
                  children: [
                    TextSpan(
                        text: " \$ 103.577 ",
                        style: const TextStyle(height: 1,fontSize: 15,color: Colors.white,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),
                        children: [
                          TextSpan(
                              text: "from".tr,
                              style: const TextStyle(height: 1, fontSize: 15,color: Colors.white,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),
                              children: const [
                                TextSpan(
                                  text: " \$150.000",
                                  style: TextStyle(height: 1,fontSize: 15,color: Colors.white,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),
                                )
                              ]
                          )
                        ]
                    )
                  ]
              )),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              // fixedSize:  Size(constraints / 10, 46),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12, left: 35, right: 35),
              child: Text('Show All Sales'.tr,style: const TextStyle(fontSize: 15,color: Colors.black,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
            ),
          ),
        ],
      ),
    ) :  Container(
      height: 550,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(15),
        image: const DecorationImage(image: AssetImage(Appcontent.bgMarket),fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
              alignment: Alignment.centerRight,
              child: PopupMenuButton(
                tooltip: '',
                padding: const EdgeInsets.all(0),
                offset: const Offset(10, 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                // initialValue: selectedMenu,
                constraints: const BoxConstraints(
                  maxWidth: 100,
                  maxHeight: 350,
                ),
                color: notifire.getContentColor,
                child:  Icon(Icons.more_horiz, color: greyScale),
                itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<SampleItem2>>[
                  PopupMenuItem<SampleItem2>(
                    enabled: true,
                    value: SampleItem2.itemOne,
                    onTap: () {},
                    child: SizedBox(
                      width: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                        scrollDirection: Axis.vertical,
                        itemCount: modal().tooltip.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(modal().tooltip[index].toString().tr, style: TextStyle(fontSize: 14, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700, color: notifire.getContainer),),
                          );
                      },),
                    ),
                  ),
                ],
              )),
          Text('Marketing Goal'.tr,style: const TextStyle(height: 1,fontSize: 26,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
          const SizedBox(height: 30),
          CircularPercentIndicator(
            radius: 120,
            lineWidth: 40,
            animation: true,
            percent: 0.7,
            center: const Text("75%", style: TextStyle(fontSize: 58,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
            progressColor: Colors.white,
            backgroundColor: const Color(0xff4F4F4F),
          ),
          const SizedBox(height: 18),
          const Text("\$103.577", style: TextStyle(fontSize: 32,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
          const SizedBox(height: 16),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
            text: "You reached".tr,
            style: const TextStyle(fontSize: 15,color: Colors.white,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),
            children: [
              TextSpan(
                text: " \$ 103.577 ",
                  style: const TextStyle(fontSize: 15,color: Colors.white,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),
                children: [
                  TextSpan(
                    text: "from".tr,
                    style: const TextStyle(fontSize: 15,color: Colors.white,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),
                    children: const [
                      TextSpan(
                        text: " \$150.000",
                        style: TextStyle(fontSize: 15,color: Colors.white,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),
                      )
                    ]
                  )
                ]
              )
            ]
          )),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              // fixedSize:  Size(constraints / 10, 46),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12, left: 35, right: 35),
              child: Text('Show All Sales'.tr,style: const TextStyle(fontSize: 15,color: Colors.black,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
            ),
          ),
        ],
      ),
    );
  }

  Widget container3(constraints) {
    return constraints < 900 ? Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(15),
        color: notifire.getContentColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Latest Transaction'.tr,style: TextStyle(fontSize: 18,color: notifire.getContainer, fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              PopupMenuButton(
                tooltip: '',
                padding: const EdgeInsets.all(0),
                offset: const Offset(35, 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                // initialValue: selectedMenu,
                constraints: const BoxConstraints(
                  maxWidth: 100,
                  maxHeight: 350,
                ),
                color: notifire.getContentColor,
                child:  Icon(Icons.more_horiz, color: greyScale),
                itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<SampleItem2>>[
                  PopupMenuItem<SampleItem2>(
                    enabled: true,
                    value: SampleItem2.itemOne,
                    onTap: () {},
                    child: SizedBox(
                      width: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                        scrollDirection: Axis.vertical,
                        itemCount: modal().tooltip.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(modal().tooltip[index].toString().tr, style: TextStyle(fontSize: 14, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700, color: notifire.getContainer),),
                          );
                        },),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: constraints < 1400 ? 800 : Get.width,
              child: latestTable(),
            ),
          ),
        ],
      ),
    ) : constraints < 1000 ? Container(
      padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 18),
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(15),
        color: notifire.getContentColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Latest Transaction'.tr,style: TextStyle(fontSize: 18,color: notifire.getContainer, fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              PopupMenuButton(
                tooltip: '',
                padding: const EdgeInsets.all(0),
                offset: const Offset(35, 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                // initialValue: selectedMenu,
                constraints: const BoxConstraints(
                  maxWidth: 100,
                  maxHeight: 350,
                ),
                color: notifire.getContentColor,
                child:  Icon(Icons.more_horiz, color: greyScale),
                itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<SampleItem2>>[
                  PopupMenuItem<SampleItem2>(
                    enabled: true,
                    value: SampleItem2.itemOne,
                    onTap: () {},
                    child: SizedBox(
                      width: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                        scrollDirection: Axis.vertical,
                        itemCount: modal().tooltip.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(modal().tooltip[index].toString().tr, style: TextStyle(fontSize: 14, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700, color: notifire.getContainer),),
                          );
                        },),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: constraints < 1665 ? 1000 : constraints < 1400 ? 1500 : 1000,
              child: latestTable(),
            ),
          ),
        ],
      ),
    ) : Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(15),
        color: notifire.getContentColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Latest Transaction'.tr,style: TextStyle(fontSize: 18,color: notifire.getContainer, fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              PopupMenuButton(
                tooltip: '',
                padding: const EdgeInsets.all(0),
                offset: const Offset(35, 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                // initialValue: selectedMenu,
                constraints: const BoxConstraints(
                  maxWidth: 100,
                  maxHeight: 350,
                ),
                color: notifire.getContentColor,
                child:  Icon(Icons.more_horiz, color: greyScale),
                itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<SampleItem2>>[
                  PopupMenuItem<SampleItem2>(
                    enabled: true,
                    value: SampleItem2.itemOne,
                    onTap: () {},
                    child: SizedBox(
                      width: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                        scrollDirection: Axis.vertical,
                        itemCount: modal().tooltip.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(modal().tooltip[index].toString().tr, style: TextStyle(fontSize: 14, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700, color: notifire.getContainer),),
                          );
                        },),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: constraints < 1665 ? 1000 : constraints < 1400 ? 1500 : 1000,
              child: latestTable(),
            ),
          ),
        ],
      ),
    );
  }

  Widget container4(constraints) {
    return constraints < 900 ? Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(15),
        color: notifire.getContentColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Sales History'.tr,style: TextStyle(fontSize: 18,color: notifire.getContainer, fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              PopupMenuButton(
                tooltip: '',
                padding: const EdgeInsets.all(0),
                offset: const Offset(35, 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                // initialValue: selectedMenu,
                constraints: const BoxConstraints(
                  maxWidth: 100,
                  maxHeight: 350,
                ),
                color: notifire.getContentColor,
                child:  Icon(Icons.more_horiz, color: greyScale),
                itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<SampleItem2>>[
                  PopupMenuItem<SampleItem2>(
                    enabled: true,
                    value: SampleItem2.itemOne,
                    onTap: () {},
                    child: SizedBox(
                      width: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                        scrollDirection: Axis.vertical,
                        itemCount: modal().tooltip.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(modal().tooltip[index].toString().tr, style: TextStyle(fontSize: 14, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700, color: notifire.getContainer),),
                          );
                        },),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          ListView.builder(
            itemCount: modal().sTitle.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        image: DecorationImage(image: AssetImage(modal().sImg[index]),fit: BoxFit.cover)
                    ),
                  ),
                  const SizedBox(width: 13),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(modal().sTitle[index],style:  TextStyle(fontSize: 18,color: notifire.getContainer, fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                      Text(modal().subTitle[index],style: TextStyle(fontSize: 15,color: greyScale, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: greenlight,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(child: Text('+\$1100',style: TextStyle(fontSize: 14,color: greentext, fontFamily: FontFamily.qBold, fontWeight: FontWeight.w600))),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    ) : constraints < 1000 ? Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(15),
        color: notifire.getContentColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Sales History'.tr,style: TextStyle(fontSize: 18,color: notifire.getContainer, fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              PopupMenuButton(
                tooltip: '',
                padding: const EdgeInsets.all(0),
                offset: const Offset(35, 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                // initialValue: selectedMenu,
                constraints: const BoxConstraints(
                  maxWidth: 100,
                  maxHeight: 350,
                ),
                color: notifire.getContentColor,
                child:  Icon(Icons.more_horiz, color: greyScale),
                itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<SampleItem2>>[
                  PopupMenuItem<SampleItem2>(
                    enabled: true,
                    value: SampleItem2.itemOne,
                    onTap: () {},
                    child: SizedBox(
                      width: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                        scrollDirection: Axis.vertical,
                        itemCount: modal().tooltip.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(modal().tooltip[index].toString().tr, style: TextStyle(fontSize: 14, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700, color: notifire.getContainer),),
                          );
                        },),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          ListView.builder(
            itemCount: modal().sTitle.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(17),
                      child: Image.asset(modal().sImg[index],height: constraints / 19, width: constraints / 19,fit: BoxFit.fill),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(modal().sTitle[index],style:  TextStyle(fontSize: constraints / 55,color: notifire.getContainer, fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                        Text(modal().subTitle[index],style: TextStyle(fontSize: constraints / 70,color: greyScale, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: greenlight,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Center(child: Text('+\$1100',style: TextStyle(fontSize: 14,color: greentext, fontFamily: FontFamily.qBold, fontWeight: FontWeight.w600))),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    ) : Container(

      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(15),
        color: notifire.getContentColor,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Sales History'.tr,style: TextStyle(fontSize: 18,color: notifire.getContainer, fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              PopupMenuButton(
                tooltip: '',
                padding: const EdgeInsets.all(0),
                offset: const Offset(35, 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                // initialValue: selectedMenu,
                constraints: const BoxConstraints(
                  maxWidth: 100,
                  maxHeight: 350,
                ),
                color: notifire.getContentColor,
                child:  Icon(Icons.more_horiz, color: greyScale),
                itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<SampleItem2>>[
                  PopupMenuItem<SampleItem2>(
                    enabled: true,
                    value: SampleItem2.itemOne,
                    onTap: () {},
                    child: SizedBox(
                      width: 200,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                        scrollDirection: Axis.vertical,
                        itemCount: modal().tooltip.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(modal().tooltip[index].toString().tr, style: TextStyle(fontSize: 14, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700, color: notifire.getContainer),),
                          );
                        },),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          ListView.builder(
            itemCount: modal().sTitle.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Container(
                    height: 51,
                    width: 51,
                    margin: const EdgeInsets.all(9),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        image: DecorationImage(image: AssetImage(modal().sImg[index]),fit: BoxFit.cover)
                    ),
                  ),
                  const SizedBox(width: 13),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(modal().sTitle[index],style:  TextStyle(fontSize: 18,color: notifire.getContainer, fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                      Text(modal().subTitle[index],style: TextStyle(fontSize: 15,color: greyScale, fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: greenlight,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(child: Text('+\$1100',style: TextStyle(fontSize: 14,color: greentext, fontFamily: FontFamily.qBold, fontWeight: FontWeight.w600))),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
  bool isActive = false;
  bool isActive2 = false;
  bool isActive3 = false;
  bool isActive4 = false;
  bool isActive5 = false;
  bool isActive6 = false;
  bool isActive7 = false;

  Table latestTable() {
    return Table(
      columnWidths: const <int, TableColumnWidth>{
        0: FixedColumnWidth(50),
        1: FixedColumnWidth(150),
        2: FixedColumnWidth(170),
        3: FixedColumnWidth(140),
        4: FixedColumnWidth(80),
        5: FixedColumnWidth(70),
        6: FixedColumnWidth(70),
        // 6: FixedColumnWidth(64),
      },
      children: [
        TableRow(
          children: [
            Transform.translate(
              offset: const Offset(0, -5),
              child: Checkbox(
                  side: BorderSide(color: greyScale),
                  activeColor: const Color(0xff595FE5),
                  shape: RoundedRectangleBorder(
                    side:  BorderSide(color: grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  value: isActive,
                  onChanged: (val) {
                    setState(() {
                      isActive = val!;
                      isActive2 = val;
                      isActive3 = val;
                      isActive4 = val;
                      isActive5 = val;
                      isActive6 = val;
                      isActive7 = val;
                    });
                  }),
            ),
            Text('Invoice No.'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
            Text('Product Name'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
            Text('Date'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
            Text('Price'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
            Text('Status'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
            Text('Option'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
          ],
        ),
        dividerTable(),
        TableRow(
          children: [
            Checkbox(
                side: BorderSide(color: greyScale),
                activeColor: const Color(0xff595FE5),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(5),
                ),
                value: isActive2,
                onChanged: (val) {
                  setState(() {
                    isActive2 = val!;
                  });
                }),
            Text('#INV/21/22/AA', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Text('Macbook Pro+', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Text('12/01/2023', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            const Text('+\$1100', style: TextStyle(fontSize: 15, color: Colors.green, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Container(
              height: 30,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: greenlight,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(child: Text('Completed'.tr, style: TextStyle(fontSize: 11, color: greentext, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600))),
            ),
            button(),
          ],
        ),
        dividerTable(),
        TableRow(
          children: [
            Checkbox(
                side: BorderSide(color: greyScale),
                activeColor: const Color(0xff595FE5),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(5),
                ),
                value: isActive3,
                onChanged: (val) {
                  setState(() {
                    isActive3 = val!;
                  });
                }),
            Text('#INV/21/22/AA', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Text('Iphone 15 pro', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Text('12/01/2023', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            const Text('-\$1100', style: TextStyle(fontSize: 15, color: Colors.red, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Container(
              height: 30,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: redlight,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(child: Text('Fail'.tr, style: TextStyle(fontSize: 11, color: redtext, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600))),
            ),
            button(),
          ],
        ),
        dividerTable(),
        TableRow(
          children: [
            Checkbox(
                side: BorderSide(color: greyScale),
                activeColor: const Color(0xff595FE5),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(5),
                ),
                value: isActive4,
                onChanged: (val) {
                  setState(() {
                    isActive4 = val!;
                  });
                }),
            Text('#INV/21/22/AA', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Text('Google Pixel', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Text('12/01/2023', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            const Text('+\$1245', style: TextStyle(fontSize: 15, color: Colors.green, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Container(
              height: 30,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: greenlight,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(child: Text('Completed'.tr, style: TextStyle(fontSize: 11, color: greentext, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600))),
            ),
            button(),
          ],
        ),
        dividerTable(),
        TableRow(
          children: [
            Checkbox(
                side: BorderSide(color: greyScale),
                activeColor: const Color(0xff595FE5),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(5),
                ),
                value: isActive5,
                onChanged: (val) {
                  setState(() {
                    isActive5 = val!;
                  });
                }),
            Text('#INV/21/22/AA', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Text('Samsung Galaxy s20+', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Text('12/01/2023', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            const Text('+\$1100', style: TextStyle(fontSize: 15, color: Colors.green, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Container(
              height: 30,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: yellowlight,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(child: Text('Hold'.tr, style: TextStyle(fontSize: 11, color: yellowtext, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600))),
            ),
            button(),
          ],
        ),
        dividerTable(),
        TableRow(
          children: [
            Checkbox(
                side: BorderSide(color: greyScale),
                activeColor: const Color(0xff595FE5),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(5),
                ),
                value: isActive6,
                onChanged: (val) {
                  setState(() {
                    isActive6 = val!;
                  });
                }),
            Text('#INV/21/22/AA', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Text('Lenovo reno', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Text('12/01/2023', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            const Text('+\$200', style: TextStyle(fontSize: 15, color: Colors.green, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Container(
              height: 30,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: greenlight,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(child: Text('Completed'.tr, style: TextStyle(fontSize: 11, color: greentext, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600))),
            ),
            button(),
          ],
        ),
        dividerTable(),
        TableRow(
          children: [
            Checkbox(
                side: BorderSide(color: greyScale),
                activeColor: const Color(0xff595FE5),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(5),
                ),
                value: isActive7,
                onChanged: (val) {
                  setState(() {
                    isActive7 = val!;
                  });
                }),
            Text('#INV/21/22/AA', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Text('Micro-max note3', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Text('12/01/2023', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            const Text('+\$2000', style: TextStyle(fontSize: 15, color: Colors.green, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Container(
              height: 30,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: greenlight,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(child: Text('Completed'.tr, style: TextStyle(fontSize: 11, color: greentext, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600))),
            ),
            button(),
          ],
        ),
      ],
    );
  }
}
Widget button(){
  return InkWell(
    onTap: () {},
    child: Container(
      height: 30,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(child: Text('Detail'.tr, style: const TextStyle(fontSize: 11, color: Colors.white, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600))),
    ),
  );
}

TableRow dividerTable(){
  return TableRow(
    children: [
      Divider(height: 20,color: greyBorder,thickness: 1),
      Divider(height: 20,color: greyBorder,thickness: 1),
      Divider(height: 20,color: greyBorder,thickness: 1),
      Divider(height: 20,color: greyBorder,thickness: 1),
      Divider(height: 20,color: greyBorder,thickness: 1),
      Divider(height: 20,color: greyBorder,thickness: 1),
      Divider(height: 20,color: greyBorder,thickness: 1),
    ],
  );
}