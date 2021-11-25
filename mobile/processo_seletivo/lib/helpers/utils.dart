import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:processo_seletivo/data/factory/storage_manager.dart';

import 'constantes.dart';

class Utils {
  static void rawSnackbar(
    String title,
    String message, {
    Color colorText = Colors.white,
    int seconds = 5,
    SnackPosition snackPosition = SnackPosition.BOTTOM,
    IconData iconData = Icons.error,
    Color background = Colors.red,
  }) {
    if (Get.isSnackbarOpen) {
      Get.back();
    }
    Get.snackbar(
      title,
      message,
      colorText: colorText,
      duration: Duration(seconds: seconds),
      snackPosition: snackPosition,
      icon: Icon(
        iconData,
        color: Colors.white,
      ),
      backgroundColor: background,
    );
  }

  ///Valida o usuário dada sua validade
  ///Se for anterior a hoje [DateTime.now()]
  ///O login estará vencido e o usuário terá de se autenticar novamente
  static Future<bool> validarUsuarioLogado() async {
    try {
      Map<String, String> usuarioLogado = await StorageManager.getSavedData();
      if (usuarioLogado != null) {
        if (usuarioLogado.containsKey(Constantes.tagNomeExterno) && usuarioLogado.containsKey(Constantes.tagEmailExterno) && usuarioLogado.containsKey(Constantes.tagDataValidadeLogin)) {
          String auxValidade = usuarioLogado[Constantes.tagDataValidadeLogin];
          DateTime validadeAcesso = DateTime.parse(auxValidade);
          //se for anterior a hoje, venceu o login
          return validadeAcesso.isBefore(DateTime.now());
        }
      }
      return false;
    }
    catch (e) {
      throw e;
    }
  }
}
