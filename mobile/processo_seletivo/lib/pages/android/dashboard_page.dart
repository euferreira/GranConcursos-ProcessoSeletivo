import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:processo_seletivo/data/controllers/dashboard_controller.dart';
import 'package:processo_seletivo/helpers/rotas.dart';
import 'package:processo_seletivo/pages/android/eventos_page.dart';
import 'package:processo_seletivo/pages/android/noticias_page.dart';
import 'package:processo_seletivo/pages/widgets/custom_clip.dart';
import 'package:processo_seletivo/pages/widgets/custom_progress.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return controller.showProgress.value
              ? CustomProgress(Colors.red)
              : Stack(
                  children: [
                    CustomClip(MediaQuery.of(context).size.height),
                    SafeArea(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Titulo | Login
                            Padding(
                              padding: const EdgeInsets.all(32),
                              child: Row(
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: 'Notícias',
                                            style: GoogleFonts.ubuntu(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              color: controller.isSelected.value
                                                  ? Colors.white
                                                  : Color(0x99FFFFFF),
                                            )),
                                        TextSpan(text: "\t|\t"),
                                        TextSpan(
                                            text: 'Eventos',
                                            style: GoogleFonts.ubuntu(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  !controller.isSelected.value
                                                      ? Colors.white
                                                      : Color(0x99FFFFFF),
                                            )),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  IconButton(
                                    icon: Icon(
                                      FontAwesomeIcons.userAlt,
                                      color: Color(0x99FFFFFF),
                                    ),
                                    onPressed: () => Get.toNamed(Rotas.loginRoute),
                                  )
                                ],
                              ),
                            ),
                            //Subtitulo
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32),
                              child: Text(
                                "Novidades",
                                style: GoogleFonts.roboto(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                            //Menu
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 24),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    _buildMenu(
                                        context,
                                        controller.keyNoticias,
                                        FontAwesomeIcons.newspaper,
                                        "Notícias",
                                        controller.isSelected.value),
                                    _buildMenu(
                                        context,
                                        controller.keyEventos,
                                        FontAwesomeIcons.glassCheers,
                                        "Eventos",
                                        !controller.isSelected.value),
                                  ],
                                ),
                              ),
                            ),
                            //Noticias | Eventos
                            Padding(
                                padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                                child: controller.isSelected.value
                                    ? NoticiasPage()
                                    : EventosPage()),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }

  Widget _buildMenu(BuildContext context, Key key, IconData iconData,
      String text, bool isSelected) {
    return GestureDetector(
      onTap: () => controller.updateSelectedMenu(key),
      child: Container(
        key: key,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? Colors.white : Color(0x99FFFFFF), width: 3),
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: isSelected ? Colors.white : Colors.red,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: isSelected
                  ? Theme.of(context).primaryColor
                  : Colors.white, //Colors.white,
              size: 40,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: GoogleFonts.ubuntu(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isSelected
                      ? Color(0xFFFF4700)
                      : Color(0xFFFFFFFF) //Color(0xFFFFFFFF)
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
