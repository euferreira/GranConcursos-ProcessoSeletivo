abstract class Constantes {
  static final String _tagLoginSalvo = "loginSalvo";
  static final String _tagSenhaSalva = "senhaSalva";
  static final String _tagNomeExterno = "nomeExterno";
  static final String _tagEmailExterno = "emailExterno";
  static final String _tagDataValidadeLogin = "dataValidadeLogin";
  static final String _tagTokenUsuario = 'tokenUsuario';

  ///Tag para recuperar o token do usuário
  static String get tagTokenUsuario => _tagTokenUsuario;

  ///Tag para recuperar a validade do login
  static String get tagDataValidadeLogin => _tagDataValidadeLogin;

  ///Tag para recuperar o nome salvo externamente
  static String get tagNomeExterno => _tagNomeExterno;

  ///Retorna a tag da senha salva
  static String get tagSenhaSalva => _tagSenhaSalva;

  ///Retorna a tag do login salvo
  static String get tagLoginSalvo => _tagLoginSalvo;

  ///Tag para recuperar o e-mail externo (GOOGLE/FB)
  static String get tagEmailExterno => _tagEmailExterno;
}