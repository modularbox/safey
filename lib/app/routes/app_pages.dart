// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:safey/app/ui/pages/puertas_page/puertas_b.dart';
import 'package:safey/app/ui/pages/puertas_page/puertas_p.dart';
import 'package:safey/app/ui/pages/safey_page/safey_b.dart';
import 'package:safey/app/ui/pages/safey_page/safey_p.dart';
// End imports

/// Names Routes
abstract class Routes {
  static const SAFEY = '/';
  static const PUERTAS = '/puertas';
}

/// Get Routes
class AppPages {
  static const INITIAL = Routes.SAFEY;
  static final routes = [
    GetPage(
      name: Routes.SAFEY,
      page: () => const SafeyPage(),
      binding: SafeyBinding(),
    ),
    GetPage(
      name: Routes.PUERTAS,
      page: () => const PuertasPage(),
      binding: PuertasBinding(),
    ),
  ];
}
