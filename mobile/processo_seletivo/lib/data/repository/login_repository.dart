import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:processo_seletivo/data/factory/storage_manager.dart';
import 'package:processo_seletivo/data/repository/usuario_repository.dart';
import 'package:processo_seletivo/data/ws/conexoes/auth_api.dart';
import 'package:processo_seletivo/helpers/api_response.dart';
import 'package:processo_seletivo/helpers/constantes.dart';
import 'package:processo_seletivo/helpers/utils.dart';
import 'package:processo_seletivo/model/enum/tipo_login.dart';
import 'package:processo_seletivo/model/facebook_auth.dart';
import 'package:processo_seletivo/model/usuarios.dart';

class LoginRepository {
  ///Handler do login
  static Future<void> login(TipoLogin tipoLogin, {String login, String senha}) async {
    try {
      switch (tipoLogin) {
        case TipoLogin.NORMAL:
          await _loginNormal(login, senha);
          break;
        case TipoLogin.FACEBOOK:
          await _loginFacebook();
          break;
        case TipoLogin.GOOGLE:
          await _loginGoogle();
          break;
      }
    }
    catch (e) {
      throw e;
    }
  }

  ///Login via API
  static Future<void> _loginNormal(String email, String senha) async {
    try {
      Usuario usuario = await UsuarioRepository().login(email, senha);
      if (usuario != null) {
        StorageManager.saveDataStorage(Constantes.tagNomeExterno, usuario.nome);
        StorageManager.saveDataStorage(Constantes.tagEmailExterno, usuario.email);
        DateTime validade = DateTime.now();
        validade.add(Duration(days: 10));
        StorageManager.saveDataStorage(Constantes.tagDataValidadeLogin, validade.toIso8601String());
        StorageManager.saveDataStorage(Constantes.tagTokenUsuario, usuario.token);
      }
      else {
        Utils.rawSnackbar('Ops...', 'Não é possível realizar login com os dados informados!');
      }
    }
    catch (e) {
      throw e;
    }
  }

  ///Login via facebook
  static Future<void> _loginFacebook() async {
    try {
      FacebookLoginResult result = await FacebookLogin().logIn(['email']);
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          ApiResponse response = await AuthApi().authFacebook(result.accessToken.token);
          if (response.ok) {
            FacebookAuth auth = response.result;
            Usuario usuario = await UsuarioRepository().loginExterno(auth.name, result.accessToken.token);
            assert(usuario != null);
            if (usuario != null) StorageManager.saveDataStorage(Constantes.tagTokenUsuario, usuario.token);

            StorageManager.saveDataStorage(Constantes.tagNomeExterno, auth.name);
            StorageManager.saveDataStorage(Constantes.tagEmailExterno, auth.email);
            StorageManager.saveDataStorage(Constantes.tagDataValidadeLogin, result.accessToken.expires.toIso8601String());
          }
          break;
        case FacebookLoginStatus.cancelledByUser:
          Utils.rawSnackbar('Login cancelado', 'Login cancelado pelo usuário');
          break;
        case FacebookLoginStatus.error:
          Utils.rawSnackbar('Ocorreu uma falha', 'Por favor, tente novamente mais tarde');
          break;
      }
    }
    catch (e) {
      throw e;
    }
  }

  ///Login via google
  static Future<void> _loginGoogle() async {
    try {
      GoogleSignInAccount googleSignInAccount = await new GoogleSignIn().signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        Usuario usuario = await UsuarioRepository().loginExterno(googleSignInAccount.email, googleSignInAuthentication.accessToken, googleSignInAccount.displayName);
        assert(usuario != null);
        if (usuario != null) StorageManager.saveDataStorage(Constantes.tagTokenUsuario, usuario.token);

        StorageManager.saveDataStorage(Constantes.tagNomeExterno, googleSignInAccount.displayName);
        StorageManager.saveDataStorage(Constantes.tagEmailExterno, googleSignInAccount.email);
        DateTime validade = DateTime.now();
        validade.add(Duration(days: 10));
        StorageManager.saveDataStorage(Constantes.tagDataValidadeLogin, validade.toIso8601String());
      }
    }
    catch (e) {
      throw e;
    }
  }
}