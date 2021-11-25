import 'package:get/get.dart';
import 'package:processo_seletivo/data/factory/storage_manager.dart';
import 'package:processo_seletivo/data/repository/eventos_repository.dart';
import 'package:processo_seletivo/helpers/constantes.dart';
import 'package:processo_seletivo/helpers/utils.dart';
import 'package:processo_seletivo/model/eventos.dart';

class EventosController extends GetxController {
  RxBool showProgress = false.obs;
  RxBool loadList = false.obs;
  RxBool usuarioLogado = false.obs;
  RxBool possuiEventos = true.obs;

  RxList eventosList = [].obs;
  int _resultadosPorPagina = 5;

  @override
  void onInit() async {
    super.onInit();
    loadList.value = true;
    await _verificaLoginUsuario();
    loadList.value = false;
  }

  Future<void> _fetchUserData() async {
    try {
      loadList.value = true;
      String token = await StorageManager.readValueStoraged(Constantes.tagTokenUsuario);
      eventosList.value = await EventosRepository().getListaNoticias(token, _resultadosPorPagina);
      if (eventosList.value != null) {
        possuiEventos.value = true;
      } else {
        possuiEventos.value = false;
      }
      loadList.value = false;
    }
    catch (e) {
      throw e;
    }
  }

  Future<void> _verificaLoginUsuario() async {
    try {
      this.usuarioLogado.value = await Utils.validarUsuarioLogado();
      if (this.usuarioLogado.value) await _fetchUserData();
    }
    catch (e) {
      this.usuarioLogado.value = false;
      throw e;
    }
  }

  Future<void> atualizaLista() async {
    try {
      loadList.value = true;
      _resultadosPorPagina += _resultadosPorPagina;
      eventosList.value.clear();
      String token = await StorageManager.readValueStoraged(Constantes.tagTokenUsuario);
      eventosList.value = await EventosRepository().getListaNoticias(token, _resultadosPorPagina);
      if (eventosList.value != null) {
        possuiEventos.value = true;
      } else {
        possuiEventos.value = false;
      }
      loadList.value = false;
    } catch (e) {
      loadList.value = false;
      throw e;
    }
  }
}