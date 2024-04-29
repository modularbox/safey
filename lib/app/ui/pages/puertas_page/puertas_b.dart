
import 'package:get/get.dart';
import 'puertas_c.dart';


class PuertasBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PuertasController>(() => PuertasController());
  }
}