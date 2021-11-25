import 'package:get/get.dart';
import 'package:processo_seletivo/data/controllers/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() => Get.lazyPut<LoginController>(() => LoginController());
}