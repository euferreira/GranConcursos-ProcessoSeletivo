import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class Ws {
  static String _baseUrl = "http://192.168.0.16/api";

  static BaseOptions _baseOptions({int timeOut, String baseUrl}) => BaseOptions(
        connectTimeout: timeOut,
        baseUrl: _baseUrl.isEmpty ? baseUrl : _baseUrl,
        validateStatus: (status) => true,
        followRedirects: false,
        contentType: Headers.jsonContentType,
      );

  Dio getInstance({int timeOut, String baseUrl}) {
    Dio dio = new Dio(_baseOptions(timeOut: timeOut ?? 5000, baseUrl: _baseUrl));
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };
    return dio;
  }

  Future<Dio> getInstanceBearer(String token) async {
    try {
      Dio dio = Dio(_baseOptions(timeOut: 10000));
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        return client;
      };
      dio.interceptors.clear();
      dio.interceptors.add(InterceptorsWrapper(
          onRequest: (options, handler) async {
            options.headers["api_token"] = "Bearer $token";
            handler.next(options);
            return options;
          },
          onResponse: (Response response, handler) {
            // Do something with response data
            handler.next(response);
            return response; // continue
          },
          onError: (DioError error, ErrorInterceptorHandler handler) async {
            // Do something with response error
            if (error.response?.statusCode == 403) {
              dio.interceptors.requestLock.lock();
              dio.interceptors.responseLock.lock();
              RequestOptions options = error.response.requestOptions;
              //token = await user.getIdToken(refresh: true);
              //await writeAuthKey(token);
              options.headers["Authorization"] = "Bearer $token";
              dio.options.headers = {"Authorization": "Bearer $token"};
              dio.interceptors.requestLock.unlock();
              dio.interceptors.responseLock.unlock();
              handler.next(error);
              return dio.request(options.path, options: Options(headers: {"Authorization": "Bearer $token"}));
            }
            else {
              dio.interceptors.requestLock.lock();
              dio.interceptors.responseLock.lock();
              RequestOptions options = error.response.requestOptions;
              options.headers["Authorization"] = "Bearer " + token;
              dio.interceptors.requestLock.unlock();
              dio.interceptors.responseLock.unlock();
              await _retry(dio, options);
              handler.next(error);
              return error;
            }
          }));
      dio.options.baseUrl = _baseUrl;
      return dio;
    }
    catch (e) {
      throw e;
    }
  }

  static Future<Response<dynamic>> _retry(Dio dio, RequestOptions requestOptions) async {
    final options = new Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}
