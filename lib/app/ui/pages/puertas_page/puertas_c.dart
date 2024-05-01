import 'package:get/get.dart';
import 'package:safey/app/data/models/mensajes.dart';
import 'package:safey/app/ui/utils/buttons_sounds.dart';

class PuertasController extends GetxController {
  final _selectPuerta = (-1).obs;
  int get selectPuerta => _selectPuerta.value;
  set selectPuerta(int value) => _selectPuerta.value = value;

  final listaPuertas = ([
    Puerta('calzada_p1', true, false),
    Puerta('calzada_p2', false, false),
    Puerta('puerta_riolobos', false, true),
    Puerta('puerta_pabellon', false, false),
    Puerta('puerta_entrada_riolobos', false, false, impago: true),
  ]);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    reproducirTextoAudio(hola);
  }
}

class Puerta {
  final String image;
  final bool local;
  static int _idCounter =
      0; // Variable estática para mantener el contador único
  final int id;
  final bool select = false;
  final bool noAcceso;
  final bool impago;
  Puerta(this.image, this.local, this.noAcceso, {this.impago = false})
      : id = _idCounter++;
}
