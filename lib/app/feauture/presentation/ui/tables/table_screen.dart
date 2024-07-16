import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:sitecycle/app/config/colors.dart';
import 'package:sitecycle/app/config/dark_ligthmode.dart';
import 'package:sitecycle/app/config/fontfamily_modal.dart';
import 'package:sitecycle/app/config/list_modal.dart';
import 'package:sitecycle/app/config/pagination.dart';
import 'package:sitecycle/app/feauture/presentation/ui/drawer/drawer_main.dart';
import 'package:sitecycle/app/feauture/presentation/ui/mq.dart';


class TableScreen extends StatefulWidget {
  const TableScreen({super.key});

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  late ColorNotifire notifire;
  PaginationController paginationController = Get.put(PaginationController());
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of(context, listen: true);
    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.maxWidth < 600) {
          return SingleChildScrollView(
            child: Container(
                color: notifire.getBgColor,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title(),
                    const SizedBox(height: 15),
                    development(constraints.maxWidth),
                    const SizedBox(height: 15),
                    check(constraints.maxWidth),
                    const SizedBox(height: 15),
                    column(constraints.maxWidth),
                    const SizedBox(height: 15),
                    complex(constraints.maxWidth),
                  ],
                ),
            ),
          );
        } else if(constraints.maxWidth < 1000) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title(),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: development(constraints.maxWidth)),
                      const SizedBox(width: 15),
                      Expanded(child: check(constraints.maxWidth)),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: column(constraints.maxWidth)),
                      const SizedBox(width: 15),
                      Expanded(child: complex(constraints.maxWidth)),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title(),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 581,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: development(constraints.maxWidth)),
                        const SizedBox(width: 15),
                        Expanded(child: check(constraints.maxWidth)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: column(constraints.maxWidth)),
                      const SizedBox(width: 15),
                      Expanded(child: complex(constraints.maxWidth)),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
  Widget title() {
    return Align(
        alignment: Alignment.topLeft,
        child: Text('Tables',style: TextStyle(fontSize: 35,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)));
  }

  bool isActive = false;
  bool isActive1 = false;
  bool isActive2 = false;
  bool isActive3 = false;
  bool isActive4 = false;
  bool isActive5 = false;
  bool isActive6 = false;
  Widget development(constraints) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: notifire.getContentColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: constraints < 600 ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Development Table'.tr,style: TextStyle(fontSize: constraints / 20,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                PopupMenuButton(
                  tooltip: '',
                  padding: const EdgeInsets.all(0),
                  offset: Offset(rtl ? -25 : 25, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // initialValue: selectedMenu,
                  constraints: const BoxConstraints(
                    maxWidth: 100,
                    maxHeight: 350,
                  ),
                  color: notifire.getContentColor,
                  child:  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: notifire.getBgColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.more_horiz, color: blue),
                  ),
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
            SizedBox(
              width: constraints < 600 ? 1000 : constraints < 1665 ? 800 : constraints < 1400 ? 800 : 800,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Table(
                  columnWidths: const <int, TableColumnWidth>{
                    0: FixedColumnWidth(150),
                    1: FixedColumnWidth(120),
                    2: FixedColumnWidth(110),
                    3: FixedColumnWidth(120),
                  },
                  children: [
                    TableRow(
                      children: [
                        Text('NAME'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                        Text('PROGRESS'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                        Text('QUANTITY'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                        Text('PROCESS'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Divider(height: 10,color: greyScale),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Divider(height: 10,color: greyScale),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Divider(height: 10,color: greyScale),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Divider(height: 10,color: greyScale),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text('Instagram UI', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('80.2%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('4032', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Row(
                          children: [
                            Expanded(child: Text('80.2%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600))),
                            Expanded(
                              flex: 2,
                              child: LinearProgressIndicator(
                                backgroundColor: greyScale.withOpacity(0.20),
                                borderRadius: BorderRadius.circular(30),
                                value: 0.8,
                                minHeight: 10,
                                color: blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    sizebox(),
                    TableRow(
                      children: [
                        Text('Instagram UI', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('35.2%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('4032', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Row(
                          children: [
                            Expanded(child: Text('35.2%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600))),
                            Expanded(
                              flex: 2,
                              child: LinearProgressIndicator(
                                backgroundColor: greyScale.withOpacity(0.20),
                                borderRadius: BorderRadius.circular(30),
                                value: 0.6,
                                minHeight: 10,
                                color: blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    sizebox(),
                    TableRow(
                      children: [
                        Text('Year Report'.tr, style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('8.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('551', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Row(
                          children: [
                            Expanded(child: Text('8.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600))),
                            Expanded(
                              flex: 2,
                              child: LinearProgressIndicator(
                                backgroundColor: greyScale.withOpacity(0.20),
                                borderRadius: BorderRadius.circular(30),
                                value: 0.2,
                                minHeight: 10,
                                color: blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    sizebox(),
                    TableRow(
                      children: [
                        Text('Marketing'.tr, style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('80.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('220', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Row(
                          children: [
                            Expanded(child: Text('80.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600))),
                            Expanded(
                              flex: 2,
                              child: LinearProgressIndicator(
                                backgroundColor: greyScale.withOpacity(0.20),
                                borderRadius: BorderRadius.circular(30),
                                value: 0.9,
                                minHeight: 10,
                                color: blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    sizebox(),
                    TableRow(
                      children: [
                        Text('Hotel Update'.tr, style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('12.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('223', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Row(
                          children: [
                            Expanded(child: Text('12.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600))),
                            Expanded(
                              flex: 2,
                              child: LinearProgressIndicator(
                                backgroundColor: greyScale.withOpacity(0.20),
                                borderRadius: BorderRadius.circular(30),
                                value: 0.3,
                                minHeight: 10,
                                color: blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    sizebox(),
                    TableRow(
                      children: [
                        Text('Instagram UI', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('35.2%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('4032', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Row(
                          children: [
                            Expanded(child: Text('35.2%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600))),
                            Expanded(
                              flex: 2,
                              child: LinearProgressIndicator(
                                backgroundColor: greyScale.withOpacity(0.20),
                                borderRadius: BorderRadius.circular(30),
                                value: 0.6,
                                minHeight: 10,
                                color: blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    sizebox(),
                    TableRow(
                      children: [
                        Text('Year Report'.tr, style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('8.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('551', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Row(
                          children: [
                            Expanded(child: Text('8.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600))),
                            Expanded(
                              flex: 2,
                              child: LinearProgressIndicator(
                                backgroundColor: greyScale.withOpacity(0.20),
                                borderRadius: BorderRadius.circular(30),
                                value: 0.2,
                                minHeight: 10,
                                color: blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    sizebox(),
                    TableRow(
                      children: [
                        Text('Marketing'.tr, style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('80.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('220', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Row(
                          children: [
                            Expanded(child: Text('80.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600))),
                            Expanded(
                              flex: 2,
                              child: LinearProgressIndicator(
                                backgroundColor: greyScale.withOpacity(0.20),
                                borderRadius: BorderRadius.circular(30),
                                value: 0.9,
                                minHeight: 10,
                                color: blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    sizebox(),
                    TableRow(
                      children: [
                        Text('Hotel Update'.tr, style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('12.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('223', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Row(
                          children: [
                            Expanded(child: Text('12.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600))),
                            Expanded(
                              flex: 2,
                              child: LinearProgressIndicator(
                                backgroundColor: greyScale.withOpacity(0.20),
                                borderRadius: BorderRadius.circular(30),
                                value: 0.3,
                                minHeight: 10,
                                color: blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ) :  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Development Table'.tr, style: TextStyle(height: 1,fontSize: constraints / 60,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                PopupMenuButton(
                  tooltip: '',
                  padding: const EdgeInsets.all(0),
                  offset: Offset(rtl ? -25 : 25, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // initialValue: selectedMenu,
                  constraints: const BoxConstraints(
                    maxWidth: 100,
                    maxHeight: 350,
                  ),
                  color: notifire.getContentColor,
                  child:  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: notifire.getBgColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.more_horiz, color: blue),
                  ),
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
                width: constraints < 600 ? 600 : constraints < 1665 ? 800 : constraints < 1400 ? 800 : 780,
                child: Table(
                  columnWidths: const <int, TableColumnWidth>{
                    0: FixedColumnWidth(20),
                    1: FixedColumnWidth(20),
                    2: FixedColumnWidth(20),
                    3: FixedColumnWidth(15),
                  },
                  children: [
                    TableRow(
                      children: [
                        Text('NAME'.tr, style: TextStyle(height: 1,fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                        Text('PROGRESS'.tr, style: TextStyle(height: 1,fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                        Text('QUANTITY'.tr, style: TextStyle(height: 1,fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                        Text('Process'.tr, style: TextStyle(height: 1,fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                      ],
                    ),
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Divider(height: 10,color: greyScale),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Divider(height: 10,color: greyScale),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Divider(height: 10,color: greyScale),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Divider(height: 10,color: greyScale),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Text('Instagram UI', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('80.2%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('4032', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Row(
                          children: [
                            Expanded(child: Text('80.2%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600))),
                            Expanded(
                              flex: 2,
                              child: LinearProgressIndicator(
                                backgroundColor: greyScale.withOpacity(0.20),
                                borderRadius: BorderRadius.circular(30),
                                value: 0.8,
                                minHeight: 10,
                                color: blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    sizebox(),
                    TableRow(
                      children: [
                        Text('Instagram UI', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('35.2%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('4032', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Row(
                          children: [
                            Expanded(child: Text('35.2%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600))),
                            Expanded(
                              flex: 2,
                              child: LinearProgressIndicator(
                                backgroundColor: greyScale.withOpacity(0.20),
                                borderRadius: BorderRadius.circular(30),
                                value: 0.6,
                                minHeight: 10,
                                color: blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    sizebox(),
                    TableRow(
                      children: [
                        Text('Year Report'.tr, style: TextStyle(height: 1,fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('8.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('551', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Row(
                          children: [
                            Expanded(child: Text('8.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600))),
                            Expanded(
                              flex: 2,
                              child: LinearProgressIndicator(
                                backgroundColor: greyScale.withOpacity(0.20),
                                borderRadius: BorderRadius.circular(30),
                                value: 0.2,
                                minHeight: 10,
                                color: blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    sizebox(),
                    TableRow(
                      children: [
                        Text('Marketing'.tr, style: TextStyle(height: 1,fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('80.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('220', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Row(
                          children: [
                            Expanded(child: Text('80.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600))),
                            Expanded(
                              flex: 2,
                              child: LinearProgressIndicator(
                                backgroundColor: greyScale.withOpacity(0.20),
                                borderRadius: BorderRadius.circular(30),
                                value: 0.9,
                                minHeight: 10,
                                color: blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    sizebox(),
                    TableRow(
                      children: [
                        Text('Hotel Update'.tr, style: TextStyle(height: 1,fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('12.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('223', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Row(
                          children: [
                            Expanded(child: Text('12.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600))),
                            Expanded(
                              flex: 2,
                              child: LinearProgressIndicator(
                                backgroundColor: greyScale.withOpacity(0.20),
                                borderRadius: BorderRadius.circular(30),
                                value: 0.3,
                                minHeight: 10,
                                color: blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    sizebox(),
                    TableRow(
                      children: [
                        Text('Instagram UI', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('35.2%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('4032', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Row(
                          children: [
                            Expanded(child: Text('35.2%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600))),
                            Expanded(
                              flex: 2,
                              child: LinearProgressIndicator(
                                backgroundColor: greyScale.withOpacity(0.20),
                                borderRadius: BorderRadius.circular(30),
                                value: 0.6,
                                minHeight: 10,
                                color: blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    sizebox(),
                    TableRow(
                      children: [
                        Text('Year Report'.tr, style: TextStyle(height: 1,fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('8.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('551', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Row(
                          children: [
                            Expanded(child: Text('8.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600))),
                            Expanded(
                              flex: 2,
                              child: LinearProgressIndicator(
                                backgroundColor: greyScale.withOpacity(0.20),
                                borderRadius: BorderRadius.circular(30),
                                value: 0.2,
                                minHeight: 10,
                                color: blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    sizebox(),
                    TableRow(
                      children: [
                        Text('Marketing'.tr, style: TextStyle(height: 1,fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('80.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('220', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Row(
                          children: [
                            Expanded(child: Text('80.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600))),
                            Expanded(
                              flex: 2,
                              child: LinearProgressIndicator(
                                backgroundColor: greyScale.withOpacity(0.20),
                                borderRadius: BorderRadius.circular(30),
                                value: 0.9,
                                minHeight: 10,
                                color: blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    sizebox(),
                    TableRow(
                      children: [
                        Text('Hotel Update'.tr, style: TextStyle(height: 1,fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('12.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Text('223', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        Row(
                          children: [
                            Expanded(child: Text('12.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600))),
                            Expanded(
                              flex: 2,
                              child: LinearProgressIndicator(
                                backgroundColor: greyScale.withOpacity(0.20),
                                borderRadius: BorderRadius.circular(30),
                                value: 0.3,
                                minHeight: 10,
                                color: blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }

  Widget check(constraints) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: notifire.getContentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child:  constraints < 600 ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Check Table'.tr,style: TextStyle(fontSize:  constraints / 20,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              PopupMenuButton(
                  tooltip: '',
                  padding: const EdgeInsets.all(0),
                  offset: Offset(rtl ? -25 : 25, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // initialValue: selectedMenu,
                  constraints: const BoxConstraints(
                    maxWidth: 100,
                    maxHeight: 350,
                  ),
                  color: notifire.getContentColor,
                  child:  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: notifire.getBgColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.more_horiz, color: blue),
                  ),
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
          SizedBox(
            width: constraints < 600 ? 1000 : constraints < 1665 ? 800 : constraints < 1400 ? 800 : 800,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(150),
                  1: FixedColumnWidth(120),
                  2: FixedColumnWidth(120),
                  3: FixedColumnWidth(120),
                },
                children: [
                  TableRow(
                    children: [
                      Text('NAME'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                      Text('PROGRESS'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                      Text('QUANTITY'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                      Text('DATE'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Divider(height: 10, color: greyScale),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Divider(height: 10,color: greyScale),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Divider(height: 10,color: greyScale),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Divider(height: 10,color: greyScale),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              side: const BorderSide(style: BorderStyle.solid),
                              activeColor: const Color(0xff595FE5),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              value: isActive,
                              onChanged: (val) {
                                setState(() {
                                  isActive = val!;
                                });
                              }),
                          Text('Instagram UI', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Text('80.2%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('4032', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('26/03/2020', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                    ],
                  ),
                  sizebox(),
                  TableRow(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              side: const BorderSide(style: BorderStyle.solid),
                              activeColor: const Color(0xff595FE5),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              value: isActive1,
                              onChanged: (val) {
                                setState(() {
                                  isActive1 = val!;
                                });
                              }),
                          Text('Instagram UI', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Text('35.2%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('4032', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('12/12/2023', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                    ],
                  ),
                  sizebox(),
                  TableRow(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              side: const BorderSide(style: BorderStyle.solid),
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
                          Text('Year Report'.tr, style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Text('8.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('551', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('10/06/2021', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                    ],
                  ),
                  sizebox(),
                  TableRow(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              side: const BorderSide(style: BorderStyle.solid),
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
                          Text('Marketing'.tr, style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Text('80.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('220', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('06/05/2017', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                    ],
                  ),
                  sizebox(),
                  TableRow(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              side: const BorderSide(style: BorderStyle.solid),
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
                          Text('Hotel Update'.tr, style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Text('12.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('223', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('20/01/2015', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                    ],
                  ),
                  sizebox(),
                  TableRow(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              side: const BorderSide(style: BorderStyle.solid),
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
                          Text('Instagram UI', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Text('35.2%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('4032', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('12/12/2023', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                    ],
                  ),
                  sizebox(),
                  TableRow(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              side: const BorderSide(style: BorderStyle.solid),
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
                          Text('Year Report'.tr, style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Text('8.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('551', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('10/06/2021', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ) : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Check Table'.tr,style: TextStyle(fontSize:  constraints / 60,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              PopupMenuButton(
                  tooltip: '',
                  padding: const EdgeInsets.all(0),
                  offset: Offset(rtl ? -25 : 25, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // initialValue: selectedMenu,
                  constraints: const BoxConstraints(
                    maxWidth: 100,
                    maxHeight: 350,
                  ),
                  color: notifire.getContentColor,
                  child:  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: notifire.getBgColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.more_horiz, color: blue),
                  ),
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
              width: constraints < 600 ? 800 : constraints < 1665 ? 800 : constraints < 1400 ? 800 : 800,
              child: Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(60),
                  1: FixedColumnWidth(60),
                  2: FixedColumnWidth(60),
                  3: FixedColumnWidth(15),
                },
                children: [
                  TableRow(
                    children: [
                      Text('NAME'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                      Text('PROGRESS'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                      Text('QUANTITY'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                      Text('DATE'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Divider(height: 10,color: greyScale),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Divider(height: 10,color: greyScale),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Divider(height: 10,color: greyScale),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Divider(height: 10,color: greyScale),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              side: BorderSide(color: greyScale),
                              activeColor: const Color(0xff595FE5),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              value: isActive,
                              onChanged: (val) {
                                setState(() {
                                  isActive = val!;
                                });
                              }),
                          Text('Instagram UI', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Text('80.2%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('4032', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('26/03/2020', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                    ],
                  ),
                  sizebox(),
                  TableRow(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              side: BorderSide(color: greyScale),
                              activeColor: const Color(0xff595FE5),
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              value: isActive1,
                              onChanged: (val) {
                                setState(() {
                                  isActive1 = val!;
                                });
                              }),
                          Text('Instagram UI', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Text('35.2%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('4032', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('12/12/2023', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                    ],
                  ),
                  sizebox(),
                  TableRow(
                    children: [
                      Row(
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
                          Text('Year Report'.tr, style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Text('8.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('551', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('10/06/2021', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                    ],
                  ),
                  sizebox(),
                  TableRow(
                    children: [
                      Row(
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
                          Text('Marketing'.tr, style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Text('80.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('220', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('06/05/2017', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                    ],
                  ),
                  sizebox(),
                  TableRow(
                    children: [
                      Row(
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
                          Text('Hotel Update'.tr, style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Text('12.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('223', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('20/01/2015', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                    ],
                  ),
                  sizebox(),
                  TableRow(
                    children: [
                      Row(
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
                          Text('Instagram UI', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Text('35.2%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('4032', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('12/12/2023', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                    ],
                  ),
                  sizebox(),
                  TableRow(
                    children: [
                      Row(
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
                          Text('Year Report'.tr, style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Text('8.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('551', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('10/06/2021', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget column(constraints) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: notifire.getContentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: constraints < 600 ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('4-Column Table'.tr,style: TextStyle(fontSize:  constraints / 20,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              PopupMenuButton(
                  tooltip: '',
                  padding: const EdgeInsets.all(0),
                  offset: Offset(rtl ? -25 : 25, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // initialValue: selectedMenu,
                  constraints: const BoxConstraints(
                    maxWidth: 100,
                    maxHeight: 350,
                  ),
                  color: notifire.getContentColor,
                  child:  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: notifire.getBgColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.more_horiz, color: blue),
                  ),
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
          SizedBox(
            width: constraints < 600 ? 1000 : constraints < 1665 ? 800 : constraints < 1400 ? 800 : 800,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(150),
                  1: FixedColumnWidth(120),
                  2: FixedColumnWidth(110),
                  3: FixedColumnWidth(120),
                },
                children: [
                  TableRow(
                    children: [
                      Text('NAME'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                      Text('PROGRESS'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                      Text('QUANTITY'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                      Text('Process'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Divider(height: 10,color: greyScale),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Divider(height: 10,color: greyScale),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Divider(height: 10,color: greyScale),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Divider(height: 10,color: greyScale),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Instagram UI', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('80.2%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('4032', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('12/02/2020', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                    ],
                  ),
                  sizebox(),
                  TableRow(
                    children: [
                      Text('Instagram UI', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('35.2%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('4032', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('12/11/2023', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                    ],
                  ),
                  sizebox(),
                  TableRow(
                    children: [
                      Text('Year Report'.tr, style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('8.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('551', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('02/06/2015', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                    ],
                  ),
                  sizebox(),
                  TableRow(
                    children: [
                      Text('Marketing'.tr, style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('80.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('220', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('12/05/2014', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                    ],
                  ),
                  sizebox(),
                  TableRow(
                    children: [
                      Text('Hotel Update'.tr, style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('12.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('223', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('20/12/2023  ', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                    ],
                  ),
                  sizebox(),
                  TableRow(
                    children: [
                      Text('Marketing'.tr, style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('80.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('220', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('12/05/2014', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                    ],
                  ),
                  // sizebox(),
                  // TableRow(
                  //   children: [
                  //     Text('Hotel Update', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                  //     Text('12.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                  //     Text('223', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                  //     Text('20/12/2023  ', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ],
      ) : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('4-Column Table'.tr,style: TextStyle(fontSize:  constraints / 60,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              PopupMenuButton(
                  tooltip: '',
                  padding: const EdgeInsets.all(0),
                  offset: Offset(rtl ? -25 : 25, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // initialValue: selectedMenu,
                  constraints: const BoxConstraints(
                    maxWidth: 100,
                    maxHeight: 350,
                  ),
                  color: notifire.getContentColor,
                  child:  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: notifire.getBgColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.more_horiz, color: blue),
                  ),
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
              width: constraints < 600 ? 600 : constraints < 1665 ? 800 : constraints < 1400 ? 800 : 800,
              child: Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(60),
                  1: FixedColumnWidth(60),
                  2: FixedColumnWidth(60),
                  3: FixedColumnWidth(15),
                },
                children: [
                  TableRow(
                    children: [
                      Text('NAME'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                      Text('PROGRESS'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                      Text('QUANTITY'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                      Text('Process'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                    ],
                  ),
                  TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Divider(height: 10,color: greyScale),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Divider(height: 10,color: greyScale),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Divider(height: 10,color: greyScale),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Divider(height: 10,color: greyScale),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Instagram UI', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('80.2%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('4032', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('12/02/2020', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                    ],
                  ),
                  sizebox(),
                  TableRow(
                    children: [
                      Text('Instagram UI', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('35.2%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('4032', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('12/11/2023', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                    ],
                  ),
                  sizebox(),
                  TableRow(
                    children: [
                      Text('Year Report'.tr, style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('8.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('551', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('02/06/2015', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                    ],
                  ),
                  sizebox(),
                  TableRow(
                    children: [
                      Text('Marketing'.tr, style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('80.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('220', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('12/05/2014', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                    ],
                  ),
                  sizebox(),
                  TableRow(
                    children: [
                      Text('Hotel Update'.tr, style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('12.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('223', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('20/12/2023  ', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                    ],
                  ),
                  sizebox(),
                  TableRow(
                    children: [
                      Text('Marketing'.tr, style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('80.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('220', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Text('12/05/2014', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                    ],
                  ),
                  // sizebox(),
                  // TableRow(
                  //   children: [
                  //     Text('Hotel Update', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                  //     Text('12.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                  //     Text('223', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                  //     Text('20/12/2023  ', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget complex(constraints) {
    return GetBuilder<PaginationController>(
      builder:(paginationController) {
        return  Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: notifire.getContentColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: constraints < 600 ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Complex Table'.tr,style: TextStyle(fontSize:  constraints / 20,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                  PopupMenuButton(
                    tooltip: '',
                    padding: const EdgeInsets.all(0),
                    offset: Offset(rtl ? -25 : 25, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // initialValue: selectedMenu,
                    constraints: const BoxConstraints(
                      maxWidth: 100,
                      maxHeight: 350,
                    ),
                    color: notifire.getContentColor,
                    child:  Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: notifire.getBgColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.more_horiz, color: blue),
                    ),
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
              SizedBox(
                width: constraints < 600 ? 1000 : constraints < 1665 ? 800 : constraints < 1400 ? 800 : 800,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Table(
                    columnWidths: const <int, TableColumnWidth>{
                      0: FixedColumnWidth(120),
                      1: FixedColumnWidth(140),
                      2: FixedColumnWidth(120),
                      3: FixedColumnWidth(120),
                    },
                    children: [
                      TableRow(
                        children: [
                          Text('NAME'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                          Text('STATUS'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                          Text('QUANTITY'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                          Text('DATE'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Divider(height: 10,color: greyScale),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Divider(height: 10,color: greyScale),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Divider(height: 10,color: greyScale),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Divider(height: 10,color: greyScale),
                          ),
                        ],
                      ),
                      for (var a = paginationController.loadmore; a < paginationController.selectindex; a++)
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(paginationController.name[a].toString().tr, style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                children: [
                                  Image.asset(paginationController.statusImg[a],height: 20),
                                  const SizedBox(width: 10),
                                  Text(paginationController.statusTitle[a], style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(paginationController.quantity[a], style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(paginationController.date[a], style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        paginationController.scrollController.animateTo(-40, duration: const Duration(milliseconds: 1000), curve: Curves.bounceOut);
                      },
                      child: Icon(Icons.chevron_left,color: notifire.getContainer,)
                  ),
                  SizedBox(
                    height: 37,
                    width: 140,
                    child: Center(
                      child: ListView.builder(
                        controller: paginationController.scrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              // setState(() {
                              //   listtiletitle.shuffle();
                              // });
                              paginationController.setloadmore(paginationController.selectpage);
                              paginationController.setpage(index);
                            },

                            child: Container(
                                width: 37,
                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: paginationController.selectpage == index? blue : greyScale),
                                    color: Colors.transparent
                                ),
                                child: Center(child: Text("$index",style: TextStyle(color: paginationController.selectpage == index? blue : greyScale),))),
                          );
                        },),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        paginationController.scrollController.animateTo(10 * 100, duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);
                      },
                      child: Icon(Icons.chevron_right,color: notifire.getContainer,)
                  ),
                ],
              ),
            ],
          ) : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Complex Table'.tr, style: TextStyle(fontSize:  constraints / 60,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                  PopupMenuButton(
                    tooltip: '',
                    padding: const EdgeInsets.all(0),
                    offset: Offset(rtl ? -25 : 25, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // initialValue: selectedMenu,
                    constraints: const BoxConstraints(
                      maxWidth: 100,
                      maxHeight: 350,
                    ),
                    color: notifire.getContentColor,
                    child:  Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: notifire.getBgColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.more_horiz, color: blue),
                    ),
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
                  width: constraints < 600 ? 700 : constraints < 1665 ? 800 : constraints < 1400 ? 800 : 800,
                  child: Table(
                    columnWidths: const <int, TableColumnWidth>{
                      0: FixedColumnWidth(60),
                      1: FixedColumnWidth(60),
                      2: FixedColumnWidth(60),
                      3: FixedColumnWidth(15),
                    },
                    children: [
                      TableRow(
                        children: [
                          Text('NAME'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                          Text('STATUS'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                          Text('QUANTITY'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                          Text('DATE'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                        ],
                      ),
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Divider(height: 10,color: greyScale),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Divider(height: 10,color: greyScale),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Divider(height: 10,color: greyScale),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Divider(height: 10,color: greyScale),
                          ),
                        ],
                      ),
                      for (var a = paginationController.loadmore; a < paginationController.selectindex; a++)
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(paginationController.name[a].toString().tr, style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Image.asset(paginationController.statusImg[a],height: 20),
                                const SizedBox(width: 10),
                                Text(paginationController.statusTitle[a], style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(paginationController.quantity[a], style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(paginationController.date[a], style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        paginationController.scrollController.animateTo(-40, duration: const Duration(milliseconds: 1000), curve: Curves.bounceOut);
                      },
                      child: Icon(Icons.chevron_left,color: notifire.getContainer,)
                  ),
                  SizedBox(
                    height: 37,
                    width: 140,
                    child: Center(
                      child: ListView.builder(
                        controller: paginationController.scrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              // setState(() {
                              //   listtiletitle.shuffle();
                              // });
                              paginationController.setloadmore(paginationController.selectpage);
                              paginationController.setpage(index);
                            },

                            child: Container(
                                width: 37,
                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: paginationController.selectpage == index? blue : greyScale),
                                    color: Colors.transparent
                                ),
                                child: Center(child: Text("$index",style: TextStyle(color: paginationController.selectpage == index? blue : greyScale),))),
                          );
                        },),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        paginationController.scrollController.animateTo(10 * 100, duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);
                      },
                      child: Icon(Icons.chevron_right,color: notifire.getContainer,)
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  TableRow sizebox() {
    return const TableRow(
      children: [
        SizedBox(height: 30),
        SizedBox(height: 30),
        SizedBox(height: 30),
        SizedBox(height: 30),
      ],
    );
  }
}
