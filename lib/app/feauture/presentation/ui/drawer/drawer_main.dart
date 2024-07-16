// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sitecycle/app/config/colors.dart';
import 'package:sitecycle/app/config/controller/index_controller.dart';
import 'package:sitecycle/app/config/dark_ligthmode.dart';
import 'package:sitecycle/app/config/fontfamily_modal.dart';
import 'package:sitecycle/app/config/images.dart';
import 'package:sitecycle/app/config/list_modal.dart';
import 'package:sitecycle/app/feauture/presentation/ui/login/login_screen.dart';
import 'package:sitecycle/app/feauture/presentation/ui/pages/two_step_verification_screen.dart';
import 'package:sitecycle/app/feauture/presentation/ui/sign_up/sign_up_screen.dart';
import 'package:sitecycle/app/feauture/presentation/ui/widgets/phone_verification.dart';

import '../mq.dart';

enum SampleItem2 { itemOne, itemTwo, itemThree, itemfour }

enum SampleItem {
  itemOne,
  itemTwo,
  itemThree,
  itemfour,
  itemfive,
  itemsix,
  itemsevan,
  itemeight
}

class DrawerMain extends StatefulWidget {
  const DrawerMain({super.key});

  @override
  State<DrawerMain> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerMain> {
  SampleItem? selectedMenu;
  IndexController inboxController = Get.put(IndexController());
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

  @override
  void initState() {
    super.initState();
    fun();
    getdarkmodepreviousstate();
    if (selectedpage == 6 && selectedpage == 7 && selectedpage == 8) {
      inboxController.setTextIsTrue(32);
    }
  }

  bool tap = false;

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  updateLanguage(Locale locale) {
    setState(() {
      Get.updateLocale(locale);
    });
  }

  fun() async {
    for (int a = 0; a < locale.length; a++) {
      if (locale[a]["locale"].toString().compareTo(Get.locale.toString()) ==
          0) {
        setState(() {
          selectedlang = a;
        });
      } else {}
    }
  }

  final List locale = [
    {'name': 'English', 'locale': const Locale('en', 'US')},
    {'name': 'Spanish', 'locale': const Locale('sp', 'SPANISH')},
    {'name': 'Arabic', 'locale': const Locale('ar', 'ARABIC')},
    {'name': 'Hindi', 'locale': const Locale('hi', 'HINDI')},
    {'name': 'Gujarati', 'locale': const Locale('gu', 'GUJARATI')},
    {'name': 'Afrikaan', 'locale': const Locale('af', 'AFRIKAAN')},
    {'name': 'Bengali', 'locale': const Locale('be', 'BENGALI')},
    {'name': 'Indonesian', 'locale': const Locale('id', 'INDONESIAN')},
  ];

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return GetBuilder<IndexController>(builder: (inboxController) {
      return LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 800) {
            return Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: notifire.getBgColor,
              key: _key,
              drawer: constraints.maxWidth < 800
                  ? drawer(constraints.maxWidth, context)
                  : const SizedBox(),
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: notifire.getBgColor,
                elevation: 0,
                iconTheme: IconThemeData(color: notifire.getContainer),
                title: InkWell(
                    onTap: () {
                      _key.currentState!.openDrawer();
                    },
                    child: SvgPicture.asset(
                      Appcontent.drawerIcon,
                      height: 26,
                      colorFilter: ColorFilter.mode(
                          notifire.getContainer, BlendMode.srcIn),
                    )),
                actions: [
                  constraints.maxWidth < 800
                      ? PopupMenuButton(
                          color: notifire.getBgColor,
                          tooltip: '',
                          constraints: BoxConstraints(
                              maxWidth: Get.width, minWidth: Get.width),
                          offset: const Offset(0, 50),
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                color: notifire.getContentColor,
                                borderRadius: BorderRadius.circular(15)),
                            child: Image.asset(Appcontent.search,
                                scale: 3, color: notifire.getContainer),
                          ),
                          itemBuilder: (context) {
                            return [
                              PopupMenuItem(
                                child: Container(
                                  width: 510,
                                  // height: 30,
                                  decoration: BoxDecoration(
                                    color: notifire.getBgColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextField(
                                    style:
                                        TextStyle(color: notifire.getContainer),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(
                                          left: 10, top: 0),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: notifire.getContentColor)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: notifire.getContentColor),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      hintText: 'Search'.tr,
                                      hintStyle: TextStyle(
                                          color: notifire.getContainer),
                                    ),
                                  ),
                                ),
                              ),
                            ];
                          },
                        )
                      : InkWell(
                          onTap: () {
                            setState(() {
                              tap = !tap;
                            });
                          },
                          child: Image(
                              image: const AssetImage(Appcontent.search),
                              height: 25,
                              width: 30,
                              color: notifire.getContainer)),
                  const SizedBox(width: 12),
                  const SizedBox(
                    width: 6,
                  ),
                  message(constraints.maxWidth),
                  bellMenu(constraints.maxWidth),
                  profile(constraints.maxWidth),
                  const SizedBox(width: 14),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    inboxController.page12[inboxController.selectPage],
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
              backgroundColor: notifire.getBgColor,
              body: Row(
                children: [
                  constraints.maxWidth < 800
                      ? const SizedBox()
                      : drawer(constraints.maxWidth, context),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 15),
                        appbar(constraints.maxWidth),
                        Expanded(
                          child: SingleChildScrollView(
                            child: inboxController
                                .page12[inboxController.selectPage],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      );
    });
  }

  Widget drawer(constraints, context) {
    return GetBuilder<IndexController>(
      builder: (inboxController) {
        return constraints < 600
            ? openDrawer(constraints, context)
            : Container(
                color: notifire.getBgColor,
                padding: EdgeInsets.only(
                    left: rtl
                        ? 0
                        : constraints < 1300
                            ? 10
                            : 20,
                    right: rtl ? 20 : 0,
                    top: 20,
                    bottom: 20),
                child: openDrawer(constraints, context),
              );
      },
    );
  }

  bool dashboard = true;
  bool tables = false;
  bool account = false;
  bool ecommerce = false;
  bool profileexpan = false;
  bool pages = false;

  int? selectedpage;

  Widget openDrawer(constraints, context) {
    return Drawer(
      width: constraints < 600
          ? 270
          : constraints < 1300
              ? 250
              : 275,
      backgroundColor: notifire.getContentColor,
      elevation: 0,
      shape: constraints < 600
          ? const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20)))
          : const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(constraints < 1300 ? 8 : 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: kIsWeb ? 0 : 40),
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 42,
                        width: 42,
                        child: Image.asset(
                          Appcontent.miracleLogo,
                          color: notifire.getContainer,
                        )),
                    const SizedBox(width: 15),
                    Text('Miracle',
                        style: TextStyle(
                            color: notifire.getContainer,
                            fontSize: 33,
                            fontWeight: FontWeight.w700,
                            fontFamily: FontFamily.qBold)),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              //! ----------------- Administrator ---------------------

              Padding(
                padding:
                    EdgeInsets.only(left: rtl ? 0 : 17, right: rtl ? 17 : 0),
                child: Text('Administrator'.tr,
                    style: const TextStyle(
                        color: Color(0xffA6A6A6),
                        fontSize: 14,
                        fontFamily: FontFamily.qBold,
                        fontWeight: FontWeight.w700)),
              ),
              ExpansionTile(
                initiallyExpanded: dashboard,
                trailing: Icon(Icons.keyboard_arrow_down,
                    color: inboxController.selectPage == 1
                        ? notifire.getContainer
                        : greyScale),
                onExpansionChanged: (value) {
                  inboxController.setTextIsTrue(1);
                  setState(() {
                    if (dashboard == false) {
                      dashboard = true;
                    } else {
                      dashboard = false;
                    }
                    selectedpage = null;
                  });
                  constraints < 600 ? Get.back() : const SizedBox();
                },
                leading: SvgPicture.asset(
                  Appcontent.dashboard,
                  height: 20,
                  color: inboxController.selectPage == 1
                      ? notifire.getContainer
                      : greyScale,
                ),
                title: Transform.translate(
                    offset: Offset(rtl ? 20 : -20, 0),
                    child: Text('Dashboard'.tr,
                        style: TextStyle(
                            color: inboxController.selectPage == 1
                                ? notifire.getContainer
                                : greyScale,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: FontFamily.qBold))),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        onTap: () {},
                        title: InkWell(
                          onTap: () {
                            inboxController.setTextIsTrue(1);
                            setState(() {
                              selectedpage = null;
                            });
                            constraints < 600 ? Get.back() : const SizedBox();
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: rtl ? 0 : 30, right: rtl ? 30 : 0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text('Dashboard V1'.tr,
                                      style: TextStyle(
                                          color: inboxController.selectPage == 1
                                              ? notifire.getContainer
                                              : greyScale,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: FontFamily.qBold)),
                                ],
                              )),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        title: InkWell(
                          onTap: () {
                            inboxController.setTextIsTrue(2);
                            setState(() {
                              selectedpage = null;
                            });
                            constraints < 600 ? Get.back() : const SizedBox();
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: rtl ? 0 : 30, right: rtl ? 30 : 0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text('Dashboard V2'.tr,
                                      style: TextStyle(
                                          color: inboxController.selectPage == 2
                                              ? notifire.getContainer
                                              : greyScale,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: FontFamily.qBold)),
                                ],
                              )),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        title: InkWell(
                          onTap: () {
                            inboxController.setTextIsTrue(3);
                            setState(() {
                              selectedpage = null;
                            });
                            constraints < 600 ? Get.back() : const SizedBox();
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: rtl ? 0 : 30, right: rtl ? 30 : 0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text('NFT Dashboard V1'.tr,
                                      style: TextStyle(
                                          color: inboxController.selectPage == 3
                                              ? notifire.getContainer
                                              : greyScale,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: FontFamily.qBold)),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              ExpansionTile(
                trailing: Icon(Icons.keyboard_arrow_down,
                    color: inboxController.selectPage == 4
                        ? notifire.getContainer
                        : greyScale),
                onExpansionChanged: (value) {
                  inboxController.setTextIsTrue(4);
                  setState(() {
                    selectedpage = null;
                    if (tables == false) {
                      tables = true;
                    } else {
                      tables = false;
                    }
                  });
                  constraints < 600 ? Get.back() : const SizedBox();
                },
                initiallyExpanded: tables,
                leading: SvgPicture.asset(Appcontent.table,
                    height: 22,
                    color: inboxController.selectPage == 4
                        ? notifire.getContainer
                        : greyScale),
                title: Transform.translate(
                    offset: Offset(rtl ? 20 : -20, 0),
                    child: Text('Tables'.tr,
                        style: TextStyle(
                            color: inboxController.selectPage == 4
                                ? notifire.getContainer
                                : greyScale,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: FontFamily.qBold))),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        onTap: () {},
                        title: InkWell(
                          onTap: () {
                            inboxController.setTextIsTrue(4);
                            setState(() {
                              selectedpage = null;
                            });
                            constraints < 600 ? Get.back() : const SizedBox();
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: rtl ? 0 : 30, right: rtl ? 30 : 0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text('Table'.tr,
                                      style: TextStyle(
                                          color: inboxController.selectPage == 4
                                              ? notifire.getContainer
                                              : greyScale,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: FontFamily.qBold)),
                                ],
                              )),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        title: InkWell(
                          onTap: () {
                            inboxController.setTextIsTrue(5);
                            setState(() {
                              selectedpage = null;
                            });
                            constraints < 600 ? Get.back() : const SizedBox();
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: rtl ? 0 : 30, right: rtl ? 30 : 0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text('Kanban'.tr,
                                      style: TextStyle(
                                          color: inboxController.selectPage == 5
                                              ? notifire.getContainer
                                              : greyScale,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: FontFamily.qBold)),
                                ],
                              )),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        title: InkWell(
                          onTap: () {
                            inboxController.setTextIsTrue(6);
                            setState(() {
                              selectedpage = null;
                            });
                            constraints < 600 ? Get.back() : const SizedBox();
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: rtl ? 0 : 30, right: rtl ? 30 : 0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text('DataTable'.tr,
                                      style: TextStyle(
                                          color: inboxController.selectPage == 6
                                              ? notifire.getContainer
                                              : greyScale,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: FontFamily.qBold)),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              ExpansionTile(
                trailing: Icon(Icons.keyboard_arrow_down,
                    color: inboxController.selectPage == 7
                        ? notifire.getContainer
                        : greyScale),
                onExpansionChanged: (value) {
                  inboxController.setTextIsTrue(7);
                  setState(() {
                    selectedpage = null;
                    if (account == false) {
                      account = true;
                    } else {
                      account = false;
                    }
                  });
                  constraints < 600 ? Get.back() : const SizedBox();
                },
                initiallyExpanded: account,
                backgroundColor: notifire.getContentColor,
                leading: SvgPicture.asset(Appcontent.menu,
                    height: 22,
                    color: inboxController.selectPage == 7
                        ? notifire.getContainer
                        : greyScale),
                title: Transform.translate(
                    offset: Offset(rtl ? 20 : -20, 0),
                    child: Text('Account'.tr,
                        style: TextStyle(
                            color: inboxController.selectPage == 7
                                ? notifire.getContainer
                                : greyScale,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: FontFamily.qBold))),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        onTap: () {},
                        title: InkWell(
                          onTap: () {
                            inboxController.setTextIsTrue(7);
                            setState(() {
                              selectedpage = null;
                            });
                            constraints < 600 ? Get.back() : const SizedBox();
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: rtl ? 0 : 30, right: rtl ? 30 : 0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text('Billing'.tr,
                                      style: TextStyle(
                                          color: inboxController.selectPage == 7
                                              ? notifire.getContainer
                                              : greyScale,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: FontFamily.qBold)),
                                ],
                              )),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        title: InkWell(
                          onTap: () {
                            inboxController.setTextIsTrue(8);
                            setState(() {
                              selectedpage = null;
                            });
                            constraints < 600 ? Get.back() : const SizedBox();
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: rtl ? 0 : 30, right: rtl ? 30 : 0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Text('Application'.tr,
                                      style: TextStyle(
                                          color: inboxController.selectPage == 8
                                              ? notifire.getContainer
                                              : greyScale,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: FontFamily.qBold)),
                                ],
                              )),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        title: InkWell(
                          onTap: () {
                            inboxController.setTextIsTrue(9);
                            setState(() {
                              selectedpage = null;
                            });
                            constraints < 600 ? Get.back() : const SizedBox();
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: rtl ? 0 : 30, right: rtl ? 30 : 0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Text('Invoice'.tr,
                                      style: TextStyle(
                                          color: inboxController.selectPage == 9
                                              ? notifire.getContainer
                                              : greyScale,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: FontFamily.qBold)),
                                ],
                              )),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        title: InkWell(
                          onTap: () {
                            inboxController.setTextIsTrue(10);
                            setState(() {
                              selectedpage = null;
                            });
                            constraints < 600 ? Get.back() : const SizedBox();
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: rtl ? 0 : 30, right: rtl ? 30 : 0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Text('Settings'.tr,
                                      style: TextStyle(
                                          color:
                                              inboxController.selectPage == 10
                                                  ? notifire.getContainer
                                                  : greyScale,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: FontFamily.qBold)),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              ExpansionTile(
                trailing: Icon(Icons.keyboard_arrow_down,
                    color: inboxController.selectPage == 11
                        ? notifire.getContainer
                        : greyScale),
                onExpansionChanged: (value) {
                  inboxController.setTextIsTrue(11);
                  setState(() {
                    selectedpage = null;
                    if (ecommerce == false) {
                      ecommerce = true;
                    } else {
                      ecommerce = false;
                    }
                  });
                  constraints < 600 ? Get.back() : const SizedBox();
                },
                initiallyExpanded: ecommerce,
                leading: SvgPicture.asset(Appcontent.basket,
                    height: 22,
                    color: inboxController.selectPage == 11
                        ? notifire.getContainer
                        : greyScale),
                title: Transform.translate(
                    offset: Offset(rtl ? 20 : -20, 0),
                    child: Text('Ecommerce'.tr,
                        style: TextStyle(
                            color: inboxController.selectPage == 11
                                ? notifire.getContainer
                                : greyScale,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: FontFamily.qBold))),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        onTap: () {},
                        title: InkWell(
                          onTap: () {
                            inboxController.setTextIsTrue(11);
                            constraints < 600 ? Get.back() : const SizedBox();
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: rtl ? 0 : 30, right: rtl ? 30 : 0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text('New Product'.tr,
                                      style: TextStyle(
                                          color:
                                              inboxController.selectPage == 11
                                                  ? notifire.getContainer
                                                  : greyScale,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: FontFamily.qBold)),
                                ],
                              )),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        title: InkWell(
                          onTap: () {
                            inboxController.setTextIsTrue(12);
                            setState(() {
                              selectedpage = null;
                            });
                            constraints < 600 ? Get.back() : const SizedBox();
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: rtl ? 0 : 30, right: rtl ? 30 : 0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text('Product Overview'.tr,
                                      style: TextStyle(
                                          color:
                                              inboxController.selectPage == 12
                                                  ? notifire.getContainer
                                                  : greyScale,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: FontFamily.qBold)),
                                ],
                              )),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        title: InkWell(
                          onTap: () {
                            inboxController.setTextIsTrue(13);
                            setState(() {
                              selectedpage = null;
                            });
                            constraints < 600 ? Get.back() : const SizedBox();
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: rtl ? 0 : 30, right: rtl ? 30 : 0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text('Product Settings'.tr,
                                      style: TextStyle(
                                          color:
                                              inboxController.selectPage == 13
                                                  ? notifire.getContainer
                                                  : greyScale,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: FontFamily.qBold)),
                                ],
                              )),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        title: InkWell(
                          onTap: () {
                            inboxController.setTextIsTrue(14);
                            setState(() {
                              selectedpage = null;
                            });
                            constraints < 600 ? Get.back() : const SizedBox();
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: rtl ? 0 : 30, right: rtl ? 30 : 0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text('Product Page'.tr,
                                      style: TextStyle(
                                          color:
                                              inboxController.selectPage == 14
                                                  ? notifire.getContainer
                                                  : greyScale,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: FontFamily.qBold)),
                                ],
                              )),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        title: InkWell(
                          onTap: () {
                            inboxController.setTextIsTrue(15);
                            setState(() {
                              selectedpage = null;
                            });
                            constraints < 600 ? Get.back() : const SizedBox();
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: rtl ? 0 : 30, right: rtl ? 30 : 0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text('Order List'.tr,
                                      style: TextStyle(
                                          color:
                                              inboxController.selectPage == 15
                                                  ? notifire.getContainer
                                                  : greyScale,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: FontFamily.qBold)),
                                ],
                              )),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        title: InkWell(
                          onTap: () {
                            inboxController.setTextIsTrue(16);
                            setState(() {
                              selectedpage = null;
                            });
                            constraints < 600 ? Get.back() : const SizedBox();
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: rtl ? 0 : 30, right: rtl ? 30 : 0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text('Order Details'.tr,
                                      style: TextStyle(
                                          color:
                                              inboxController.selectPage == 16
                                                  ? notifire.getContainer
                                                  : greyScale,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: FontFamily.qBold)),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              InkWell(
                onTap: () {
                  inboxController.setTextIsTrue(17);
                  setState(() {
                    selectedpage = null;
                  });
                  constraints < 600 ? Get.back() : const SizedBox();
                },
                child: Container(
                  height: 46,
                  margin: const EdgeInsets.only(top: 4),
                  padding:
                      EdgeInsets.only(left: rtl ? 0 : 16, right: rtl ? 16 : 0),
                  decoration: BoxDecoration(
                    color: inboxController.selectPage == 17
                        ? notifire.getContainer
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(Appcontent.analytics,
                          height: 22,
                          color: inboxController.selectPage == 17
                              ? notifire.text
                              : greyScale),
                      const SizedBox(width: 30),
                      Transform.translate(
                          offset: Offset(rtl ? 20 : -20, 0),
                          child: Text('Analytics',
                              style: TextStyle(
                                  color: inboxController.selectPage == 17
                                      ? notifire.text
                                      : greyScale,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: FontFamily.qBold))),
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  inboxController.setTextIsTrue(18);
                  setState(() {
                    selectedpage = null;
                  });
                  constraints < 600 ? Get.back() : const SizedBox();
                },
                child: Container(
                  height: 46,
                  margin: const EdgeInsets.only(top: 4),
                  padding:
                      EdgeInsets.only(left: rtl ? 0 : 16, right: rtl ? 16 : 0),
                  decoration: BoxDecoration(
                    color: inboxController.selectPage == 18
                        ? notifire.getContainer
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: Row(
                    children: [
                      Transform.translate(
                          offset: const Offset(0, 0),
                          child: SvgPicture.asset(Appcontent.sales,
                              height: 22,
                              color: inboxController.selectPage == 18
                                  ? notifire.text
                                  : greyScale)),
                      const SizedBox(width: 30),
                      Transform.translate(
                          offset: Offset(rtl ? 20 : -20, 0),
                          child: Text('Sales'.tr,
                              style: TextStyle(
                                  color: inboxController.selectPage == 18
                                      ? notifire.text
                                      : greyScale,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: FontFamily.qBold))),
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  inboxController.setTextIsTrue(19);
                  setState(() {
                    selectedpage = null;
                  });
                  constraints < 600 ? Get.back() : const SizedBox();
                },
                child: Container(
                  height: 46,
                  margin: const EdgeInsets.only(top: 4),
                  padding:
                      EdgeInsets.only(left: rtl ? 0 : 16, right: rtl ? 16 : 0),
                  decoration: BoxDecoration(
                    color: inboxController.selectPage == 19
                        ? notifire.getContainer
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(Appcontent.product,
                          height: 22,
                          color: inboxController.selectPage == 19
                              ? notifire.text
                              : greyScale),
                      const SizedBox(width: 30),
                      Transform.translate(
                          offset: Offset(rtl ? 20 : -20, 0),
                          child: Text('Product'.tr,
                              style: TextStyle(
                                  color: inboxController.selectPage == 19
                                      ? notifire.text
                                      : greyScale,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: FontFamily.qBold))),
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  inboxController.setTextIsTrue(20);
                  setState(() {
                    selectedpage = null;
                  });
                  constraints < 600 ? Get.back() : const SizedBox();
                },
                child: Container(
                  height: 46,
                  margin: const EdgeInsets.only(top: 4),
                  padding:
                      EdgeInsets.only(left: rtl ? 0 : 16, right: rtl ? 16 : 0),
                  decoration: BoxDecoration(
                    color: inboxController.selectPage == 20
                        ? notifire.getContainer
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(Appcontent.customer,
                          height: 22,
                          color: inboxController.selectPage == 20
                              ? notifire.text
                              : greyScale),
                      const SizedBox(width: 30),
                      Transform.translate(
                          offset: Offset(rtl ? 20 : -20, 0),
                          child: Text('Customer'.tr,
                              style: TextStyle(
                                  color: inboxController.selectPage == 20
                                      ? notifire.text
                                      : greyScale,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: FontFamily.qBold))),
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  inboxController.setTextIsTrue(21);
                  setState(() {
                    selectedpage = null;
                  });
                  constraints < 600 ? Get.back() : const SizedBox();
                },
                child: Container(
                  height: 46,
                  margin: const EdgeInsets.only(top: 4),
                  padding:
                      EdgeInsets.only(left: rtl ? 0 : 16, right: rtl ? 16 : 0),
                  decoration: BoxDecoration(
                    color: inboxController.selectPage == 21
                        ? notifire.getContainer
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(Appcontent.payout,
                          height: 22,
                          color: inboxController.selectPage == 21
                              ? notifire.text
                              : greyScale),
                      const SizedBox(width: 30),
                      Transform.translate(
                          offset: Offset(rtl ? 20 : -20, 0),
                          child: Text('Payout'.tr,
                              style: TextStyle(
                                  color: inboxController.selectPage == 21
                                      ? notifire.text
                                      : greyScale,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: FontFamily.qBold))),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),
              //! ----------------- Settings ---------------------

              Padding(
                padding:
                    EdgeInsets.only(left: rtl ? 0 : 17, right: rtl ? 17 : 0),
                child: Text('Settings'.tr,
                    style: const TextStyle(
                        color: Color(0xffA6A6A6),
                        fontSize: 14,
                        fontFamily: FontFamily.qBold,
                        fontWeight: FontWeight.w700)),
              ),

              ExpansionTile(
                trailing: Icon(Icons.keyboard_arrow_down,
                    color: inboxController.selectPage == 22
                        ? notifire.getContainer
                        : greyScale),
                onExpansionChanged: (value) {
                  inboxController.setTextIsTrue(22);
                  setState(() {
                    selectedpage = null;
                    if (profileexpan == false) {
                      profileexpan = true;
                    } else {
                      profileexpan = false;
                    }
                  });
                  constraints < 600 ? Get.back() : const SizedBox();
                },
                initiallyExpanded: profileexpan,
                leading: SvgPicture.asset(Appcontent.profile,
                    height: 22,
                    color: inboxController.selectPage == 22
                        ? notifire.getContainer
                        : greyScale),
                title: Transform.translate(
                    offset: Offset(rtl ? 20 : -20, 0),
                    child: Text('Profile'.tr,
                        style: TextStyle(
                            color: inboxController.selectPage == 22
                                ? notifire.getContainer
                                : greyScale,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: FontFamily.qBold))),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        onTap: () {},
                        title: InkWell(
                          onTap: () {
                            inboxController.setTextIsTrue(22);
                            setState(() {
                              selectedpage = null;
                            });
                            constraints < 600 ? Get.back() : const SizedBox();
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: rtl ? 0 : 30, right: rtl ? 30 : 0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text('Profile V1',
                                      style: TextStyle(
                                          color:
                                              inboxController.selectPage == 22
                                                  ? notifire.getContainer
                                                  : greyScale,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: FontFamily.qBold)),
                                ],
                              )),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        title: InkWell(
                          onTap: () {
                            inboxController.setTextIsTrue(23);
                            setState(() {
                              selectedpage = null;
                            });
                            constraints < 600 ? Get.back() : const SizedBox();
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: rtl ? 0 : 30, right: rtl ? 30 : 0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text('Profile V2',
                                      style: TextStyle(
                                          color:
                                              inboxController.selectPage == 23
                                                  ? notifire.getContainer
                                                  : greyScale,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: FontFamily.qBold)),
                                ],
                              )),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        title: InkWell(
                          onTap: () {
                            inboxController.setTextIsTrue(24);
                            setState(() {
                              selectedpage = null;
                            });
                            constraints < 600 ? Get.back() : const SizedBox();
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: rtl ? 0 : 30, right: rtl ? 30 : 0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text('Profile Settings'.tr,
                                      style: TextStyle(
                                          color:
                                              inboxController.selectPage == 24
                                                  ? notifire.getContainer
                                                  : greyScale,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: FontFamily.qBold)),
                                ],
                              )),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        title: InkWell(
                          onTap: () {
                            inboxController.setTextIsTrue(25);
                            setState(() {
                              selectedpage = null;
                            });
                            constraints < 600 ? Get.back() : const SizedBox();
                          },
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: rtl ? 0 : 30, right: rtl ? 30 : 0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text('News Feed'.tr,
                                      style: TextStyle(
                                          color:
                                              inboxController.selectPage == 25
                                                  ? notifire.getContainer
                                                  : greyScale,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: FontFamily.qBold)),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ExpansionTile(
                trailing: Icon(Icons.keyboard_arrow_down,
                    color: inboxController.selectPage == 28
                        ? notifire.getContainer
                        : greyScale),
                onExpansionChanged: (value) {
                  inboxController.setTextIsTrue(28);
                  setState(() {
                    selectedpage = 0;
                    if (pages == false) {
                      pages = true;
                    } else {
                      pages = false;
                    }
                  });
                  constraints < 600 ? Get.back() : const SizedBox();
                },
                initiallyExpanded: pages,
                leading: SvgPicture.asset(Appcontent.dashboard,
                    height: 20,
                    color: inboxController.selectPage == 28
                        ? notifire.getContainer
                        : greyScale),
                title: Transform.translate(
                    offset: Offset(rtl ? 20 : -20, 0),
                    child: Text('Pages'.tr,
                        style: TextStyle(
                            color: inboxController.selectPage == 28
                                ? notifire.getContainer
                                : greyScale,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: FontFamily.qBold))),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: modal().pages.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              setState(() {
                                selectedpage = index;
                              });

                              if (selectedpage == 0) {
                                inboxController.setTextIsTrue(28);
                              } else if (selectedpage == 1) {
                                inboxController.setTextIsTrue(29);
                              } else if (selectedpage == 2) {
                                inboxController.setTextIsTrue(30);
                              } else if (selectedpage == 3) {
                                inboxController.setTextIsTrue(31);
                              } else if (selectedpage == 4) {
                                inboxController.setTextIsTrue(32);
                              } else if (selectedpage == 9) {
                                inboxController.setTextIsTrue(34);
                              } else if (selectedpage == 10) {
                                inboxController.setTextIsTrue(35);
                              } else if (selectedpage == 11) {
                                inboxController.setTextIsTrue(36);
                              } else if (selectedpage == 12) {
                                inboxController.setTextIsTrue(37);
                              } else if (selectedpage == 8) {
                                Get.to(const TwostepVerificationPage());
                              } else if (selectedpage == 5) {
                                Get.to(const LoginScreen());
                              } else if (selectedpage == 6) {
                                Get.to(const SignupScreen());
                              } else if (selectedpage == 7) {
                                Get.to(const PhoneVerification());
                              }
                              constraints < 600
                                  ? (selectedpage == 5 ||
                                          selectedpage == 6 ||
                                          selectedpage == 7 ||
                                          selectedpage == 8
                                      ? const SizedBox()
                                      : Get.back())
                                  : const SizedBox();
                              if (selectedpage == 5 ||
                                  selectedpage == 6 ||
                                  selectedpage == 7 ||
                                  selectedpage == 8) {
                                setState(() {
                                  inboxController.setTextIsTrue(32);
                                  selectedpage = 4;
                                });
                              }
                            },
                            title: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 7,
                                      width: 7,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      modal().pages[index].toString().tr,
                                      style: TextStyle(
                                          color: selectedpage == index
                                              ? notifire.getContainer
                                              : greyScale,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: FontFamily.qBold),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                )),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  inboxController.setTextIsTrue(26);
                  setState(() {
                    selectedpage = null;
                  });
                  constraints < 600 ? Get.back() : const SizedBox();
                },
                child: Container(
                  height: 46,
                  margin: const EdgeInsets.only(top: 4),
                  padding: EdgeInsets.only(left: 16, right: rtl ? 16 : 0),
                  decoration: BoxDecoration(
                    color: inboxController.selectPage == 26
                        ? notifire.getContainer
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(Appcontent.message,
                          height: 22,
                          color: inboxController.selectPage == 26
                              ? notifire.text
                              : greyScale),
                      const SizedBox(width: 30),
                      Transform.translate(
                          offset: Offset(rtl ? 20 : -20, 0),
                          child: Text('Inbox'.tr,
                              style: TextStyle(
                                  color: inboxController.selectPage == 26
                                      ? notifire.text
                                      : greyScale,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: FontFamily.qBold))),
                      const Spacer(),
                      Container(
                        height: 25,
                        margin: const EdgeInsets.only(right: 13),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                            child: Text('7',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: FontFamily.qBold))),
                      ),
                    ],
                  ),
                ),
              ),

              InkWell(
                onTap: () {
                  inboxController.setTextIsTrue(27);
                  setState(() {
                    selectedpage = null;
                  });
                  constraints < 600 ? Get.back() : const SizedBox();
                },
                child: Container(
                  height: 46,
                  margin: const EdgeInsets.only(top: 4),
                  padding:
                      EdgeInsets.only(left: rtl ? 0 : 16, right: rtl ? 16 : 0),
                  decoration: BoxDecoration(
                    color: inboxController.selectPage == 27
                        ? notifire.getContainer
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(Appcontent.setting,
                          height: 22,
                          color: inboxController.selectPage == 27
                              ? notifire.text
                              : greyScale),
                      const SizedBox(width: 30),
                      Transform.translate(
                          offset: Offset(rtl ? 20 : -20, 0),
                          child: Text('Settings'.tr,
                              style: TextStyle(
                                  color: inboxController.selectPage == 27
                                      ? notifire.text
                                      : greyScale,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: FontFamily.qBold))),
                    ],
                  ),
                ),
              ),
              ExpansionTile(
                trailing: Icon(Icons.keyboard_arrow_down,
                    color: inboxController.selectPage == 22
                        ? notifire.getContainer
                        : greyScale),
                onExpansionChanged: (value) {},
                collapsedTextColor: notifire.getContainer,
                leading: SvgPicture.asset(Appcontent.multimenu,
                    height: 22, color: greyScale),
                title: Transform.translate(
                    offset: Offset(rtl ? 20 : -20, 0),
                    child: Text('Multi Menu'.tr,
                        style: TextStyle(
                          color: greyScale,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          fontFamily: FontFamily.qBold,
                        ))),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        onTap: () {},
                        title: InkWell(
                          onTap: () {},
                          child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text('Level A'.tr,
                                      style: TextStyle(
                                          color: greyScale,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: FontFamily.qBold)),
                                ],
                              )),
                        ),
                      ),
                      ExpansionTile(
                        trailing:
                            Icon(Icons.keyboard_arrow_down, color: greyScale),
                        onExpansionChanged: (value) {},
                        title: Transform.translate(
                          offset: Offset(rtl ? 20 : -20, 0),
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: rtl ? 0 : 30, right: rtl ? 30 : 0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 7,
                                    width: 7,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text('Level B'.tr,
                                      style: TextStyle(
                                          color: greyScale,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: FontFamily.qBold)),
                                ],
                              )),
                        ),
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                onTap: () {},
                                title: InkWell(
                                  onTap: () {},
                                  child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 7,
                                            width: 7,
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Text('Level B1'.tr,
                                              style: TextStyle(
                                                  color: greyScale,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily:
                                                      FontFamily.qBold)),
                                        ],
                                      )),
                                ),
                              ),
                              ExpansionTile(
                                trailing: Icon(Icons.keyboard_arrow_down,
                                    color: greyScale),
                                onExpansionChanged: (value) {},
                                title: Transform.translate(
                                  offset: Offset(rtl ? 20 : -20, 0),
                                  child: Padding(
                                      padding: const EdgeInsets.only(left: 40),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 7,
                                            width: 7,
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Text('Level B2'.tr,
                                              style: TextStyle(
                                                  color: greyScale,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                  fontFamily:
                                                      FontFamily.qBold)),
                                        ],
                                      )),
                                ),
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        onTap: () {},
                                        title: InkWell(
                                          onTap: () {},
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: rtl ? 0 : 30,
                                                  right: rtl ? 30 : 0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 7,
                                                    width: 7,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text('Level B21'.tr,
                                                      style: TextStyle(
                                                          color: greyScale,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontFamily: FontFamily
                                                              .qBold)),
                                                ],
                                              )),
                                        ),
                                      ),
                                      ListTile(
                                        onTap: () {},
                                        title: InkWell(
                                          onTap: () {},
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: rtl ? 0 : 30,
                                                  right: rtl ? 30 : 0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 7,
                                                    width: 7,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text('Level b22'.tr,
                                                      style: TextStyle(
                                                          color: greyScale,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontFamily: FontFamily
                                                              .qBold)),
                                                ],
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Appcontent.copyright, height: 15),
                  const SizedBox(width: 10),
                  Text('Copyright Miracle 2024 ',
                      style: TextStyle(
                          fontSize: 12,
                          color: greyScale,
                          fontFamily: FontFamily.qRegular,
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isdark = false;
  bool value = true;

  final now = DateFormat.yMMMd().add_jms().format(DateTime.now());

  Widget appbar(constraints) {
    return constraints < 600
        ? const SizedBox()
        : AppBar(
            backgroundColor: notifire.getBgColor,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Container(
              width: Get.width * 0.76,
              height: 45,
              margin: const EdgeInsets.symmetric(vertical: 13),
              child: TextField(
                style: TextStyle(color: notifire.getContainer),
                decoration: InputDecoration(
                  hintText: 'Search'.tr,
                  suffixIcon: Image.asset(Appcontent.search,
                      scale: 3, color: const Color(0xff9DA2A7)),
                  hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontFamily: FontFamily.qRegular),
                  contentPadding: const EdgeInsets.only(left: 20, right: 20),
                  filled: true,
                  fillColor: notifire.getContentColor,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            actions: [
              const SizedBox(width: 6),
              message(constraints),
              bellMenu(constraints),
              profile(constraints),
              const SizedBox(width: 20),
            ],
          );
  }

  int selectedlang = 0;

  Widget message(constraints) {
    return PopupMenuButton(
      tooltip: '',
      padding: const EdgeInsets.all(0),
      offset: Offset(rtl ? -80 : 50, 60),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      // initialValue: selectedMenu,
      constraints: const BoxConstraints(
        maxWidth: 315,
        maxHeight: 350,
      ),
      color: notifire.getContentColor,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: constraints < 800 ? 6 : 13, vertical: 5),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
        child: Center(
            child: SvgPicture.asset(
          Appcontent.messagedotsIcon,
          fit: BoxFit.cover,
          height: 25,
          colorFilter: ColorFilter.mode(
            notifire.getContainer,
            BlendMode.srcIn,
          ),
        )),
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem2>>[
        PopupMenuItem<SampleItem2>(
          enabled: true,
          value: SampleItem2.itemOne,
          onTap: () {},
          child: SizedBox(
            width: 315,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 6, right: 6),
                  child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: notifire.isDark
                            ? notifire.getBgColor
                            : const Color(0xfff3f2f7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Messages",
                              style: TextStyle(
                                  color: notifire.getContainer,
                                  fontSize: 14,
                                  fontFamily: FontFamily.qBold),
                              overflow: TextOverflow.ellipsis),
                          const SizedBox(
                            width: 6,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: yellow),
                            child: const Padding(
                              padding: EdgeInsets.all(6),
                              child: Text("7",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontFamily: FontFamily.qBold),
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ],
                      )),
                ),
                const SizedBox(height: 12),
                ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                right: 13, top: 5, bottom: 5, left: 6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Image.asset(
                                  modal().sImg[index],
                                  fit: BoxFit.fill,
                                  height: 40,
                                )),
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Mitchel Brown",
                                        style: TextStyle(
                                            color: notifire.getContainer,
                                            fontSize: 14,
                                            fontFamily: FontFamily.qBold),
                                        overflow: TextOverflow.ellipsis),
                                    Text("1.7 hrs ago",
                                        style: TextStyle(
                                            color: yellow,
                                            fontSize: 10,
                                            fontFamily: FontFamily.qBold),
                                        overflow: TextOverflow.ellipsis),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Lorel ipsum dolor amet cosec",
                                        style: TextStyle(
                                            color: Colors.grey.withOpacity(0.5),
                                            fontSize: 12,
                                            fontFamily: FontFamily.qBold),
                                        overflow: TextOverflow.ellipsis),
                                    Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: yellow),
                                      child: const Padding(
                                        padding: EdgeInsets.all(6),
                                        child: Text("3",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontFamily: FontFamily.qBold),
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget bellMenu(constraints) {
    return PopupMenuButton(
      tooltip: '',
      padding: const EdgeInsets.all(0),
      offset: Offset(rtl ? -80 : 50, 60),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      // initialValue: selectedMenu,
      constraints: const BoxConstraints(
        maxWidth: 315,
        maxHeight: 350,
      ),
      color: notifire.getContentColor,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: constraints < 800 ? 6 : 13, vertical: 5),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
        child: Center(
            child: SvgPicture.asset(
          Appcontent.bellIcon,
          fit: BoxFit.cover,
          height: 25,
          colorFilter: ColorFilter.mode(
            notifire.getContainer,
            BlendMode.srcIn,
          ),
        )),
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem2>>[
        PopupMenuItem<SampleItem2>(
          enabled: true,
          value: SampleItem2.itemOne,
          onTap: () {},
          child: SizedBox(
            width: 315,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.only(left: 6, right: 6),
                  child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: notifire.isDark
                            ? notifire.getBgColor
                            : const Color(0xfff3f2f7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Notification",
                              style: TextStyle(
                                  color: notifire.getContainer,
                                  fontSize: 14,
                                  fontFamily: FontFamily.qBold),
                              overflow: TextOverflow.ellipsis),
                          const SizedBox(
                            width: 6,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.lightBlueAccent),
                            child: const Padding(
                              padding: EdgeInsets.all(6),
                              child: Text("5",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontFamily: FontFamily.qBold),
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ],
                      )),
                ),
                const SizedBox(height: 12),
                ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12, right: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                right: 10, top: 5, left: 6, bottom: 5),
                            decoration: const BoxDecoration(),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Image.asset(
                                  modal().sImg[index + 1],
                                  fit: BoxFit.fill,
                                  height: 40,
                                )),
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Mitchel Brown",
                                        style: TextStyle(
                                            color: notifire.getContainer,
                                            fontSize: 14,
                                            fontFamily: FontFamily.qBold),
                                        overflow: TextOverflow.ellipsis),
                                    const Text("1.3 hrs ago",
                                        style: TextStyle(
                                            color: Colors.lightBlueAccent,
                                            fontSize: 10,
                                            fontFamily: FontFamily.qBold),
                                        overflow: TextOverflow.ellipsis),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Lorel ipsum dolor amet cosec",
                                        style: TextStyle(
                                            color: Colors.grey.withOpacity(0.5),
                                            fontSize: 12,
                                            fontFamily: FontFamily.qBold),
                                        overflow: TextOverflow.ellipsis),
                                    const Text("●",
                                        style: TextStyle(
                                            color: Colors.lightBlueAccent,
                                            fontSize: 10,
                                            fontFamily: FontFamily.qBold),
                                        overflow: TextOverflow.ellipsis),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget profile(constraints) {
    return PopupMenuButton(
      tooltip: '',
      padding: const EdgeInsets.all(0),
      offset: const Offset(-5, 60),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      // initialValue: selectedMenu,
      constraints: const BoxConstraints(
        maxWidth: 315,
        maxHeight: 500,
      ),
      color: notifire.getContentColor,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              Appcontent.sales1,
              fit: BoxFit.cover,
              height: constraints < 800 ? 30 : 40,
            )),
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem2>>[
        PopupMenuItem<SampleItem2>(
          enabled: true,
          value: SampleItem2.itemOne,
          onTap: () {},
          child: Padding(
            padding:
                const EdgeInsets.only(top: 12, bottom: 12, left: 6, right: 6),
            child: SizedBox(
              width: 325,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: notifire.isDark
                            ? notifire.getBgColor
                            : const Color(0xfff3f2f7),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 6, bottom: 6),
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 13, vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14)),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    Appcontent.sales1,
                                    fit: BoxFit.cover,
                                    height: 50,
                                  )),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Elon Musk",
                                  style: TextStyle(
                                      color: notifire.getContainer,
                                      fontSize: 20,
                                      fontFamily: FontFamily.qBold),
                                  overflow: TextOverflow.ellipsis),
                              const SizedBox(height: 4),
                              Text("Web Designer",
                                  style: TextStyle(
                                      color: Colors.grey.withOpacity(0.5),
                                      fontSize: 14,
                                      fontFamily: FontFamily.qBold),
                                  overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: modal().profileIcons.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: InkWell(
                          onTap: () {
                            index == 0
                                ? (
                                    inboxController.setTextIsTrue(22),
                                    selectedpage = null
                                  )
                                : index == 1
                                    ? (
                                        inboxController.setTextIsTrue(27),
                                        selectedpage = null
                                      )
                                    : index == 2
                                        ? (
                                            inboxController.setTextIsTrue(30),
                                            selectedpage = 2
                                          )
                                        : index == 3
                                            ? (
                                                inboxController
                                                    .setTextIsTrue(25),
                                                selectedpage = null
                                              )
                                            : (
                                                inboxController
                                                    .setTextIsTrue(29),
                                                selectedpage = 1
                                              );
                            Get.back();
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(modal().profileIcons[index],
                                  height: 20,
                                  color: Colors.grey.withOpacity(0.9)),
                              const SizedBox(width: 10),
                              Text(modal().profileText[index].toString().tr,
                                  style: TextStyle(
                                      color: Colors.grey.withOpacity(0.9),
                                      fontSize: 14,
                                      fontFamily: FontFamily.qBold),
                                  overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 45,
                    width: Get.width,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          elevation: const MaterialStatePropertyAll(0),
                          backgroundColor: WidgetStatePropertyAll(
                              notifire.isDark
                                  ? notifire.getBgColor
                                  : const Color(0xfff3f2f7)),
                        ),
                        onPressed: () {
                          Get.to(const LoginScreen());
                        },
                        child: Text("Logout".tr,
                            style: TextStyle(
                                color: notifire.getContainer,
                                fontSize: 14,
                                fontFamily: FontFamily.qBold),
                            overflow: TextOverflow.ellipsis)),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget popManu() {
    return PopupMenuButton(
      tooltip: '',
      offset: const Offset(10, 60),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      splashRadius: 1,
      constraints: const BoxConstraints(maxWidth: 400, minWidth: 400),
      shadowColor: Colors.grey,
      color: notifire.getBgColor,
      itemBuilder: (context) => <PopupMenuEntry<SampleItem>>[
        PopupMenuItem(
            height: 30,
            padding: EdgeInsets.zero,
            enabled: false,
            child: SingleChildScrollView(
              child: StatefulBuilder(
                builder: (context, setState) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Notification'.tr,
                                style: TextStyle(
                                    fontSize: 24,
                                    color: notifire.getContainer,
                                    fontFamily: FontFamily.qBold,
                                    fontWeight: FontWeight.w700)),
                            Text('Mark as read',
                                style: TextStyle(
                                    fontSize: 11,
                                    color: notifire.getContainer,
                                    fontFamily: FontFamily.qRegular,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: modal().noImg.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Container(
                                height: 48,
                                width: 48,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(modal().noImg[index]),
                                        fit: BoxFit.cover)),
                              ),
                              title: Text(modal().noTitle[index],
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: notifire.getContainer,
                                      fontFamily: FontFamily.qBold,
                                      fontWeight: FontWeight.w700)),
                              subtitle: RichText(
                                  text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'You got sale, and received money ',
                                      style: TextStyle(
                                          fontSize: 9,
                                          color: greyScale,
                                          fontFamily: FontFamily.qRegular,
                                          fontWeight: FontWeight.w700)),
                                  TextSpan(
                                      text: modal().amt[index],
                                      style: TextStyle(
                                          fontSize: 9,
                                          color: greenCyan,
                                          fontFamily: FontFamily.qRegular,
                                          fontWeight: FontWeight.w700)),
                                ],
                              )),
                              trailing: Transform.translate(
                                  offset: const Offset(0, -7),
                                  child: Text('1m',
                                      style: TextStyle(
                                          fontSize: 9,
                                          color: greyScale,
                                          fontFamily: FontFamily.qRegular,
                                          fontWeight: FontWeight.w700))),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            )),
      ],
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: notifire.getContentColor,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Image.asset(Appcontent.notification,
                color: notifire.getContainer)),
      ),
    );
  }

  bool light = false;
}
