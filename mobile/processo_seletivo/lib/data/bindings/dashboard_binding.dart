import 'package:get/get.dart';
import 'package:processo_seletivo/data/controllers/dashboard_controller.dart';
import 'package:processo_seletivo/data/controllers/eventos_controller.dart';
import 'package:processo_seletivo/data/controllers/noticias_controller.dart';

class DashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<NoticiasController>(() => NoticiasController());
    Get.lazyPut<EventosController>(() => EventosController());
  }
}