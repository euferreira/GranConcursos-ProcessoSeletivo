import 'package:processo_seletivo/data/ws/conexoes/usuario_api.dart';
import 'package:processo_seletivo/helpers/api_response.dart';
import 'package:processo_seletivo/model/usuarios.dart';

class UsuarioRepository {
  ///Gerencia o cadastro do usuário na API
  ///Retorna o objeto preenchido caso tenha cadastrado
  Future<Usuario> cadastrar(Usuario usuario) async {
    try {
      ApiResponse response = await UsuarioApi().cadastrar(usuario.toJson());
      if (response != null) {
        if (response.ok) {
          return response.result;
        }
      }
      return null;
    }
    catch (e) {
      throw e;
    }
  }

  ///Realiza o login do usuário na API
  ///Retorna o objeto preenchido caso positivo
  Future<Usuario> login(String email, String senha) async {
    try {
      Usuario usuario = Usuario(email: email, senha: senha);
      ApiResponse response = await UsuarioApi().login(usuario.toJson());
      if (response != null) {
        if (response.ok) {
          return response.result;
        }
      }
      return null;
    }
    catch (e) {
      throw e;
    }
  }

  ///Realiza o login ou cadastro do usuário na API
  ///Usuário de link externo (FACEBOOK/GOOGLE)
  Future<Usuario> loginExterno(String email, String senha, [String nome]) async {
    try {
      Usuario usuario = await login(email, senha);
      //testa o login do usuário de link externo
      if (usuario != null) {
        return usuario;
      }
      //se continuar nulo, cria uma instância e cadastra
      usuario = new Usuario(nome: nome, email: email, senha: senha);
      usuario = await cadastrar(usuario);
      return usuario;
    }
    catch (e) {
      throw e;
    }
  }
}