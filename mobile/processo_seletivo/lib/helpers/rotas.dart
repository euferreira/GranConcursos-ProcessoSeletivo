abstract class Rotas {
  static final String _initialRoute = '/';
  static final String _dashboardRoute = '/Dashboard';
  static final String _paginaNaoEncontradaRoute = '/PaginaNaoEncontrada';
  static final String _noticiasRoute = '/NoticiasRoute';
  static final String _eventosRoute = '/Eventos';
  static final String _loginRoute = '/Login';
  static final String _cadastroPage = '/Cadastro';

  ///Rota para tela de cadastro
  static String get cadastroPage => _cadastroPage;

  ///Rota para tela de login
  static String get loginRoute => _loginRoute;

  ///Rota para tela de eventos
  static String get eventosRoute => _eventosRoute;

  ///Rota para tela de notícia
  static String get noticiasRoute => _noticiasRoute;

  ///Rota para uma página desconhecida
  static String get paginaNaoEncontradaRoute => _paginaNaoEncontradaRoute;

  ///Rota para tela de dashboard
  static String get dashboardRoute => _dashboardRoute;

  ///Rota inicial
  static String get initialRoute => _initialRoute;
}