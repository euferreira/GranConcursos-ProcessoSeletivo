import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:processo_seletivo/data/ws/ws.dart';
import 'package:processo_seletivo/helpers/api_response.dart';
import 'package:processo_seletivo/helpers/utils.dart';
import 'package:processo_seletivo/model/usuarios.dart';

class UsuarioApi extends Ws {
  ///Realiza o cadastro do usuário
  Future<ApiResponse> cadastrar(Map params) async {
    try {
      Dio dio = getInstance(timeOut: 5000);
      Response response = await dio.post('/usuario/cadastrar', data: json.encode(params));

      return response.statusCode == 201
          ? ApiResponse.ok(Usuario.fromJson(response.data))
          : ApiResponse.error(response.data['message']);
    } catch (e) {
      throw e;
    }
  }

  ///Realiza o request para login do usuário
  Future<ApiResponse> login(Map params) async {
    try {
      Dio dio = getInstance(timeOut: 5000);
      Response response = await dio.post('/usuario/login', data: json.encode(params));

      return response.statusCode == 200
          ? ApiResponse.ok(Usuario.fromJson(response.data))
          : ApiResponse.error(response.data['message']);
    }
    catch (e) {
      if (e is TypeError) {
        Utils.rawSnackbar('Ocorreu um erro...', 'No momento, nossos servidores não estão trabalhando.. Tente novamente mais tarde!');
      }
      else {
        throw e;
      }
    }
  }
}
