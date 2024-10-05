import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platform_converter_app/pages/android_home_page.dart';
import 'package:platform_converter_app/pages/ios_home_page.dart';

import 'controller/platform_connvert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    PlatformConvert platformConvert = Get.put(PlatformConvert());
    return Obx(
      () => platformConvert.isAndroid.value
          ? MaterialApp(
              debugShowCheckedModeBanner: false,
              home: AndroidHomePage(),
              // themeMode: TheamController(sp:).isDark
              //     ? ThemeMode.dark
              //     : ThemeMode.light,
            )
          : CupertinoApp(
              debugShowCheckedModeBanner: false,
              home: IosHomePage(),
              // theme: CupertinoThemeData(
              //   brightness: TheamController(sp: ).isDark
              //       ? Brightness.dark
              //       : Brightness.light,
              // ),
            ),
    );
  }
}
