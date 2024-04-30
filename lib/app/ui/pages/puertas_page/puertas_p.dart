import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safey/app/routes/app_pages.dart';
import 'package:safey/app/ui/utils/btn_icon.dart';
import 'package:safey/app/ui/utils/buttons_sounds.dart';
import 'package:safey/flutter_flow/flutter_flow_theme.dart';
import 'puertas_c.dart';

class PuertasPage extends GetView<PuertasController> {
  const PuertasPage({super.key});
  PuertasController get self => controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        'Hola Miguel!',
                        style:
                            LightModeTheme().bodyLarge.copyWith(fontSize: 40),
                      ),
                      Text(
                        'Selecciona la puerta',
                        style: LightModeTheme().bodyLarge.copyWith(
                            color: LightModeTheme().primary, fontSize: 30),
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
    );
  }

  Widget buildPuerta(Puerta p) {
    return Stack(
      children: [
        Center(
            child: Container(
                decoration: p.noAcceso
                    ? BoxDecoration(
                        border:
                            Border.all(color: LightModeTheme().error, width: 2))
                    : null,
                child: Image.asset('assets/images/${p.image}.jpeg'))),
        BtnIcon(
            hoverColor: const Color.fromARGB(47, 54, 105, 244),
            borderWidth: 1,
            borderColor: p.local ? LightModeTheme().primary : null,
            width: Get.width,
            height: Get.height,
            onPressed: p.noAcceso
                ? null
                : () {
                    ButtonsSounds.playSound(
                        sound: "assets/audios/success_pin.wav");
                    Timer(const Duration(seconds: 1), () {
                      Get.offAllNamed(Routes.SAFEY);
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
                                'Puerta abierta',
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
                  },
            icon: const SizedBox.shrink()),
      ],
    );
  }
}
