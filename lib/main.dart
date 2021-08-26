import 'package:animatedcontroller/routes/app_pages.dart';
import 'package:animatedcontroller/routes/app_routes.dart';
import 'package:animatedcontroller/utils/constants.dart';
import 'package:animatedcontroller/utils/sharedpreferecens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PersistDataSharedPreferences.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'One Piece Chapters',
    initialRoute: Routes.SPLASH,
    darkTheme: appDarkTheme,
    theme: appLightTheme,
    getPages: AppPages.routes,
  ));
}
