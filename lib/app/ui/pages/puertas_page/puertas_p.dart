import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:safey/app/routes/app_pages.dart';
import 'package:safey/app/ui/utils/btn_icon.dart';
import 'package:safey/app/ui/utils/buttons_sounds.dart';
import 'package:safey/flutter_flow/flutter_flow_theme.dart';
import 'package:safey/flutter_flow/flutter_flow_widgets.dart';
import 'puertas_c.dart';

class PuertasPage extends GetView<PuertasController> {
  const PuertasPage({super.key});
  PuertasController get self => controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hola Miguel!',
          style: LightModeTheme().bodyLarge.copyWith(fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: Center(
            child: SizedBox(
                width: 480.0,
                height: 710.0,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Selecciona la puerta',
                        style: LightModeTheme()
                            .bodyLarge
                            .copyWith(color: LightModeTheme().primary),
                        textAlign: TextAlign.center,
                      ),
                      Expanded(
                        child: GridView(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            childAspectRatio: 1,
                          ),
                          scrollDirection: Axis.vertical,
                          children: self.listaPuertas
                              .map((e) => buildPuerta(e))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ))),
      ),
      // bottomNavigationBar: SizedBox(
      //   height: 50,
      //   child: buildBotones(),
      // ),
    );
  }

  Widget buildPuerta(Puerta p) {
    return Obx(() {
      final select = self.selectPuerta;
      return Stack(
        children: [
          Center(child: Image.asset('assets/images/${p.image}.jpeg')),
          BtnIcon(
              hoverColor: const Color.fromARGB(47, 54, 105, 244),
              borderWidth: 1,
              borderColor: p.local ? LightModeTheme().primary : null,
              fillColor: select == p.id
                  ? const Color.fromARGB(47, 54, 105, 244)
                  : null,
              width: Get.width,
              height: Get.height,
              onPressed: () {
                ButtonsSounds.playSound(sound: "assets/audios/success_pin.wav");
                Timer(const Duration(milliseconds: 400), () {
                  Get.offAllNamed(Routes.SAFEY);
                });
                Get.dialog(Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BtnIcon(
                          onPressed: Get.back,
                          icon: Icon(
                            Icons.check_circle_sharp,
                            size: 300,
                            color: LightModeTheme().success,
                          )),
                      Text(
                        'Puerta abierta',
                        style: LightModeTheme().bodyLarge.copyWith(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 80,
                            decoration: TextDecoration.none),
                      )
                    ],
                  ),
                ));
              },
              icon: const SizedBox.shrink()),
        ],
      );
    });
  }

  Widget buildBotones() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FFButtonWidget(
          onPressed: Get.back,
          text: 'Cancelar',
          options: FFButtonOptions(
            width: 140,
            height: 40,
            padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
            iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            color: LightModeTheme().error,
            textStyle: LightModeTheme().titleSmall.override(
                  fontFamily: 'Readex Pro',
                  color: LightModeTheme().primaryText,
                ),
            elevation: 3,
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        FFButtonWidget(
          onPressed: () {
            if (self.selectPuerta != -1) {
              ButtonsSounds.playSound(sound: "assets/audios/success_pin.wav");
              Timer(const Duration(milliseconds: 400), () {
                Get.offAllNamed(Routes.SAFEY);
              });
              Get.dialog(SizedBox(
                height: 100,
                width: 200,
                child: BtnIcon(
                    onPressed: Get.back,
                    icon: Icon(
                      Icons.check_circle_sharp,
                      size: 300,
                      color: LightModeTheme().success,
                    )),
              ));
            }
          },
          text: 'Abrir',
          options: FFButtonOptions(
            width: 140,
            height: 40,
            padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
            iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            color: LightModeTheme().successGeneral,
            textStyle: LightModeTheme().titleSmall.override(
                  fontFamily: 'Readex Pro',
                  color: LightModeTheme().primaryText,
                ),
            elevation: 3,
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }
}
