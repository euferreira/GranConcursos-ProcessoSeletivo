import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:processo_seletivo/data/controllers/eventos_controller.dart';
import 'package:processo_seletivo/helpers/rotas.dart';
import 'package:processo_seletivo/pages/widgets/custom_button.dart';
import 'package:processo_seletivo/pages/widgets/custom_card.dart';
import 'package:processo_seletivo/pages/widgets/custom_img_asset.dart';
import 'package:processo_seletivo/pages/widgets/shimmer_effect.dart';

class EventosPage extends GetView<EventosController> {
  const EventosPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: Obx(() => controller.usuarioLogado.value
          ? _buildListaEventos()
          : _buildSolicitarLoginUsuario()),
    );
  }

  Widget _buildListaEventos() => !controller.possuiEventos.value
      ? Container(
          child: ListTile(
            title: Text("Não existem eventos para exibir"),
          ),
        )
      : LazyLoadScrollView(
          child: ListView.builder(
            itemCount: controller.eventosList.value.length,
            itemBuilder: (context, index) {
              return controller.loadList.value
                  ? ShimmerEffect()
                  : CustomCard(controller.eventosList.value[index].titulo,
                      controller.eventosList.value[index].descricao, () {});
            },
          ),
          isLoading: controller.loadList.value,
          scrollOffset: 5,
          onEndOfPage: controller.atualizaLista,
        );

  Widget _buildSolicitarLoginUsuario() => Container(
        child: Column(
          children: [
            CustomImgAsset(100, "event_cad", "png"),
            ListTile(
              title: Text(
                "Faça login agora ou cadastre-se para ter\nacesso à lista de eventos",
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.all(16),
                child: CustomButton(
                  () => Get.toNamed(Rotas.loginRoute),
                  false,
                  "Entrar",
                  Colors.red,
                  true,
                ),
              ),
            ),
          ],
        ),
      );
}
