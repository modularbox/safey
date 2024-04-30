import 'package:get/get.dart';

class PuertasController extends GetxController {
  final _selectPuerta = (-1).obs;
  int get selectPuerta => _selectPuerta.value;
  set selectPuerta(int value) => _selectPuerta.value = value;

  final listaPuertas = ([
    Puerta('calzada_p1', true, false),
    Puerta('calzada_p2', false, false),
    Puerta('calzada_p2', false, true)
  ]);
}

class Puerta {
  final String image;
  final bool local;
  static int _idCounter =
      0; // Variable estática para mantener el contador único
  final int id;
  final bool select = false;
  final bool noAcceso;
  Puerta(this.image, this.local, this.noAcceso) : id = _idCounter++;
}
