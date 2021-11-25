import 'package:dio/dio.dart';
import 'package:processo_seletivo/data/ws/ws.dart';
import 'package:processo_seletivo/helpers/api_response.dart';
import 'package:processo_seletivo/model/eventos.dart';

class EventosApi extends Ws {
  Future<ApiResponse> getEventos(String token, [int perPage = 5]) async {
    try {
      Dio dio = await getInstanceBearer(token);
      if (dio != null) {
        Response response = await dio.get('/eventos', queryParameters: {"per_page" : perPage});
        if (response.statusCode == 200) {
          if (response.data['data'].length > 0) {
            List<Eventos> listaNoticias = List.generate(response.data['data'].length, (index) => Eventos.fromJson(response.data['data'][index]));

            return ApiResponse.ok(listaNoticias);
          }
        }
      }
      return null;
    }
    catch (e) {
      throw e;
    }
  }
}