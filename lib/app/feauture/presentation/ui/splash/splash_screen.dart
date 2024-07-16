import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sitecycle/app/config/colors.dart';
import 'package:sitecycle/app/config/dark_ligthmode.dart';
import 'package:sitecycle/app/config/fontfamily_modal.dart';
import 'package:sitecycle/app/config/images.dart';
import 'package:sitecycle/app/feauture/presentation/ui/login/login_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late ColorNotifire notifire;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialization();

  }

  void initialization() async {
    await Future.delayed(
      const Duration(seconds: 3),
          () {
        Navigator.pushReplacement(context,
          MaterialPageRoute(
              builder: (context) {
                return  LoginScreen();
              }
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 52,
                    width: 52,
                    child: Image.asset(Appcontent.miracleLogo,color: notifire.getContainer,)),
                const SizedBox(width: 15),
                Text('Miracle', style: TextStyle(color: blackColor, fontSize: 46, fontFamily: FontFamily.qRegular,fontWeight: FontWeight.w400)),
              ],
            ),
            const SizedBox(height: 16),
        SpinKitFadingCircle(
          color: notifire.isDark ? blackColor : blackColor,//ustomize the color
          size: 30.0,
        ),
          ],
        ),
      ),
    );
  }
}
