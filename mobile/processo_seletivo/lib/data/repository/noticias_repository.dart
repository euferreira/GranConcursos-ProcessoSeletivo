import 'package:processo_seletivo/data/ws/conexoes/noticias_api.dart';
import 'package:processo_seletivo/helpers/api_response.dart';
import 'package:processo_seletivo/model/noticias.dart';

class NoticiasRepository {
  Future<List<Noticias>> getListaNoticias([int perPage = 5]) async {
    try {
      ApiResponse response = await NoticiasApi().getNoticias(perPage);
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