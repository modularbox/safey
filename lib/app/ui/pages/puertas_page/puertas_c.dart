import 'package:get/get.dart';

class PuertasController extends GetxController {
  final _selectPuerta = (-1).obs;
  int get selectPuerta => _selectPuerta.value;
  set selectPuerta(int value) => _selectPuerta.value = value;

  final listaPuertas =
      ([Puerta('calzada_p1', true), Puerta('calzada_p2', false)]);
}

class Puerta {
  final String image;
  final bool local;
  static int _idCounter =
      0; // Variable estática para mantener el contador único
  final int id;
  final bool select = false;
  Puerta(this.image, this.local) : id = _idCounter++;
}
