import 'package:get/get.dart';
import 'package:processo_seletivo/data/repository/noticias_repository.dart';

class NoticiasController extends GetxController {
  RxBool loadList = false.obs;
  RxBool possuiNoticias = true.obs;
  RxList noticeList = [].obs;

  int _resultadosPorPagina = 5;

  @override
  void onInit() async {
    super.onInit();
    loadList.value = true;
    await _fetchUserData();
    loadList.value = false;
  }

  Future<void> _fetchUserData() async {
    try {
      loadList.value = true;
      noticeList.value = await NoticiasRepository().getListaNoticias();
      if (noticeList.value != null) {
        possuiNoticias.value = true;
      } else {
        possuiNoticias.value = false;
      }
      loadList.value = false;
    } catch (e) {
      loadList.value = false;
      throw e;
    }
  }

  Future<void> atualizaLista() async {
    try {
      loadList.value = true;
      _resultadosPorPagina += _resultadosPorPagina;
      noticeList.value.clear();
      noticeList.value = await NoticiasRepository().getListaNoticias(_resultadosPorPagina);
      if (noticeList.value != null) {
        possuiNoticias.value = true;
      } else {
        possuiNoticias.value = false;
      }
      loadList.value = false;
    } catch (e) {
      loadList.value = false;
      throw e;
    }
  }
}
