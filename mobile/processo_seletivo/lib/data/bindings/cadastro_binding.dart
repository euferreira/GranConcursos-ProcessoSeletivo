import 'package:get/get.dart';
import 'package:processo_seletivo/data/controllers/cadastro_controller.dart';

class CadastroBinding implements Bindings {
  @override
  void dependencies() => Get.lazyPut<CadastroController>(() => CadastroController());
}