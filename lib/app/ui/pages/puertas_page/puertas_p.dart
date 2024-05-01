import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safey/app/data/models/mensajes.dart';
import 'package:safey/app/ui/global_widgets/dialogs.dart';
import 'package:safey/app/ui/utils/btn_icon.dart';
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
                        hola,
                        style:
                            LightModeTheme().bodyLarge.copyWith(fontSize: 40),
                      ),
                      Text(
                        puertaSeleccion,
                        style: LightModeTheme().bodyLarge.copyWith(
                            color: LightModeTheme().primary, fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                      Expanded(
                        child: GridView(
                          padding: EdgeInsets.zero,
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
                            Border.all(color: LightModeTheme().error, width: 5))
                    : null,
                child: Image.asset('assets/images/${p.image}.jpeg'))),
        p.noAcceso
            ? Icon(
                Icons.close,
                color: LightModeTheme().error,
                size: 240,
                shadows: const [
                  BoxShadow(color: Color.fromARGB(255, 0, 0, 0), blurRadius: 10)
                ],
              )
            : const SizedBox.shrink(),
        BtnIcon(
            hoverColor: const Color.fromARGB(47, 54, 105, 244),
            borderWidth: 8,
            borderColor: p.local ? LightModeTheme().primary : null,
            width: Get.width,
            height: Get.height,
            onPressed: p.noAcceso
                ? buildDialogNoAccesso
                : (p.impago ? buildDialogErrorImpago : buildDialogSuccess),
            icon: const SizedBox.shrink()),
      ],
    );
  }
}
