import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sitecycle/app/config/colors.dart';
import 'package:sitecycle/app/config/dark_ligthmode.dart';
import 'package:sitecycle/app/config/fontfamily_modal.dart';
import 'package:sitecycle/app/config/images.dart';
import 'package:sitecycle/app/config/list_modal.dart';
import 'package:sitecycle/app/feauture/presentation/ui/drawer/drawer_main.dart';
import 'package:sitecycle/app/feauture/presentation/ui/mq.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


class Dashboard1Screen extends StatefulWidget {
  const Dashboard1Screen({super.key});

  @override
  State<Dashboard1Screen> createState() => _Dashboard1ScreenState();
}
List<String> list = <String>['Monthly'.tr, 'Yearly'.tr, 'Daily'.tr];
class _Dashboard1ScreenState extends State<Dashboard1Screen> {
  late ColorNotifire notifire;

  List<_SplineAreaData> chartData = <_SplineAreaData>[
    _SplineAreaData(2010, 10.53, 3.3),
    _SplineAreaData(2011, 9.5, 5.4),
    _SplineAreaData(2012, 10, 2.65),
    _SplineAreaData(2013, 9.4, 2.62),
    _SplineAreaData(2014, 20.8, 1.99),
    _SplineAreaData(2015, 13.9, 1.44),
  ];

  final List<ChartData> chartData1 = [
    ChartData('12.Sep', 30, 20, 24),
    ChartData('13.Sep', 40, 15, 18),
    ChartData('14.Sep', 16, 40, 15),
    ChartData('15.Sep', 18, 23, 18),
    ChartData('16.Sep', 18, 26, 18),
    ChartData('17.Sep', 18, 36, 18),
    ChartData('18.Sep', 18, 56, 18),
    ChartData('19.Sep', 18, 35, 18),
  ];

  final List<ChartData2> chartData2 = [
    ChartData2(1, 120),
    ChartData2(2, 120),
    ChartData2(3, 150),
    ChartData2(4, 130),
    ChartData2(5, 50),
    ChartData2(6, 20),
  ];

