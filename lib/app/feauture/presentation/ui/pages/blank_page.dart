import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sitecycle/app/config/dark_ligthmode.dart';

class BlacnkPage extends StatefulWidget {
  const BlacnkPage({super.key});

  @override
  State<BlacnkPage> createState() => _BlacnkPageState();
}

class _BlacnkPageState extends State<BlacnkPage> {

  late ColorNotifire notifire;

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of(context, listen: true);
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: blankpage(constraints),
      );
    },);
  }
  Widget blankpage(constraints){
    return Container(
      height: Get.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: notifire.getContentColor,
      ),
    );
  }
}
