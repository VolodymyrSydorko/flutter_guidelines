import 'package:dio/dio.dart';
import 'package:flutter_guidelines/models/general_models.dart';
import 'package:injectable/injectable.dart';

import 'interceptors/index.dart';

@injectable
class HttpClient {
  late Dio _dio;

  HttpClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Endpoints.baseUrl,
        receiveTimeout: Endpoints.receiveTimeout,
        connectTimeout: Endpoints.connectTimeout,
      ),
    )..interceptors.add(HttpInterceptor());
  }

  Future<Response> get(String url) {
    return _dio.get(url);
  }

  Future<Response<T>> post<T>(String url,
      {data, DynamicMap? queryParameters, Options? options}) async {
    return _dio.post(url,
        data: data, queryParameters: queryParameters, options: options);
  }
}

class Endpoints {
  static const String baseUrl = 'base_url';

  static const String users = '/users';

  static const int receiveTimeout = 5000;

  static const int connectTimeout = 3000;
}
