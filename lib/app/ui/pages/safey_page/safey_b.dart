
import 'package:get/get.dart';
import 'safey_c.dart';


class SafeyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SafeyController>(() => SafeyController());
  }
}