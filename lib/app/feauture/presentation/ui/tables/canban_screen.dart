// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sitecycle/app/config/colors.dart';
import 'package:sitecycle/app/config/dark_ligthmode.dart';
import 'package:sitecycle/app/config/fontfamily_modal.dart';
import 'package:sitecycle/app/config/images.dart';
import 'package:sitecycle/app/config/list_modal.dart';
import 'package:sitecycle/app/feauture/presentation/ui/mq.dart';



class CanBanScreen extends StatefulWidget {
  const CanBanScreen({super.key});

  @override
  State<CanBanScreen> createState() => _CanBanScreenState();
}

class _CanBanScreenState extends State<CanBanScreen> {
  late ColorNotifire notifire;
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of(context,listen: true);
    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.maxWidth < 600) {
          return Container(
            color: notifire.getBgColor,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                backlog(constraints.maxWidth),
                const SizedBox(height: 15),
                inProgress(constraints.maxWidth),
                const SizedBox(height: 15),
                done(constraints.maxWidth),
              ],
            ),
          );
        } else if(constraints.maxWidth < 1000) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: backlog(constraints.maxWidth)),
                      const SizedBox(width: 15),
                      Expanded(child: inProgress(constraints.maxWidth)),
                      const SizedBox(width: 15),
                      Expanded(child: done(constraints.maxWidth)),
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
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: backlog(constraints.maxWidth)),
                      const SizedBox(width: 15),
                      Expanded(child: inProgress(constraints.maxWidth)),
                      const SizedBox(width: 15),
                      Expanded(child: done(constraints.maxWidth)),
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
  Widget backlog(constraints) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: notifire.getContentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          constraints < 600 ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Backlog'.tr,style: TextStyle(fontSize: constraints / 20,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              InkWell(
                onTap: () {
                  popup();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                  decoration: BoxDecoration(
                    color: notifire.getBgColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.add,color: blue),
                ),
              ),
            ],
          ) : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Backlog'.tr,style: TextStyle(fontSize: constraints / 60,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              InkWell(
                onTap: () {
                  popup();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                  decoration: BoxDecoration(
                    color: notifire.getBgColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.add,color: blue),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: modal().backlogTitle.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: notifire.getBgColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text(modal().backlogTitle[index].toString().tr,style: TextStyle(color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                        InkWell(
                            onTap: () {},
                            child: Icon(Icons.edit,size: 15,color: greyScale)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(modal().backlogSubtitle[index].toString().tr,style: TextStyle(color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w400)),
                    const SizedBox(height: 15),
                    index == 1 ? ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset(Appcontent.miracleBacklog,fit: BoxFit.fill,),) : const SizedBox(),
                    const SizedBox(height: 15),
                    constraints < 980 ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            const CircleAvatar(backgroundImage: AssetImage(Appcontent.boy18)),
                            Positioned(
                                left: rtl ? -20 : 20,
                                child: const CircleAvatar(backgroundImage: AssetImage(Appcontent.girl18))),
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                            decoration: BoxDecoration(
                              color: modal().statusColor[index],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(modal().backlogStatus[index].toString().tr,style: const TextStyle(color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ],
                    ) : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            const CircleAvatar(backgroundImage: AssetImage(Appcontent.boy18)),
                            Positioned(
                                left: rtl ? -20 : 20,
                                child: const CircleAvatar(backgroundImage: AssetImage(Appcontent.girl18))),
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                            decoration: BoxDecoration(
                              color: modal().statusColor[index],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(modal().backlogStatus[index].toString().tr,style: const TextStyle(color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget inProgress(constraints) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: notifire.getContentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          constraints < 600 ? Row (
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('In progress'.tr,style: TextStyle(fontSize: constraints / 20,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              InkWell(
                onTap: () {
                  popup();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                  decoration: BoxDecoration(
                    color: notifire.getBgColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.add,color: blue),
                ),
              ),
            ],
          ) : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('In progress'.tr, style: TextStyle(fontSize: constraints / 60,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              InkWell(
                onTap: () {
                  popup();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                  decoration: BoxDecoration(
                    color: notifire.getBgColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.add,color: blue),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: modal().progressTitle.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: notifire.getBgColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text(modal().progressTitle[index].toString().tr,style: TextStyle(color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                        InkWell(
                            onTap: () {},
                            child: Icon(Icons.edit,size: 15,color: greyScale)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(modal().progressSubtitle[index].toString().tr,style: TextStyle(color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w400)),
                    const SizedBox(height: 15),
                    index == 2 ? ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset(Appcontent.miracleInprogress,fit: BoxFit.fill,),) : const SizedBox(),
                    const SizedBox(height: 15),
                    constraints < 980 ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            const CircleAvatar(backgroundImage: AssetImage(Appcontent.boy18)),
                            Positioned(
                                left: rtl ? -20 : 20,
                                child: const CircleAvatar(backgroundImage: AssetImage(Appcontent.girl18))),
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                            decoration: BoxDecoration(
                              color: modal().progressColor[index],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(modal().progressStatus[index].toString().tr,style: const TextStyle(color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ],
                    ) : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            const CircleAvatar(backgroundImage: AssetImage(Appcontent.boy18)),
                            Positioned(
                                left: rtl ? -20 : 20,
                                child: const CircleAvatar(backgroundImage: AssetImage(Appcontent.girl18))),
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                            decoration: BoxDecoration(
                              color: modal().progressColor[index],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(modal().progressStatus[index].toString().tr,style: const TextStyle(color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget done(constraints) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: notifire.getContentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          constraints < 600 ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Done'.tr,style: TextStyle(fontSize: constraints / 20,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              InkWell(
                onTap: () {
                  popup();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                  decoration: BoxDecoration(
                    color: notifire.getBgColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.add,color: blue),
                ),
              ),
            ],
          ) : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Done'.tr,style: TextStyle(fontSize: constraints / 60,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              InkWell(
                onTap: () {
                  popup();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                  decoration: BoxDecoration(
                    color: notifire.getBgColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.add,color: blue),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: modal().doneTitle.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: notifire.getBgColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: Text(modal().doneTitle[index].toString().tr,style: TextStyle(color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                        InkWell(
                            onTap: () {},
                            child: Icon(Icons.edit,size: 15,color: greyScale)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(modal().doneSubtitle[index].toString().tr,style: TextStyle(color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w400)),
                    const SizedBox(height: 15),
                    constraints < 980 ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            const CircleAvatar(backgroundImage: AssetImage(Appcontent.boy18)),
                            Positioned(
                                left: rtl ? -20 : 20,
                                child: const CircleAvatar(backgroundImage: AssetImage(Appcontent.girl18))),
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                            decoration: BoxDecoration(
                              color: const Color(0xff01B574),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text('DONE'.tr,style: const TextStyle(color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ],
                    ) : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            const CircleAvatar(backgroundImage: AssetImage(Appcontent.boy18)),
                            Positioned(
                                left: rtl ? -20 : 20,
                                child: const CircleAvatar(backgroundImage: AssetImage(Appcontent.girl18))),
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                            decoration: BoxDecoration(
                              color: const Color(0xff01B574),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text('DONE'.tr,style: const TextStyle(color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }


  Widget textfield({required String hintText}) {
    return TextField(
      style: TextStyle(color: notifire.getContainer,fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(height: 1,color: greyScale,fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w500),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: notifire.textfieldborder)),
        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: greyBorder)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: notifire.darktextfieldborder)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(color: greyBorder)),
      ),
    );
  }

  var dropdownValue;
  var dropdownValue1;
  Future popup() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: notifire.getContentColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            height: 500,
            width: 400,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: notifire.getContentColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child:  Icon(Icons.close,color: notifire.getContainer)),
                ),

                Align(
                  alignment: Alignment.center,
                  child:  Text('Add Log'.tr,style: TextStyle(height: 1,fontSize: 30,color: notifire.getContainer,fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                ),

                const Spacer(),
                textfield(hintText: 'Title'.tr),
                const SizedBox(height: 15),
                textfield(hintText: 'Subtitle'.tr),
                const SizedBox(height: 15),
                Text('Person Name'.tr,style: TextStyle(height: 1,color: notifire.getContainer,fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                DropdownButtonFormField(
                  padding: const EdgeInsets.only(top: 10),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: notifire.getContainer,fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w500),
                    hintText: 'Search Person'.tr,
                    contentPadding: const EdgeInsets.only(bottom: 18,left: 10,right: 10, top: 18),
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
                  items: modal().personName.map<DropdownMenuItem>((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item,style: TextStyle(color: greyScale,fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 15),
                Text('Status'.tr,style: TextStyle(height: 1,color: notifire.getContainer,fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                DropdownButtonFormField(
                  padding: const EdgeInsets.only(top: 10),
                  decoration: InputDecoration(
                    hintText: 'Search Status'.tr,
                    hintStyle: TextStyle(color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w500),
                    contentPadding: const EdgeInsets.only(bottom: 18, top: 18,left: 10,right: 10),
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
                  items: modal().progressStatus.map<DropdownMenuItem>((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item,style: TextStyle(color: greyScale,fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                    );
                  }).toList(),
                ),


                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          side: BorderSide(color: greyScale),
                          fixedSize: Size(Get.width, 50),
                        ),
                          onPressed: () {
                             Get.back();
                          },
                          child:  Text('Close'.tr,style: TextStyle(height: 1,color: greyScale,fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w500)),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: blue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          fixedSize: Size(Get.width, 50),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                        child:  Text('Add'.tr,style: const TextStyle(height: 1,color: Colors.white,fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
