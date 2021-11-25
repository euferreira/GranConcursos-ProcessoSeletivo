import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  Key keyNoticias = Key('noticias');
  Key keyEventos = Key('eventos');

  RxBool showProgress = false.obs;
  RxBool isSelected = true.obs;

  void updateSelectedMenu(Key key) {
    if (key == keyNoticias) {
      isSelected.value = true;
    }
    else if (key == keyEventos) {
      isSelected.value = false;
    }
  }
}
