import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio_media_kit/just_audio_media_kit.dart';
import 'package:safey/app/routes/app_pages.dart';
import 'package:safey/app/ui/pages/safey_page/safey_b.dart';

void main() {
  // by default, windows and linux are enabled
  JustAudioMediaKit.ensureInitialized();

// or, if you want to manually configure enabled platforms instead:
// make sure to include the required dependency in pubspec.yaml for
// each enabled platform!
  JustAudioMediaKit.ensureInitialized(
    linux: true, // default: true  - dependency: media_kit_libs_linux
  );
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.SAFEY,
    defaultTransition: Transition.fade,
    initialBinding: SafeyBinding(),
    getPages: AppPages.routes,
  ));
}
