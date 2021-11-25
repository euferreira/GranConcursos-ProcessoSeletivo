import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:processo_seletivo/data/bindings/dashboard_binding.dart';
import 'package:processo_seletivo/data/bindings/login_binding.dart';
import 'package:processo_seletivo/helpers/rotas.dart';
import 'package:processo_seletivo/pages/android/cadastro_page.dart';
import 'package:processo_seletivo/pages/android/dashboard_page.dart';
import 'package:processo_seletivo/pages/android/eventos_page.dart';
import 'package:processo_seletivo/pages/android/login_page.dart';
import 'package:processo_seletivo/pages/android/noticias_page.dart';
import 'package:processo_seletivo/pages/android/pagina_nao_encontrada_page.dart';

import 'data/bindings/cadastro_binding.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(MyApp());
  }
  catch (e) {
    throw e;
  }
}

class MyApp extends StatelessWidget {
  static final Transition _fadeInTransition = Transition.fadeIn;
  static final Duration _durationTransition = new Duration(milliseconds: 500);
  static final List<GetPage> _pagesList = [
    //Dashboard
    GetPage(
      name: Rotas.dashboardRoute,
      page: () => DashboardPage(),
      transition: _fadeInTransition,
      transitionDuration: _durationTransition,
      title: 'Dashboard',
      binding: DashboardBinding(),
    ),
    //Pagina de noticias
    GetPage(
      name: Rotas.noticiasRoute,
      page: () => NoticiasPage(),
      transition: _fadeInTransition,
      transitionDuration: _durationTransition,
      title: 'Noticias',
      binding: DashboardBinding(),
    ),
    //Página de eventos
    GetPage(
      name: Rotas.eventosRoute,
      page: () => EventosPage(),
      transition: _fadeInTransition,
      transitionDuration: _durationTransition,
      title: 'Eventos',
      binding: DashboardBinding(),
    ),
    //Página de login
    GetPage(
      name: Rotas.loginRoute,
      page: () => LoginPage(),
      transition: Transition.rightToLeft,
      transitionDuration: _durationTransition,
      title: 'Login',
      binding: LoginBinding(),
    ),
    //Página de Cadastro
    GetPage(
      name: Rotas.cadastroPage,
      page: () => CadastroPage(),
      transition: Transition.rightToLeft,
      transitionDuration: _durationTransition,
      title: 'Cadastro',
      binding: CadastroBinding(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Processo Seletivo - GranConcursos Online',
      home: DashboardPage(),
      locale: Locale('pt', 'BR'),
      getPages: _pagesList,
      initialRoute: Rotas.initialRoute,
      initialBinding: DashboardBinding(),
      enableLog: true,
      transitionDuration: _durationTransition,
      themeMode: ThemeMode.light,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonColor: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      unknownRoute: GetPage(
        name: Rotas.paginaNaoEncontradaRoute,
        page: () => PaginaNaoEncontradaPage(),
        title: 'Pagina não encontrada',
        transitionDuration: _durationTransition,
        transition: _fadeInTransition,
      ),
    );
  }
}
