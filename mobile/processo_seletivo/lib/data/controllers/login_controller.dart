import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:processo_seletivo/data/factory/storage_manager.dart';
import 'package:processo_seletivo/data/repository/login_repository.dart';
import 'package:processo_seletivo/helpers/constantes.dart';
import 'package:processo_seletivo/helpers/utils.dart';
import 'package:processo_seletivo/model/enum/tipo_login.dart';

class LoginController extends GetxController {
  Key keyLogin = Key('login');
  Key keySenha = Key('senha');

  RxBool isPassword = true.obs;
  RxBool showProgress = false.obs;
  RxBool usuarioLogado = false.obs;
  RxString tituloTela = "Login".obs;
  RxString nomeUsuario = "".obs;
  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  Rx<TextEditingController> tLogin = TextEditingController().obs;
  Rx<TextEditingController> tSenha = TextEditingController().obs;

  @override
  void onInit() async {
    super.onInit();
    await _fetchUserData();
    await _verificaLoginUsuario();
  }

  ///Inicia os dados do usuário
  Future<void> _fetchUserData() async {
    try {
      String login = await StorageManager.readValueStoraged(Constantes.tagLoginSalvo);
      String senha = await StorageManager.readValueStoraged(Constantes.tagSenhaSalva);
      if (login != null && senha != null) {
        tLogin.value.text = login;
        tSenha.value.text = senha;
      }
    }
    catch (e) {
      throw e;
    }
  }

  Future<void> _verificaLoginUsuario() async {
    try {
      bool usuarioLogado = await Utils.validarUsuarioLogado();
      if (usuarioLogado) {
        this.usuarioLogado.value = usuarioLogado;
        this.tituloTela.value = await StorageManager.readValueStoraged(Constantes.tagNomeExterno);
        this.nomeUsuario.value = await StorageManager.readValueStoraged(Constantes.tagNomeExterno);
      }
      else {
        this.usuarioLogado.value = false;
      }
    }
    catch (e) {
      this.usuarioLogado.value = false;
      throw e;
    }
  }

  ///Validações do formulário
  String validatorForm(Key key, String value) {
    if (key == keyLogin) {
      if (value.isEmpty || value.isBlank || !value.isEmail) return "Campo inválido!";
    }
    if (key == keySenha) {
      if (value.isEmpty || value.isBlank || value.length < 2) return "Campo inválido!";
    }
    return null;
  }

  ///Verifica as mudanças de estado dos componentes do formulário
  void onChanged(Key key, String value) {
    if (key == keyLogin) {
      if (value.isEmail) StorageManager.saveDataStorage(Constantes.tagLoginSalvo, value);
    }
    if (key == keySenha) {
      if (value.length > 2) StorageManager.saveDataStorage(Constantes.tagSenhaSalva, value);
    }
  }

  ///Realiza o login dado seu tipo
  void realizarLogin(TipoLogin tipoLogin) async {
    try {
      this.showProgress.value = true;
      if (tipoLogin == TipoLogin.NORMAL) {
        if (!this.formKey.value.currentState.validate()) {
          this.showProgress.value = false;
          return;
        }
      }
      await LoginRepository.login(tipoLogin, login: tLogin.value.text, senha: tSenha.value.text);
      await _verificaLoginUsuario();
      this.showProgress.value = false;
    }
    catch (e) {
      this.showProgress.value = false;
      throw e;
    }
  }
}