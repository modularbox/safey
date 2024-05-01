import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safey/app/data/models/mensajes.dart';
import 'package:safey/app/routes/app_pages.dart';
import 'package:safey/app/ui/utils/btn_icon.dart';
import 'package:safey/app/ui/utils/buttons_sounds.dart';
import 'package:safey/flutter_flow/flutter_flow_theme.dart';

void buildDialogError(String text) {
  ButtonsSounds.playSound(sound: "assets/audios/error_pin.wav");
  Timer(const Duration(seconds: 3), () {
    Get.back();
  });
  Get.dialog(Scaffold(
    body: Center(
      child: Container(
        width: 480.0,
        height: 710.0,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BtnIcon(
                onPressed: Get.back,
                fillColor: const Color.fromARGB(0, 0, 0, 0),
                hoverColor: Colors.transparent,
                icon: Icon(
                  Icons.cancel,
                  size: 200,
                  color: LightModeTheme().error,
                )),
            Text(
              text,
              textAlign: TextAlign.center,
              style: LightModeTheme().bodyLarge.copyWith(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 60,
                  decoration: TextDecoration.none),
            )
          ],
        ),
      ),
    ),
  ));
}

buildDialogCodigoErroneo() {
  buildDialogError(codigoErroneo);
  reproducirTextoAudio(codigoErroneo, 'codigo_erroneo');
}

buildDialogErrorImpago() {
  buildDialogError(impago);
  reproducirTextoAudio(impago, "impago");
}

buildDialogNoAccesso() {
  buildDialogError(dialogError);
  reproducirTextoAudio(dialogError, "error");
}

void buildDialogSuccess() {
  ButtonsSounds.playSound(sound: "assets/audios/success_pin.wav");
  reproducirTextoAudio(dialogSuccess, 'success');
  Timer(const Duration(seconds: 3), () {
    reproducirTextoAudio(cerrarPuerta, 'cerrar');
    Get.offAllNamed(Routes.SAFEY);
  });
  Timer(const Duration(seconds: 5), () {
    reproducirTextoAudio(cerrarPuerta, 'cerrar');
  });
  Get.dialog(Scaffold(
    body: Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BtnIcon(
                onPressed: Get.back,
                fillColor: const Color.fromARGB(0, 0, 0, 0),
                hoverColor: Colors.transparent,
                icon: Icon(
                  Icons.check_circle_sharp,
                  size: 200,
                  color: LightModeTheme().success,
                )),
            Text(
              dialogSuccess,
              textAlign: TextAlign.center,
              style: LightModeTheme().bodyLarge.copyWith(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 60,
                  decoration: TextDecoration.none),
            )
          ],
        ),
      ),
    ),
  ));
}
