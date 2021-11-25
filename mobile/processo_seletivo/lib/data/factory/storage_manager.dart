import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class StorageManager {
  static final FlutterSecureStorage _storage = new FlutterSecureStorage();

  ///Retorna um MAP futuro com os dados armazenados no storage
  static Future<Map<String, String>> getSavedData() async {
    try {
      return _storage.readAll();
    } catch (e) {
      return null;
    }
  }

  ///Salva no storage um valor passado por parâmetro <br/>
  ///[key] => a chave que será utilizada para identificar o valor <br/>
  ///[value] => o valor que será salvo, deve ser convertido para uma String.
  static void saveDataStorage(String key, String value) async {
    try {
      _storage.write(key: key, value: value);
    }
    catch(e) {
      throw new Exception("Ocorreu um erro ao salvar os dados, ${e.toString()}");
    }
  }

  ///Retorna uma chave específica que esteja armazenada
  ///Deve-se passar a chave como parametro
  static Future<String> readValueStoraged(String key) async {
    try {
      return await _storage.read(key: key);
    } catch (e) {
      throw new Exception(
          "Ocorreu um erro no método static Future<String> readValueStoraged(String key) async. Mais detalhes: ${e.toString()}");
    }
  }

  static Future<void> deleteValueStoraged(String key) async {
    try {
      return _storage.delete(key: key);
    } catch (e) {
      return null;
    }
  }

  static Future<void> deleteAllValueStoraged() async {
    try {
      return _storage.deleteAll();
    } catch (e) {
      return null;
    }
  }
}