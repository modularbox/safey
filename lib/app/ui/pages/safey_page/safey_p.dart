import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:safey/app/ui/utils/btn_icon.dart';
import 'package:safey/flutter_flow/flutter_flow_animations.dart';
import 'package:safey/flutter_flow/flutter_flow_theme.dart';
import 'safey_c.dart';

class SafeyPage extends GetView<SafeyController> {
  const SafeyPage({super.key});
  SafeyController get self => controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
            width: 480.0,
            height: 710.0,
            child: // Generated code for this Column Widget...
                SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildAppBar(context),
                  Expanded(
                    child: GridView(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          childAspectRatio: 1,
                        ),
                        scrollDirection: Axis.vertical,
                        children: self.keyboards
                            .map((e) => buildKeyButton(e))
                            .toList()),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return SizedBox(
      height: 120.0,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            left: 5.0,
            top: 40,
            child: Image.asset(
              'assets/images/logo_fiware.png',
              width: 100,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            right: 10.0,
            child: Image.asset(
              'assets/images/logo_badajoz.png',
              width: 70,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            left: 115.0,
            top: 5.0,
            child: Obx(buildLuz),
          ),
          Positioned(
              left: 122,
              top: 18,
              child: SizedBox(
                width: 300,
                height: 100,
                child: TextField(
                  controller: self.pinController,
                  enabled: false,
                  style: LightModeTheme()
                      .bodyLarge
                      .copyWith(fontSize: 90, letterSpacing: 10),
                  decoration: const InputDecoration(border: InputBorder.none),
                ),
              )),
        ],
      ),
    );
  }

  Widget buildLuz() {
    final colorShadow = self.validarPin == null
        ? Colors.black
        : (self.validarPin!
            ? LightModeTheme().success
            : LightModeTheme().error);
    final colorBackground = self.validarPin == null
        ? Colors.white
        : const Color.fromARGB(113, 255, 255, 255);
    return Container(
      width: 280,
      height: 100,
      decoration: BoxDecoration(
          color: colorBackground,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                blurRadius: 8,
                color: colorShadow,
                offset: const Offset(0, 0),
                blurStyle: BlurStyle.normal)
          ]),
    );
  }

  Widget buildKeyButton(Rx<ButtonAnimation> buttonAnimation) {
    return Obx(() {
      final btn = buttonAnimation.value;
      return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 5,
                    offset: Offset(0, 1.5),
                  )
                ]),
          ),
          BtnIcon(
                  hoverColor: const Color.fromARGB(81, 0, 55, 255),
                  padding: const EdgeInsets.all(0),
                  borderRadius: 20.0,
                  onPressed: () => self.onTap(buttonAnimation),
                  icon: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade900),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    //Logo de badajo,
                    // Logo de modularbox
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        btn.text,
                        style: LightModeTheme().labelLarge.copyWith(
                            fontSize: btn.text == '*' ? 134.0 : 80.0,
                            color: const Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ))
              .animateOnActionTrigger(btn.animation,
                  hasBeenTriggered: btn.ativate),
        ],
      );
    });
  }
}
