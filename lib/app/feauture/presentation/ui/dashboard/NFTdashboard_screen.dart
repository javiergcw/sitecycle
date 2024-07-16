// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:sitecycle/app/config/colors.dart';
import 'package:sitecycle/app/config/dark_ligthmode.dart';
import 'package:sitecycle/app/config/fontfamily_modal.dart';
import 'package:sitecycle/app/config/images.dart';
import 'package:sitecycle/app/config/list_modal.dart';
import 'package:sitecycle/app/feauture/presentation/ui/mq.dart';

class MarketPlaceScreen extends StatefulWidget {
  const MarketPlaceScreen({super.key});

  @override
  State<MarketPlaceScreen> createState() => _MarketPlaceScreenState();
}

class _MarketPlaceScreenState extends State<MarketPlaceScreen> {
  late ColorNotifire notifire;
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of(context,listen: true);
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
                    discover(constraints.maxWidth),
                    const SizedBox(height: 20),
                    creators(constraints.maxWidth),
                    const SizedBox(height: 20),
                    history(constraints.maxWidth),
                    const SizedBox(height: 20),
                    nfts(constraints.maxWidth),
                    const SizedBox(height: 20),
                    trending(constraints.maxWidth),
                    const SizedBox(height: 10),
                    recently(constraints.maxWidth),
                    const SizedBox(height: 20),
                    recently1(constraints.maxWidth),
                  ],
                ),
            ),
          );
        } else if(constraints.maxWidth < 1000) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          discover(constraints.maxWidth),
                          const SizedBox(height: 30),
                          nfts(constraints.maxWidth),
                          const SizedBox(height: 20),
                          trending(constraints.maxWidth),
                          const SizedBox(height: 30),
                          recently(constraints.maxWidth),
                          const SizedBox(height: 40),
                          recently1(constraints.maxWidth),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          creators(constraints.maxWidth),
                          const SizedBox(height: 20),
                          history(constraints.maxWidth),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            discover(constraints.maxWidth),
                            const SizedBox(height: 30),
                            nfts(constraints.maxWidth),
                            const SizedBox(height: 20),
                            trending(constraints.maxWidth),
                            const SizedBox(height: 30),
                            recently(constraints.maxWidth),
                            const SizedBox(height: 30),
                            recently1(constraints.maxWidth),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              creators(constraints.maxWidth),
                              const SizedBox(height: 20),
                              history(constraints.maxWidth),
                            ],
                          ),
                      ),
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
  Widget discover(constraints) {
    return constraints < 600 ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 300,
          padding: EdgeInsets.only(left: rtl ? 30 : 30, right: rtl ? 30 : 0, top: 30,bottom: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(image: AssetImage(Appcontent.nftBg),fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "Discover, collect, and".tr,
                      style: TextStyle(fontSize: constraints / 15,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),
                      children: [
                        TextSpan(
                            text: "\n",
                            children: [
                              TextSpan(
                                  text: "sell extraordinary NFTs".tr,
                                style: TextStyle(fontSize: constraints / 15,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),
                              )
                            ]
                        )
                      ]
                  )),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "Enter in this creative world. Discover now the".tr,
                      style: TextStyle(fontSize: constraints / 30,color: Colors.white,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                            text: "\n",
                            children: [
                              TextSpan(
                                text: "latest NFTs or start creating your own!".tr,
                                style: TextStyle(fontSize: constraints / 30,color: Colors.white,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w500),
                              )
                            ]
                        )
                      ]
                  )),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 45,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:  Center(child: Text('Discover now'.tr,style: TextStyle(fontSize: constraints / 30,color: Colors.black,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                    ),
                  ),
                  const SizedBox(width: 30),
                  InkWell(
                      onTap: () {},
                      child: Text('Watch video'.tr,style: TextStyle(fontSize: constraints / 30,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                ],
              ),
            ],
          ),
        ),
      ],
    ) : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 300,
          padding: EdgeInsets.only(left: rtl ? 0 : 50, right: rtl ? 50 : 0, top: 30,bottom: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(image: AssetImage(Appcontent.nftBg),fit: BoxFit.cover),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                      text: "Discover, collect, and".tr,
                      style: const TextStyle( height: 1, fontSize: 35,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),
                      children: [
                        TextSpan(
                            text: "\n",
                            children: [
                              TextSpan(
                                text: "sell extraordinary NFTs".tr,
                                  style: const TextStyle(fontSize: 35,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),
                              )
                            ]
                        )
                      ]
                  )),
              RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                      text: "Enter in this creative world. Discover now the".tr,
                      style: const TextStyle(fontSize: 15,color: Colors.white,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                            text: "\n",
                            children: [
                              TextSpan(
                                text: "latest NFTs or start creating your own!".tr,
                                style: const TextStyle(fontSize: 15,color: Colors.white,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w500),
                              )
                            ]
                        )
                      ]
                  )),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 45,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(child: Text('Discover now'.tr,style: const TextStyle(color: Colors.black,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                    ),
                  ),
                  const SizedBox(width: 30),
                  InkWell(
                      onTap: () {},
                      child: Text('Watch video'.tr,style: const TextStyle(color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget creators(constraints) {
    return Container(
        // height: 500,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: notifire.getContentColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Top Creators'.tr,style: TextStyle(fontSize: 20,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                    decoration: BoxDecoration(
                      color: notifire.getBgColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text('See all'.tr,style: TextStyle(height: 1, color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: constraints < 600 ? 600 : constraints < 1665 ? 800 : constraints < 1400 ? 800 : 800,
              child: Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(120),
                  1: FixedColumnWidth(90),
                  2: FixedColumnWidth(60),
                },
                children: [
                  TableRow(
                    children: [
                      Text('Name'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                      Text('Artworks'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                      Text('Rating'.tr, style: TextStyle(fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                    ],
                  ),
                  const TableRow(
                    children: [
                      SizedBox(height: 30),
                      SizedBox(height: 30),
                      SizedBox(height: 30),
                    ],
                  ),
                  TableRow(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(backgroundImage: AssetImage(Appcontent.boy18)),
                          const SizedBox(width: 10),
                          Expanded(child: Text('Elon musk', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis)),
                        ],
                      ),
                      Text('23512', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      LinearProgressIndicator(
                        backgroundColor: greyScale.withOpacity(0.20),
                        borderRadius: BorderRadius.circular(30),
                        value: 0.5,
                        minHeight: 10,
                        color: blue,
                      ),
                    ],
                  ),
                  sizebox(),
                  TableRow(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(backgroundImage: AssetImage(Appcontent.girl18)),
                          const SizedBox(width: 10),
                          Expanded(child: Text('ms puiyi', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis)),
                        ],
                      ),
                      Text('1425', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      LinearProgressIndicator(
                        backgroundColor: greyScale.withOpacity(0.20),
                        borderRadius: BorderRadius.circular(30),
                        value: 0.7,
                        minHeight: 10,
                        color: blue,
                      ),
                    ],
                  ),
                  sizebox(),
                  TableRow(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(backgroundImage: AssetImage(Appcontent.boy14)),
                          const SizedBox(width: 10),
                          Expanded(child: Text('Salons gupta', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis)),
                        ],
                      ),
                      Text('3254', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      LinearProgressIndicator(
                        backgroundColor: greyScale.withOpacity(0.20),
                        borderRadius: BorderRadius.circular(30),
                        value: 0.9,
                        minHeight: 10,
                        color: blue,
                      ),
                    ],
                  ),
                  sizebox(),
                  TableRow(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(backgroundImage: AssetImage(Appcontent.girl17)),
                          const SizedBox(width: 10),
                          Expanded(child: Text('Jaye-sh', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis)),
                        ],
                      ),
                      Text('5412', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      LinearProgressIndicator(
                        backgroundColor: greyScale.withOpacity(0.20),
                        borderRadius: BorderRadius.circular(30),
                        value: 0.4,
                        minHeight: 10,
                        color: blue,
                      ),
                    ],
                  ),
                  sizebox(),
                  TableRow(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(backgroundImage: AssetImage(Appcontent.boy18)),
                          const SizedBox(width: 10),
                          Expanded(child: Text('Hari Jewellers', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis)),
                        ],
                      ),
                      Text('1412', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      LinearProgressIndicator(
                        backgroundColor: greyScale.withOpacity(0.20),
                        borderRadius: BorderRadius.circular(30),
                        value: 0.2,
                        minHeight: 10,
                        color: blue,
                      ),
                    ],
                  ),
                  sizebox(),
                  TableRow(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(backgroundImage: AssetImage(Appcontent.girl18)),
                          const SizedBox(width: 10),
                          Expanded(child: Text('ms puiyi', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis)),
                        ],
                      ),
                      Text('1425', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      LinearProgressIndicator(
                        backgroundColor: greyScale.withOpacity(0.20),
                        borderRadius: BorderRadius.circular(30),
                        value: 0.7,
                        minHeight: 10,
                        color: blue,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
    );
  }

  int selectIndex =0;
  Widget nfts(constraints) {
    return constraints < 600 ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Trending NFTs'.tr,style: TextStyle(fontSize: 20,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
        const SizedBox(height: 15),
        SizedBox(
          height: 35,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: modal().nfts.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectIndex = index;
                  });
                },
                child: Container(
                  height: 35,
                  margin: EdgeInsets.only(right: index == 3 ? 0 : 15),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: selectIndex == index ? notifire.getContentColor : notifire.getBgColor,
                    borderRadius: BorderRadius.circular(70),
                  ),
                  child: Center(child: Text(modal().nfts[index].toString().tr,style: TextStyle(color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                ),
              );
            },
          ),
        ),
      ],
    ) : Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Text('Trending NFTs'.tr,style: TextStyle(fontSize: 20,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
         SizedBox(
           height: 35,
           child: ListView.builder(
             shrinkWrap: true,
             scrollDirection: Axis.horizontal,
             itemCount: modal().nfts.length,
             itemBuilder: (context, index) {
               return InkWell(
                 onTap: () {
                   setState(() {
                     selectIndex = index;
                   });
                 },
                 child: Container(
                   height: 35,
                   margin: EdgeInsets.only(right: index == 3 ? 0 : 15),
                   padding: const EdgeInsets.symmetric(horizontal: 20),
                   decoration: BoxDecoration(
                     color: selectIndex == index ? notifire.getContentColor : notifire.getBgColor,
                     borderRadius: BorderRadius.circular(70),
                   ),
                   child: Center(child: Text(modal().nfts[index].toString().tr,style: TextStyle(color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                 ),
               );
             },
           ),
         ),
       ],
    );
  }

  bool isLike = false;
  bool isLike1 = false;
  bool isLike2 = false;
  Widget trending(constraints) {
    return constraints < 600 ? ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: modal().nftImg.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: notifire.getContentColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(modal().nftImg[index],fit: BoxFit.cover),),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isLike = !isLike;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(child: Icon(isLike ? Icons.favorite : Icons.favorite_border,color: blue)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(modal().nftTitle[index], style: TextStyle(fontSize: 16,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                        Text(modal().nftSub[index], style: TextStyle(fontSize: 12,color: greyScale,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w400)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const CircleAvatar(backgroundImage: AssetImage(Appcontent.boy18)),
                          const Positioned(
                              left: 20,
                              child: CircleAvatar(backgroundImage: AssetImage(Appcontent.girl18))),
                          const Positioned(
                              left: 40,
                              child: CircleAvatar(backgroundImage: AssetImage(Appcontent.boy14))),
                          Positioned(
                              left: 60,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffFAFCFE),
                                ),
                                child: Center(child: Text('+18',style: TextStyle(color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "Current Bid".tr,
                            style: TextStyle(fontSize: 12,color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),
                            children: [
                              TextSpan(
                                text: ": 0.91 ETH",
                                style: TextStyle(fontSize: 12,color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),
                              )
                            ]
                        )),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: blue,
                        ),
                        child: Center(child: Text('Place Bid'.tr,style: const TextStyle(color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },) : constraints < 1000 ? Row(
      children: [
        Expanded(
          child: Container(
            height: 370,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right:15),
            decoration: BoxDecoration(
              color: notifire.getContentColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(image: AssetImage(modal().nftImg[0]),fit: BoxFit.cover)
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isLike = !isLike;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(child: Icon(isLike ? Icons.favorite : Icons.favorite_border,color: blue)),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(modal().nftTitle[0],style: TextStyle(fontSize: 15,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                        Text(modal().nftSub[0],style: TextStyle(fontSize: 10,color: greyScale,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w400)),
                      ],
                    ),
                    Transform.translate(
                      offset: const Offset(-70, 0),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const CircleAvatar(backgroundImage: AssetImage(Appcontent.boy18)),
                          const Positioned(
                              left: 20,
                              child: CircleAvatar(backgroundImage: AssetImage(Appcontent.girl18))),
                          const Positioned(
                              left: 40,
                              child: CircleAvatar(backgroundImage: AssetImage(Appcontent.boy14))),
                          Positioned(
                              left: 60,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffFAFCFE),
                                ),
                                child: Center(child: Text('+18',style: TextStyle(color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "Current Bid".tr,
                            style: TextStyle(fontSize: constraints / 150,color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),
                            children: [
                              TextSpan(
                                text: ": 0.91 ETH",
                                style: TextStyle(fontSize: constraints / 150,color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),
                              )
                            ]
                        )),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: blue,
                        ),
                        child: Center(child: Text('Place Bid'.tr,style: const TextStyle(color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 370,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right:15),
            decoration: BoxDecoration(
              color: notifire.getContentColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(image: AssetImage(modal().nftImg[1]),fit: BoxFit.cover)
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isLike1 = !isLike1;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(child: Icon(isLike1 ? Icons.favorite : Icons.favorite_border,color: blue)),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(modal().nftTitle[1],style: TextStyle(fontSize: 15,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                        Text(modal().nftSub[1],style: TextStyle(fontSize: 10,color: greyScale,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w400)),
                      ],
                    ),
                    Transform.translate(
                      offset: const Offset(-70, 0),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const CircleAvatar(backgroundImage: AssetImage(Appcontent.boy18)),
                          const Positioned(
                              left: 20,
                              child: CircleAvatar(backgroundImage: AssetImage(Appcontent.girl18))),
                          const Positioned(
                              left: 40,
                              child: CircleAvatar(backgroundImage: AssetImage(Appcontent.boy14))),
                          Positioned(
                              left: 60,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffFAFCFE),
                                ),
                                child: Center(child: Text('+18',style: TextStyle(color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "Current Bid".tr,
                            style: TextStyle(fontSize: constraints / 150,color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),
                            children: [
                              TextSpan(
                                text: ": 0.91 ETH",
                                style: TextStyle(fontSize: constraints / 150,color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),
                              )
                            ]
                        )),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: blue,
                        ),
                        child: Center(child: Text('Place Bid'.tr,style: const TextStyle(color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 370,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: notifire.getContentColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(image: AssetImage(modal().nftImg[2]),fit: BoxFit.cover)
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isLike2 = !isLike2;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(child: Icon(isLike2 ? Icons.favorite : Icons.favorite_border,color: blue)),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(modal().nftTitle[2],style: TextStyle(fontSize: 15,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                        Text(modal().nftSub[2],style: TextStyle(fontSize: 10,color: greyScale,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w400)),
                      ],
                    ),
                    Transform.translate(
                      offset: const Offset(-70, 0),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const CircleAvatar(backgroundImage: AssetImage(Appcontent.boy18)),
                          const Positioned(
                              left: 20,
                              child: CircleAvatar(backgroundImage: AssetImage(Appcontent.girl18))),
                          const Positioned(
                              left: 40,
                              child: CircleAvatar(backgroundImage: AssetImage(Appcontent.boy14))),
                          Positioned(
                              left: 60,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffFAFCFE),
                                ),
                                child: Center(child: Text('+18',style: TextStyle(color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "Current Bid".tr,
                            style: TextStyle(fontSize: constraints / 150,color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),
                            children: [
                              TextSpan(
                                text: ": 0.91 ETH",
                                style: TextStyle(fontSize: constraints / 150,color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),
                              )
                            ]
                        )),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: blue,
                        ),
                        child: Center(child: Text('Place Bid'.tr,style: const TextStyle(color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ) : SizedBox(
          height: 340,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: modal().nftImg.length,
            itemBuilder: (context, index) {
            return Container(
              width: 335,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                color: notifire.getContentColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(modal().nftImg[index],fit: BoxFit.cover),),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              isLike = !isLike;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Center(child: Icon(isLike ? Icons.favorite : Icons.favorite_border,color: blue)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    width: rtl ? 310 : 250,
                    child: Row(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(modal().nftTitle[index], style: TextStyle(fontSize: 15,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                            Text(modal().nftSub[index], style: TextStyle(fontSize: 10,color: greyScale,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w400)),
                          ],
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            const CircleAvatar(backgroundImage: AssetImage(Appcontent.boy18)),
                            const Positioned(
                                left: 20,
                                child: CircleAvatar(backgroundImage: AssetImage(Appcontent.girl18))),
                            const Positioned(
                                left: 40,
                                child: CircleAvatar(backgroundImage: AssetImage(Appcontent.boy14))),
                            Positioned(
                                left: 60,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffFAFCFE),
                                  ),
                                  child: Center(child: Text('+18',style: TextStyle(color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 17,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: "Current Bid".tr,
                              style: TextStyle(fontSize: constraints / 150,color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),
                              children: [
                                TextSpan(
                                  text: ": 0.91 ETH",
                                  style: TextStyle(fontSize: constraints / 150,color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),
                                )
                              ]
                          )),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: rtl ? 4 : 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: blue,
                          ),
                          child: Center(child: Text('Place Bid'.tr,style: const TextStyle(color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },),
        );
  }

  bool isLike3 = false;
  bool isLike4 = false;
  bool isLike5 = false;
  Widget recently1(constraints) {
    return constraints < 600 ? ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: modal().nftImg.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: notifire.getContentColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(modal().recentlyadded[index],fit: BoxFit.cover),),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isLike = !isLike;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(child: Icon(isLike ? Icons.favorite : Icons.favorite_border,color: blue)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(modal().nftTitle[index], style: TextStyle(fontSize: 16,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                        Text(modal().nftSub[index], style: TextStyle(fontSize: 12,color: greyScale,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w400)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const CircleAvatar(backgroundImage: AssetImage(Appcontent.boy18)),
                          const Positioned(
                              left: 20,
                              child: CircleAvatar(backgroundImage: AssetImage(Appcontent.girl18))),
                          const Positioned(
                              left: 40,
                              child: CircleAvatar(backgroundImage: AssetImage(Appcontent.boy14))),
                          Positioned(
                              left: 60,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffFAFCFE),
                                ),
                                child: Center(child: Text('+18',style: TextStyle(color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "Current Bid".tr,
                            style: TextStyle(fontSize: 12,color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),
                            children: [
                              TextSpan(
                                text: ": 0.91 ETH",
                                style: TextStyle(fontSize: 12,color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),
                              )
                            ]
                        )),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: blue,
                        ),
                        child: Center(child: Text('Place Bid'.tr,style: const TextStyle(color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },) : constraints < 1000 ? Row(
      children: [
        Expanded(
          child: Container(
            height: 370,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right:15),
            decoration: BoxDecoration(
              color: notifire.getContentColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(image: AssetImage(modal().nftImg[0]),fit: BoxFit.cover)
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isLike3 = !isLike3;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(child: Icon(isLike3 ? Icons.favorite : Icons.favorite_border,color: blue)),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(modal().nftTitle[0],style: TextStyle(fontSize: 15,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                        Text(modal().nftSub[0],style: TextStyle(fontSize: 10,color: greyScale,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w400)),
                      ],
                    ),
                    Transform.translate(
                      offset: const Offset(-70, 0),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const CircleAvatar(backgroundImage: AssetImage(Appcontent.boy18)),
                          const Positioned(
                              left: 20,
                              child: CircleAvatar(backgroundImage: AssetImage(Appcontent.girl18))),
                          const Positioned(
                              left: 40,
                              child: CircleAvatar(backgroundImage: AssetImage(Appcontent.boy14))),
                          Positioned(
                              left: 60,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffFAFCFE),
                                ),
                                child: Center(child: Text('+18',style: TextStyle(color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "Current Bid".tr,
                            style: TextStyle(fontSize: constraints / 150,color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),
                            children: [
                              TextSpan(
                                text: ": 0.91 ETH",
                                style: TextStyle(fontSize: constraints / 150,color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),
                              )
                            ]
                        )),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: blue,
                        ),
                        child: Center(child: Text('Place Bid'.tr,style: const TextStyle(color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 370,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right:15),
            decoration: BoxDecoration(
              color: notifire.getContentColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(image: AssetImage(modal().nftImg[1]),fit: BoxFit.cover)
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isLike4 = !isLike4;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(child: Icon(isLike4 ? Icons.favorite : Icons.favorite_border,color: blue)),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(modal().nftTitle[1],style: TextStyle(fontSize: 15,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                        Text(modal().nftSub[1],style: TextStyle(fontSize: 10,color: greyScale,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w400)),
                      ],
                    ),
                    Transform.translate(
                      offset: const Offset(-70, 0),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const CircleAvatar(backgroundImage: AssetImage(Appcontent.boy18)),
                          const Positioned(
                              left: 20,
                              child: CircleAvatar(backgroundImage: AssetImage(Appcontent.girl18))),
                          const Positioned(
                              left: 40,
                              child: CircleAvatar(backgroundImage: AssetImage(Appcontent.boy14))),
                          Positioned(
                              left: 60,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffFAFCFE),
                                ),
                                child: Center(child: Text('+18',style: TextStyle(color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "Current Bid".tr,
                            style: TextStyle(fontSize: constraints / 150,color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),
                            children: [
                              TextSpan(
                                text: ": 0.91 ETH",
                                style: TextStyle(fontSize: constraints / 150,color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),
                              )
                            ]
                        )),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: blue,
                        ),
                        child: Center(child: Text('Place Bid'.tr,style: const TextStyle(color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 370,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: notifire.getContentColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(image: AssetImage(modal().nftImg[2]),fit: BoxFit.cover)
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isLike5 = !isLike5;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(child: Icon(isLike5 ? Icons.favorite : Icons.favorite_border,color: blue)),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(modal().nftTitle[2], style: TextStyle(fontSize: 15,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                        Text(modal().nftSub[2], style: TextStyle(fontSize: 10,color: greyScale,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w400)),
                      ],
                    ),
                    Transform.translate(
                      offset: const Offset(-70, 0),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const CircleAvatar(backgroundImage: AssetImage(Appcontent.boy18)),
                          const Positioned(
                              left: 20,
                              child: CircleAvatar(backgroundImage: AssetImage(Appcontent.girl18))),
                          const Positioned(
                              left: 40,
                              child: CircleAvatar(backgroundImage: AssetImage(Appcontent.boy14))),
                          Positioned(
                              left: 60,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffFAFCFE),
                                ),
                                child: Center(child: Text('+18',style: TextStyle(color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "Current Bid".tr,
                            style: TextStyle(fontSize: constraints / 150,color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),
                            children: [
                              TextSpan(
                                text: ": 0.91 ETH",
                                style: TextStyle(fontSize: constraints / 150,color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),
                              )
                            ]
                        )),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: blue,
                        ),
                        child: Center(child: Text('Place Bid'.tr,style: const TextStyle(color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ) : SizedBox(
      height: 340,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: modal().recentlyadded.length,
        itemBuilder: (context, index) {
          return Container(
            width: 335,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: notifire.getContentColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(modal().recentlyadded[index],fit: BoxFit.cover),),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isLike = !isLike;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(child: Icon(isLike ? Icons.favorite : Icons.favorite_border,color: blue)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: rtl ? 310 : 250,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(modal().nftTitle[index], style: TextStyle(fontSize: 15,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                          Text(modal().nftSub[index], style: TextStyle(fontSize: 10,color: greyScale,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w400)),
                        ],
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const CircleAvatar(backgroundImage: AssetImage(Appcontent.boy18)),
                          const Positioned(
                              left: 20,
                              child: CircleAvatar(backgroundImage: AssetImage(Appcontent.girl18))),
                          const Positioned(
                              left: 40,
                              child: CircleAvatar(backgroundImage: AssetImage(Appcontent.boy14))),
                          Positioned(
                              left: 60,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffFAFCFE),
                                ),
                                child: Center(child: Text('+18',style: TextStyle(color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                              )),
                        ],
                      ),

                      // Transform.translate(
                      //   offset: const Offset(-70, 0),
                      //   child:
                      // ),
                    ],
                  ),
                ),
                const SizedBox(height: 17,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "Current Bid".tr,
                            style: TextStyle(fontSize: 12,color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),
                            children: [
                              TextSpan(
                                text: ": 0.91 ETH",
                                style: TextStyle(fontSize: 12,color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),
                              )
                            ]
                        )),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: rtl ? 4 : 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: blue,
                        ),
                        child: Center(child: Text('Place Bid'.tr,style: const TextStyle(color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },),
    );
  }

  Widget recently(constraints) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recently Added'.tr,style: TextStyle(fontSize: 20,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
      ],
    );
  }

  int selectHistory = 0;
  Widget history(constraints) {
    return constraints < 600 ? Container(
      // height: 500,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: notifire.getContentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('History'.tr,style: TextStyle(fontSize: 20,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  decoration: BoxDecoration(
                    color: notifire.getBgColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text('See all'.tr,style: TextStyle(height: 1,color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: modal().historyImg.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectHistory = index;
                  });
                },
                child: Container(
                  height: 105,
                  padding: const EdgeInsets.all(10),
                  // margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: selectHistory == index ? notifire.getBgColor : notifire.getContentColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        margin: EdgeInsets.only(right: rtl ? 0 : 15, left: rtl ? 15 : 0,),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(image: AssetImage(modal().sImg[index]),fit: BoxFit.cover)
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(modal().historyTitle[index].toString().tr,style: TextStyle(height: 1,fontSize: 20,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                          Text(modal().historySub[index],style: TextStyle(fontSize: 16,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w400)),
                        ],
                      ),
                      const Spacer(),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: "30s ",
                              style: TextStyle(fontSize: 14,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w400),
                              children: [
                                TextSpan(
                                  text: "ago".tr,
                                  style: TextStyle(fontSize: 14,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w400),
                                )
                              ]
                          ))
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ) : Container(
      // height: 500,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: notifire.getContentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('History'.tr,style: TextStyle(fontSize: 20, color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  decoration: BoxDecoration(
                    color: notifire.getBgColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text('See all'.tr,style: TextStyle(color: blue,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: modal().historyImg.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectHistory = index;
                  });
                },
                child: Container(
                  height: 105,
                  padding: const EdgeInsets.all(10),
                  // margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: selectHistory == index ? notifire.getBgColor : notifire.getContentColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        margin: EdgeInsets.only(right: rtl ? 0 : 15, left: rtl ? 15 : 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(image: AssetImage(modal().sImg[index]),fit: BoxFit.cover)
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(modal().historyTitle[index].toString().tr,style: TextStyle(fontSize: 22,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                          const SizedBox(height: 10),
                          Text(modal().historySub[index],style: TextStyle(fontSize: 16,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w400)),
                        ],
                      ),
                      const Spacer(),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: "30s ",
                              style: TextStyle(fontSize: constraints / 130,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w400),
                              children: [
                                TextSpan(
                                  text: "ago".tr,
                                  style: TextStyle(fontSize: constraints / 130,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w400),
                                )
                              ]
                          )),
                    ],
                  ),
                ),
              );
          },
          ),
        ],
      ),
    );
  }

  TableRow sizebox() {
    return const TableRow(
      children: [
        SizedBox(height: 20),
        SizedBox(height: 20),
        SizedBox(height: 20),
      ],
    );
  }
}
