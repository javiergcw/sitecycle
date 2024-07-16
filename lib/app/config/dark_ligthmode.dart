// ignore_for_file: file_names, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:sitecycle/app/config/colors.dart';


class ColorNotifire with ChangeNotifier {
  bool isDark = false;
  set setIsDark(value) {
    isDark = value;
    notifyListeners();
  }

  // ignore: recursive_getters
  get  greyColor => greyColor;
  get getIsDark => isDark;
  get getBgColor => isDark ? blackColor : bgColor;
  get getContentColor => isDark ? darkColor : Colors.white;
  get text => isDark ? Colors.black : Colors.white;
  get getContainer => isDark ? Colors.white : Colors.black;
  get getChatBg => isDark ? blackColor : greenShadow;
  get textfieldborder => isDark ? greyBorder : blue;
  get darktextfieldborder => isDark ? textfielddarkborder : greyBorder;
}
