import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sitecycle/app/config/dark_ligthmode.dart';
import 'package:sitecycle/app/config/language.dart';
import 'package:sitecycle/app/config/scrolling.dart';
import 'package:sitecycle/app/feauture/presentation/ui/splash/splash_screen.dart';
import 'package:sitecycle/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ColorNotifire()),
      ],
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Miracle',
          locale: const Locale('en', 'US'),
          translations: LocalString(),
          debugShowCheckedModeBanner: false,
          scrollBehavior: MyCustomScrollerBehavior(),
          theme: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            dividerColor: Colors.transparent,
            useMaterial3: false,
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}
