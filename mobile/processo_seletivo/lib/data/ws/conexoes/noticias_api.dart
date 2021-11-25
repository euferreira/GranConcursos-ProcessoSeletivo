import 'package:dio/dio.dart';
import 'package:processo_seletivo/data/ws/ws.dart';
import 'package:processo_seletivo/helpers/api_response.dart';
import 'package:processo_seletivo/model/noticias.dart';

class NoticiasApi extends Ws {
  ///Recupera a lista de notícias
  Future<ApiResponse> getNoticias([int perPage = 5]) async {
    try {
      Dio dio = getInstance(timeOut: 10000);
      Response response = await dio.get('/noticias', queryParameters: {"per_page" : perPage});
      if (response.statusCode == 200) {
        if (response.data['data'].length > 0) {
          List<Noticias> listaNoticias = List.generate(response.data['data'].length, (index) => Noticias.fromJson(response.data['data'][index]));

          return ApiResponse.ok(listaNoticias);
        }
      }
      return ApiResponse.error(null);
    }
    catch (e) {
      throw e;
    }
  }
}