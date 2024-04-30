import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safey/app/routes/app_pages.dart';
import 'package:safey/app/ui/pages/safey_page/safey_b.dart';
import 'package:simple_audio/simple_audio.dart';

void main() async {
  // Initialize with default values.
  await SimpleAudio.init(
    useMediaController: true,
    shouldNormalizeVolume: false,
    dbusName: "com.erikas.SimpleAudio",
    actions: [
      MediaControlAction.rewind,
      MediaControlAction.skipPrev,
      MediaControlAction.playPause,
      MediaControlAction.skipNext,
      MediaControlAction.fastForward,
    ],
    androidNotificationIconPath: "mipmap/ic_launcher",
    androidCompactActions: [1, 2, 3],
    applePreferSkipButtons: true,
  );
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.SAFEY,
    defaultTransition: Transition.fade,
    initialBinding: SafeyBinding(),
    getPages: AppPages.routes,
  ));
}
