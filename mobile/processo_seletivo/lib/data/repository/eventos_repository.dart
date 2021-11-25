import 'package:processo_seletivo/data/ws/conexoes/eventos_api.dart';
import 'package:processo_seletivo/helpers/api_response.dart';
import 'package:processo_seletivo/model/eventos.dart';

class EventosRepository {
  Future<List<Eventos>> getListaNoticias(String token, [int perPage = 5]) async {
    try {
      ApiResponse response = await EventosApi().getEventos(token, perPage);
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
}