  final List<PieData> pie =[
    PieData('Your files', 50,blue),
    PieData('System', 20,blueCyan),
  ];

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of(context, listen: true);
    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.maxWidth < 600) {
          return SingleChildScrollView(
            child: Container(
              color: notifire.getBgColor,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    status(constraints.maxWidth),
                    month(constraints.maxWidth),
                    revenue(constraints.maxWidth),
                    table(constraints.maxWidth),
                    const SizedBox(height: 10),
                    traffic(constraints.maxWidth),
                    const SizedBox(height: 10),
                    pieChart(constraints.maxWidth),
                    const SizedBox(height: 10),
                    complex(constraints.maxWidth),
                    const SizedBox(height: 10),
                    task(constraints.maxWidth),
                    const SizedBox(height: 10),
                    datePicker(constraints.maxWidth),
                    const SizedBox(height: 10),
                    business(constraints.maxWidth),
                    const SizedBox(height: 10),
                    member(constraints.maxWidth),
                    const SizedBox(height: 10),
                    security(constraints.maxWidth),
                    const SizedBox(height: 10),
                    starbucks(constraints.maxWidth),
                  ],
                ),
              ),
            ),
          );
        } else if(constraints.maxWidth < 1000) {
          return  Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  status(constraints.maxWidth),
                  Row(
                    children: [
                      Expanded(child: month(constraints.maxWidth)),
                      const SizedBox(width: 15),
                      Expanded(child: revenue(constraints.maxWidth)),
                    ],
                  ),
                  SizedBox(
                    height: 435,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 1,child: table(constraints.maxWidth)),
                        const SizedBox(width: 15),
                        Expanded(flex: 1,child: traffic(constraints.maxWidth)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 340,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 1,child: pieChart(constraints.maxWidth)),
                        const SizedBox(width: 15),
                        Expanded(flex: 1,child: complex(constraints.maxWidth)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 355,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 1,child: task(constraints.maxWidth)),
                        const SizedBox(width: 15),
                        Expanded(flex: 1,child: datePicker(constraints.maxWidth)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  SizedBox(
                    height: 370,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 1,child: business(constraints.maxWidth)),
                        const SizedBox(width: 15),
                        Expanded(flex: 1,child: starbucks(constraints.maxWidth)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 320,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 1,child: security(constraints.maxWidth)),
                        const SizedBox(width: 15),
                        Expanded(flex: 1, child: member(constraints.maxWidth)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else{
          return Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  status(constraints.maxWidth),
                  Row(
                    children: [
                      Expanded(flex: 1,child: month(constraints.maxWidth)),
                      const SizedBox(width: 15),
                      Expanded(flex: 1,child: revenue(constraints.maxWidth)),
                    ],
                  ),
                  SizedBox(
                    height: 455,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 2, child: table(constraints.maxWidth)),
                        const SizedBox(width: 15),
                        Expanded(flex: 1,child: traffic(constraints.maxWidth)),
                        const SizedBox(width: 15),
                        Expanded(flex: 1,child: pieChart(constraints.maxWidth)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 342,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 2,child: complex(constraints.maxWidth)),
                        const SizedBox(width: 15),
                        Expanded(flex: 1,child: task(constraints.maxWidth)),
                        const SizedBox(width: 15),
                        Expanded(flex: 1,child: datePicker(constraints.maxWidth)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 300,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 1,child: business(constraints.maxWidth)),
                        const SizedBox(width: 15),
                        Expanded(flex: 1,child: member(constraints.maxWidth)),
                        const SizedBox(width: 15),
                        Expanded(flex: 1,child: security(constraints.maxWidth)),
                        const SizedBox(width: 15),
                        Expanded(flex: 1,child: starbucks(constraints.maxWidth)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
  // ---------------
  Widget status(constraints) {
    return constraints < 600 ? ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: modal().statusTitle.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          height: 100,
          width: 250,
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: notifire.getContentColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              index == 2 ? const SizedBox() : index == 3 ? const SizedBox() :Container(
                height: 56,
                width: 56,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                decoration:  BoxDecoration(
                  shape: BoxShape.circle,
                  color: notifire.getBgColor,
                ),
                child: index == 4 ? Image.asset(modal().statusImg[index]) : Padding(
                  padding: const EdgeInsets.all(13),
                  child: Image.asset(modal().statusImg[index]),
                ),
              ),
              index  == 2 ? const SizedBox(width: 15) : index  == 3 ? const SizedBox(width: 15) : const SizedBox(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(modal().statusTitle[index].toString().tr,style: TextStyle(fontSize: 15,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                  Text(modal().statusAmt[index],style: TextStyle(fontSize: 25,color: notifire.getContainer,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                  index == 2 ? RichText(text: TextSpan(
                    children: [
                      TextSpan(text: '+23%',style: TextStyle(fontSize: 10,color: greenCyan,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                      TextSpan(text: 'since last month'.tr,style: TextStyle(fontSize: 10,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                    ],
                  )) : const SizedBox(),
                ],
              ),
            ],
          ),
        );
      },
    ) : SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: modal().statusTitle.length,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            width: 250,
            margin: EdgeInsets.only(right: index == 5 ? (rtl ? 20 : 0) : rtl ? index == 0 ? 0 : 18 : 18),
            decoration: BoxDecoration(
              color: notifire.getContentColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                index == 2 ? const SizedBox() : index == 3 ? const SizedBox() :Container(
                  height: 56,
                  width: 56,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration:  BoxDecoration(
                    shape: BoxShape.circle,
                    color: notifire.getBgColor,
                  ),
                  child: index == 4 ? Image.asset(modal().statusImg[index]) : Padding(
                    padding: const EdgeInsets.all(13),
                    child: Image.asset(modal().statusImg[index]),
                  ),
                ),
                index  == 2 ? const SizedBox(width: 15) : index  == 3 ? const SizedBox(width: 15) : const SizedBox(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(modal().statusTitle[index].toString().tr, style: TextStyle(fontSize: 15,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                    Text(modal().statusAmt[index],style: TextStyle(fontSize: 25, color: notifire.getContainer,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                    index == 2 ? RichText(text: TextSpan(
                      children: [
                        TextSpan(text: '+23%', style: TextStyle(fontSize: 10, color: greenCyan,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                        TextSpan(text: 'since last month'.tr, style: TextStyle(fontSize: 10,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                      ],
                    )) : const SizedBox(),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  // ---------------
  Widget month(constraints) {
    return constraints < 600 ? Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: notifire.getContentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: notifire.getBgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.calendar_today,color: greyScale,size: 16),
                    const SizedBox(width: 10),
                    Text('This month'.tr,style: TextStyle(fontSize: 15,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
              InkWell(
                onTap: () {

                },
                child: Container(
                  decoration: BoxDecoration(
                    color: notifire.getBgColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(Appcontent.sEarning, height: 40),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('\$23.6K',style: TextStyle(fontSize: 35,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'Total Spent'.tr,style: TextStyle(fontSize: 14,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                    WidgetSpan(alignment: PlaceholderAlignment.middle,child: Icon(Icons.arrow_drop_up,color: greenCyan)),
                    TextSpan(text: '2.50%',style: TextStyle(fontSize: 14,color: greenCyan,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              SfCartesianChart(
                legend: const Legend(isVisible: true, opacity: 0.7),
                plotAreaBorderWidth: 0,
                primaryXAxis: const NumericAxis(
                    axisLine: AxisLine(color: Colors.transparent),
                    interval: 1,
                    majorGridLines: MajorGridLines(width: 0),
                    edgeLabelPlacement: EdgeLabelPlacement.shift),
                primaryYAxis: NumericAxis(
                    labelFormat: '{value}%'.tr,
                    axisLine: const AxisLine(color: Colors.transparent),
                    majorTickLines: const MajorTickLines(size: 0)),
                series: [
                  SplineAreaSeries<_SplineAreaData, double>(
                    dataSource: chartData,
                    color:   const Color(0xff2916FF).withOpacity(0.08),
                    borderColor: const Color(0xff2916FF),
                    enableTooltip: false,
                    legendItemText: '',
                    isVisibleInLegend: false,
                    name: '2 March 2024',
                    xValueMapper: (_SplineAreaData sales, _) => sales.year,
                    yValueMapper: (_SplineAreaData sales, _) => sales.y1,
                  ),
                ],
                tooltipBehavior: TooltipBehavior(enable: true),
              ),
            ],
          )
        ],
      ),
    ) : Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: notifire.getContentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {

                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: notifire.getBgColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today,color: greyScale,size: 16),
                      const SizedBox(width: 10),
                      Text('This month'.tr,style: TextStyle(fontSize: 15,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {

                },
                child: Container(
                  decoration: BoxDecoration(
                    color: notifire.getBgColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(Appcontent.sEarning, height: 40),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('\$23.6K',style: TextStyle(fontSize: 35,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: 'Total Spent'.tr,style: TextStyle(fontSize: 14,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                        WidgetSpan(alignment: PlaceholderAlignment.middle,child: Icon(Icons.arrow_drop_up,color: greenCyan)),
                        TextSpan(text: '2.50%',style: TextStyle(fontSize: 14,color: greenCyan,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Expanded(
                child: SfCartesianChart(
                  legend: const Legend(isVisible: true, opacity: 0.7),
                  plotAreaBorderWidth: 0,
                  primaryXAxis: const NumericAxis(
                    axisLine: AxisLine(color: Colors.transparent),
                      interval: 1,
                      majorGridLines: MajorGridLines(width: 0),
                      edgeLabelPlacement: EdgeLabelPlacement.shift),
                  primaryYAxis: NumericAxis(
                      labelFormat: '{value}%'.tr,
                      axisLine: const AxisLine(color: Colors.transparent),
                      majorTickLines: const MajorTickLines(size: 0)),
                  series: [
                    SplineAreaSeries<_SplineAreaData, double>(
                      dataSource: chartData,
                      color:   const Color(0xff2916FF).withOpacity(0.08),
                      borderColor: const Color(0xff2916FF),
                      enableTooltip: false,
                      legendItemText: '',
                      isVisibleInLegend: false,
                      name: '2 March 2024',
                      xValueMapper: (_SplineAreaData sales, _) => sales.year,
                      yValueMapper: (_SplineAreaData sales, _) => sales.y1,
                    ),
                  ],
                  tooltipBehavior: TooltipBehavior(enable: true),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget revenue(constraints) {
    return constraints < 600 ? Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: notifire.getContentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Weekly Revenue'.tr,style: TextStyle(fontSize: 20,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              InkWell(
                onTap: () {

                },
                child: Container(
                  decoration: BoxDecoration(
                    color: notifire.getBgColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(Appcontent.sEarning, height: 30),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          SfCartesianChart(
              primaryXAxis: const CategoryAxis(
                isVisible: false,
              ),
              series: <CartesianSeries>[
                StackedColumnSeries<ChartData, String>(
                    width: 0.15,
                    color: blue,
                    dataSource: chartData1,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y1),
                StackedColumnSeries<ChartData, String>(
                    width: 0.15,
                    color: blueCyan,
                    dataSource: chartData1,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y2),
                StackedColumnSeries<ChartData, String>(
                    width: 0.15,
                    color: const Color(0xffEEEEEE),
                    dataSource: chartData1,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y3)
              ]),
        ],
      ),
    ) : Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: notifire.getContentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Weekly Revenue'.tr,style: TextStyle(fontSize: 25,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              InkWell(
                onTap: () {

                },
                child: Container(
                  decoration: BoxDecoration(
                    color: notifire.getBgColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(Appcontent.sEarning, height: 40),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          SfCartesianChart(
              primaryXAxis: const CategoryAxis(
                isVisible: false,
              ),
              series: <CartesianSeries>[
                StackedColumnSeries<ChartData, String>(
                    width: 0.15,
                    color: blue,
                    dataSource: chartData1,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y1),
                StackedColumnSeries<ChartData, String>(
                    width: 0.15,
                    color: blueCyan,
                    dataSource: chartData1,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y2),
                StackedColumnSeries<ChartData, String>(
                    width: 0.15,
                    color: const Color(0xffEEEEEE),
                    dataSource: chartData1,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y3)
              ]),
        ],
      ),
    );
  }
  // ---------------
  bool isActive = false;
  bool isActive1 = false;
  bool isActive2 = false;
  bool isActive3 = false;
  bool isActive4 = false;
  Widget table(constraints) {
    return Container(
      padding: const EdgeInsets.only(left: 20,right: 20,top: 20),
      // margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: notifire.getContentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         constraints < 600 ? Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text('Check Table'.tr,style: TextStyle(fontSize: 20,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
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
         ) : constraints < 1000 ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Check Table'.tr,style: TextStyle(fontSize: constraints / 40,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
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
          ) : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Check Table'.tr,style: TextStyle(fontSize: 25,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
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
          const SizedBox(height: 30),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: constraints < 600 ? 600 : constraints < 1665 ? 800 : constraints < 1400 ? 800 : 800,
              child: tables(),
            ),
          ),
        ],
      ),
    );
  }

  Widget traffic(constraints) {
    return Container(
      padding: const EdgeInsets.all(20),
      // margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: notifire.getContentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          constraints < 600 ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Daily Traffic'.tr,style: TextStyle(fontSize: 14,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: '2.549',style: TextStyle(fontSize: 35,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                        TextSpan(text: 'Visitors'.tr,style: TextStyle(fontSize: 15,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(alignment: PlaceholderAlignment.middle,child: Icon(Icons.arrow_drop_up,color: greenCyan)),
                    TextSpan(text: '2.50%',style: TextStyle(fontSize: 10,color: greenCyan,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ],
          ) : constraints < 1000 ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Daily Traffic'.tr,style: TextStyle(fontSize: constraints / 40,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: '2.549',style: TextStyle(fontSize: 35,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                        TextSpan(text: 'Visitors'.tr,style: TextStyle(fontSize: 15,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(alignment: PlaceholderAlignment.middle,child: Icon(Icons.arrow_drop_up,color: greenCyan)),
                    TextSpan(text: '2.50%',style: TextStyle(fontSize: constraints / 60,color: greenCyan,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ],
          ) : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Daily Traffic'.tr,style: TextStyle(height: 1,fontSize: 14,color: greyScale,fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w700)),
                  SizedBox(height: rtl ? 0 : 4),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: '2.549 ',style: TextStyle(fontSize: 32,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                        TextSpan(text: 'Visitors'.tr,style: TextStyle(height: 1,fontSize: 13,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700,)),
                      ],
                    ),
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(alignment: PlaceholderAlignment.middle,child: Icon(Icons.arrow_drop_up,color: greenCyan)),
                    TextSpan(text: '2.50%', style: TextStyle(fontSize: 14,color: greenCyan,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: rtl ? 30 : 37),
          SfCartesianChart(
            primaryXAxis: const NumericAxis(
              majorTickLines: MajorTickLines(
                  width: 0, color: Colors.transparent),
              axisBorderType: AxisBorderType.rectangle,
              axisLine:
              AxisLine(color: Colors.transparent, width: 0),
              borderColor: Colors.transparent,
              borderWidth: 0,
              minorGridLines: MinorGridLines(
                  color: Colors.transparent, width: 0),
              majorGridLines: MajorGridLines(
                width: 0,
                color: Colors.transparent,
              ),
            ),
            primaryYAxis: const NumericAxis(
              majorTickLines: MajorTickLines(
                  width: 0, color: Colors.transparent),
              axisLine:
              AxisLine(color: Colors.transparent, width: 0),
              axisBorderType: AxisBorderType.withoutTopAndBottom,
              borderColor: Colors.transparent,
              borderWidth: 0,
            ),
            series: [
              // Renders column chart
              ColumnSeries<ChartData2, double>(
                color: const Color(0xff595FE5),
                borderRadius:
                const BorderRadius.all(Radius.circular(5)),
                dataSource: chartData2,
                xValueMapper: (ChartData2 data, _) => data.x,
                yValueMapper: (ChartData2 datum, int index) {
                  return null;
                },
                // yValueMapper: (ChartData data, _) => data.y
              ),
              ColumnSeries<ChartData2, double>(
                  dataSource: chartData2,
                  borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(30)),
                  color: const Color(0xff595FE5),
                  xValueMapper: (ChartData2 data, _) => data.x,
                  yValueMapper: (ChartData2 data, _) => data.y1),
            ],
          )
        ],
      ),
    );
  }

  String dropdownValue = list.first;
  Widget pieChart(constraints) {
    return  Container(
      padding: const EdgeInsets.all(15),
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
              Text('Your Pie Chart'.tr,style: TextStyle(fontSize: 20,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              DropdownButton<String>(
                value: dropdownValue,
                icon:  Icon(Icons.arrow_drop_down_outlined,color: greyScale),
                elevation: 0,
                dropdownColor: notifire.getBgColor,
                style: const TextStyle(color: Colors.deepPurple),
                underline: const SizedBox(),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,style: TextStyle(fontSize: 10,color: greyScale,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                  );
                }).toList(),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.zero,
            child: SfCircularChart(
              margin: EdgeInsets.zero,
              series: <CircularSeries>[
                PieSeries<PieData, String>(
                  dataSource: pie,
                  pointColorMapper: (PieData data, _) => data.color,
                  xValueMapper: (PieData data, _) => data.a,
                  yValueMapper: (PieData data, _) => data.b,
                  radius: '60%',
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        color: blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Your files'.tr,style: TextStyle(fontSize: 10,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                        Text('50%',style: TextStyle(fontSize: 20,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        color: blueCyan,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('System'.tr,style: TextStyle(fontSize: 10,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                        Text('20%',style: TextStyle(fontSize: 20,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ) : constraints < 1000 ?  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Your Pie Chart'.tr,style: TextStyle(fontSize: constraints /40,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              DropdownButton<String>(
                value: dropdownValue,
                icon:  Icon(Icons.arrow_drop_down_outlined,color: greyScale),
                elevation: 0,
                dropdownColor: notifire.getBgColor,
                style: const TextStyle(color: Colors.deepPurple),
                underline: const SizedBox(),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,style: TextStyle(fontSize: constraints /60,color: greyScale,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                  );
                }).toList(),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.zero,
            height: 220,
            child: SfCircularChart(
              margin: EdgeInsets.zero,
              series: <CircularSeries>[
                PieSeries<PieData, String>(
                  dataSource: pie,
                  pointColorMapper: (PieData data, _) => data.color,
                  xValueMapper: (PieData data, _) => data.a,
                  yValueMapper: (PieData data, _) => data.b,
                  radius: '60%',
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        color: blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Your files'.tr,style: TextStyle(fontSize: 10,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                        Text('50%',style: TextStyle(fontSize: 20,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        color: blueCyan,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('System'.tr,style: TextStyle(fontSize: 10,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                        Text('20%',style: TextStyle(fontSize: 20,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ) : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Your Pie Chart'.tr,style: TextStyle(fontSize: 20,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              DropdownButton<String>(
                value: dropdownValue,
                icon:  Icon(Icons.arrow_drop_down_outlined,color: greyScale),
                elevation: 0,
                dropdownColor: notifire.getBgColor,
                style: const TextStyle(color: Colors.deepPurple),
                underline: const SizedBox(),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,style: TextStyle(fontSize: 15,color: greyScale,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                  );
                }).toList(),
              ),
            ],
          ),
          SfCircularChart(
              series: <CircularSeries>[
                PieSeries<PieData, String>(
                    dataSource: pie,
                    pointColorMapper: (PieData data, _) => data.color,
                    xValueMapper: (PieData data, _) => data.a,
                    yValueMapper: (PieData data, _) => data.b,
                    radius: '60%',
                ),
              ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        color: blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Your files'.tr,style: TextStyle(fontSize: 10,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                        Text('50%',style: TextStyle(fontSize: 20,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        color: blueCyan,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('System'.tr,style: TextStyle(fontSize: 10,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                        Text('20%',style: TextStyle(fontSize: 20,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  // ---------------
  Widget complex(constraints) {
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
              Text('Complex Table'.tr,style: TextStyle(fontSize: 20,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
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
                child: Container(
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
          ) : constraints < 1000 ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Complex Table'.tr,style: TextStyle(fontSize: constraints /40,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: notifire.getBgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: PopupMenuButton(
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
              ),
            ],
          ) : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Complex Table'.tr,style: TextStyle(height: 1,fontSize: 25,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
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
          const SizedBox(height: 30),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: constraints < 600 ? 800 : constraints < 1665 ? 800 : constraints < 1400 ? 800 : 800,
              child: Table(
                columnWidths: const <int, TableColumnWidth>{
                  0: FixedColumnWidth(60),
                  1: FixedColumnWidth(60),
                  2: FixedColumnWidth(60),
                  3: FixedColumnWidth(60),
                },
                children: [
                  TableRow(
                    children: [
                      Text('NAME'.tr, style: TextStyle(height: 1,fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                      Text('STATUS'.tr, style: TextStyle( height: 1, fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                      Text('DATE'.tr, style: TextStyle( height: 1, fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                      Text('PROGRESS'.tr, style: TextStyle(height: 1,fontSize: 14, color: greyScale, fontFamily: FontFamily.qBold,fontWeight: FontWeight.w700)),
                    ],
                  ),
                  const TableRow(
                    children: [
                      SizedBox(height: 30),
                      SizedBox(height: 30),
                      SizedBox(height: 30),
                      SizedBox(height: 30),
                    ],
                  ),
                  TableRow(
                    children: [
                      Text('Instagram UI', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(backgroundColor: greenCyan, radius: 10, child:const Icon(Icons.check, color: Colors.white,size: 16,)),
                          const SizedBox(width: 10),
                          Text('Approved'.tr, style: TextStyle(height: 1,fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Text('12 Jan 2023', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
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
                      Text('Instagram UI', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(backgroundColor: Colors.red, radius: 10,child: Icon(Icons.check, color: Colors.white,size: 16,)),
                          const SizedBox(width: 10),
                          Text('Disable'.tr, style: TextStyle(height: 1,fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Text('12 July 2023', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
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
                      Text('Marketing'.tr, style: TextStyle(height: 1,fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(backgroundColor: Color(0xffFFCE20),  radius: 10,child: Text("!", style: TextStyle(color: Colors.white,fontSize: 16))),
                          const SizedBox(width: 10),
                          Text('Error'.tr, style: TextStyle(height: 1,fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Text('12 Feb 2023', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
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
                      Text('Yearly Report'.tr, style: TextStyle(height: 1,fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(backgroundColor: greenCyan, radius: 10,child:const Icon(Icons.check, color: Colors.white,size: 16,)),
                          const SizedBox(width: 10),
                          Text('Approved'.tr, style: TextStyle(height: 1,fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Text('12 Apr 2023', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      LinearProgressIndicator(
                        backgroundColor: greyScale.withOpacity(0.20),
                        borderRadius: BorderRadius.circular(30),
                        value: 0.6,
                        minHeight: 10,
                        color: blue,
                      ),
                    ],
                  ),
                  sizebox(),
                  TableRow(
                    children: [
                      Text('Instagram UI', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(backgroundColor: greenCyan, radius: 10, child:const Icon(Icons.check, color: Colors.white,size: 16,)),
                          const SizedBox(width: 10),
                          Text('Approved'.tr, style: TextStyle(height: 1,fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Text('12 Jan 2023', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
                      LinearProgressIndicator(
                        backgroundColor: greyScale.withOpacity(0.20),
                        borderRadius: BorderRadius.circular(30),
                        value: 0.5,
                        minHeight: 10,
                        color: blue,
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

  List taskCheck = [false,false,false,false,false,false];
  bool active = false;
  Widget task(constraints) {
    return Container(
      padding: const EdgeInsets.all(10),
      // margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: notifire.getContentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: constraints < 600 ? Column(
        children: [
          Row(
            children: [
              Text('Tasks'.tr, style: TextStyle(fontSize: 20,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              const Spacer(),
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
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: modal().taskTitle.length,
            padding: const EdgeInsets.only(top: 20),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 13),
                child: Row(
                  children: [
                    Checkbox(
                        side:  BorderSide(color: greyScale),
                        activeColor: const Color(0xff595FE5),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        value: taskCheck[index],
                        onChanged: (val) {
                          setState(() {
                            taskCheck[index] = val;
                          });
                        }),
                    Text(modal().taskTitle[index].toString().tr,style: TextStyle(fontSize: 15,color: active ? notifire.getContainer : greyScale, fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                    const Spacer(),
                    InkWell(
                        onTap: () {

                    },child: Image.asset(Appcontent.dragIndicator,height: 25)),
                  ],
                ),
              );
            },
          ),
        ],
      ) : constraints < 1000 ? Column(
        children: [
          Row(
            children: [
              Text('Tasks'.tr,style: TextStyle(fontSize: constraints /40,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              const Spacer(),
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
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: modal().taskTitle.length,
            padding: const EdgeInsets.only(top: 20),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 13),
                child: Row(
                  children: [
                    Checkbox(
                        side:  BorderSide(color: greyScale),
                        activeColor: const Color(0xff595FE5),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        value: taskCheck[index],
                        onChanged: (val) {
                          setState(() {
                            taskCheck[index] = val;
                          });
                        }),
                    Text(modal().taskTitle[index].toString().tr,style: TextStyle(fontSize: constraints / 60,color: active ?  notifire.getContainer : greyScale,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                    const Spacer(),
                    InkWell(
                        onTap: () {

                    },child: Image.asset(Appcontent.dragIndicator,height: 25)),
                  ],
                ),
              );
            },
          ),
        ],
      ) : Column(
        children: [
         Row(
            children: [
              Text('Tasks'.tr,style: TextStyle(height: 1,fontSize: 25,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              const Spacer(),
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
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: modal().taskTitle.length,
            padding: const EdgeInsets.only(top: 20),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Checkbox(
                        side:  BorderSide(color: greyScale),
                        activeColor: const Color(0xff595FE5),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        value: taskCheck[index],
                        onChanged: (val) {
                          setState(() {
                            taskCheck[index] = val;
                          });
                          // setState(() {
                          //   modal().taskCheck[index] = val!;
                          // });
                        }),
                    Text(modal().taskTitle[index].toString().tr,style: TextStyle(fontSize: 15,color: active ?  notifire.getContainer : greyScale,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                    const Spacer(),
                    InkWell(
                        onTap: () {

                    },child: Image.asset(Appcontent.dragIndicator,height: 25)),
                  ],
                ),
              );
          },
          ),
        ],
      ),
    );
  }
  // Widget dsd(){
  //   return ListView.separated(
  //       separatorBuilder: (context, index) {
  //         return const SizedBox(width:  10);
  //       },
  //       physics: const NeverScrollableScrollPhysics(),
  //       shrinkWrap: true,
  //       scrollDirection: Axis.vertical,
  //       itemCount: from?.facilitylist.length ?? 0,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Padding(
  //           padding: const EdgeInsets.only(left: 8.0,right: 8.0),
  //           child: Column(
  //             children: [
  //               ListTile(
  //                 onTap: () {
  //                   if(checkboxlist.contains(index+1)){
  //                     setState((){
  //                       checkboxlist.remove(index+1);
  //                     });
  //                   } else{
  //                     setState((){
  //                       checkboxlist.add(index+1);
  //                     });
  //                   }
  //                 },
  //                 leading: Image(image: NetworkImage('${config().baseUrl}/${from?.facilitylist[index].img}'),height: 25,width: 25,color: notifier.textColor),
  //                 title: Padding(
  //                   padding: const EdgeInsets.only(left: 8.0),
  //                   child: Text('${from?.facilitylist[index].title}',style: TextStyle(color: notifier.textColor,fontWeight: FontWeight.bold)),
  //                 ),
  //                 trailing: Checkbox(
  //                   side: BorderSide(color: notifier.theamcolorelight,width: 2),
  //                   checkColor: Colors.white,
  //                   activeColor: notifier.theamcolorelight,
  //                   value: checkboxlist.contains(index+1) ? true : false,
  //                   onChanged: (bool? value) {
  //                     if(checkboxlist.contains(index+1)){
  //                       setState((){
  //                         checkboxlist.remove(index+1);
  //                       });
  //                     } else{
  //                       setState((){
  //                         checkboxlist.add(index+1);
  //                       });
  //                     }
  //                     print(checkboxlist.join(','));
  //                   },
  //                 ),
  //               ),
  //             ],
  //           ),
  //         );
  //       }),
  // }
  Widget datePicker(constraints) {
    return constraints < 1000 ? Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: notifire.getContentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SfDateRangePicker(
        enablePastDates: false,
        onSelectionChanged: (dateRangePickerSelectionChangedArgs) {},
        selectionMode: DateRangePickerSelectionMode.range,
        startRangeSelectionColor: blue,
        endRangeSelectionColor: blue,
        rangeSelectionColor: greyScale.withOpacity(0.30),
        rangeTextStyle: TextStyle(color: notifire.getContainer),
        headerStyle: DateRangePickerHeaderStyle(backgroundColor: notifire.getContentColor, textStyle: TextStyle(color: notifire.getContainer)),
        monthCellStyle: DateRangePickerMonthCellStyle(
          leadingDatesTextStyle: TextStyle(color: greyScale),
          textStyle: TextStyle(color: notifire.getContainer),
          disabledDatesTextStyle: TextStyle(color: greyScale),
        ),
        monthViewSettings: DateRangePickerMonthViewSettings(
          showTrailingAndLeadingDates: true,
          viewHeaderStyle: DateRangePickerViewHeaderStyle(backgroundColor: notifire.getContentColor,textStyle: TextStyle(color: notifire.getContainer)),
        ),
      ),
    ) : Container(
      // height: 365,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: notifire.getContentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SfDateRangePicker(
        enablePastDates: false,
        onSelectionChanged: (dateRangePickerSelectionChangedArgs) {},
        selectionMode: DateRangePickerSelectionMode.range,
        startRangeSelectionColor: blue,
        endRangeSelectionColor: blue,
        rangeSelectionColor: greyScale.withOpacity(0.30),
        rangeTextStyle: TextStyle(color: notifire.getContainer),
        headerStyle: DateRangePickerHeaderStyle(backgroundColor: notifire.getContentColor,textStyle: TextStyle(color: notifire.getContainer)),
        monthCellStyle: DateRangePickerMonthCellStyle(
          leadingDatesTextStyle: TextStyle(color: greyScale),
          textStyle: TextStyle(color: notifire.getContainer),
          disabledDatesTextStyle: TextStyle(color: greyScale),
        ),
        monthViewSettings: DateRangePickerMonthViewSettings(
          showTrailingAndLeadingDates: true,
          viewHeaderStyle: DateRangePickerViewHeaderStyle(backgroundColor: notifire.getContentColor,textStyle: TextStyle(color: notifire.getContainer)),
        ),
      ),
    );
  }
  // ---------------

  Widget business(constraints) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: notifire.getContentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: rtl ? 0 : 15,left: rtl ? 15 : 0),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.30),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SvgPicture.asset(Appcontent.localFire),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Business Design'.tr,style: TextStyle(height: 1,fontSize: 10,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 4),
                  Text('New lesson is available'.tr,style: TextStyle(height: 1,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          Text('What do you need to know to create better products?'.tr,style: TextStyle(height: 1,fontSize: 20,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              children: [
                SvgPicture.asset(Appcontent.timer1),
                const SizedBox(width: 10),
                RichText(text: TextSpan(
                  text: "60 ",
                    style: TextStyle(color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700),
                  children: [
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "mins".tr,
                            style: TextStyle(height: 1,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)
                        )
                      ]
                    )
                  ]
                )),
                const SizedBox(width: 40),
                SvgPicture.asset(Appcontent.slowMotion),
                const SizedBox(width: 10),
                Text('Video format'.tr,style: TextStyle(height: 1,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const CircleAvatar(backgroundImage: AssetImage(Appcontent.boy18)),
                  Positioned(
                    left: rtl ? -20 : 20,
                    child: const CircleAvatar(backgroundImage: AssetImage(Appcontent.girl18))),
                  Positioned(
                      left: rtl ? -40 : 40,
                      child: const CircleAvatar(backgroundImage: AssetImage(Appcontent.boy14))),
                  Positioned(
                      left: rtl ? -60 : 60,
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
              const Spacer(),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text('Get Started'.tr,style: const TextStyle(height: 1,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget member(constraints) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: notifire.getContentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Team members'.tr, style: TextStyle(height: 1,fontSize: 20,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: blue,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add,color: Colors.white),
                ),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: 4,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.only(top: constraints < 1000 ? 35 :  15),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    const CircleAvatar(backgroundImage: AssetImage(Appcontent.boy14)),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Shyam Assizes',style: TextStyle(fontSize: 15,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                        Text('Video Editor'.tr,style: TextStyle(fontSize: 10,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
                      ],
                    ),
                    const Spacer(),
                    InkWell(onTap: () {

                    },child: Icon(Icons.more_vert,color: greyScale)),
                  ],
                ),
              );
          },
          ),
        ],
      ),
    );
  }
  Widget security(constraints) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: notifire.getContentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(Appcontent.fingerprint),
          const SizedBox(height: 10),
          Text('Control card security in-app with a tap'.tr,style: TextStyle(height: 1,fontSize: 25,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
          const SizedBox(height: 10),
          Text('Discover our cards benefits, with one tap.'.tr,style: TextStyle(height: 1,fontSize: 15,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
          const SizedBox(height: 30),
          InkWell(
            onTap: () {},
            child: Container(
              width: Get.width,
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(child: Text('Cards'.tr,style: const TextStyle(height: 1,color: Colors.white,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),),
            ),
          ),
        ],
      ),
    );
  }
  Widget starbucks(constraints) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: notifire.getContentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(Appcontent.starbucksBg),
              Positioned(
                top: 10,
                right: 10,
                child: InkWell(
                  onTap: () {
                    
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.60),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(child: Icon(Icons.timer_outlined,color: Colors.white)),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                bottom: -20,
                child: Image.asset(Appcontent.starbucksLogo,height: 60)
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              constraints < 1000 ? const SizedBox(height: 50) : const SizedBox(height: 20),
              Text('Starbucks',style: TextStyle(fontSize: 25,color: notifire.getContainer,fontFamily: FontFamily.qBold, fontWeight: FontWeight.w700)),
              const SizedBox(height: 5),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "20% ",
                      style: TextStyle(height: 1,fontSize: 15,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700),
                      children: [
                        TextSpan(
                            text: "Cashback & off".tr,
                            style: TextStyle(height: 1,fontSize: 15,color: greyScale,fontFamily: FontFamily.qRegular, fontWeight: FontWeight.w700)
                        )
                      ]
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Widget tables(){
    return Table(
      columnWidths: const <int, TableColumnWidth>{
        0: FixedColumnWidth(60),
        1: FixedColumnWidth(60),
        2: FixedColumnWidth(60),
        3: FixedColumnWidth(60),
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
        const TableRow(
          children: [
            SizedBox(height: 30),
            SizedBox(height: 30),
            SizedBox(height: 30),
            SizedBox(height: 30),
          ],
        ),
        TableRow(
          children: [
            Transform.translate(
              offset: const Offset(0, -5),
              child: Row(
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
            ),
            Text('25.2%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Text('4032', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Text('12/01/2023', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
          ],
        ),
        sizebox(),
        TableRow(
          children: [
            Transform.translate(
              offset: const Offset(0, -5),
              child: Row(
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
            ),
            Text('25.2%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Text('4032', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Text('12/01/2023', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),

          ],
        ),
        sizebox(),
        TableRow(
          children: [
            Transform.translate(
              offset: const Offset(0, -5),
              child: Row(
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
            ),
            Text('32.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Text('551', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Text('12/01/2023', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),

          ],
        ),
        sizebox(),
        TableRow(
          children: [
            Transform.translate(
              offset: const Offset(0, -5),
              child: Row(
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
            ),
            Text('32.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Text('551', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Text('12/01/2023', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),

          ],
        ),
        sizebox(),
        TableRow(
          children: [
            Transform.translate(
              offset: const Offset(0, -5),
              child: Row(
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
            ),
            Text('55.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Text('220', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Text('12/01/2023', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),

          ],
        ),
        sizebox(),
        TableRow(
          children: [
            Transform.translate(
              offset: const Offset(0, -5),
              child: Row(
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
            ),
            Text('12.6%', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Text('223', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),
            Text('12/01/2023', style: TextStyle(fontSize: 15, color: notifire.getContainer, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w600)),

          ],
        ),
      ],
    );
  }

  TableRow sizebox() {
    return const TableRow(
      children: [
        SizedBox(height: 20),
        SizedBox(height: 20),
        SizedBox(height: 20),
        SizedBox(height: 20),
      ],
    );
  }
}
class _SplineAreaData {
  _SplineAreaData(this.year, this.y1, this.y2);
  final double year;
  final double y1;
  final double y2;
}
class ChartData {
  ChartData(this.x, this.y1, this.y2, this.y3);

  final String x;
  final double y1;
  final double y2;
  final double y3;
}

class ChartData2 {
  ChartData2(this.x, this.y1,);

  final double x;
  final double y1;
}
class PieData{
  PieData(this.a,this.b,this.color);
  final String a;
  final double b;
  final Color? color;
}