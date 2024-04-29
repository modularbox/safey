import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:safey/app/routes/app_pages.dart';
import 'package:safey/app/ui/utils/buttons_sounds.dart';
import 'package:safey/flutter_flow/flutter_flow_animations.dart';

class SafeyController extends GetxController with GetTickerProviderStateMixin {
  /// Controllador de alert recarga widget
  final keyboards = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '*', '0', '#']
      .map((e) => Rx<ButtonAnimation>(ButtonAnimation(e)))
      .toList();

  final _validarPin = Rxn<bool>();
  bool? get validarPin => _validarPin.value;
  set validarPin(bool? value) => _validarPin.value = value;

  bool? backValidarPin;
  String pin = '';

  int repeticionLuz = 0;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    for (final element in keyboards) {
      final newController = AnimationController(vsync: this);
      element.value.animation.controller = newController;
    }
    debounce(_validarPin, (callback) {
      if (repeticionLuz > 0) {
        // Pin Aceptado
        if (callback!) {
          Get.toNamed(Routes.PUERTAS);
        }
        repeticionLuz = 0;
        backValidarPin = null;
        validarPin = null;
      } else {
        if (backValidarPin != null) {
          validarPin = backValidarPin;
          backValidarPin = null;
          repeticionLuz++;
        }
        if (callback == null) {
        } else {
          backValidarPin = callback;
          validarPin = null;
          if (callback) {
            ButtonsSounds.playSound(sound: "assets/audios/success_pin.wav");
          } else {
            ButtonsSounds.playSound(sound: "assets/audios/error_pin.wav");
          }
        }
      }
    }, time: const Duration(milliseconds: 400));
  }

  void onTap(Rx<ButtonAnimation> buttonAnimation) {
    ButtonsSounds.playSound(sound: "assets/audios/click_pin.wav");
    changePin(buttonAnimation.value.text);
    buttonAnimation.value.ativate = true;
    buttonAnimation.refresh();
    SchedulerBinding.instance.addPostFrameCallback((_) async =>
        await buttonAnimation.value.animation.controller.forward(from: 0.0));
  }

  void changePin(String letra) {
    if (pin.length > 5) {
      if (letra == '#') {
        if (pin == '123456') {
          validarPin = true;
          pin = '';
        } else {
          validarPin = false;
          pin = '';
        }
      }
    } else if (pin == '*') {
      pin = '';
      validarPin = null;
    } else {
      pin += letra;
    }
    print(pin);
  }
}

class ButtonAnimation {
  bool ativate = false;
  final animation = AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 130.ms,
          begin: const Offset(0.6, 0.6),
          end: const Offset(1, 1),
        ),
      ]);
  final String text;
  ButtonAnimation(this.text);
}
