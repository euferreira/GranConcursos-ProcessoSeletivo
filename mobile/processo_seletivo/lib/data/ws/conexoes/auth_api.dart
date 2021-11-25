import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:processo_seletivo/data/ws/ws.dart';
import 'package:processo_seletivo/helpers/api_response.dart';
import 'package:processo_seletivo/model/facebook_auth.dart';

class AuthApi extends Ws {
  ///Realiza uma requisição na api do facebook dado o token de acesso
  Future<ApiResponse> authFacebook(String token) async {
    try {
      Dio dio = getInstance(timeOut: 5000);
      Response response = await dio.get("https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=$token");
      return response.statusCode == 200 ? ApiResponse.ok(FacebookAuth.fromJson(json.decode(response.data))) : ApiResponse.error(null);
    }
    catch (e) {
      throw e;
    }
  }
}