// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sitecycle/app/config/colors.dart';
import 'package:sitecycle/app/config/controller/all_controller.dart';
import 'package:sitecycle/app/config/dark_ligthmode.dart';
import 'package:sitecycle/app/config/fontfamily_modal.dart';
import 'package:sitecycle/app/config/images.dart';
import 'package:sitecycle/app/config/list_modal.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


class DataTableScreen extends StatefulWidget {
  const DataTableScreen({super.key});

  @override
  State<DataTableScreen> createState() => _DataTableScreenState();
}

class _DataTableScreenState extends State<DataTableScreen> {
  late ColorNotifire notifire;
  InboxController inboxController = Get.put(InboxController());
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of(context,listen: true);
    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.maxWidth < 600) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                title(constraints.maxWidth),
                dataTable(constraints.maxWidth),
              ],
            ),
          );
        } else if(constraints.maxWidth < 1000) {
          return  Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                title(constraints.maxWidth),
                dataTable(constraints.maxWidth),
              ],
            ),
          );
        } else{
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                title(constraints.maxWidth),
                dataTable(constraints.maxWidth),
              ],
            ),
          );
        }
      },
    );
  }
  Widget title(constraints) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            style: TextStyle(color: notifire.getContainer,fontFamily: FontFamily.qBold),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 10),
              prefixIcon: Icon(Icons.search,color: greyScale),
              hintText: 'Find Friends'.tr,
              hintStyle:  TextStyle(fontFamily: FontFamily.qBold,color: greyScale),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: notifire.isDark ? greyScale : blue)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: greyBorder)),
              disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: greyBorder)),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide:  BorderSide(color: greyScale)),
            ),
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: () {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return Dialog(
                    backgroundColor: notifire.getContentColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: SizedBox(
                      width: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Add New User'.tr,style: TextStyle(fontSize: 18,color: notifire.getContainer,fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(child: textfield(hintText: 'Name'.tr)),
                                const SizedBox(width: 10),
                                Expanded(child: textfield(hintText: 'Username'.tr)),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(child: textfield(hintText: 'Email'.tr)),
                                const SizedBox(width: 10),
                                Expanded(child: textfield(hintText: 'Date Of Birth'.tr)),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(child: textfield(hintText: 'Phone'.tr)),
                                const SizedBox(width: 10),
                                Expanded(child: textfield(hintText: 'Address'.tr)),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(child: textfield(hintText: 'Position'.tr)),
                                const SizedBox(width: 10),
                                Expanded(child: textfield(hintText: 'Experience'.tr)),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(child: textfield(hintText: 'Team Size'.tr)),
                                const SizedBox(width: 10),
                                Expanded(child: textfield(hintText: 'Status'.tr)),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: blue),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(child: Text('Cancel'.tr,style: TextStyle(color: blue,fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700))),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: blue,
                                        border: Border.all(color: blue),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(child: Text('Save'.tr.tr,style: const TextStyle(color: Colors.white,fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700))),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
            );
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: blue,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Text('Add Employee'.tr,style: const TextStyle(color: Colors.white,fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                const SizedBox(width: 10),
                const Icon(Icons.add,color: Colors.white),
              ],
            ),
          ),
        ),
      ],
    );
  }

  var dropdownValue;
  var dropdownValue1;
  var dropdownValue2;
  Widget dataTable(constraints) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: notifire.getContentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: constraints < 1500 ? 1200 : 1650,
              child: Table(
                columnWidths: const {
                  0: FixedColumnWidth(50),
                  5: FixedColumnWidth(230),
                },
                children: [
                  TableRow(
                    children: [
                      Checkbox(
                        side: BorderSide(color: greyScale),
                        activeColor: blue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        value: inboxController.checkboxis,
                        onChanged: (value) {
                          inboxController.setchekboxis(inboxController.checkboxis = !inboxController.checkboxis);
                          if (inboxController.checkboxis == true) {
                            for (var a = 0; a <= inboxController.listtiletitle.length; a++) {
                              setState(() {
                                inboxController.checkBox.add(a);
                              });
                            }
                          } else {
                            setState(() {
                              inboxController.checkBox.clear();
                            });
                          }
                        },
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name'.tr,style: TextStyle(color: notifire.getContainer,fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w500)),
                          Padding(
                            padding: const EdgeInsets.only(right: 15,top: 10),
                            child: SizedBox(
                              height: 40,
                              child: TextField(
                                style: TextStyle(color: notifire.getContainer,fontFamily: FontFamily.qBold),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(top: 10,left: 10),
                                  suffixIcon: Icon(Icons.search,color: greyScale),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: notifire.textfieldborder)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: notifire.darktextfieldborder)),
                                  disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: greyBorder)),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:  BorderSide(color: greyBorder)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Position'.tr,style: TextStyle(color: notifire.getContainer,fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: 50,
                            child: DropdownButtonFormField(
                              padding: const EdgeInsets.only(right: 15,top: 10),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: greyBorder),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: notifire.darktextfieldborder),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: greyBorder),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: notifire.darktextfieldborder),
                                ),
                              ),
                              icon: Icon(Icons.keyboard_arrow_down,color: greyScale),
                              dropdownColor: Colors.white,
                              onChanged: (newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              value: dropdownValue,
                              items: modal().position.map<DropdownMenuItem>((item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item,style: TextStyle(color: greyScale,fontFamily: FontFamily.qRegular)),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Team'.tr,style: TextStyle(color: notifire.getContainer,fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w500)),
                          Padding(
                            padding: const EdgeInsets.only(right: 15,top: 10),
                            child: SizedBox(
                              height: 40,
                              child: TextField(
                                style: TextStyle(color: notifire.getContainer,fontFamily: FontFamily.qBold),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(top: 10,left: 10),
                                  suffixIcon: Icon(Icons.search,color: greyScale),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:  BorderSide(color: notifire.textfieldborder)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:  BorderSide(color: notifire.darktextfieldborder)),
                                  disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:  BorderSide(color:greyBorder)),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:  BorderSide(color: greyBorder)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Birth Date'.tr,style: TextStyle(color: notifire.getContainer,fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w500)),
                          Padding(
                            padding: const EdgeInsets.only(right: 15,top: 10),
                            child: SizedBox(
                              height: 40,
                              child: TextField(
                                readOnly: true,
                                style:  TextStyle(color: greyScale,fontFamily: FontFamily.qBold),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(top: 10,left: 10),
                                  hintText: startDate ?? "DD/MM/yyyy",
                                  hintStyle: TextStyle(fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700,color: greyScale),
                                  suffixIcon: InkWell(
                                      onTap: () {
                                        buildDialog();
                                      },
                                      child: Icon(Icons.date_range_outlined,color: greyScale)),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:  BorderSide(color: notifire.textfieldborder)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:  BorderSide(color: notifire.darktextfieldborder)),
                                  disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:  BorderSide(color:greyBorder)),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:  BorderSide(color: greyBorder)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email'.tr, style: TextStyle(color: notifire.getContainer,fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w500)),
                          Padding(
                            padding: const EdgeInsets.only(right: 15,top: 10),
                            child: SizedBox(
                              height: 40,
                              child: TextField(
                                style: TextStyle(color: notifire.getContainer,fontFamily: FontFamily.qBold),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(top: 10,left: 10),
                                  suffixIcon: Icon(Icons.search,color: greyScale),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:  BorderSide(color: notifire.textfieldborder)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:  BorderSide(color: notifire.darktextfieldborder)),
                                  disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:  BorderSide(color: greyBorder)),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide:  BorderSide(color: greyBorder)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Address'.tr,style: TextStyle(color: notifire.getContainer,fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: 50,
                            child: DropdownButtonFormField(
                              padding: const EdgeInsets.only(right: 15,top: 10),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: greyBorder),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: notifire.darktextfieldborder),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: greyBorder),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: notifire.darktextfieldborder),
                                ),
                              ),
                              icon: Icon(Icons.keyboard_arrow_down,color: greyScale),
                              dropdownColor: Colors.white,
                              onChanged: (newValue) {
                                setState(() {
                                  dropdownValue1 = newValue!;
                                });
                              },
                              value: dropdownValue1,
                              items: modal().addressName.map<DropdownMenuItem>((item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item,style: TextStyle(color: greyScale,fontFamily: FontFamily.qRegular)),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Status'.tr,style: TextStyle(color: notifire.getContainer,fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: 50,
                            child: DropdownButtonFormField(
                              padding: const EdgeInsets.only(right: 15,top: 10),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(bottom: 10,left: 10,right: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: greyBorder),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: notifire.darktextfieldborder),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: greyBorder),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: notifire.darktextfieldborder),
                                ),
                              ),
                              icon: Icon(Icons.keyboard_arrow_down,color: greyScale),
                              dropdownColor: Colors.white,
                              onChanged: (newValue) {
                                setState(() {
                                  dropdownValue2 = newValue!;
                                });
                              },
                              value: dropdownValue2,
                              items: modal().statusName.map<DropdownMenuItem>((item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item,style: TextStyle(color: greyScale,fontFamily: FontFamily.qRegular)),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      Divider(color: Colors.grey.withOpacity(0.4), height: 30),
                      Divider(color: Colors.grey.withOpacity(0.4), height: 30),
                      Divider(color: Colors.grey.withOpacity(0.4), height: 30),
                      Divider(color: Colors.grey.withOpacity(0.4), height: 30),
                      Divider(color: Colors.grey.withOpacity(0.4), height: 30),
                      Divider(color: Colors.grey.withOpacity(0.4), height: 30),
                      Divider(color: Colors.grey.withOpacity(0.4), height: 30),
                      Divider(color: Colors.grey.withOpacity(0.4), height: 30),
                    ],
                  ),
                  for (var a = inboxController.loadmore; a < inboxController.loadmore + inboxController.selectindex; a++)
                    TableRow(
                        children: [
                          Padding(
                            padding:  const EdgeInsets.symmetric(vertical:  25),
                            child: Center(
                              child: SizedBox(
                                  height: 22,
                                  width: 22,
                                  child: Checkbox(
                                    activeColor: blue,
                                    side: BorderSide(
                                        color: greyScale),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                    value: inboxController.checkBox.contains(a) ? true : false,
                                    onChanged: (value) {
                                      setState(() {
                                        inboxController.selcetcheckbox(a);
                                      });
                                    },
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: ListTile(
                              title: Text(inboxController.listtiletitle[a], style: TextStyle(color: notifire.getContainer,fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                              leading: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset(Appcontent.sales2,fit: BoxFit.fill,),),
                              dense: true,
                              contentPadding: const EdgeInsets.all(0),
                              subtitle: Padding(
                                padding:
                                const EdgeInsets.only(top: 5),
                                child: Text("INV110XXX", style: TextStyle(color: greyScale,fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w500)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(inboxController.date[a], style: TextStyle(color: notifire.getContainer,fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                                Text(inboxController.year[a], style: TextStyle(color: greyScale,fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w500)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(inboxController.clint[a], style: TextStyle(color: notifire.getContainer,fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(inboxController.birthDate[a], style: TextStyle(color: notifire.getContainer,fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(inboxController.timeJob[a], style: TextStyle(color: notifire.getContainer,fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(inboxController.address[a], style: TextStyle(color: notifire.getContainer,fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(inboxController.timeJob[a], style: TextStyle(color: notifire.getContainer,fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                          ),
                        ]),
                ],
              ),
            ),
          ),
          GetBuilder<InboxController> (
              builder: (inboxController) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Show result:".tr, style: TextStyle(color: notifire.getContainer),overflow: TextOverflow.ellipsis,maxLines: 1),
                          const SizedBox(width: 10),
                          Flexible(
                            child: PopupMenuButton(
                              tooltip: "",
                              offset: const Offset(0, -50),
                              constraints: const BoxConstraints(maxWidth: 60, minWidth: 60,maxHeight: 120,minHeight: 120),
                              onOpened: () {
                                inboxController.setmenuu(true);
                              },
                              onCanceled: () {
                                inboxController.setmenuu(false);
                              },
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              color: notifire.getBgColor,
                              child: Container(
                                height: 37,
                                width: 68,
                                decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.withOpacity(0.4))),
                                child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      Text(inboxController.selectindex.toString(), style: TextStyle(color: notifire.getContainer)),
                                    ]),
                              ),
                              itemBuilder: (context) {
                                return [
                                  PopupMenuItem(
                                      enabled: false,
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                              onTap: () {
                                                setState(() {
                                                  inboxController.setindexforitem(5);
                                                  Get.back();
                                                });
                                              },
                                              child: Text("5", style: TextStyle(color: notifire.getContainer))),
                                          const SizedBox(height: 10),
                                          InkWell(
                                              onTap: () {
                                                setState(() {
                                                  inboxController.setindexforitem(6);
                                                  Get.back();
                                                });
                                              },
                                              child: Text("6", style: TextStyle(color: notifire.getContainer))),
                                          const SizedBox(height: 10),
                                          InkWell(
                                              onTap: () {
                                                setState(() {
                                                  inboxController.setindexforitem(7);
                                                  Get.back();
                                                });
                                              },
                                              child: Text("7", style: TextStyle(color: notifire.getContainer))),
                                          const SizedBox(height: 10),
                                          InkWell(
                                              onTap: () {
                                                setState(() {
                                                  inboxController.setindexforitem(10);
                                                  Get.back();
                                                });
                                              },
                                              child: Text("10", style: TextStyle(color: notifire.getContainer))),
                                        ],
                                      )),
                                ];
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    constraints < 600 ? const Spacer() : const SizedBox(width: 100,),
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              setState(() {
                                inboxController.scrollController.animateTo(-40, duration: const Duration(milliseconds: 1000), curve: Curves.bounceOut);
                              });
                            },
                            child: Icon(Icons.chevron_left,color: notifire.getContainer,)
                        ),
                        SizedBox(
                          height: 37,
                          width: 140,
                          child: Center(
                            child: ListView.builder(
                              controller: inboxController.scrollController,
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      inboxController.setloadmore(inboxController.selectpage);
                                      inboxController.setpage(index);
                                    });
                                  },

                                  child: Container(
                                      width: 37,
                                      margin: const EdgeInsets.symmetric(horizontal: 5),
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(color: inboxController.selectpage == index? blue : greyScale),
                                          color: Colors.transparent
                                      ),
                                      child: Center(child: Text("$index",style: TextStyle(color: inboxController.selectpage == index? blue : greyScale),))),
                                );
                              },),
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              setState(() {
                                inboxController.scrollController.animateTo(10 * 100, duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);
                              });
                            },
                            child: Icon(Icons.chevron_right,color: notifire.getContainer,)
                        ),
                      ],
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }

  DateRangePickerController dateSelect = DateRangePickerController();
  var startDate;
  void buildDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          alignment: Alignment.center,
          insetAnimationCurve: Easing.linear,
          surfaceTintColor: Colors.transparent,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            height: 300,
            width: 400,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SfDateRangePicker(
                controller: dateSelect,
                enableMultiView: false,
                monthCellStyle: DateRangePickerMonthCellStyle(
                  todayCellDecoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  textStyle: const TextStyle(
                    fontFamily: 'gilroymed',
                    fontSize: 14,
                  ),
                  blackoutDateTextStyle: const TextStyle(
                    fontFamily: 'gilroymed',
                    fontSize: 14,
                  ),
                  todayTextStyle: TextStyle(
                    fontFamily: 'gilroymed',
                    fontSize: 14,
                    color: blue,
                  ),
                ),
                monthViewSettings: const DateRangePickerMonthViewSettings(
                  viewHeaderStyle: DateRangePickerViewHeaderStyle(
                    textStyle: TextStyle(fontFamily: 'gilroymed', fontSize: 14),
                  ),
                ),
                onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
                  setState(() {
                    startDate = DateFormat('dd/MM/yyyy').format(DateTime.parse(dateSelect.selectedDate.toString().split(" ").first));
                  });
                },
                backgroundColor: Colors.white,
                view: DateRangePickerView.month,
                startRangeSelectionColor: blue,
                endRangeSelectionColor: blue,
                rangeSelectionColor: greyScale,
                selectionColor: blue,
                selectionRadius: 50,
                viewSpacing: 30,
                selectionTextStyle:
                const TextStyle(fontFamily: 'gilroymed', fontSize: 14),
                headerStyle: const DateRangePickerHeaderStyle(
                  textStyle: TextStyle(fontFamily: 'gilroysemi', fontSize: 18),
                ),
                selectionMode: DateRangePickerSelectionMode.single,
                rangeTextStyle:
                const TextStyle(fontFamily: 'gilroymed', fontSize: 14),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget dataColumn1({required String title, required bool iscenter}) {
    return Row(
      mainAxisAlignment: iscenter ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: notifire.getContainer)),
      ],
    );
  }

  Widget textfield({required String hintText}) {
    return TextField(
      style: TextStyle(color: notifire.getContainer, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xffE6E6E6), fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w500),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(width: 2, color: notifire.textfieldborder)),
        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(width: 2, color: greyBorder)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(width: 2, color: notifire.darktextfieldborder)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(width: 2,color: greyBorder)),
      ),
    );
  }
}
