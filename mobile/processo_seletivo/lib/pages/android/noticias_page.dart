import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:processo_seletivo/data/controllers/noticias_controller.dart';
import 'package:processo_seletivo/pages/widgets/custom_card.dart';
import 'package:processo_seletivo/pages/widgets/shimmer_effect.dart';

class NoticiasPage extends GetView<NoticiasController> {
  const NoticiasPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: Obx(
        () => !controller.possuiNoticias.value
            ? Container(
                child: ListTile(
                  title: Text("Não há noticias para exibir"),
                ),
              )
            : LazyLoadScrollView(
                child: ListView.builder(
                  itemCount: controller.noticeList.value.length,
                  itemBuilder: (context, index) {
                    return controller.loadList.value
                        ? ShimmerEffect()
                        : CustomCard("${controller.noticeList[index].titulo}",
                            "${controller.noticeList[index].descricao}", () {});
                  },
                ),
                isLoading: controller.loadList.value,
                scrollOffset: 5,
                onEndOfPage: () async => controller.atualizaLista(),
              ),
      ),
    );
  }
}
