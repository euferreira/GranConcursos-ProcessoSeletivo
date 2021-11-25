import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processo_seletivo/data/repository/usuario_repository.dart';
import 'package:processo_seletivo/helpers/rotas.dart';
import 'package:processo_seletivo/helpers/utils.dart';
import 'package:processo_seletivo/model/usuarios.dart';

class CadastroController extends GetxController {
  Key keyNome = Key('nome');
  Key keyEmail = Key('email');
  Key keySenha = Key('senha');

  RxBool isPassword = true.obs;
  RxBool showProgress = false.obs;
  Rx<TextEditingController> tNome = TextEditingController().obs;
  Rx<TextEditingController> tEmail = TextEditingController().obs;
  Rx<TextEditingController> tSenha = TextEditingController().obs;
  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;

  String validatorForm(Key key, String value) {
    if (key == keyNome) {
      if (value.isEmpty || value.isBlank) return "Campo inválido!";
    }
    if (key == keyEmail) {
      if (value.isEmpty || value.isBlank || !value.isEmail) return "Campo inválido!";
    }
    if (key == keySenha) {
      if (value.isEmpty || value.isBlank || value.length < 2) return "Campo inválido!";
    }
    return null;
  }

  void cadastrarUsuario() async {
    try {
      this.showProgress.value = true;
      if (!this.formKey.value.currentState.validate()) {
        this.showProgress.value = false;
        return;
      }

      Usuario usuario = Usuario(nome: tNome.value.text.capitalizeFirst, email: tEmail.value.text, senha: tSenha.value.text);
      usuario = await UsuarioRepository().cadastrar(usuario);
      if (usuario != null) {
        Utils.rawSnackbar('Bem-vindo!', usuario.nome, iconData: Icons.done, background: Colors.green);
        await Future.delayed(Duration(seconds: 5));
        if (Get.isSnackbarOpen) Get.back();
        Get.offAllNamed(Rotas.dashboardRoute);
      }
      else {
        Utils.rawSnackbar('Atenção!', 'Não foi possível cadastrar o usuário no momento');
      }

      this.showProgress.value = false;
    }
    catch (e) {
      this.showProgress.value = false;
      throw e;
    }
  }
}