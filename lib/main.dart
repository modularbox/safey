import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kplayer/kplayer.dart';
import 'package:safey/app/routes/app_pages.dart';
import 'package:safey/app/ui/pages/safey_page/safey_b.dart';

void main() async {
  Player.boot(); //add this  line (optional)
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.SAFEY,
    defaultTransition: Transition.fade,
    initialBinding: SafeyBinding(),
    getPages: AppPages.routes,
  ));
}
